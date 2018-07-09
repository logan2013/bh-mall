package com.bh.mall.api.impl;

import com.bh.mall.ao.IUserAO;
import com.bh.mall.api.AProcessor;
import com.bh.mall.common.JsonUtil;
import com.bh.mall.core.ObjValidater;
import com.bh.mall.dto.req.XN627363Req;
import com.bh.mall.dto.res.BooleanRes;
import com.bh.mall.exception.BizException;
import com.bh.mall.exception.ParaException;
import com.bh.mall.spring.SpringContextHolder;

/**
 * 本等级是够需要实名
 * @author: nyc 
 * @since: 2018年4月1日 上午10:58:40 
 * @history:
 */
public class XN627363 extends AProcessor {

    private IUserAO userAO = SpringContextHolder.getBean(IUserAO.class);

    private XN627363Req req = null;

    @Override
    public Object doBusiness() throws BizException {

        return new BooleanRes(userAO.isRealName(req.getUserId()));
    }

    @Override
    public void doCheck(String inputparams) throws ParaException {
        req = JsonUtil.json2Bean(inputparams, XN627363Req.class);
        ObjValidater.validateReq(req);
    }

}
