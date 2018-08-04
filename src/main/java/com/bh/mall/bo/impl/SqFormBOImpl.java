package com.bh.mall.bo.impl;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.bh.mall.bo.IAgentLogBO;
import com.bh.mall.bo.ISqFormBO;
import com.bh.mall.bo.base.Page;
import com.bh.mall.bo.base.PaginableBOImpl;
import com.bh.mall.core.StringValidater;
import com.bh.mall.dao.ISqFormDAO;
import com.bh.mall.domain.SqForm;

@Component
public class SqFormBOImpl extends PaginableBOImpl<SqForm> implements ISqFormBO {

    @Autowired
    private ISqFormDAO sqFormDAO;

    @Autowired
    private IAgentLogBO agentLogBO;

    public SqForm applySqForm(String userId, String realName, String mobile,
            String wxId, String applyLevel, String toUserId, String teamName,
            String introducer, String userRefree, String idKind, String idNo,
            String idHand, String province, String city, String area,
            String address, String status) {

        SqForm data = new SqForm();
        data.setUserId(userId);
        data.setRealName(realName);
        data.setMobile(mobile);
        data.setWxId(wxId);

        data.setApplyLevel(StringValidater.toInteger(applyLevel));
        data.setToUserId(toUserId);
        data.setTeamName(teamName);
        data.setIdKind(idKind);
        data.setIdNo(idNo);

        data.setIdHand(idHand);
        data.setIntroducer(introducer);
        data.setReferrer(userRefree);
        data.setProvince(province);
        data.setCity(city);

        data.setArea(area);
        data.setAddress(address);
        data.setStatus(status);
        Date date = new Date();
        data.setApplyDatetime(date);
        sqFormDAO.insert(data);
        return data;
    }

    // 详细查询
    @Override
    public SqForm getSqForm(String userId) {
        SqForm data = null;
        if (StringUtils.isNotBlank(userId)) {
            SqForm condition = new SqForm();
            condition.setUserId(userId);
            data = sqFormDAO.select(condition);
        }
        return data;
    }

    // 分页查询
    @Override
    public List<SqForm> querySqFormPage(int start, int limit,
            SqForm condition) {
        long totalCount = sqFormDAO.selectTotalCount(condition);
        Page<SqForm> page = new Page<SqForm>(start, limit, totalCount);
        return sqFormDAO.selectList(condition, page.getPageNO(),
            page.getPageSize());
    }

    // 列表查询
    @Override
    public List<SqForm> querySqFormList(SqForm condition) {
        return sqFormDAO.selectList(condition);
    }

    @Override
    public String approveSqForm(SqForm data, String approver,
            String approveName, String remark, String status) {
        data.setApprover(approver);
        data.setApproveName(approveName);
        Date date = new Date();
        data.setApproveDatetime(date);
        data.setRemark(remark);

        data.setStatus(status);
        return agentLogBO.applySqForm(data);
    }

    @Override
    public String cancelSqForm(SqForm data, String status) {
        data.setStatus(status);
        Date date = new Date();
        data.setApplyDatetime(date);
        sqFormDAO.cancelSqForm(data);

        return agentLogBO.applySqForm(data);
    }

}
