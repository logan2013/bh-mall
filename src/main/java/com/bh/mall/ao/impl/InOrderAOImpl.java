package com.bh.mall.ao.impl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.jdom2.JDOMException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bh.mall.ao.IInOrderAO;
import com.bh.mall.ao.IWeChatAO;
import com.bh.mall.bo.IAccountBO;
import com.bh.mall.bo.IAgentBO;
import com.bh.mall.bo.IAgentLevelBO;
import com.bh.mall.bo.IAgentPriceBO;
import com.bh.mall.bo.ICartBO;
import com.bh.mall.bo.IChAwardBO;
import com.bh.mall.bo.IInOrderBO;
import com.bh.mall.bo.IProductBO;
import com.bh.mall.bo.ISYSConfigBO;
import com.bh.mall.bo.ISYSUserBO;
import com.bh.mall.bo.ISpecsBO;
import com.bh.mall.bo.ISpecsLogBO;
import com.bh.mall.bo.ITjAwardBO;
import com.bh.mall.bo.IWareBO;
import com.bh.mall.bo.base.Paginable;
import com.bh.mall.callback.CallbackBzdhConroller;
import com.bh.mall.common.AmountUtil;
import com.bh.mall.common.PropertiesUtil;
import com.bh.mall.core.StringValidater;
import com.bh.mall.domain.Account;
import com.bh.mall.domain.Agent;
import com.bh.mall.domain.AgentLevel;
import com.bh.mall.domain.AgentPrice;
import com.bh.mall.domain.Cart;
import com.bh.mall.domain.ChAward;
import com.bh.mall.domain.InOrder;
import com.bh.mall.domain.Product;
import com.bh.mall.domain.SYSUser;
import com.bh.mall.domain.Specs;
import com.bh.mall.domain.TjAward;
import com.bh.mall.domain.Ware;
import com.bh.mall.dto.req.XN627640Req;
import com.bh.mall.dto.req.XN627641Req;
import com.bh.mall.dto.res.BooleanRes;
import com.bh.mall.enums.EAgentLevel;
import com.bh.mall.enums.EBizType;
import com.bh.mall.enums.EBoolean;
import com.bh.mall.enums.EChannelType;
import com.bh.mall.enums.ECurrency;
import com.bh.mall.enums.EInOrderStatus;
import com.bh.mall.enums.EOrderStatus;
import com.bh.mall.enums.EPayType;
import com.bh.mall.enums.EProductIsTotal;
import com.bh.mall.enums.EProductLogType;
import com.bh.mall.enums.EProductStatus;
import com.bh.mall.enums.EResult;
import com.bh.mall.enums.ESysUser;
import com.bh.mall.enums.ESystemCode;
import com.bh.mall.enums.EUserKind;
import com.bh.mall.exception.BizException;
import com.bh.mall.util.wechat.XMLUtil;

@Service
public class InOrderAOImpl implements IInOrderAO {

    private static Logger logger = Logger
        .getLogger(CallbackBzdhConroller.class);

    @Autowired
    IInOrderBO inOrderBO;

    @Autowired
    ICartBO cartBO;

    @Autowired
    IProductBO productBO;

    @Autowired
    ISpecsBO specsBO;

    @Autowired
    IAgentPriceBO agentPriceBO;

    @Autowired
    IAccountBO accountBO;

    @Autowired
    IAgentBO agentBO;

    @Autowired
    ISYSConfigBO sysConfigBO;

    @Autowired
    ITjAwardBO tjAwardBO;

    @Autowired
    IWareBO wareBO;

    @Autowired
    IWeChatAO weChatAO;

    @Autowired
    ISpecsLogBO specsLogBO;

    @Autowired
    IAgentLevelBO agentLevelBO;

    @Autowired
    IChAwardBO chAwardBO;

    @Autowired
    ISYSUserBO sysUserBO;

    @Override
    @Transactional
    public List<String> addInOrder(XN627640Req req) {
        List<String> list = new ArrayList<String>();
        for (String code : req.getCartList()) {
            Cart cart = cartBO.getCart(code);
            Product pData = productBO.getProduct(cart.getProductCode());
            Specs specs = specsBO.getSpecs(cart.getSpecsCode());
            if (!EProductStatus.Shelf_YES.getCode().equals(pData.getStatus())) {
                throw new BizException("xn0000", "产品包含未上架商品,不能下单");
            }

            // 下单人及下单代理
            Agent applyUser = agentBO.getAgent(req.getApplyUser());
            AgentPrice agentPrice = agentPriceBO
                .getPriceByLevel(specs.getCode(), applyUser.getLevel());

            // 检查是否可购买
            if (EBoolean.NO.getCode().equals(agentPrice.getIsBuy())) {
                throw new BizException("xn0000", "您的等级无法购买该规格的产品");
            }

            String orderCode = inOrderBO.saveInOrder(applyUser.getUserId(),
                applyUser.getHighUserId(), pData.getCode(), pData.getName(),
                specs.getCode(), specs.getName(), pData.getAdvPic(),
                agentPrice.getPrice(), cart.getQuantity(), req.getApplyNote());
            list.add(orderCode);
            // 删除购物车记录
            cartBO.removeCart(cart);
        }
        return list;
    }

    @Override
    @Transactional
    public String addInOrderNoCart(XN627641Req req) {
        Agent applyUser = agentBO.getAgent(req.getApplyUser());
        Specs specs = specsBO.getSpecs(req.getSpecsCode());
        Product pData = productBO.getProduct(specs.getProductCode());

        // 获取该产品中最小规格的数量
        int minNumber = specsBO.getMinSpecsNumber(pData.getCode());
        AgentLevel agentLevel = agentLevelBO
            .getAgentByLevel(applyUser.getLevel());

        // 非最高等级代理，检查上级云仓
        if (StringValidater.toInteger(EAgentLevel.ONE.getCode()) != agentLevel
            .getLevel()) {
            wareBO.checkProduct(req.getToUser(), req.getSpecsCode());
        } else {
            // 非最高等级代理，扣减产品库存
            Integer nowNumber = pData.getRealNumber()
                    - (StringValidater.toInteger(req.getQuantity())
                            * minNumber);
            if (nowNumber < 0) {
                throw new BizException("xn00000", "产品库存不足");
            }
        }

        // 门槛余额是否高于限制
        AgentPrice agentPrice = agentPriceBO.getPriceByLevel(specs.getCode(),
            applyUser.getLevel());
        Long amount = StringValidater.toInteger(req.getQuantity())
                * agentPrice.getPrice();
        Account account = accountBO.getAccountByUser(applyUser.getUserId(),
            ECurrency.MK_CNY.getCode());

        // 门槛最低余额为零
        Long restAmount = account.getAmount() - amount;
        if (0 == agentLevel.getMinSurplus()) {
            if (restAmount > agentLevel.getMinSurplus()) {
                throw new BizException("xn0000",
                    "剩余门槛不能大于[" + agentLevel.getMinSurplus() / 1000
                            + "]元，目前余额还有[" + restAmount / 1000 + "]元");
            }

        } else if (restAmount >= agentLevel.getMinSurplus()) {
            throw new BizException("xn0000",
                "剩余门槛不能大于[" + agentLevel.getMinSurplus() / 1000 + "]元，目前余额还有["
                        + restAmount / 1000 + "]元");
        }

        // 检查起购数量
        int minQuantity = agentPriceBO.checkMinQuantity(agentPrice.getCode(),
            applyUser.getLevel());
        if (minQuantity > StringValidater.toInteger(req.getQuantity())) {
            throw new BizException("xn0000", "您购买的数量不能低于" + minQuantity + "]");
        }

        return inOrderBO.saveInOrder(applyUser.getUserId(),
            applyUser.getHighUserId(), pData.getCode(), pData.getName(),
            specs.getCode(), specs.getName(), pData.getAdvPic(),
            agentPrice.getPrice(), StringValidater.toInteger(req.getQuantity()),
            req.getApplyNote());
    }

    @Override
    @Transactional
    public Object payInOrder(List<String> codeList, String payType) {
        Object result = null;
        for (String code : codeList) {
            InOrder data = inOrderBO.getInOrder(code);
            if (!EOrderStatus.Unpaid.getCode().equals(data.getStatus())) {
                throw new BizException("xn0000", "订单未处于待支付状态");
            }
            Agent uData = agentBO.getAgent(data.getApplyUser());
            if (EPayType.RMB_YE.getCode().equals(payType)) {
                // 账户扣钱
                String payGroup = inOrderBO.addPayGroup(data);
                Account mkAccount = accountBO.getAccountByUser(
                    data.getApplyUser(), ECurrency.MK_CNY.getCode());
                data.setPayType(EChannelType.NBZ.getCode());
                accountBO.changeAmount(mkAccount.getAccountNumber(),
                    EChannelType.NBZ, null, payGroup, data.getCode(),
                    EBizType.AJ_GMYC, EBizType.AJ_GMYC.getValue(),
                    -data.getAmount());
                String status = EOrderStatus.Paid.getCode();

                // 该等级是否启用云仓
                AgentLevel agent = agentLevelBO
                    .getAgentByLevel(uData.getLevel());
                if (EBoolean.YES.getCode().equals(agent.getIsWare())) {
                    status = EOrderStatus.Received.getCode();
                    // 购买云仓
                    wareBO.buyWare(data, uData);
                    // 出货以及推荐奖励
                    this.payAward(data);
                } else {
                    throw new BizException("xn00000", "您的等级还未开启云仓哦！");
                }

                data.setPayDatetime(new Date());
                data.setPayCode(data.getCode());
                data.setPayAmount(data.getAmount());
                data.setStatus(status);
                inOrderBO.paySuccess(data);

                result = new BooleanRes(true);
            } else if (EPayType.WEIXIN_H5.getCode().equals(payType)) {
                Object payResult = this.payWXH5(data,
                    PropertiesUtil.Config.WECHAT_H5_ORDER_BACKURL);
                result = payResult;
            }
        }
        return result;

    }

    private Object payWXH5(InOrder data, String callBackUrl) {
        Long rmbAmount = data.getAmount();
        Agent agent = agentBO.getAgent(data.getApplyUser());
        String payGroup = inOrderBO.addPayGroup(data);
        agentBO.getAgent(data.getToUser());
        Account account = accountBO.getAccountByUser(data.getToUser(),
            ECurrency.YJ_CNY.getCode());
        return weChatAO.getPrepayIdH5(agent.getUserId(),
            account.getAccountNumber(), payGroup, data.getCode(),
            EBizType.AJ_GMCP.getCode(), EBizType.AJ_GMCP.getValue(), rmbAmount,
            callBackUrl, data.getPayType());
    }

    @Override
    public void paySuccess(String result) {
        Map<String, String> map = null;
        try {
            logger.info("========回调信息=================");
            map = XMLUtil.doXMLParse(result);
            String attach = map.get("attach");
            String[] codes = attach.split("\\|\\|");
            String systemCode = codes[0];
            String companyCode = codes[1];
            String bizBackUrl = codes[2];
            String wechatOrderNo = map.get("transaction_id");
            String outTradeNo = map.get("out_trade_no");

            InOrder data = inOrderBO.getInOrder(outTradeNo);
            if (!EOrderStatus.Unpaid.getCode().equals(data.getStatus())) {
                throw new BizException("xn0000", "订单已支付");
            }

            // 此处调用订单查询接口验证是否交易成功
            boolean isSucc = weChatAO.reqOrderquery(map,
                EChannelType.WeChat_H5.getCode());
            if (isSucc) {

                Agent agent = agentBO.getAgent(data.getApplyUser());
                // 账户收钱
                this.payOrder(agent, data, wechatOrderNo);

                String status = EOrderStatus.Paid.getCode();
                // 代理进货且是购买云仓
                if (EUserKind.Merchant.getCode().equals(agent.getKind())) {
                    AgentLevel agentLevel = agentLevelBO
                        .getAgentByLevel(agent.getLevel());
                    if (EBoolean.YES.getCode().equals(agentLevel.getIsWare())) {
                        status = EOrderStatus.Received.getCode();
                        // 购买云仓
                        wareBO.buyWare(data, agent);
                        // 出货以及推荐奖励
                        this.payAward(data);
                    }
                }

                data.setPayDatetime(new Date());
                data.setPayCode(wechatOrderNo);
                data.setPayAmount(data.getAmount());
                data.setStatus(status);

                inOrderBO.paySuccess(data);
            } else {

                data.setStatus(EOrderStatus.Pay_NO.getCode());
                data.setPayDatetime(new Date());
                inOrderBO.payNo(data);
            }
        } catch (JDOMException | IOException e) {
            throw new BizException("xn000000", "回调结果XML解析失败");
        }
    }

    @Override
    public Paginable<InOrder> queryInOrderPage(int start, int limit,
            InOrder condition) {
        if (condition.getStartDatetime() != null
                && condition.getEndDatetime() != null && condition
                    .getStartDatetime().after(condition.getEndDatetime())) {
            throw new BizException("xn00000", "开始时间不能大于结束时间");
        }

        Paginable<InOrder> page = inOrderBO.getPaginable(start, limit,
            condition);
        for (InOrder inOrder : page.getList()) {
            // 下单人
            Agent agent = agentBO.getAgent(inOrder.getApplyUser());
            inOrder.setAgent(agent);

            // 团队长,一级代理自己是团队长
            if (1 != agent.getLevel()) {
                Agent teamLeader = agentBO.getTeamLeader(agent.getTeamName());
                inOrder.setLeaderName(teamLeader.getRealName());
                inOrder.setLeaderMobile(teamLeader.getMobile());
            } else {
                inOrder.setLeaderName(agent.getRealName());
                inOrder.setLeaderMobile(agent.getMobile());
            }

            // 订单归属人
            String toUserName = this.getName(agent);
            inOrder.setToUserName(toUserName);

            // 产品信息
            Product product = productBO.getProduct(inOrder.getProductCode());
            inOrder.setProduct(product);

            inOrder.setPic(product.getAdvPic());
        }
        return page;
    }

    @Override
    public List<InOrder> queryInOrderList(InOrder condition) {
        if (condition.getStartDatetime() != null
                && condition.getEndDatetime() != null && condition
                    .getStartDatetime().after(condition.getEndDatetime())) {
            throw new BizException("xn00000", "开始时间不能大于结束时间");
        }

        List<InOrder> list = inOrderBO.queryInOrderList(condition);
        for (InOrder inOrder : list) {
            // 下单人
            Agent agent = agentBO.getAgent(inOrder.getApplyUser());
            inOrder.setAgent(agent);

            // 团队长,一级代理自己是团队长
            if (1 != agent.getLevel()) {
                Agent teamLeader = agentBO.getTeamLeader(agent.getTeamName());
                inOrder.setLeaderName(teamLeader.getRealName());
                inOrder.setLeaderMobile(teamLeader.getMobile());
            } else {
                inOrder.setLeaderName(agent.getRealName());
                inOrder.setLeaderMobile(agent.getMobile());
            }

            // 订单归属人
            String toUserName = this.getName(agent);
            inOrder.setToUserName(toUserName);

            // 产品信息
            Product product = productBO.getProduct(inOrder.getProductCode());
            inOrder.setProduct(product);
        }
        return list;
    }

    @Override
    public InOrder getInOrder(String code) {
        InOrder inOrder = inOrderBO.getInOrder(code);
        // 下单人
        Agent agent = agentBO.getAgent(inOrder.getApplyUser());
        inOrder.setAgent(agent);

        // 订单归属人
        String toUserName = this.getName(agent);
        inOrder.setToUserName(toUserName);

        // 产品信息
        Product product = productBO.getProduct(inOrder.getProductCode());
        inOrder.setProduct(product);
        return inOrder;
    }

    private void payAward(InOrder data) {

        Product product = productBO.getProduct(data.getProductCode());
        Agent applyUser = agentBO.getAgent(data.getApplyUser());
        Long orderAmount = data.getAmount();

        // 下单代理不是一级代理
        String fromUserId = ESysUser.SYS_USER_BH.getCode();
        if (!(StringValidater
            .toInteger(EAgentLevel.ONE.getCode()) == (applyUser.getLevel()))) {
            fromUserId = applyUser.getHighUserId();
        }

        // **********出货奖*******
        // 出货奖励,且产品计入出货
        if (EProductIsTotal.YES.getCode().equals(product.getIsTotal())) {
            ChAward award = chAwardBO.getChAwardByLevel(applyUser.getLevel(),
                data.getAmount());
            if (award != null) {
                Long awardAmount = AmountUtil.mul(orderAmount,
                    award.getPercent() / 100);
                accountBO.transAmountCZB(fromUserId, ECurrency.YJ_CNY.getCode(),
                    applyUser.getUserId(), ECurrency.YJ_CNY.getCode(),
                    awardAmount, EBizType.AJ_CHJL, EBizType.AJ_CHJL.getValue(),
                    EBizType.AJ_CHJL.getValue(), data.getCode());
            }
        }

        // **********推荐奖**********
        // 是否有推荐人
        if (this.checkAward(applyUser)) {
            if (StringUtils.isNotBlank(applyUser.getUserReferee())) {
                // 直接推荐人
                Agent firstReferee = agentBO
                    .getAgent(applyUser.getUserReferee());
                TjAward tjAward = tjAwardBO.getAwardByLevel(
                    applyUser.getLevel(), data.getProductCode());

                Long amount = 0L;
                // 直接推荐奖
                if (null != firstReferee) {
                    amount = AmountUtil.mul(orderAmount,
                        tjAward.getValue1() / 100);
                    accountBO.transAmountCZB(fromUserId,
                        ECurrency.YJ_CNY.getCode(), firstReferee.getUserId(),
                        ECurrency.YJ_CNY.getCode(), amount, EBizType.AJ_TJJL,
                        EBizType.AJ_TJJL.getValue(),
                        EBizType.AJ_TJJL.getValue(), data.getCode());

                    // 间接推荐奖
                    if (StringUtils.isNotBlank(firstReferee.getUserReferee())) {
                        Agent secondReferee = agentBO
                            .getAgent(firstReferee.getUserReferee());
                        amount = AmountUtil.mul(orderAmount,
                            tjAward.getValue2() / 100);
                        accountBO.transAmountCZB(fromUserId,
                            ECurrency.YJ_CNY.getCode(),
                            secondReferee.getUserId(),
                            ECurrency.YJ_CNY.getCode(), amount,
                            EBizType.AJ_TJJL, EBizType.AJ_TJJL.getValue(),
                            EBizType.AJ_TJJL.getValue(), data.getCode());

                        // 次推荐奖
                        if (StringUtils
                            .isNotBlank(secondReferee.getUserReferee())) {
                            Agent thirdReferee = agentBO
                                .getAgent(secondReferee.getUserReferee());
                            amount = AmountUtil.mul(orderAmount,
                                tjAward.getValue3() / 100);
                            accountBO.transAmountCZB(fromUserId,
                                ECurrency.YJ_CNY.getCode(),
                                thirdReferee.getUserId(),
                                ECurrency.YJ_CNY.getCode(), amount,
                                EBizType.AJ_TJJL, EBizType.AJ_TJJL.getValue(),
                                EBizType.AJ_TJJL.getValue(), data.getCode());
                        }
                    }
                }
            }
        }
    }

    @Override
    public void cancelInOrder(String code) {
        InOrder data = inOrderBO.getInOrder(code);

        // 订单已申请取消或已取消
        if (EInOrderStatus.TO_Cancel.getCode().equals(data.getStatus())
                || EOrderStatus.Canceled.getCode().equals(data.getStatus())) {
            throw new BizException("xn00000", "订单已申请取消喽，请勿重复申请！");
        }
        // 订单已发货或已收货无法取消
        if (!EInOrderStatus.Unpaid.getCode().equals(data.getStatus())) {
            throw new BizException("xn00000", "订单已收货，无法申请取消");
        }

        data.setStatus(EOrderStatus.TO_Cancel.getCode());
        inOrderBO.cancelInOrder(data);
    }

    @Override
    public void approveCancel(String code, String result, String updater,
            String remark) {
        InOrder data = inOrderBO.getInOrder(code);
        if (!EOrderStatus.TO_Cancel.getCode().equals(data.getStatus())) {
            throw new BizException("xn0000", "该订单未申请取消");
        }

        data.setStatus(EOrderStatus.Paid.getCode());
        if (EResult.Result_YES.getCode().equals(result)) {
            data.setStatus(EOrderStatus.Canceled.getCode());
            // 云仓提货，归还云仓库存
            if (EChannelType.NBZ.getCode().equals(data.getPayType())) {
                String toUser = data.getToUser();
                if (StringUtils.isBlank(toUser)) {
                    toUser = ESysUser.SYS_USER_BH.getCode();
                }

                accountBO.transAmountCZB(toUser, ECurrency.YJ_CNY.getCode(),
                    data.getApplyUser(), ECurrency.YJ_CNY.getCode(),
                    data.getAmount(), EBizType.AJ_GMCP_TK,
                    EBizType.AJ_GMCP_TK.getValue(),
                    EBizType.AJ_GMCP_TK.getValue(), data.getCode());
            }
        }
        data.setRemark(remark);
        inOrderBO.approveCancel(data);

    }

    // 检查介绍奖与推荐奖是否同时存在
    private boolean checkAward(Agent agent) {
        // 介绍人与推荐人同时存在
        if (StringUtils.isNotBlank(agent.getIntroducer())
                && StringUtils.isNotBlank(agent.getUserReferee())) {
            // 下单金额是否超过授权金额
            InOrder condition = new InOrder();
            condition.setApplyUser(agent.getUserId());
            condition.setStatus(EOrderStatus.Received.getCode());
            List<InOrder> list = inOrderBO.queryInOrderList(condition);
            Long amount = 0L;
            for (InOrder inOrder : list) {
                amount = amount + inOrder.getAmount();
            }

            AgentLevel impower = agentLevelBO.getAgentByLevel(agent.getLevel());
            if (impower.getMinCharge() >= amount) {
                return false;
            }
        }
        return true;
    }

    private void payOrder(Agent agent, InOrder data, String wechatOrderNo) {

        // 改变产品数量
        Product pData = productBO.getProduct(data.getProductCode());
        Specs psData = specsBO.getSpecs(data.getSpecsCode());
        this.changeProductNumber(agent, pData, psData, data,
            -data.getQuantity(), data.getCode());

        // 订单归属人不是平台，托管账户与代理账户同时加钱
        if (!(StringValidater.toInteger(EAgentLevel.ONE.getCode()) == agent
            .getLevel())) {
            Account account = accountBO.getAccountByUser(agent.getUserId(),
                ECurrency.YJ_CNY.getCode());
            // 收款方账户价钱
            accountBO.changeAmount(account.getAccountNumber(),
                EChannelType.WeChat_H5, wechatOrderNo, data.getPayGroup(),
                data.getCode(), EBizType.AJ_YCCH, EBizType.AJ_YCCH.getValue(),
                data.getAmount());
            // 托管账户加钱
            accountBO.changeAmount(ESystemCode.BH.getCode(),
                EChannelType.getEChannelType(data.getPayType()), wechatOrderNo,
                data.getPayGroup(), data.getCode(), EBizType.AJ_GMYC,
                EBizType.AJ_GMYC.getValue(), data.getAmount());
        } else {
            // 订单归属人是平台，只有托管账户加钱
            accountBO.changeAmount(ESystemCode.BH.getCode(),
                EChannelType.getEChannelType(data.getPayType()), wechatOrderNo,
                data.getPayGroup(), data.getCode(), EBizType.AJ_GMYC,
                EBizType.AJ_GMYC.getValue(), data.getAmount());
        }
    }

    @Override
    @Transactional
    public void invalidInOrder(String code, String updater, String remark) {
        InOrder data = inOrderBO.getInOrder(code);
        // 非待支付与未审核订单无法作废
        if (!EOrderStatus.Unpaid.getCode().equals(data.getStatus())) {
            throw new BizException("xn00000", "该订单无法作废");
        }
        inOrderBO.invalidOrder(data, updater, remark);

    }

    // 删除未支付订单
    public void removeOrderTimer() {
        // 每十二个小时执行一次，删除是个小时前未支付的订单
        Date date = new Date();
        InOrder condition = new InOrder();
        condition.setStatus(EOrderStatus.Unpaid.getCode());
        condition.setEndDatetime(date);
        List<InOrder> list = inOrderBO.queryInOrderList(condition);
        for (InOrder data : list) {
            inOrderBO.removeOrder(data);
        }
    }

    // 变动产品数量
    private void changeProductNumber(Agent agent, Product pData, Specs psData,
            InOrder inOrder, Integer number, String code) {
        int minNumber = specsBO.getMinSpecsNumber(pData.getCode());
        int quantity = number * minNumber;
        // 开启云仓的代理
        AgentLevel agentLevel = agentLevelBO.getAgentByLevel(agent.getLevel());
        if (EBoolean.YES.getCode().equals(agentLevel.getIsWare())) {
            // 非最高等级代理，扣减上级云仓
            if (StringValidater.toInteger(EAgentLevel.ONE.getCode()) != agent
                .getLevel()) {
                Ware toWare = wareBO.getWareByProductSpec(inOrder.getToUser(),
                    inOrder.getSpecsCode());
                // 上级云仓没有该产品
                if (null == toWare) {
                    throw new BizException("xn00000", "上级代理云仓中没有该产品");
                } else {
                    // 改变上级云仓
                    wareBO.changeWare(toWare.getCode(), number,
                        EBizType.AJ_YCCH, EBizType.AJ_YCCH.getValue(),
                        inOrder.getCode());
                }

            } else {
                // 无上级代理,扣减产品实际库存
                specsLogBO.saveExchangeLog(pData,
                    EProductLogType.Order.getCode(), pData.getRealNumber(),
                    quantity, null);
                pData.setRealNumber(pData.getRealNumber() + quantity);
                productBO.refreshRealNumber(pData);
            }
        }
    }

    private String getName(Agent agent) {
        if (agentBO.isHighest(agent.getUserId())) {
            Agent highAgent = agentBO.getAgent(agent.getHighUserId());
            return highAgent.getRealName();
        }
        SYSUser sysUser = sysUserBO.getUser(agent.getHighUserId());
        return sysUser.getRealName();
    }
}