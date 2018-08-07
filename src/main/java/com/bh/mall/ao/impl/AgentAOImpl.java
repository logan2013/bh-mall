package com.bh.mall.ao.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bh.mall.ao.IAgentAO;
import com.bh.mall.bo.IAccountBO;
import com.bh.mall.bo.IAddressBO;
import com.bh.mall.bo.IAgentBO;
import com.bh.mall.bo.IAgentLevelBO;
import com.bh.mall.bo.IAgentLogBO;
import com.bh.mall.bo.IAgentReportBO;
import com.bh.mall.bo.IInOrderBO;
import com.bh.mall.bo.IInnerOrderBO;
import com.bh.mall.bo.IJsAwardBO;
import com.bh.mall.bo.ISYSConfigBO;
import com.bh.mall.bo.ISYSRoleBO;
import com.bh.mall.bo.ISYSUserBO;
import com.bh.mall.bo.ISjFormBO;
import com.bh.mall.bo.ISmsOutBO;
import com.bh.mall.bo.ISqFormBO;
import com.bh.mall.bo.IWareBO;
import com.bh.mall.bo.IYxFormBO;
import com.bh.mall.bo.base.Paginable;
import com.bh.mall.common.DateUtil;
import com.bh.mall.common.PhoneUtil;
import com.bh.mall.common.SysConstant;
import com.bh.mall.common.WechatConstant;
import com.bh.mall.core.StringValidater;
import com.bh.mall.domain.Account;
import com.bh.mall.domain.Agent;
import com.bh.mall.domain.SYSUser;
import com.bh.mall.dto.res.XN627303Res;
import com.bh.mall.enums.EAgentLevel;
import com.bh.mall.enums.EBizType;
import com.bh.mall.enums.EConfigType;
import com.bh.mall.enums.ECurrency;
import com.bh.mall.enums.ESysUser;
import com.bh.mall.enums.EUserPwd;
import com.bh.mall.enums.EUserStatus;
import com.bh.mall.exception.BizException;
import com.bh.mall.http.PostSimulater;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

@Service
public class AgentAOImpl implements IAgentAO {

    private static Logger logger = Logger.getLogger(AgentAOImpl.class);

    @Autowired
    IAgentBO agentBO;

    @Autowired
    ISYSRoleBO sysRoleBO;

    @Autowired
    ISYSUserBO sysUserBO;

    @Autowired
    ISmsOutBO smsOutBO;

    @Autowired
    ISYSConfigBO sysConfigBO;

    @Autowired
    IAddressBO addressBO;

    @Autowired
    IYxFormBO yxFormBO;

    @Autowired
    ISqFormBO sqFormBO;

    @Autowired
    ISjFormBO sjFormBO;

    @Autowired
    IAccountBO accountBO;

    @Autowired
    IInOrderBO inOrderBO;

    @Autowired
    IInnerOrderBO innerOrderBO;

    @Autowired
    IJsAwardBO jsAwardBO;

    @Autowired
    IAgentLevelBO agentLevelBO;

    @Autowired
    IWareBO wareBO;

    @Autowired
    IAgentReportBO agentReportBO;

    @Autowired
    IAgentLogBO agentLogBO;

    // 微信注册
    private XN627303Res doWxLoginReg(String unionId, String appOpenId,
            String h5OpenId, String nickname, String photo, String fromUserId,
            String status) {
        agentBO.doCheckOpenId(unionId, h5OpenId, appOpenId);
        Integer level = 0;
        String userId = agentBO.doRegister(unionId, h5OpenId, appOpenId, null,
            EUserPwd.InitPwd.getCode(), nickname, photo, status, level,
            fromUserId);
        XN627303Res result = new XN627303Res(userId, status);
        return result;
    }

    // 注册登录
    @Override
    public XN627303Res doLoginWeChatByAgent(String code, String fromUserId) {
        String status = EUserStatus.TO_MIND.getCode(); // 待申请意向代理
        if (StringUtils.isNotBlank(fromUserId)) {
            status = EUserStatus.IMPOWERO_INFO.getCode(); // 待填写授权资料
        }
        return doLoginWeChatH(code, fromUserId, status);
    }

    // doLoginWeChatH
    @Transactional
    private XN627303Res doLoginWeChatH(String code, String refereeId,
            String status) {
        // Step1：获取密码参数信息
        Map<String, String> configPwd = sysConfigBO
            .getConfigsMap(EConfigType.WEIXIN_H5.getCode());

        String appId = configPwd.get(SysConstant.WX_H5_ACCESS_KEY);
        String appSecret = configPwd.get(SysConstant.WX_H5_SECRET_KEY);

        if (StringUtils.isBlank(appId)) {
            throw new BizException("XN000000", "参数appId配置获取失败，请检查配置");
        }
        if (StringUtils.isBlank(appSecret)) {
            throw new BizException("XN000000", "参数appSecret配置获取失败，请检查配置");
        }
        // Step2：通过Authorization Code获取Access Token
        String accessToken = "";
        Map<String, Object> res = new HashMap<>();
        Properties fromProperties = new Properties();
        fromProperties.put("grant_type", "authorization_code");
        fromProperties.put("appid", appId);
        fromProperties.put("secret", appSecret);
        fromProperties.put("code", code);// 微信H5
        logger.info(
            "appId:" + appId + ",appSecret:" + appSecret + ",js_code:" + code);
        XN627303Res result = null;
        try {
            String response = PostSimulater
                .requestPostForm(WechatConstant.WX_TOKEN_URL, fromProperties);
            res = getMapFromResponse(response);
            accessToken = (String) res.get("access_token");
            if (res.get("error") != null) {
                throw new BizException("XN000000",
                    "微信登录失败原因：" + res.get("error"));
            }
            if (StringUtils.isBlank(accessToken)) {
                throw new BizException("XN000000", "accessToken不能为空");
            }
            // Step3：使用Access Token来获取用户的OpenID
            String openId = (String) res.get("openid");

            // 获取unionid
            Map<String, Object> wxRes = new HashMap<>();
            Properties queryParas = new Properties();
            queryParas.put("access_token", accessToken);
            queryParas.put("openid", openId);
            queryParas.put("lang", "zh_CN");
            wxRes = getMapFromResponse(PostSimulater
                .requestPostForm(WechatConstant.WX_USER_INFO_URL, queryParas));
            String unionId = (String) wxRes.get("unionid");
            String h5OpenId = (String) wxRes.get("openid");
            System.out.println("unionId:" + unionId);
            // Step4：根据openId，unionId从数据库中查询用户信息
            Agent dbUser = agentBO.doGetUserByOpenId(h5OpenId);

            // 用户是否关注了公众号
            // 1、获取全局token
            Map<String, Object> resMap1 = new HashMap<>();
            Properties properties1 = new Properties();
            properties1.put("grant_type", "client_credential");
            properties1.put("appid", appId);
            properties1.put("secret", appSecret);
            resMap1 = getMapFromResponse(PostSimulater.requestPostForm(
                WechatConstant.WXXCX_GLOBAL_TOKEN_URL, properties1));
            String token = (String) resMap1.get("access_token");
            if (StringUtils.isBlank(token)) {
                throw new BizException("XN000000", "accessToken不能为空");
            }

            Map<String, Object> resMap2 = new HashMap<>();
            Properties properties2 = new Properties();
            properties2.put("access_token", token);
            properties2.put("openid", openId);
            resMap2 = getMapFromResponse(PostSimulater
                .requestPostForm(WechatConstant.WX_USER_CGI_URL, properties2));

            String subscribe = String.valueOf(resMap2.get("subscribe"));

            if (null != dbUser) {// 如果user存在，说明用户授权登录过，直接登录
                result = new XN627303Res(dbUser.getUserId(), dbUser.getStatus(),
                    subscribe);
            } else {
                String nickname = (String) wxRes.get("nickname");
                String photo = (String) wxRes.get("headimgurl");

                result = doWxLoginReg(unionId, null, h5OpenId, nickname, photo,
                    refereeId, status);
                result = new XN627303Res(result.getUserId(), result.getStatus(),
                    subscribe);
            }
            // result.setSubscribe(subscribe);
        } catch (Exception e) {
            throw new BizException("xn000000", e.getMessage());
        }
        return result;
    }

    public Map<String, Object> getMapFromResponse(String response) {
        if (StringUtils.isBlank(response)) {
            return new HashMap<>();
        }
        Map<String, Object> result = new HashMap<>();
        int begin = response.indexOf("{");
        int end = response.lastIndexOf("}") + 1;
        if (begin >= 0 && end > 0) {
            result = new Gson().fromJson(response.substring(begin, end),
                new TypeToken<Map<String, Object>>() {
                }.getType());
        } else {
            String[] paras = response.split("&");
            for (String para : paras) {
                result.put(para.split("=")[0], para.split("=")[1]);
            }
        }

        return result;
    }

    // 修改头像
    @Override
    public void doModifyPhoto(String userId, String photo) {
        agentBO.refreshPhoto(userId, photo);
    }

    // 更换绑定手机号
    @Override
    public void doResetMoblie(String userId, String newMobile,
            String smsCaptcha) {
        Agent buser = agentBO.getAgent(userId);
        String oldMobile = buser.getMobile();
        if (newMobile.equals(oldMobile)) {
            throw new BizException("xn000000", "新手机与原手机一致");
        }
        // 判断手机号是否存在
        agentBO.isMobileExist(newMobile);
        // 新手机号验证
        smsOutBO.checkCaptcha(newMobile, smsCaptcha, "627310");
        agentBO.resetBindMobile(buser, newMobile);
        // 发送短信
        smsOutBO.sendSmsOut(oldMobile,
            "尊敬的" + PhoneUtil.hideMobile(oldMobile) + "用户，您于"
                    + DateUtil.dateToStr(new Date(),
                        DateUtil.DATA_TIME_PATTERN_1)
                    + "已将手机号码改为" + newMobile + "，您的登录名更改为" + newMobile
                    + "，请妥善保管您的账户相关信息。",
            "631072");

    }

    // 修改管理者
    @Override
    public void editManager(String userId, String manager, String updater) {
        Agent data = agentBO.getAgent(userId);
        sysUserBO.getSYSUser(manager);
        agentBO.refreshManager(data, manager, updater);
    }

    // 修改信息
    @Override
    public void editInformation(String userId, String wxId, String mobile,
            String realName, String teamName, String province, String city,
            String area, String address) {
        Agent data = agentBO.getAgent(userId);
        // 一级代理修改团队名称，下级同步
        if (StringValidater.toInteger(EAgentLevel.ONE.getCode()) == data
            .getLevel()) {
            agentBO.refreshTeamName(data, teamName);
            this.editTeamName(data.getUserId(), teamName);
        } else {
            // 非一级代理不允许修改团队名称
            throw new BizException("xn00000", "非最高等级代理的团队名称无法修改");
        }
        agentBO.refreshAgent(data, wxId, mobile, realName, teamName, province,
            city, area, address);
    }

    // 修改上级
    @Override
    public void editHighUser(String userId, String highUserId, String updater,
            String remark) {
        Agent data = agentBO.getAgent(userId);

        // 判断上级
        if (StringValidater.toInteger(EAgentLevel.ONE.getCode()) == data
            .getLevel()) {
            highUserId = ESysUser.SYS_USER_BH.getCode();
        }
        agentBO.refreshHighUser(data, highUserId, updater, remark);
        // 增肌上级门槛
        Account account = accountBO.getAccountByUser(data.getUserId(),
            ECurrency.MK_CNY.getCode());

        if (0 != account.getAmount()) {
            accountBO.transAmountCZB(data.getUserId(),
                ECurrency.MK_CNY.getCode(), highUserId,
                ECurrency.MK_CNY.getCode(), account.getAmount(),
                EBizType.AJ_XGSJ, EBizType.AJ_XGSJ.getValue(),
                EBizType.AJ_XGSJ.getValue(), data.getUserId());
        }
    }

    // 修改推荐人
    @Override
    public void editUserReferee(String userId, String referrer, String updater,
            String remark) {
        Agent data = agentBO.getAgent(userId);
        Agent referrAgent = agentBO.getAgent(referrer);
        if (referrAgent.getLevel() != data.getLevel()) {
            throw new BizException("xn00000", "代理要与推荐人的等级相同哦");
        }
        agentBO.refreshReferee(data, referrAgent.getUserId(), updater, remark);
    }

    // 分页查询代理
    @Override
    public Paginable<Agent> queryAgentPage(int start, int limit,
            Agent condition) {
        Paginable<Agent> page = agentBO.getPaginable(start, limit, condition);

        for (Agent data : page.getList()) {
            // 推荐人转义
            if (StringUtils.isNotBlank(data.getReferrer())) {
                Agent userRefree = agentBO.getAgent(data.getReferrer());
                data.setUserRefreeName(userRefree.getRealName());
                data.setUserRefreeMobile(userRefree.getMobile());
            }
            // 介绍人转义
            if (StringUtils.isNotBlank(data.getIntroducer())) {
                Agent introducer = agentBO.getAgent(data.getIntroducer());
                data.setIntroduceName(introducer.getRealName());
            }

            // 上级转义
            if (StringValidater.toInteger(EAgentLevel.ONE.getCode()) == data
                .getLevel()) {
                SYSUser sysUser = sysUserBO.getSYSUser(data.getHighUserId());
                data.setHighUserName(sysUser.getRealName());
            } else if (StringUtils.isNotBlank(data.getHighUserId())) {
                Agent highAgent = agentBO.getAgent(data.getHighUserId());
                data.setHighUserName(highAgent.getRealName());
                data.setHighUserMobile(highAgent.getMobile());
            }
        }
        return page;
    }

    // 列表查询代理
    @Override
    public List<Agent> queryAgentList(Agent condition) {
        List<Agent> list = agentBO.queryAgentList(condition);
        for (Agent data : list) {
            // 推荐人转义
            if (StringUtils.isNotBlank(data.getReferrer())) {
                Agent userRefree = agentBO.getAgent(data.getReferrer());
                data.setUserRefreeName(userRefree.getRealName());
                data.setUserRefreeMobile(userRefree.getMobile());
            }
            // 介绍人转义
            if (StringUtils.isNotBlank(data.getIntroducer())) {
                Agent introducer = agentBO.getAgent(data.getIntroducer());
                data.setIntroduceName(introducer.getRealName());
            }
            // 上级转义
            if (StringValidater.toInteger(EAgentLevel.ONE.getCode()) == data
                .getLevel()) {
                SYSUser sysUser = sysUserBO.getSYSUser(data.getHighUserId());
                data.setHighUserName(sysUser.getRealName());
            } else if (StringUtils.isNotBlank(data.getHighUserId())) {
                Agent highAgent = agentBO.getAgent(data.getHighUserId());
                data.setHighUserName(highAgent.getRealName());
                data.setHighUserMobile(highAgent.getMobile());
            }
        }
        return list;
    }

    public Paginable<Agent> queryMyLowAgentPage(int start, int limit,
            Agent condition) {
        Paginable<Agent> page = agentBO.getPaginable(start, limit, condition);

        for (Agent data : page.getList()) {
            // 推荐人转义
            if (StringUtils.isNotBlank(data.getReferrer())) {
                Agent userRefree = agentBO.getAgent(data.getReferrer());
                data.setUserRefreeName(userRefree.getRealName());
                data.setUserRefreeMobile(userRefree.getMobile());
            }
            // 介绍人转义
            if (StringUtils.isNotBlank(data.getIntroducer())) {
                Agent introducer = agentBO.getAgent(data.getIntroducer());
                data.setUserRefreeName(introducer.getRealName());
            }

            // 上级转义
            if (StringValidater.toInteger(EAgentLevel.ONE.getCode()) == data
                .getLevel()) {
                SYSUser sysUser = sysUserBO.getSYSUser(data.getHighUserId());
                data.setHighUserName(sysUser.getRealName());
            } else if (StringUtils.isNotBlank(data.getHighUserId())) {
                Agent highAgent = agentBO.getAgent(data.getHighUserId());
                data.setHighUserName(highAgent.getRealName());
                data.setHighUserMobile(highAgent.getMobile());
            }
        }
        return page;
    }

    // 列表查询代理结构
    @Override
    public List<Agent> queryAgentJgList(Agent condition) {

        List<Agent> agentList = agentBO.queryAgentList(condition);
        if (CollectionUtils.isNotEmpty(agentList)) {
            getAgentList(agentList);
        }

        return agentList;
    }

    private void getAgentList(List<Agent> list) {
        for (Agent agent : list) {
            Agent condition = new Agent();
            condition.setHighUserId(agent.getUserId());
            List<Agent> agentList = agentBO.queryAgentList(condition);
            if (CollectionUtils.isNotEmpty(agentList)) {
                agent.setAgentList(agentList);
                getAgentList(agentList);
            }
        }
    }

    @Override
    public void abolishSqForm(String userId, String updater, String remark) {
        Agent data = agentBO.getAgent(userId);
        agentBO.refreshStatus(data, updater, remark);
    }

    @Override
    public Agent doGetAgentByMobile(String mobile) {
        return agentBO.getAgentByMobile(mobile);
    }

    @Override
    public Agent getAgent(String userId) {
        Agent data = agentBO.getAgent(userId);

        // 推荐人转义
        if (StringUtils.isNotBlank(data.getReferrer())) {
            Agent userRefree = agentBO.getAgent(data.getReferrer());
            data.setUserRefreeName(userRefree.getRealName());
            data.setUserRefreeMobile(userRefree.getMobile());
        }
        // 介绍人转义
        if (StringUtils.isNotBlank(data.getIntroducer())) {
            Agent introducer = agentBO.getAgent(data.getIntroducer());
            data.setIntroduceName(introducer.getRealName());
        }
        // 上级转义
        if (StringValidater.toInteger(EAgentLevel.ONE.getCode()) == data
            .getLevel()) {
            SYSUser sysUser = sysUserBO.getSYSUser(data.getHighUserId());
            data.setHighUserName(sysUser.getRealName());
        } else if (StringUtils.isNotBlank(data.getHighUserId())) {
            Agent highAgent = agentBO.getAgent(data.getHighUserId());
            data.setHighUserName(highAgent.getRealName());
            data.setHighUserMobile(highAgent.getMobile());
        }

        return data;
    }

    // 修改下级团队名称
    private void editTeamName(String userId, String teamName) {
        Agent condition = new Agent();
        condition.setHighUserId(userId);
        List<Agent> list = agentBO.queryAgentList(condition);
        for (Agent data : list) {
            agentBO.refreshTeamName(data, teamName);
        }
    }

}
