
package com.bh.mall.api.impl;

import com.bh.mall.ao.ISjFormAO;
import com.bh.mall.api.AProcessor;
import com.bh.mall.common.JsonUtil;
import com.bh.mall.core.ObjValidater;
import com.bh.mall.dto.req.XN627291Req;
import com.bh.mall.dto.res.BooleanRes;
import com.bh.mall.exception.BizException;
import com.bh.mall.exception.ParaException;
import com.bh.mall.spring.SpringContextHolder;

/**
 * 审核升级申请（oss）
 * @author: nyc 
 * @since: 2018年4月1日 上午10:58:40 
 * @history:
 */
public class XN627291 extends AProcessor {

    private ISjFormAO sjFormAO = SpringContextHolder.getBean(ISjFormAO.class);

    private XN627291Req req = null;

    @Override
    public Object doBusiness() throws BizException {
        sjFormAO.approveSjFormByB(req.getUserId(), req.getApprover(),
            req.getRemark(), req.getResult());
        return new BooleanRes(true);
    }

    @Override
    public void doCheck(String inputparams) throws ParaException {
        req = JsonUtil.json2Bean(inputparams, XN627291Req.class);
        ObjValidater.validateReq(req);
    }

}