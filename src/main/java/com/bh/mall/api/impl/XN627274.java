package com.bh.mall.api.impl;

import com.bh.mall.ao.ISjFormAO;
import com.bh.mall.api.AProcessor;
import com.bh.mall.common.JsonUtil;
import com.bh.mall.core.ObjValidater;
import com.bh.mall.dto.req.XN627274Req;
import com.bh.mall.dto.res.BooleanRes;
import com.bh.mall.exception.BizException;
import com.bh.mall.exception.ParaException;
import com.bh.mall.spring.SpringContextHolder;

public class XN627274 extends AProcessor {

    private ISjFormAO userAO = SpringContextHolder.getBean(ISjFormAO.class);

    private XN627274Req req = null;

    @Override
    public Object doBusiness() throws BizException {
        userAO.cancelSjForm(req.getUserId());
        return new BooleanRes(true);
    }

    @Override
    public void doCheck(String inputparams) throws ParaException {
        req = JsonUtil.json2Bean(inputparams, XN627274Req.class);
        ObjValidater.validateReq(req);
    }
}
