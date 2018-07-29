package com.bh.mall.domain;

import java.util.Date;

import com.bh.mall.dao.base.ABaseDO;

/**
* 售后单
* @author: chenshan 
* @since: 2018-03-29 16:39:02
* @history:
*/
public class AgencyLog extends ABaseDO {

    private static final long serialVersionUID = 1L;

    // 编号
    private String code;

    // 意向归属人
    private String toUserId;

    // 类型[意向分配/授权/升级]
    private String type;

    // 申请人
    private String applyUser;

    // 申请时间
    private Date applyDatetime;

    // 当前等级
    private Integer level;

    // 申请等级
    private Integer applyLevel;

    // 上级
    private String highUserId;

    // 推荐人
    private String userReferee;

    // 团队名称
    private String teamName;

    // 打款截图
    private String payPdf;

    // 状态
    private String status;

    // 审核人
    private String approver;

    // 审核时间
    private Date approveDatetime;

    // 备注
    private String remark;

    // ******************db***********
    private Date applyDatetimeStart;

    private Date applyDatetimeEnd;

    private String keyWord;

    private String userIdForQuery;

    private Date approveDatetimeStart;

    private Date approveDatetimeEnd;

    private Agent agent;

    private String refereeName;

    private String approvName;

    private Long impowerAmount;

    public String getRefereeName() {
        return refereeName;
    }

    public void setRefereeName(String refereeName) {
        this.refereeName = refereeName;
    }

    public Agent getAgent() {
        return agent;
    }

    public void setAgent(Agent agent) {
        this.agent = agent;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getCode() {
        return code;
    }

    public void setToUserId(String toUserId) {
        this.toUserId = toUserId;
    }

    public String getToUserId() {
        return toUserId;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getType() {
        return type;
    }

    public void setApplyUser(String applyUser) {
        this.applyUser = applyUser;
    }

    public String getApplyUser() {
        return applyUser;
    }

    public Date getApplyDatetime() {
        return applyDatetime;
    }

    public void setApplyDatetime(Date applyDatetime) {
        this.applyDatetime = applyDatetime;
    }

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    public String getUserIdForQuery() {
        return userIdForQuery;
    }

    public void setUserIdForQuery(String userIdForQuery) {
        this.userIdForQuery = userIdForQuery;
    }

    public Integer getApplyLevel() {
        return applyLevel;
    }

    public void setApplyLevel(Integer applyLevel) {
        this.applyLevel = applyLevel;
    }

    public void setApproveDatetime(Date approveDatetime) {
        this.approveDatetime = approveDatetime;
    }

    public String getHighUserId() {
        return highUserId;
    }

    public void setHighUserId(String highUserId) {
        this.highUserId = highUserId;
    }

    public void setUserReferee(String userReferee) {
        this.userReferee = userReferee;
    }

    public String getUserReferee() {
        return userReferee;
    }

    public void setTeamName(String teamName) {
        this.teamName = teamName;
    }

    public String getTeamName() {
        return teamName;
    }

    public void setPayPdf(String payPdf) {
        this.payPdf = payPdf;
    }

    public String getPayPdf() {
        return payPdf;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getStatus() {
        return status;
    }

    public void setApprover(String approver) {
        this.approver = approver;
    }

    public String getApprover() {
        return approver;
    }

    public Date getApproveDatetime() {
        return approveDatetime;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getRemark() {
        return remark;
    }

    public Date getApplyDatetimeStart() {
        return applyDatetimeStart;
    }

    public void setApplyDatetimeStart(Date applyDatetimeStart) {
        this.applyDatetimeStart = applyDatetimeStart;
    }

    public Date getApplyDatetimeEnd() {
        return applyDatetimeEnd;
    }

    public void setApplyDatetimeEnd(Date applyDatetimeEnd) {
        this.applyDatetimeEnd = applyDatetimeEnd;
    }

    public String getKeyWord() {
        return keyWord;
    }

    public void setKeyWord(String keyWord) {
        this.keyWord = keyWord;
    }

    public Date getApproveDatetimeStart() {
        return approveDatetimeStart;
    }

    public void setApproveDatetimeStart(Date approveDatetimeStart) {
        this.approveDatetimeStart = approveDatetimeStart;
    }

    public Date getApproveDatetimeEnd() {
        return approveDatetimeEnd;
    }

    public void setApproveDatetimeEnd(Date approveDatetimeEnd) {
        this.approveDatetimeEnd = approveDatetimeEnd;
    }

    public Long getImpowerAmount() {
        return impowerAmount;
    }

    public void setImpowerAmount(Long impowerAmount) {
        this.impowerAmount = impowerAmount;
    }

    public String getApprovName() {
        return approvName;
    }

    public void setApprovName(String approvName) {
        this.approvName = approvName;
    }

}
