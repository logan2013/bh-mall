package com.bh.mall.domain;

import java.util.Date;

import com.bh.mall.dao.base.ABaseDO;

/**
 * 代理等级表 agent
 * @author: nyc 
 * @since: 2018年1月31日 下午2:04:03 
 * @history:
 */
public class Agent extends ABaseDO {

    private static final long serialVersionUID = -8708365669948607235L;

    // 等级
    private Integer level;

    // 等级名称
    private String name;

    // 首次授权金额
    private Long amount;

    // 红线金额
    private Long redAmount;

    // 本等级每次最低充值金额
    private Long minChargeAmount;

    // 本等级门槛最低余额
    private Long minSurplus;

    // 本等级是够开启云仓
    private String isWareHouse;

    // 授权单是否可以自发
    private String isSend;

    // 更新人
    private String updater;

    // 更新时间
    private Date updateDatetime;

    // 备注
    private String remark;

    // ***************db*************
    private Integer lowLevel;

    private Integer highLevel;

    // 是够需要实名
    private String isRealName;

    public Integer getLowLevel() {
        return lowLevel;
    }

    public void setLowLevel(Integer lowLevel) {
        this.lowLevel = lowLevel;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    public Long getAmount() {
        return amount;
    }

    public void setAmount(Long amount) {
        this.amount = amount;
    }

    public Long getRedAmount() {
        return redAmount;
    }

    public void setRedAmount(Long redAmount) {
        this.redAmount = redAmount;
    }

    public Long getMinChargeAmount() {
        return minChargeAmount;
    }

    public void setMinChargeAmount(Long minChargeAmount) {
        this.minChargeAmount = minChargeAmount;
    }

    public String getUpdater() {
        return updater;
    }

    public void setUpdater(String updater) {
        this.updater = updater;
    }

    public Date getUpdateDatetime() {
        return updateDatetime;
    }

    public void setUpdateDatetime(Date updateDatetime) {
        this.updateDatetime = updateDatetime;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Long getMinSurplus() {
        return minSurplus;
    }

    public void setMinSurplus(Long minSurplus) {
        this.minSurplus = minSurplus;
    }

    public String getIsWareHouse() {
        return isWareHouse;
    }

    public void setIsWareHouse(String isWareHouse) {
        this.isWareHouse = isWareHouse;
    }

    public String getIsSend() {
        return isSend;
    }

    public void setIsSend(String isSend) {
        this.isSend = isSend;
    }

    public Integer getHighLevel() {
        return highLevel;
    }

    public void setHighLevel(Integer highLevel) {
        this.highLevel = highLevel;
    }

    public String getIsRealName() {
        return isRealName;
    }

    public void setIsRealName(String isRealName) {
        this.isRealName = isRealName;
    }

}
