package com.bh.mall.enums;

import java.util.HashMap;
import java.util.Map;

public enum ESqFormStatus {

    TO_APPROVE("0", "待上级审核授权"), BC_ZL("1", "补充授权资料"), COMPANY_APPROVE("2",
            "待公司审核授权"), IMPOWERED("3", "已授权"), NO_THROUGH("4",
                    "授权未通过"), TO_CANCEL("5",
                            "申请退出待上级审核"), TO_COMPANY_CANCLE("6", "申请退出待公司审核");

    ESqFormStatus(String code, String value) {
        this.code = code;
        this.value = value;
    }

    public static Map<String, ESqFormStatus> getMap() {
        Map<String, ESqFormStatus> map = new HashMap<String, ESqFormStatus>();
        for (ESqFormStatus userStatus : ESqFormStatus.values()) {
            map.put(userStatus.getCode(), userStatus);
        }
        return map;
    }

    private String code;

    private String value;

    public String getCode() {
        return code;
    }

    public String getValue() {
        return value;
    }
}
