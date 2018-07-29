package com.bh.mall.dto.req;

import org.hibernate.validator.constraints.NotBlank;

public class XN627288Req extends APageReq {

    private static final long serialVersionUID = 9092885295612580388L;

    // 用户编号
    @NotBlank(message = "用户编号不能为空")
    private String userId;

    // （选填）等级
    private String level;

    // （选填）申请等级
    private String applyLevel;

    // 状态（选填）
    private String status;

    // 关键字 （选填）
    private String keyword;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public String getApplyLevel() {
        return applyLevel;
    }

    public void setApplyLevel(String applyLevel) {
        this.applyLevel = applyLevel;
    }
}