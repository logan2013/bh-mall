package com.bh.mall.api.impl;

import org.apache.commons.lang3.StringUtils;

import com.bh.mall.ao.IInOrderAO;
import com.bh.mall.api.AProcessor;
import com.bh.mall.common.DateUtil;
import com.bh.mall.common.JsonUtil;
import com.bh.mall.domain.InOrder;
import com.bh.mall.dto.req.XN627916Req;
import com.bh.mall.exception.BizException;
import com.bh.mall.exception.ParaException;
import com.bh.mall.spring.SpringContextHolder;

/**
 * 分页查询云仓订单
 * @author: LENOVO 
 * @since: 2018年8月2日 下午4:30:04 
 * @history:
 */
public class XN627916 extends AProcessor {

    private IInOrderAO inOrderAO = SpringContextHolder
        .getBean(IInOrderAO.class);

    private XN627916Req req = null;

    @Override
    public Object doBusiness() throws BizException {
        InOrder condition = new InOrder();
        condition.setKeyword(req.getKeyword());
        condition.setStatus(req.getStatus());
        condition.setStartDatetime(DateUtil.strToDate(req.getDateStart(),
            DateUtil.DATA_TIME_PATTERN_1));
        condition.setEndDatetime(
            DateUtil.strToDate(req.getDateEnd(), DateUtil.DATA_TIME_PATTERN_1));

        String column = req.getOrderColumn();
        if (StringUtils.isBlank(column)) {
            column = IInOrderAO.DEFAULT_ORDER_COLUMN;
        }
        condition.setOrder(column, req.getOrderDir());

        return inOrderAO.queryInOrderList(condition);
    }

    @Override
    public void doCheck(String inputparams) throws ParaException {
        req = JsonUtil.json2Bean(inputparams, XN627916Req.class);
    }
}