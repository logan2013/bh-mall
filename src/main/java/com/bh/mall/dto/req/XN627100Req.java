package com.bh.mall.dto.req;

import org.hibernate.validator.constraints.NotBlank;

/**
 * 新增银行
 * @author: nyc 
 * @since: 2018年4月27日 下午8:53:36 
 * @history:
 */
public class XN627100Req {

    // 银行别称
    @NotBlank(message = "银行别称不能为空")
    private String bankCode;

    // 银行名称
    @NotBlank(message = "银行名称不能为空")
    private String bankName;

    // 更新人
    @NotBlank(message = "更新人不能为空")
    private String updater;

    public String getBankCode() {
        return bankCode;
    }

    public void setBankCode(String bankCode) {
        this.bankCode = bankCode;
    }

    public String getBankName() {
        return bankName;
    }

    public void setBankName(String bankName) {
        this.bankName = bankName;
    }

    public String getUpdater() {
        return updater;
    }

    public void setUpdater(String updater) {
        this.updater = updater;
    }

}
