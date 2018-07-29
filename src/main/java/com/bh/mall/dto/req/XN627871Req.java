package com.bh.mall.dto.req;

import org.hibernate.validator.constraints.NotBlank;

/**
 * 导出防伪溯源码
 * @author: nyc 
 * @since: 2018年7月1日 下午9:22:35 
 * @history:
 */
public class XN627871Req {

    // 每页数量
    @NotBlank(message = "每页数量不能为空")
    private String pageSize;

    // 张数
    @NotBlank(message = "张数不能为空")
    private String pageNo;

    public String getPageSize() {
        return pageSize;
    }

    public String getPageNo() {
        return pageNo;
    }

    public void setPageSize(String pageSize) {
        this.pageSize = pageSize;
    }

    public void setPageNo(String pageNo) {
        this.pageNo = pageNo;
    }

}