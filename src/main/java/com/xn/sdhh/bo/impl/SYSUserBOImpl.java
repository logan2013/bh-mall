package com.xn.sdhh.bo.impl;

import java.util.Date;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.xn.sdhh.bo.ISYSUserBO;
import com.xn.sdhh.bo.base.PaginableBOImpl;
import com.xn.sdhh.common.MD5Util;
import com.xn.sdhh.common.PhoneUtil;
import com.xn.sdhh.core.OrderNoGenerater;
import com.xn.sdhh.dao.ISYSUserDAO;
import com.xn.sdhh.domain.SYSUser;
import com.xn.sdhh.enums.EUserStatus;
import com.xn.sdhh.exception.BizException;

@Component
public class SYSUserBOImpl extends PaginableBOImpl<SYSUser>
        implements ISYSUserBO {

    @Autowired
    private ISYSUserDAO sysUserDAO;

    @Override
    public List<SYSUser> queryUserList(SYSUser data) {
        return sysUserDAO.selectList(data);
    }

    // 注册
    @Override
    public String doRegister(String loginName, String loginPwd,
            String systemCode) {
        String userId = OrderNoGenerater.generate("U");
        SYSUser sysUser = new SYSUser();
        sysUser.setUserId(userId);

        sysUser.setLoginName(loginName);
        sysUser.setSystemCode(systemCode);

        sysUserDAO.insert(sysUser);
        return userId;
    }

    @Override
    public void doSaveSYSuser(SYSUser data) {
        sysUserDAO.insert(data);
    }

    @Override
    public void isMobileExist(String mobile) {
        if (StringUtils.isNotBlank(mobile)) {
            // 判断格式
            PhoneUtil.checkMobile(mobile);
            SYSUser condition = new SYSUser();
            condition.setMobile(mobile);
            long count = getTotalCount(condition);
            if (count > 0) {
                throw new BizException("li01003", "手机号已经存在");
            }
        }
    }

    // 登录
    @Override
    public SYSUser getUserByLoginName(String loginName, String systemCode) {
        SYSUser data = null;
        if (StringUtils.isNotBlank(loginName)) {
            SYSUser condition = new SYSUser();
            condition.setLoginName(loginName);
            List<SYSUser> list = sysUserDAO.selectList(condition);
            if (list != null && list.size() > 1) {
                throw new BizException("li01006", "登录名重复");
            }
            if (CollectionUtils.isNotEmpty(list)) {
                data = list.get(0);
            }
        }
        return data;
    }

    @Override
    public SYSUser getUserByMobile(String mobile) {
        SYSUser data = null;
        if (StringUtils.isNotBlank(mobile)) {
            SYSUser condition = new SYSUser();
            condition.setMobile(mobile);
            data = sysUserDAO.select(condition);
            if (data == null) {
                throw new BizException("xn0000", "用户不存在");
            }
        }
        return data;

    }

    @Override
    public SYSUser getSYSUser(String userId) {
        SYSUser data = null;
        if (StringUtils.isNotBlank(userId)) {
            SYSUser condition = new SYSUser();
            condition.setUserId(userId);
            data = sysUserDAO.select(condition);
            if (data == null) {
                throw new BizException("xn0000", "系统用户不存在");
            }
        }
        return data;
    }

    @Override
    public SYSUser getSYSUser() {
        SYSUser condition = new SYSUser();
        List<SYSUser> list = sysUserDAO.selectList(condition);
        if (CollectionUtils.isEmpty(list)) {
            throw new BizException("xn0000", "系统用户不存在");
        }
        return list.get(list.size() - 1);

    }

    @Override
    public boolean isUserExist(String userId, String systemCode) {
        SYSUser condition = new SYSUser();
        condition.setUserId(userId);
        condition.setSystemCode(systemCode);
        if (sysUserDAO.selectTotalCount(condition) > 0) {
            return true;
        }
        return false;
    }

    // 密码检查
    @Override
    public void checkLoginPwd(String userId, String loginPwd) {
        if (StringUtils.isNotBlank(userId)
                && StringUtils.isNotBlank(loginPwd)) {
            SYSUser condition = new SYSUser();
            condition.setUserId(userId);
            condition.setLoginPwd(MD5Util.md5(loginPwd));
            long count = this.getTotalCount(condition);
            if (count != 1) {
                throw new BizException("jd00001", "原登录密码错误");
            }
        } else {
            throw new BizException("jd00001", "原登录密码错误");
        }
    }

    // 重置密码
    @Override
    public void resetAdminLoginPwd(SYSUser sysUser, String loginPwd) {
        sysUser.setLoginPwd(MD5Util.md5(loginPwd));
        sysUserDAO.updateLoginPwd(sysUser);
    }

    @Override
    public void resetSelfPwd(SYSUser sysUser, String newLoginPwd) {
        sysUser.setLoginPwd(MD5Util.md5(newLoginPwd));
        sysUserDAO.updateLoginPwd(sysUser);

    }

    // 重置登录名
    @Override
    public void refreshLoginName(String userId, String loginName) {
        if (StringUtils.isNotBlank(userId)) {
            SYSUser data = new SYSUser();
            data.setUserId(userId);
            data.setLoginName(loginName);
            sysUserDAO.updateLoginName(data);
        }
    }

    @Override
    public void isLoginNameExist(String loginName, String systemCode) {
        if (StringUtils.isNotBlank(loginName)) {
            // 判断格式
            SYSUser condition = new SYSUser();
            condition.setLoginName(loginName);

            condition.setSystemCode(systemCode);
            long count = getTotalCount(condition);
            if (count > 0) {
                throw new BizException("li01003", "登录名已经存在");
            }
        }
    }

    //
    @Override
    public void resetBindMobile(SYSUser user, String newMobile) {
        user.setMobile(newMobile);
        user.setLoginName(newMobile);
        sysUserDAO.resetBindMobile(user);
    }

    @Override
    public void refreshStatus(String userId, EUserStatus status, String updater,
            String remark) {
        if (StringUtils.isNotBlank(userId)) {
            SYSUser data = new SYSUser();
            data.setUserId(userId);
            data.setStatus(status.getCode());
            data.setUpdater(updater);
            data.setUpdateDatetime(new Date());
            data.setRemark(remark);
            sysUserDAO.updateStatus(data); // change to updateStatus
        }

    }

    @Override
    public void refreshRole(String userId, String roleCode, String updater,
            String remark) {
        if (StringUtils.isNotBlank(userId)) {
            SYSUser data = new SYSUser();
            data.setUserId(userId);
            data.setRoleCode(roleCode);
            data.setUpdater(updater);
            data.setUpdateDatetime(new Date());
            data.setRemark(remark);
            sysUserDAO.updateRole(data);
        }
    }

}
