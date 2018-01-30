package com.bh.mall.api.impl;

import com.bh.mall.ao.IUserAO;
import com.bh.mall.api.AProcessor;
import com.bh.mall.common.JsonUtil;
import com.bh.mall.core.StringValidater;
import com.bh.mall.dto.req.XN627200Req;
import com.bh.mall.dto.res.XN627200Res;
import com.bh.mall.exception.BizException;
import com.bh.mall.exception.ParaException;
import com.bh.mall.spring.SpringContextHolder;

/**
 * 普通登录
 * @author: xieyj 
 * @since: 2016年11月22日 下午3:39:17 
 * @history:
 */
public class XN627200 extends AProcessor {
    private IUserAO userAO = SpringContextHolder.getBean(IUserAO.class);

    private XN627200Req req = null;

    @Override
    public Object doBusiness() throws BizException {
        return new XN627200Res(userAO.doLogin(req.getLoginName(),
            req.getLoginPwd(), req.getKind(), req.getCompanyCode(),
            req.getSystemCode()));
    }

    @Override
    public void doCheck(String inputparams) throws ParaException {
        req = JsonUtil.json2Bean(inputparams, XN627200Req.class);
        StringValidater.validateBlank(req.getLoginName(), req.getLoginPwd(),
            req.getKind(), req.getSystemCode());
    }
}
