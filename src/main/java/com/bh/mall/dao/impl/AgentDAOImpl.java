package com.bh.mall.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.bh.mall.dao.IAgentDAO;
import com.bh.mall.dao.base.support.AMybatisTemplate;
import com.bh.mall.domain.Agent;

@Repository("agentDAOImpl")
public class AgentDAOImpl extends AMybatisTemplate implements IAgentDAO {

    // IBaseDAO
    @Override
    public Agent select(Agent condition) {
        return super.select(NAMESPACE.concat("select_buser"), condition,
            Agent.class);
    }

    @Override
    public long selectTotalCount(Agent condition) {
        return super.selectTotalCount(NAMESPACE.concat("select_buser_count"),
            condition);
    }

    @Override
    public List<Agent> selectList(Agent condition) {
        return super.selectList(NAMESPACE.concat("select_buser"), condition,
            Agent.class);
    }

    @Override
    public List<Agent> selectList(Agent condition, int start, int count) {
        return super.selectList(NAMESPACE.concat("select_buser"), start, count,
            condition, Agent.class);
    }

    @Override
    public int insert(Agent data) {
        return super.insert(NAMESPACE.concat("insert_buser"), data);
    }

    @Override
    public int delete(Agent data) {
        return 0;
    }

    // IAgentDAO

    @Override
    public int updateLoginPwd(Agent data) {
        return super.update(NAMESPACE.concat("update_login_pwd"), data);
    }

    @Override
    public int updateStatus(Agent data) {
        return super.update(NAMESPACE.concat("update_status"), data);
    }

    @Override
    public int updateRole(Agent data) {
        return super.update(NAMESPACE.concat("update_role"), data);
    }

    // public void updateLog(Agent data) {
    // super.update(NAMESPACE.concat("update_log"), data);
    // }

    /** 
     * @see com.bh.mall.dao.IUserDAO#updateLoginName(com.bh.mall.domain.User)
     */
    @Override
    public int updateLoginName(Agent data) {
        return super.update(NAMESPACE.concat("update_buser_loginName"), data);
    }

    @Override
    public int updateNickname(Agent data) {
        return super.update(NAMESPACE.concat("update_buser_nickname"), data);
    }

    @Override
    public int updatePhoto(Agent data) {
        return super.update(NAMESPACE.concat("update_buser_photo"), data);
    }

    @Override
    public int updateMobileIds(Agent data) {
        return super.update(NAMESPACE.concat("update_buser_mobileIds"), data);
    }

    @Override
    public int updateWxInfo(Agent data) {
        return super.update(NAMESPACE.concat("update_wx_info"), data);
    }

    @Override
    public void resetBindMobile(Agent buser) {
        super.update(NAMESPACE.concat("update_mobile"), buser);
    }

    // public int approveUser(Agent data) {
    // return super.update(NAMESPACE.concat("approve_buser"), data);
    // }

    @Override
    public void updateHigh(Agent data) {
        super.update(NAMESPACE.concat("update_high"), data);
    }

    @Override
    public List<Agent> selectAgentFront(Agent condition, int start, int limit) {
        return super.selectList(NAMESPACE.concat("select_agent_front"), start,
            limit, condition, Agent.class);
    }

    @Override
    public int updateLevel(Agent data) {
        return super.update(NAMESPACE.concat("update_level"), data);
    }

    @Override
    public int update(Agent data) {
        return super.update(NAMESPACE.concat("update_buser"), data);
    }

    @Override
    public void updateInformation(Agent data) {
        super.update(NAMESPACE.concat("update_information"), data);
    }

    @Override
    public void updateManager(Agent data) {
        super.update(NAMESPACE.concat("update_manager"), data);

    }

    @Override
    public int approveUser(Agent data) {
        return 0;
    }

    @Override
    public void updateLog(Agent data) {
    }

}