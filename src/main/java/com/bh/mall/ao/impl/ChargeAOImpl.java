package com.bh.mall.ao.impl;

import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bh.mall.ao.IChargeAO;
import com.bh.mall.bo.IAccountBO;
import com.bh.mall.bo.IAgentBO;
import com.bh.mall.bo.IAgentLevelBO;
import com.bh.mall.bo.IChargeBO;
import com.bh.mall.bo.base.Paginable;
import com.bh.mall.domain.Account;
import com.bh.mall.domain.Agent;
import com.bh.mall.domain.AgentLevel;
import com.bh.mall.domain.Charge;
import com.bh.mall.enums.EBizType;
import com.bh.mall.enums.EBoolean;
import com.bh.mall.enums.EChannelType;
import com.bh.mall.enums.EChargeStatus;
import com.bh.mall.exception.BizException;

@Service
public class ChargeAOImpl implements IChargeAO {

    @Autowired
    IAccountBO accountBO;

    @Autowired
    IChargeBO chargeBO;

    @Autowired
    IAgentBO agentBO;

    @Autowired
    IAgentLevelBO agentLevelBO;

    @Override
    public String applyCharge(String accountNumber, String type, Long amount,
            String applyUser, String applyNote, String chargePdf) {
        if (amount < 0) {
            throw new BizException("xn000000", "金额需大于零");
        }
        Agent agent = agentBO.getAgent(applyUser);
        // 没有充值过
        List<Charge> charge = chargeBO.getChargeByUser(agent.getUserId(),
            agent.getImpowerDatetime());
        if (CollectionUtils.isEmpty(charge)) {
            // 首次不能低于授权金额
            AgentLevel impower = agentLevelBO.getAgentByLevel(agent.getLevel());
            if (impower.getMinCharge() > amount) {
                throw new BizException("xn000000",
                    "授权金额不能低于[" + impower.getMinCharge() / 1000 + "]");
            }

        }
        // 普通充值
        AgentLevel agentLevl = agentLevelBO.getAgentByLevel(agent.getLevel());
        if (agentLevl.getMinChargeAmount() > amount) {
            throw new BizException("xn000000",
                "充值金额不能低于[" + agentLevl.getMinChargeAmount() / 1000 + "]");
        }

        Account account = accountBO.getAccount(accountNumber);
        Long tranAmount = amount;
        if (EBizType.AJ_KK.getCode().equals(type)) {
            tranAmount = -amount;
        }
        // 生成充值订单
        String code = chargeBO.applyOrderOffline(account,
            EBizType.getBizType(type), tranAmount, applyUser, agent.getLevel(),
            applyNote, chargePdf);
        return code;
    }

    @Override
    @Transactional
    public void payCharge(String code, String payUser, String payResult,
            String payNote) {
        Charge data = chargeBO.getCharge(code);
        if (!EChargeStatus.TO_Cancel.getCode().equals(data.getStatus())) {
            throw new BizException("xn000000", "该充值单不是待审核状态");
        }
        if (EBoolean.YES.getCode().equals(payResult)) {
            payOrderYES(data, payUser, payNote);
        } else {
            payOrderNO(data, payUser, payNote);
        }
    }

    private void payOrderNO(Charge data, String payUser, String payNote) {
        chargeBO.payOrder(data, EChargeStatus.Cancel_NO.getCode(), payUser,
            payNote);
    }

    private void payOrderYES(Charge data, String payUser, String payNote) {
        chargeBO.payOrder(data, EChargeStatus.Cancel_YES.getCode(), payUser,
            payNote);
        // 账户加钱
        accountBO.changeAmount(data.getAccountNumber(), EChannelType.Offline,
            null, null, data.getCode(), EBizType.getBizType(data.getBizType()),
            EBizType.getBizType(data.getBizType()).getValue(),
            data.getAmount());
    }

    @Override
    public Paginable<Charge> queryChargePage(int start, int limit,
            Charge condition) {

        return chargeBO.getPaginable(start, limit, condition);
    }

    @Override
    public List<Charge> queryChargeList(Charge condition) {
        List<Charge> list = chargeBO.queryChargeList(condition);
        if (CollectionUtils.isNotEmpty(list)) {
            for (Charge data : list) {
                if (data.getApplyUser() != null) {
                    Agent agent = agentBO.getAgent(data.getApplyUser());
                    data.setAgent(agent);
                    data.setTeamName(agent.getTeamName());
                }
            }
        }
        return list;
    }

    @Override
    public Charge getCharge(String code) {
        Charge data = chargeBO.getCharge(code);
        if (data.getApplyUser() != null) {
            Agent agent = agentBO.getAgent(data.getApplyUser());
            data.setAgent(agent);
            data.setTeamName(agent.getTeamName());
        }
        return data;
    }

    @Override
    public Paginable<Charge> queryFrontChargePage(int start, int limit,
            Charge condition) {
        Paginable<Charge> page = chargeBO.getPaginable(start, limit, condition);
        for (Charge data : page.getList()) {
            Agent agent = agentBO.getAgent(data.getApplyUser());
            data.setTeamName(agent.getTeamName());
        }
        return page;
    }

}
