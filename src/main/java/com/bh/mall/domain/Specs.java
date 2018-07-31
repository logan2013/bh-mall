package com.bh.mall.domain;

import java.util.List;

import com.bh.mall.dao.base.ABaseDO;

/**
 * 产品规格表
 * @author: nyc 
 * @since: 2018年3月23日 上午10:47:23 
 * @history:
 */
public class Specs extends ABaseDO {

    private static final long serialVersionUID = -7966448311753734050L;

    // 编号
    private String code;

    // 产品编号
    private String productCode;

    // 是否可拆单
    private String isSingle;

    // 拆单数量
    private Integer singleNumber;

    // 关联拆单规格
    private String refCode;

    // 规格名称
    private String name;

    // 规格包含数量
    private Integer number;

    // 重量
    private Double weight;

    // 是否允许授权单下单
    private String isSqOrder;

    // 是否允许升级单下单
    private String isSjOrder;

    // 是否允许普通单下单
    private String isNormalOrder;

    // 规格价格
    private List<AgentPrice> priceList;

    // *************db**************

    // 规格价格
    private AgentPrice price;

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getProductCode() {
        return productCode;
    }

    public void setProductCode(String productCode) {
        this.productCode = productCode;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public String getIsImpowerOrder() {
        return isSjOrder;
    }

    public void setIsImpowerOrder(String isImpowerOrder) {
        this.isSjOrder = isImpowerOrder;
    }

    public String getIsUpgradeOrder() {
        return isSqOrder;
    }

    public void setIsUpgradeOrder(String isUpgradeOrder) {
        this.isSqOrder = isUpgradeOrder;
    }

    public String getIsNormalOrder() {
        return isNormalOrder;
    }

    public void setIsNormalOrder(String isNormalOrder) {
        this.isNormalOrder = isNormalOrder;
    }

    public Double getWeight() {
        return weight;
    }

    public void setWeight(Double weight) {
        this.weight = weight;
    }

    public List<AgentPrice> getPriceList() {
        return priceList;
    }

    public void setPriceList(List<AgentPrice> priceList) {
        this.priceList = priceList;
    }

    public AgentPrice getPrice() {
        return price;
    }

    public void setPrice(AgentPrice price) {
        this.price = price;
    }

    public String getIsSingle() {
        return isSingle;
    }

    public Integer getSingleNumber() {
        return singleNumber;
    }

    public String getRefCode() {
        return refCode;
    }

    public void setIsSingle(String isSingle) {
        this.isSingle = isSingle;
    }

    public void setSingleNumber(Integer singleNumber) {
        this.singleNumber = singleNumber;
    }

    public void setRefCode(String refCode) {
        this.refCode = refCode;
    }

}