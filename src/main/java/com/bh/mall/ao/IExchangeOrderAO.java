package com.bh.mall.ao;

import java.util.List;

import org.springframework.stereotype.Component;

import com.bh.mall.bo.base.Paginable;
import com.bh.mall.domain.ExchangeOrder;
import com.bh.mall.dto.req.XN627790Req;
import com.bh.mall.dto.res.XN627805Res;

/**
 * 置换单
 * @author: LENOVO 
 * @since: 2018年7月31日 下午9:19:20 
 * @history:
 */
@Component
public interface IExchangeOrderAO {
    static final String DEFAULT_ORDER_COLUMN = "code";

    // 添加置换单
    public String addChangeOrder(XN627790Req req);

    // 修改置换单
    public int editChangeOrder(ExchangeOrder data);

    // 分页查询
    public Paginable<ExchangeOrder> queryChangeOrderPage(int start, int limit,
            ExchangeOrder condition);

    // 列表查询
    public List<ExchangeOrder> queryChangeOrderList(ExchangeOrder condition);

    // 详情查询
    public ExchangeOrder getChangeOrder(String code);

    // 修改换货价
    public void editChangePrice(String code, String changePrice,
            String approver, String string);

    // 审核置换单
    public void approveChange(String code, String aprrover, String approveNote,
            String result);

    // 提交云仓置换申请单
    public ExchangeOrder getChangeOrderMessage(XN627790Req req);

    // 检查余额红线
    public XN627805Res checkAmount(String userId);

}
