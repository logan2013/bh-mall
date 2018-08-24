package com.bh.mall.ao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bh.mall.ao.IWareLogAO;
import com.bh.mall.bo.IWareLogBO;
import com.bh.mall.bo.base.Paginable;
import com.bh.mall.domain.WareLog;
import com.bh.mall.exception.BizException;

@Service
public class WareLogAOImpl implements IWareLogAO {

    @Autowired
    private IWareLogBO wareLogBO;

    // 分页查询
    @Override
    public Paginable<WareLog> queryWareLogPage(int start, int limit,
            WareLog condition) {
        if (condition.getStartDatetime() != null
                && condition.getEndDatetime() != null && condition
                    .getStartDatetime().after(condition.getEndDatetime())) {
            throw new BizException("xn00000", "开始时间不能大于结束时间");
        }
        Paginable<WareLog> page = wareLogBO.getPaginable(start, limit,
            condition);
        return page;
    }

    // 列表查询
    @Override
    public List<WareLog> queryWareLogList(WareLog condition) {
        if (condition.getStartDatetime() != null
                && condition.getEndDatetime() != null && condition
                    .getStartDatetime().after(condition.getEndDatetime())) {
            throw new BizException("xn00000", "开始时间不能大于结束时间");
        }
        return wareLogBO.queryWareLogList(condition);
    }

    // 详细查询
    @Override
    public WareLog getWareLog(String code) {
        return wareLogBO.getWareLog(code);
    }
}
