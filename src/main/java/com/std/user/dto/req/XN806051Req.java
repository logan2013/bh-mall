package com.std.user.dto.req;

public class XN806051Req {
    // 类型（选填）
    private String type;

    // 属于（选填）全局+地方默认(没修改)+地方修改过的
    private String belong;

    // 父编号（选填）
    private String parentCode;

    // 公司编号（必填）
    private String companyCode;

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getBelong() {
        return belong;
    }

    public void setBelong(String belong) {
        this.belong = belong;
    }

    public String getParentCode() {
        return parentCode;
    }

    public void setParentCode(String parentCode) {
        this.parentCode = parentCode;
    }

    public String getCompanyCode() {
        return companyCode;
    }

    public void setCompanyCode(String companyCode) {
        this.companyCode = companyCode;
    }
}
