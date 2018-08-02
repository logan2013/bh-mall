package com.bh.mall.domain;

import java.util.Date;

import com.bh.mall.dao.base.ABaseDO;

/**
 * 代理升级单
 * @author: nyc 
 * @since: 2018年7月29日 下午8:03:07 
 * @history:
 */
public class SjForm extends ABaseDO {

    private static final long serialVersionUID = 4666159752651876262L;

    // 编码
    private String code;

    // 申请人
    private String userId;

    // 新上级
    private String toUserId;

    // 申请等级
    private Integer applyLevel;

    // 半门槛推荐人数
    private String reNumber;

    // 打款金额
    private Long payAmount;

    // 打款截图
    private String payPdf;

    // 审核人
    private String approver;

    // 申请时间
    private Date applyDatetime;

    // 审核时间
    private Date approveDatetime;

    // 状态
    private String status;

    // 备注
    private String remark;

    // *******************db*****************

    // 代理
    private Agent user;

    // 门槛费
    private Long requireAmount;

    // 申请开始时间
    private Date applyDatetimeStart;

    // 申请结束时间
    private Date applyDatetimeEnd;

    // 通过开始时间
    private Date approveDatetimeStart;

    // 通过结束时间
    private Date approveDatetimeEnd;

    // 查询用户id
    private String userIdForQuery;

    // 关键词
    private String keyWord;

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getToUserId() {
        return toUserId;
    }

    public void setToUserId(String toUserId) {
        this.toUserId = toUserId;
    }

    // 获取申请人
    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    // 获取申请等级
    public Integer getApplyLevel() {
        return applyLevel;
    }

    public void setApplyLevel(Integer applyLevel) {
        this.applyLevel = applyLevel;
    }

    public Date getApplyDatetime() {
        return applyDatetime;
    }

    public void setApplyDatetime(Date applyDatetime) {
        this.applyDatetime = applyDatetime;
    }

    // 获取申请等级
    public String getReNumber() {
        return reNumber;
    }

    public void setReNumber(String reNumber) {
        this.reNumber = reNumber;
    }

    // 获取付款金额
    public Long getPayAmount() {
        return payAmount;
    }

    public void setPayAmount(Long payAmount) {
        this.payAmount = payAmount;
    }

    // 获取付款截图
    public String getPaymentPdf() {
        return payPdf;
    }

    public void setPaymentPdf(String paymentPdf) {
        this.payPdf = paymentPdf;
    }

    // 获取审核人
    public String getApprover() {
        return approver;
    }

    public void setApprover(String approver) {
        this.approver = approver;
    }

    // 获取审核时间
    public Date getApproveDatetime() {
        return approveDatetime;
    }

    public void setApproveDatetime(Date approveDatetime) {
        this.approveDatetime = approveDatetime;
    }

    // 获取备注
    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    // 获取状态
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    // 获取数据库 buser
    public Agent getUser() {
        return user;
    }

    public void setUser(Agent user) {
        this.user = user;
    }

    // 获取升级金额
    public Long getRequireAmount() {
        return requireAmount;
    }

    public void setRequireAmount(Long requireAmount) {
        this.requireAmount = requireAmount;
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

    public String getUserIdForQuery() {
        return userIdForQuery;
    }

    public void setUserIdForQuery(String userIdForQuery) {
        this.userIdForQuery = userIdForQuery;
    }

    public String getKeyWord() {
        return keyWord;
    }

    public void setKeyWord(String keyWord) {
        this.keyWord = keyWord;
    }

}
