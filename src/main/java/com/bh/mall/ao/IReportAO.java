package com.bh.mall.ao;

import java.util.List;

import org.springframework.stereotype.Component;

import com.bh.mall.bo.base.Paginable;
import com.bh.mall.domain.Report;

@Component
public interface IReportAO {
    static final String DEFAULT_ORDER_COLUMN = "code";

    public Paginable<Report> queryReportPage(int start, int limit,
            Report condition);

    public List<Report> queryReportList(Report condition);

    public Report getReport(String code);

}