package com.bh.mall.ao.impl;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bh.mall.ao.IOrderAO;
import com.bh.mall.ao.IWareHouseAO;
import com.bh.mall.bo.IAddressBO;
import com.bh.mall.bo.IAgentBO;
import com.bh.mall.bo.IAgentImpowerBO;
import com.bh.mall.bo.IOrderBO;
import com.bh.mall.bo.IProductBO;
import com.bh.mall.bo.IProductSpecsBO;
import com.bh.mall.bo.IProductSpecsPriceBO;
import com.bh.mall.bo.ISYSConfigBO;
import com.bh.mall.bo.IUserBO;
import com.bh.mall.bo.IWareHouseBO;
import com.bh.mall.bo.IWareHouseSpecsBO;
import com.bh.mall.bo.base.Page;
import com.bh.mall.bo.base.Paginable;
import com.bh.mall.common.AmountUtil;
import com.bh.mall.core.StringValidater;
import com.bh.mall.domain.Agent;
import com.bh.mall.domain.Product;
import com.bh.mall.domain.ProductSpecs;
import com.bh.mall.domain.ProductSpecsPrice;
import com.bh.mall.domain.User;
import com.bh.mall.domain.WareHouse;
import com.bh.mall.dto.req.XN627815Req;
import com.bh.mall.dto.res.XN627814Res;
import com.bh.mall.enums.EBizType;
import com.bh.mall.enums.EBoolean;
import com.bh.mall.enums.EOrderKind;
import com.bh.mall.exception.BizException;

@Service
public class WareHouseAOImpl implements IWareHouseAO {

    @Autowired
    IWareHouseBO wareHouseBO;

    @Autowired
    IUserBO userBO;

    @Autowired
    IProductBO productBO;

    @Autowired
    IAgentBO agentBO;

    @Autowired
    IOrderBO orderBO;

    @Autowired
    ISYSConfigBO sysConfigBO;

    @Autowired
    IWareHouseSpecsBO wareHouseSpecsBO;

    @Autowired
    IProductSpecsBO productSpecsBO;

    @Autowired
    IProductSpecsPriceBO productSpecsPriceBO;

    @Autowired
    IAgentImpowerBO agentImpowerBO;

    @Autowired
    IOrderAO orderAO;

    @Autowired
    IAddressBO addressBO;

    @Override
    public Paginable<WareHouse> queryWareHousePage(int start, int limit,
            WareHouse condition) {
        long count = wareHouseBO.getTotalCountByProduct(condition);
        Page<WareHouse> page = new Page<WareHouse>(start, limit, count);
        List<WareHouse> list = wareHouseBO.queryWareHousePorductList(condition);

        WareHouse specsCondition = new WareHouse();
        for (WareHouse wareHouse : list) {
            User user = userBO.getUser(wareHouse.getUserId());
            wareHouse.setUser(user);
            Product product = productBO.getProduct(wareHouse.getProductCode());
            wareHouse.setProduct(product);
            specsCondition.setUserId(wareHouse.getUserId());
            specsCondition.setProductCode(wareHouse.getProductCode());
            wareHouse
                .setWhsList(wareHouseBO.queryWareHouseList(specsCondition));

        }

        page.setList(list);
        return page;
    }

    @Override
    public List<WareHouse> queryWareHouseList(WareHouse condition) {
        List<WareHouse> list = wareHouseBO.queryWareHouseList(condition);
        WareHouse specsCondition = new WareHouse();
        for (WareHouse wareHouse : list) {
            User user = userBO.getUser(wareHouse.getUserId());
            wareHouse.setUser(user);
            Product product = productBO.getProduct(wareHouse.getProductCode());
            wareHouse.setProduct(product);
            specsCondition.setUserId(wareHouse.getUserId());
            specsCondition.setProductCode(wareHouse.getProductCode());
            wareHouse
                .setWhsList(wareHouseBO.queryWareHouseList(specsCondition));
            int minSpecsNumber = productSpecsBO
                .getMinSpecsNumber(product.getCode());
            wareHouse.setAllQuantity(minSpecsNumber * wareHouse.getQuantity());
        }
        return list;
    }

    @Override
    public WareHouse getWareHouse(String code) {

        WareHouse data = wareHouseBO.getWareHouse(code);
        User user = userBO.getUser(data.getUserId());
        WareHouse condition = new WareHouse();
        condition.setUserId(data.getUserId());
        condition.setProductCode(data.getProductCode());
        List<WareHouse> specsList = wareHouseBO.queryWareHouseList(condition);
        for (WareHouse wh : specsList) {
            ProductSpecsPrice price = productSpecsPriceBO
                .getPriceByLevel(wh.getProductSpecsCode(), user.getLevel());
            wh.setPrice(price.getPrice());
        }
        data.setWhsList(specsList);
        Product product = productBO.getProduct(data.getProductCode());
        data.setProduct(product);
        return data;
    }

    @Override
    public Paginable<WareHouse> queryWareHouseFrontPage(int start, int limit,
            WareHouse condition) {
        long count = wareHouseBO.getTotalCountByProduct(condition);
        Page<WareHouse> page = new Page<WareHouse>(start, limit, count);
        List<WareHouse> list = wareHouseBO.queryWareHousePorductList(condition);

        WareHouse specsCondition = new WareHouse();
        for (WareHouse wareHouse : list) {
            User user = userBO.getUser(wareHouse.getUserId());
            wareHouse.setUser(user);
            Product product = productBO.getProduct(wareHouse.getProductCode());
            wareHouse.setProduct(product);
            specsCondition.setUserId(wareHouse.getUserId());
            specsCondition.setProductCode(wareHouse.getProductCode());
            wareHouse
                .setWhsList(wareHouseBO.queryWareHouseList(specsCondition));
            int minSpecsNumber = productSpecsBO
                .getMinSpecsNumber(product.getCode());
            wareHouse.setAllQuantity(minSpecsNumber * wareHouse.getQuantity());

        }
        page.setList(list);
        return page;
    }

    @Override
    public XN627814Res getWareHouseByUser(String userId) {
        XN627814Res res = null;
        Long allAmount = 0L;
        List<WareHouse> list = wareHouseBO.getWareHouseByUser(userId);
        for (WareHouse wareHouse : list) {
            if (StringUtils.isNotBlank(wareHouse.getProductCode())) {
                Product product = productBO
                    .getProduct(wareHouse.getProductCode());
                wareHouse.setProduct(product);
                allAmount = allAmount + wareHouse.getAmount();
            }
        }
        allAmount = AmountUtil.eraseLiUp(allAmount);
        res = new XN627814Res(list, allAmount);
        return res;
    }

    @Override
    @Transactional
    public void deliveProject(XN627815Req req) {
        User user = userBO.getUser(req.getUserId());
        WareHouse data = wareHouseBO.getWareHouseByProductSpec(req.getUserId(),
            req.getProductSpecsCode());
        if (null == data) {
            throw new BizException("xn00000", "您仓库中没有该规格的产品");
        }

        ProductSpecs psData = productSpecsBO
            .getProductSpecs(data.getProductSpecsCode());
        ProductSpecsPrice pspData = productSpecsPriceBO
            .getPriceByLevel(data.getProductSpecsCode(), user.getLevel());

        // 检查限购
        orderAO.checkLimitNumber(user, psData, pspData,
            StringValidater.toInteger(req.getQuantity()));
        if (pspData.getMinNumber() > data.getQuantity()) {
            throw new BizException("xn00000",
                "该产品云仓提货不能少于" + pspData.getMinNumber() + psData.getName());
        }

        // 剩余产品是否充足
        Product product = productBO.getProduct(data.getProductCode());
        if (data.getQuantity() < StringValidater.toInteger(req.getQuantity())) {
            throw new BizException("xn00000", "您仓库中该规格的产品数量不足");
        }
        Long amount = data.getPrice()
                * StringValidater.toInteger(req.getQuantity());

        // 获取授权单
        String kind = EOrderKind.Pick_Up.getCode();
        Agent agent = agentBO.getAgentByLevel(user.getLevel());

        // 是否完成授权单
        if (orderBO.checkImpowerOrder(user.getUserId())) {
            if (agent.getAmount() > amount) {
                throw new BizException("xn00000", agent.getName() + "授权单金额为["
                        + agent.getAmount() / 1000 + "]元");
            } else {
                kind = EOrderKind.Impower_Order.getCode();
            }

        } else {
            kind = EOrderKind.Pick_Up.getCode();
        }

        // 是否完成升级单
        // if (EUserStatus.UPGRADED.getCode().equals(user.getStatus())) {
        // if (!orderBO.checkUpgradeOrder(user.getUserId())) {
        // kind = EOrderKind.Upgrade_Order.getCode();
        // }
        // }
        // 订单拆单
        if (EBoolean.YES.getCode().equals(psData.getIsSingle())) {

            int singleNumber = StringValidater.toInteger(req.getQuantity())
                    / psData.getSingleNumber();

            for (int i = 0; i < singleNumber; i++) {

                String code = orderBO.pickUpGoods(data.getProductCode(),
                    data.getProductName(), product.getPic(),
                    data.getProductSpecsCode(), data.getProductSpecsName(),
                    psData.getSingleNumber(), data.getPrice(),
                    user.getHighUserId(),
                    psData.getSingleNumber() * data.getPrice(),
                    data.getUserId(), req.getSigner(), req.getMobile(),
                    req.getProvince(), req.getCity(), req.getArea(),
                    req.getAddress(), kind);

                // 减少云仓库存
                wareHouseBO.changeWareHouse(data.getCode(),
                    -StringValidater.toInteger(req.getQuantity()),
                    EBizType.AJ_YCTH, EBizType.AJ_YCTH.getValue(), code);
            }
        } else {
            String code = orderBO.pickUpGoods(data.getProductCode(),
                data.getProductName(), product.getPic(),
                data.getProductSpecsCode(), data.getProductSpecsName(),
                psData.getSingleNumber(), data.getPrice(), user.getHighUserId(),
                psData.getSingleNumber() * data.getPrice(), data.getUserId(),
                req.getSigner(), req.getMobile(), req.getProvince(),
                req.getCity(), req.getArea(), req.getAddress(), kind);
            // 减少云仓库存
            wareHouseBO.changeWareHouse(data.getCode(),
                -StringValidater.toInteger(req.getQuantity()), EBizType.AJ_YCTH,
                EBizType.AJ_YCTH.getValue(), code);
        }

    }

    @Override
    public Paginable<WareHouse> queryWareHouseCFrontPage(int start, int limit,
            WareHouse condition) {
        long count = wareHouseBO.getTotalCountByProduct(condition);
        Page<WareHouse> page = new Page<WareHouse>(start, limit, count);
        List<WareHouse> list = wareHouseBO.queryWareHousePorductList(condition);
        WareHouse specsCondition = new WareHouse();
        Product product = null;
        for (WareHouse wareHouse : list) {
            product = productBO.getProduct(wareHouse.getProductCode());
            wareHouse.setProduct(product);
            specsCondition.setUserId(wareHouse.getUserId());
            specsCondition.setProductCode(wareHouse.getProductCode());
            List<WareHouse> whList = wareHouseBO
                .queryWareHouseList(specsCondition);
            for (WareHouse wh : whList) {
                ProductSpecsPrice price = productSpecsPriceBO
                    .getPriceByLevel(wh.getProductSpecsCode(), 6);
                wh.setPrice(price.getPrice());
            }
            wareHouse.setWhsList(whList);
        }
        page.setList(list);
        return page;
    }

    @Override
    public WareHouse getWareHouseByCustomer(String code) {
        WareHouse data = wareHouseBO.getWareHouse(code);
        WareHouse condition = new WareHouse();
        condition.setUserId(data.getUserId());
        condition.setProductCode(data.getProductCode());
        List<WareHouse> specsList = wareHouseBO.queryWareHouseList(condition);
        for (WareHouse wareHouse : specsList) {
            ProductSpecsPrice price = productSpecsPriceBO
                .getPriceByLevel(wareHouse.getProductSpecsCode(), 6);
            wareHouse.setPrice(price.getPrice());
        }
        data.setWhsList(specsList);
        Product product = productBO.getProduct(data.getProductCode());
        data.setProduct(product);
        return data;
    }
}
