package com.bh.mall.api.impl;

import com.bh.mall.ao.IProCodeAO;
import com.bh.mall.api.AProcessor;
import com.bh.mall.common.JsonUtil;
import com.bh.mall.core.ObjValidater;
import com.bh.mall.dto.req.XN627870Req;
import com.bh.mall.exception.BizException;
import com.bh.mall.exception.ParaException;
import com.bh.mall.spring.SpringContextHolder;

/**
 * 预览打印
 * @author: nyc 
 * @since: 2018年7月1日 下午9:22:35 
 * @history:
 */
public class XN627870 extends AProcessor {

    private IProCodeAO proCodeAO = SpringContextHolder
        .getBean(IProCodeAO.class);

    private XN627870Req req = null;

    @Override
    public Object doBusiness() throws BizException {
        return proCodeAO.queryProCode();
    }

    @Override
    public void doCheck(String inputparams) throws ParaException {
        req = JsonUtil.json2Bean(inputparams, XN627870Req.class);
        ObjValidater.validateReq(req);
    }

}