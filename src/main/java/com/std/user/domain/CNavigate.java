package com.std.user.domain;

import com.std.user.dao.base.ABaseDO;

public class CNavigate extends ABaseDO {

    private static final long serialVersionUID = 1L;

    // 编号
    private String code;

    // 名称
    private String name;

    // 类型
    private String type;

    // url
    private String url;

    // pic
    private String pic;

    // 状态(1 启用 0 不启用)
    private String status;

    // UI 位置
    private String location;

    // 序号
    private Integer orderNo;

    // 属于
    private String belong;

    // 父编号
    private String parentCode;

    // 备注
    private String remark;

    // 内容样式
    private String contentType;

    // 所属公司
    private String companyCode;

    /******************db data******************/

    // 是否地方查询
    private String isDfNavigate;

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public Integer getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(Integer orderNo) {
        this.orderNo = orderNo;
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

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getContentType() {
        return contentType;
    }

    public void setContentType(String contentType) {
        this.contentType = contentType;
    }

    public String getCompanyCode() {
        return companyCode;
    }

    public void setCompanyCode(String companyCode) {
        this.companyCode = companyCode;
    }

    public String getIsDfNavigate() {
        return isDfNavigate;
    }

    public void setIsDfNavigate(String isDfNavigate) {
        this.isDfNavigate = isDfNavigate;
    }
}
