package com.bh.mall.ao;

import java.util.List;

import com.bh.mall.bo.base.Paginable;
import com.bh.mall.domain.SYSUser;

/**
 * 系统用户表
 * @author: clockorange 
 * @since: Jul 31, 2018 4:50:05 PM 
 * @history:
 */
public interface ISYSUserAO {

    String DEFAULT_ORDER_COLUMN = "user_id";

    // 新增用户
    public String addSYSUser(String mobile, String loginPwd, String realName,
            String photo);

    // 用户登录
    public String doLogin(String loginName, String loginPwd);

    // 注销 | 激活其他管理员
    public void doCloseOpen(String userId, String updater, String remark);

    // 分配角色
    public void doRoleSYSUser(String userId, String roleCode, String updater,
            String remark);

    // 重置登录密码
    public void resetAdminLoginPwd(String userId, String newLoginPwd);

    // 重置其他管理员密码
    public void resetOtherSYSuserPwd(String mobile, String smsCaptcha,
            String newLoginPwd);

    // 修改照片
    public void doModifyPhoto(String userId, String photo);

    // 修改电话
    public void doResetMoblie(String userId, String kind, String newMobile,
            String smsCaptcha);

    // 分页查询
    public Paginable<SYSUser> queryUserPage(int start, int limit,
            SYSUser condition);

    // 列表查询
    public List<SYSUser> querySYSUserList(SYSUser condition);

    // 详细查询
    public SYSUser getSYSUser(String code);

}
