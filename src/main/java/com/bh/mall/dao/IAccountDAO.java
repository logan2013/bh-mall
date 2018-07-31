/**
 * @Title IAccountDAO.java 
 * @Package com.ibis.account.dao 
 * @Description 
 * @author miyb  
 * @date 2015-2-14 下午2:07:37 
 * @version V1.0   
 */
package com.bh.mall.dao;

import com.bh.mall.dao.base.IBaseDAO;
import com.bh.mall.domain.Account;

/** 
 * @author: miyb 
 * @since: 2015-2-14 下午2:07:37 
 * @history:
 */
public interface IAccountDAO extends IBaseDAO<Account> {
    String NAMESPACE = IAccountDAO.class.getName().concat(".");

    /**
     * 修改账户余额,并统计充值，取现金额
     * @param data
     * @return 
     * @create: 2017年5月16日 下午2:23:19 xieyj
     * @history:
     */
    public int updateAmount(Account data);

    /**
     * 更新户名
     * @param data
     * @return 
     * @create: 2016年12月26日 下午5:23:13 xieyj
     * @history:
     */
    public int updateRealName(Account data);

    /** 
     * 修改账户状态
     * @param data
     * @return 
     * @create: 2015-2-23 下午4:28:41 miyb
     * @history: 
     */
    public int updateStatus(Account data);

    /**
     * 冻结金额
     * @param data
     * @return 
     * @create: 2018年7月31日 下午1:57:49 LENOVO
     * @history:
     */
    public int frozenAmount(Account data);

    /**
     * 解冻账户
     * @param data
     * @return 
     * @create: 2018年7月31日 下午1:59:27 LENOVO
     * @history:
     */
    public int unfrozenAmount(Account data);

    /**
     * 扣减冻结金额
     * @param data
     * @return 
     * @create: 2018年7月31日 下午2:00:58 LENOVO
     * @history:
     */
    public int cutFrozenAmount(Account data);
}
