/*
-- Query: SELECT * FROM zhpay_std_user.tstd_user where login_name = 'admin' and system_code  = 'CD-CZH000001'
-- Date: 2017-01-08 19:52
*/
INSERT INTO `tstd_user` (`user_id`,`login_name`,`nickname`,`login_pwd`,`login_pwd_strength`,`kind`,`level`,`user_referee`,`mobile`,`id_kind`,`id_no`,`real_name`,`trade_pwd`,`trade_pwd_strength`,`role_code`,`status`,`pdf`,`amount`,`lj_amount`,`company_code`,`open_id`,`jpush_id`,`updater`,`update_datetime`,`longitude`,`latitude`,`remark`,`system_code`) VALUES ('U201600000000000000','admin',NULL,'21218cca77804d2ba1922c33e0151105',NULL,'01','1','',NULL,NULL,NULL,NULL,NULL,NULL,'SR201600000000000000','0',NULL,NULL,NULL,NULL,NULL,NULL,'admin',NULL,NULL,NULL,'管理端系统方','CD-CZH000001');

/*
-- Query: SELECT code,name,type,url,order_no,updater, now() as update_datetime,remark,parent_code,system_code FROM tsys_menu where system_code = 'CD-CZH000001'
LIMIT 0, 50000

-- Date: 2017-01-10 23:01
*/
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM201600000000000000','根目录','1','#','1','admin',now(),'','','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM201600001000000000','系统根目录','1','#','1','admin',now(),'','SM201600000000000000','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM201600001000000001','系统管理','1','#','1','admin',now(),'','SM201600001000000000','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM201600001000000002','运维管理','1','#','2','admin',now(),NULL,'SM201600001000000001','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM201600001000000003','菜单管理','1','/security/menu.htm','1','admin',now(),NULL,'SM201600001000000002','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM201600001000000004','修改','2','/edit','1','admin',now(),NULL,'SM201600001000000003','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016101716241339082','运营管理','1','#','1','admin',now(),'','SM201600001000000001','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016101716253866426','角色管理','1','/security/role.htm','1','admin',now(),'','SM2016101716241339082','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016101716261754674','用户管理','1','/security/user.htm','2','admin',now(),'','SM2016101716241339082','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016101716290657836','系统参数管理','1','/general/param.htm','2','admin',now(),'','SM201600001000000002','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016101716295904680','数据字典管理','1','/general/dict.htm','3','admin',now(),'','SM201600001000000002','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016101716450533995','分配菜单','2','/change','4','admin',now(),'','SM2016101716253866426','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016101717551955993','新增','2','/add','1','admin',now(),'','SM2016101716253866426','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016101717560118734','修改','2','/edit','2','admin',now(),'','SM2016101716253866426','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016101717563661357','删除','2','/delete','3','admin',now(),'','SM2016101716253866426','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016101719082391126','新增','2','/add','1','admin',now(),'','SM2016101716261754674','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016101719094151894','重置密码','2','/reset','2','admin',now(),'','SM2016101716261754674','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016101719100760088','注销','2','/rock','4','admin',now(),'','SM2016101716261754674','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016101719110981215','设置角色','2','/assign','5','admin',now(),'','SM2016101716261754674','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016101719140087629','修改','2','/edit','1','admin',now(),'','SM2016101716290657836','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016101719143965297','修改','2','/edit','1','admin',now(),'','SM2016101716295904680','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016112911141208861','消息管理','1','#','4','admin',now(),'','SM201600001000000000','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016112911152991684','消息推送','1','#','1','admin',now(),'','SM2016112911141208861','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016112911280249973','公告管理','1','/news/notice.htm','1','admin',now(),'','SM2016112911152991684','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016112911292717856','短信推送','1','/news/message.htm','2','admin',now(),'','SM2016112911152991684','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016112911322482563','极光推送','1','/news/aurora.htm','3','admin',now(),'','SM2016112911152991684','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016112911334743939','微信推送','1','/news/wechat.htm','4','admin',now(),'','SM2016112911152991684','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016112914292031228','新增','2','/add','1','admin',now(),'','SM2016112911280249973','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016112914295002950','修改','2','/edit','2','admin',now(),'','SM2016112911280249973','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016112914322481897','发布','2','/pub','3','admin',now(),'','SM2016112911280249973','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016112914325471772','详情','2','/detail','5','admin',now(),'','SM2016112911280249973','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016112915194249520','单发','2','/pub','1','admin',now(),'','SM2016112911292717856','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM201611291521071981','详情','2','/detail','3','admin',now(),'','SM2016112911292717856','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016112915302885244','单发','2','/pub','1','admin',now(),'','SM2016112911322482563','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM201611291531308302','详情','2','/detail','3','admin',now(),'','SM2016112911322482563','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016112915315987472','单发','2','/pub','1','admin',now(),'','SM2016112911334743939','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016112915325414564','详情','2','/detail','3','admin',now(),'','SM2016112911334743939','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016120210533096194','撤下','2','/pull','4','admin',now(),'','SM2016112911280249973','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016120610552303416','激活','2','/active','3','admin',now(),'','SM2016101716261754674','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM201612071021105964','财务管理','1','#','3','admin',now(),'','SM201600001000000000','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016120710215035834','账户查询','1','#','1','admin',now(),'','SM201612071021105964','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM201612071022206883','外部账管理','1','#','2','admin',now(),'','SM201612071021105964','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016120710225078473','内部账管理','1','#','3','admin',now(),'','SM201612071021105964','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016120710233232137','系统账号','1','#','4','admin',now(),'','SM201612071021105964','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016120710242555432','线下走款','1','#','5','admin',now(),'','SM201612071021105964','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016120710251765049','统计分析','1','#','6','admin',now(),'','SM201612071021105964','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016120710261005778','银行账户','1','#','7','admin',now(),'','SM201612071021105964','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM201612071029309117','账户查询','1','/finance/account.htm','1','admin',now(),'','SM2016120710215035834','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016120710341064879','流水查询','1','/finance/ledger.htm','2','admin',now(),'','SM2016120710215035834','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016120710421392861','自动对账监控','1','/finance/autoReconControl.htm','1','admin',now(),'','SM201612071022206883','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016120710443551388','不平账处理','1','/finance/roughHand.htm','2','admin',now(),'','SM201612071022206883','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016120710470696888','二次轧账','1','/finance/twoRoll.htm','1','admin',now(),'','SM2016120710225078473','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016120710484209132','不平账处理','1','/finance/inRoughHand.htm','2','admin',now(),'','SM2016120710225078473','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016120710583381112','盈亏余额','1','/finance/breakBalance.htm','1','admin',now(),'','SM2016120710233232137','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016120711021944714','线下充值','1','/finance/lineRecharge.htm','1','admin',now(),'','SM2016120710242555432','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016120711034365344','线下取现','1','/finance/lineUnder.htm','2','admin',now(),'','SM2016120710242555432','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016120711095973678','统计分析','1','/finance/staAnalysis.htm','1','admin',now(),'','SM2016120710251765049','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016120711492601376','保证金账户','1','/finance/marginAccount.htm','1','admin',now(),'','SM2016120710261005778','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016120713315874098','进钱账户','1','/finance/income.htm','2','admin',now(),'','SM2016120710261005778','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM201612071333260150','出钱账户','1','/finance/outcome.htm','3','admin',now(),'','SM2016120710261005778','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016120713350008767','走账账户','1','/finance/goAccount.htm','4','admin',now(),'','SM2016120710261005778','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016120714062949665','流水','2','/flow','1','admin',now(),'','SM201612071029309117','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016120714343212111','详情','2','/detail','1','admin',now(),'','SM2016120710341064879','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016120715221559156','群发','2','/pubs','2','admin',now(),'','SM2016112911292717856','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016120715320175228','群发','2','/pubs','2','admin',now(),'','SM2016112911322482563','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016120715325497790','群发','2','/pubs','2','admin',now(),'','SM2016112911334743939','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016120816125733948','人工对账','2','edit','1','admin',now(),'','SM2016120710421392861','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016120816133940523','详情','2','/detail','2','admin',now(),'','SM2016120710421392861','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016120911033945882','审核','2','check','1','admin',now(),'','SM2016120710443551388','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016120911042060088','详情','2','/detail','2','admin',now(),'','SM2016120710443551388','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM201612091114505291','二次轧账','2','edit','1','admin',now(),'','SM2016120710470696888','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016120911160661084','详情','2','/detail','2','admin',now(),'','SM2016120710470696888','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016120911293120195','审核','2','check','1','admin',now(),'','SM2016120710484209132','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016120911301231346','详情','2','/detail','2','admin',now(),'','SM2016120710484209132','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM201612121417489854','业务管理','1','#','2','admin',now(),'','SM201600001000000000','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016121214325248217','审批事项','1','#','1','admin',now(),'','SM201612121417489854','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016121214352376049','商户审批','1','/biz/seller.htm','1','admin',now(),'','SM2016121214325248217','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016121214362106650','代申请','2','/add','1','admin',now(),'','SM2016121214352376049','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016121214363809593','修改','2','/edit','2','admin',now(),'','SM2016121214352376049','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016121214365781512','审批','2','/check','3','admin',now(),'','SM2016121214352376049','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016121214373237174','批量审批','2','/multicheck','4','admin',now(),'','SM2016121214352376049','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016121214380315234','上/下架','2','/updown','5','admin',now(),'','SM2016121214352376049','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016121214381922945','详情','2','/detail','6','admin',now(),'','SM2016121214352376049','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM201612121442020218','夺宝审批','1','/biz/treasure.htm','2','admin',now(),'','SM2016121214325248217','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM201612121442262686','代申请','2','/add','1','admin',now(),'','SM201612121442020218','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016121214424548012','审批','2','/check','2','admin',now(),'','SM201612121442020218','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016121214431210560','批量审批','2','/multicheck','3','admin',now(),'','SM201612121442020218','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016121214435061029','详情','2','/detail','4','admin',now(),'','SM201612121442020218','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016121214444685582','商品审批','1','/biz/product.htm','3','admin',now(),'','SM2016121214325248217','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016121214451800642','代申请','2','/add','1','admin',now(),'','SM2016121214444685582','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016121214454009858','审批','2','/check','2','admin',now(),'','SM2016121214444685582','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016121214461300741','批量审批','2','/multicheck','3','admin',now(),'','SM2016121214444685582','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016121214470517562','上/下架','2','/updown','4','admin',now(),'','SM2016121214444685582','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016121214481743755','取现审批','1','/biz/withdraw.htm','4','admin',now(),'','SM2016121214325248217','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016121214490617928','代申请','2','add','1','admin',now(),'','SM2016121214481743755','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016121214495421331','审批','2','/check','2','admin',now(),'','SM2016121214481743755','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016121215224762287','订单跟踪','1','/biz/order.htm','5','admin',now(),'','SM2016121214325248217','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016121215231084357','详情','2','/detail','1','admin',now(),'','SM2016121215224762287','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM201612121523320451','导出','2','/export','2','admin',now(),'','SM2016121215224762287','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016121215243785360','汇赚宝管理','1','/biz/moneytree.htm','6','admin',now(),'','SM2016121214325248217','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016121215251717619','代激活','2','/active','1','admin',now(),'','SM2016121215243785360','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016121215255452846','解冻/冻结','2','/lock','2','admin',now(),'','SM2016121215243785360','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016121215265650515','福利月卡管理','1','/biz/stock.htm','7','admin',now(),'','SM2016121214325248217','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016121215272427591','代购','2','add','1','admin',now(),'','SM2016121215265650515','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016121215275638278','清算','2','edit','2','admin',now(),'','SM2016121215265650515','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016121215281752118','详情','2','/detail','3','admin',now(),'','SM2016121215265650515','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016121215304545522','红包审批','1','/biz/luckymoney.htm','8','admin',now(),'','SM2016121214325248217','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016121215310612145','审批','2','/check','1','admin',now(),'','SM2016121215304545522','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016121215323620971','红包业绩审批','1','/biz/performance.htm','9','admin',now(),'','SM2016121214325248217','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016121215325117652','审批','2','/check','1','admin',now(),'','SM2016121215323620971','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016121215332251046','业务规则','1','#','2','admin',now(),'','SM201612121417489854','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016121215342898771','分销规则','1','/biz/distribution.htm','1','admin',now(),'','SM2016121215332251046','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016121215345041790','修改','2','/edit','1','admin',now(),'','SM2016121215342898771','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016121215411661735','摇一摇规则','1','/biz/shake.htm','2','admin',now(),'','SM2016121215332251046','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016121215414008454','修改','2','edit','1','admin',now(),'','SM2016121215411661735','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016121215431330778','虚拟币规则','1','/biz/virtualmoney.htm','3','admin',now(),'','SM2016121215332251046','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016121215435401753','修改','2','/edit','1','admin',now(),'','SM2016121215431330778','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016121215443012922','定位规则','1','/biz/location.htm','4','admin',now(),'','SM2016121215332251046','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016121215444925722','修改','2','/edit','1','admin',now(),'','SM2016121215443012922','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016121215462081241','用户管理','1','#','3','admin',now(),'','SM201612121417489854','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016121215465935188','C端用户','1','/biz/customer.htm','1','admin',now(),'','SM2016121215462081241','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016121215475590373','代注册','2','/add','1','admin',now(),'','SM2016121215465935188','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016121215491223788','禁止登录/取消','2','/lock','2','admin',now(),'','SM2016121215465935188','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016121215501001074','B端用户','1','/biz/bizman.htm','2','admin',now(),'','SM2016121215462081241','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016121215511604893','代注册','2','/add','1','admin',now(),'','SM2016121215501001074','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016121215513360129','禁止登录/取消','2','/lock','2','admin',now(),'','SM2016121215501001074','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016121215521211246','合伙人管理','1','/biz/partner.htm','3','admin',now(),'','SM2016121215462081241','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016121215522782115','新增','2','/add','1','admin',now(),'','SM2016121215521211246','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016121215524418148','修改','2','/edit','2','admin',now(),'','SM2016121215521211246','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016121215534398095','解除关系/取消','2','lock','3','admin',now(),'','SM2016121215521211246','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016121215543215610','文章管理','1','#','4','admin',now(),'','SM201612121417489854','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016121215550321785','Banner管理','1','/biz/banner.htm','1','admin',now(),'','SM2016121215543215610','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016121215581659738','新增','2','/add','1','admin',now(),'','SM2016121215550321785','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016121215584215568','修改','2','/edit','2','admin',now(),'','SM2016121215550321785','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016121215590135675','删除','2','/delete','3','admin',now(),'','SM2016121215550321785','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016121215592553949','详情','2','/detail','4','admin',now(),'','SM2016121215550321785','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016121216034068624','菜单管理','1','/biz/menu.htm','2','admin',now(),'','SM2016121215543215610','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016121216040106058','修改','2','/edit','1','admin',now(),'','SM2016121216034068624','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016121216045274832','关于我们','1','/biz/aboutus_addedit.htm','3','admin',now(),'','SM2016121215543215610','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016121216055859786','合伙人','1','#','6','admin',now(),'','SM201612121417489854','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016121216070440235','我的账本','1','/biz/myaccount.htm','1','admin',now(),'','SM2016121216055859786','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016121216081334671','辖区商户','1','/biz/myseller.htm','2','admin',now(),'','SM2016121216055859786','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016121216083080679','审批','2','/check','1','admin',now(),'','SM2016121216081334671','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016121216084598347','详情','2','/detail','2','admin',now(),'','SM2016121216081334671','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016121610074423689','商品类别','1','/biz/prokind.htm','0','admin',now(),'','SM2016121215543215610','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016121610081124138','新增','2','/add','1','admin',now(),'','SM2016121610074423689','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016121610083504294','修改','2','/edit','2','admin',now(),'','SM2016121610074423689','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016121610085798139','删除','2','/delete','3','admin',now(),'','SM2016121610074423689','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016121610102404834','详情','2','/detail','4','admin',now(),'','SM2016121610074423689','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016122219561180130','导出','2','/export','9','admin',now(),'','SM201612071029309117','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016122219573703627','导出','2','/export','9','admin',now(),'','SM2016120710341064879','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016122219590218515','导出','2','/export','9','admin',now(),'','SM2016120710470696888','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016122220000572417','导出','2','/export','9','admin',now(),'','SM2016120710484209132','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016122316104946911','新增','2','add','1','admin',now(),'','SM2016120711492601376','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016122316120015342','修改','2','edit','2','admin',now(),'','SM2016120711492601376','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016122316561190284','新增','2','add','1','admin',now(),'','SM2016120713315874098','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016122316563671114','修改','2','edit','2','admin',now(),'','SM2016120713315874098','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016122316571129671','新增','2','add','1','admin',now(),'','SM201612071333260150','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016122316573932633','修改','2','edit','2','admin',now(),'','SM201612071333260150','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM201612231658256847','新增','2','add','1','admin',now(),'','SM2016120713350008767','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016122316584604190','修改','2','edit','2','admin',now(),'','SM2016120713350008767','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016122317321369746','线下充值','2','add','1','admin',now(),'','SM2016120711021944714','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016122317325464966','线下取现','2','add','2','admin',now(),'','SM2016120711034365344','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016122317590316953','流水','2','/flow','1','admin',now(),'','SM2016120710583381112','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016122409521459050','详情','2','detail','5','admin',now(),'','SM2016121214444685582','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016122412144574736','导出','2','export','9','admin',now(),'','SM2016120710583381112','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016122412472681689','详情','2','detail','3','admin',now(),'','SM2016120711492601376','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016122412474396115','详情','2','detail','3','admin',now(),'','SM2016120713315874098','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016122412480040054','详情','2','detail','3','admin',now(),'','SM201612071333260150','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016122412482044967','详情','2','detail','3','admin',now(),'','SM2016120713350008767','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016122413510161245','审核','2','check','2','admin',now(),'','SM2016120711021944714','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2016122413512505485','审核','2','check','2','admin',now(),'','SM2016120711034365344','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2017010417014842122','钱币干预','1','/biz/recharge.htm','4','admin',now(),'','SM2016121214325248217','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2017010417045374357','线下充值','2','add','1','admin',now(),'','SM2017010417014842122','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM201701041705127446','审核','2','check','2','admin',now(),'','SM2017010417014842122','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2017010419535061899','批量审核','2','multicheck','3','admin',now(),'','SM2017010417014842122','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2017010715093123723','详情','2','detail','3','admin',now(),'','SM2016121215465935188','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2017010715095226059','详情','2','detail','3','admin',now(),'','SM2016121215501001074','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2017010715111895455','详情','2','detail','3','admin',now(),'','SM2016121215521211246','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2017010716513610148','批量审批','2','multicheck','3','admin',now(),'','SM2016121214481743755','CD-CZH000001');
INSERT INTO `tsys_menu` (`code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`parent_code`,`system_code`) VALUES ('SM2017010914405037621','生成激活二维码','2','qrcode','3','admin',now(),'','SM2016121215243785360','CD-CZH000001');

/*
-- Query: SELECT `code`,`name`,`level`,'admin' as `updater`,now() as 'update_datetime',`remark`,`system_code` FROM tsys_role where name = '超级管理员' and system_code = 'CD-CZH000001'
-- Date: 2017-01-03 10:48
*/
INSERT INTO `tsys_role` (`code`,`name`,`level`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','超级管理员','1','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_role` (`code`,`name`,`level`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR20160000000000hhr1','合伙人','1','admin',now(),'','CD-CZH000001');

/*
-- Query: SELECT `role_code`,`menu_code`,`updater`,now() as `update_datetime`,`remark`,`system_code` FROM tsys_menu_role where role_code in('SR201600000000000000','SR20160000000000hhr1')
LIMIT 0, 50000

-- Date: 2017-01-10 23:02
*/
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR20160000000000hhr1','SM201600000000000000','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR20160000000000hhr1','SM201600001000000000','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR20160000000000hhr1','SM201612121417489854','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR20160000000000hhr1','SM2016121216055859786','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR20160000000000hhr1','SM2016121216070440235','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR20160000000000hhr1','SM2016121216081334671','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR20160000000000hhr1','SM2016121216083080679','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR20160000000000hhr1','SM2016121216084598347','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM201600000000000000','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM201600001000000000','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM201600001000000001','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM201600001000000002','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM201600001000000003','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM201600001000000004','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016101716290657836','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016101719140087629','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016101716295904680','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016101719143965297','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016101716241339082','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016101716253866426','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016101716450533995','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016101717551955993','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016101717560118734','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016101717563661357','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016101716261754674','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016101719082391126','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016101719094151894','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016101719100760088','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016101719110981215','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016120610552303416','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016112911141208861','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016112911152991684','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016112911280249973','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016112914292031228','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016112914295002950','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016112914322481897','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016112914325471772','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016120210533096194','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016112911292717856','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016112915194249520','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM201611291521071981','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016120715221559156','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016112911322482563','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016112915302885244','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM201611291531308302','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016120715320175228','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016112911334743939','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016112915315987472','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016112915325414564','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016120715325497790','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM201612071021105964','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016120710215035834','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM201612071029309117','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016120714062949665','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016122219561180130','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016120710341064879','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016120714343212111','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016122219573703627','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM201612071022206883','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016120710421392861','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016120816125733948','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016120816133940523','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016120710443551388','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016120911033945882','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016120911042060088','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016120710225078473','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016120710470696888','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM201612091114505291','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016120911160661084','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016122219590218515','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016120710484209132','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016120911293120195','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016120911301231346','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016122220000572417','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016120710233232137','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016120710583381112','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016122317590316953','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016122412144574736','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016120710242555432','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016120711021944714','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016122317321369746','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016122413510161245','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016120711034365344','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016122317325464966','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016122413512505485','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016120710251765049','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016120711095973678','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016120710261005778','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016120711492601376','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016122316104946911','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016122316120015342','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016122412472681689','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016120713315874098','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016122316561190284','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016122316563671114','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016122412474396115','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM201612071333260150','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016122316571129671','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016122316573932633','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016122412480040054','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016120713350008767','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM201612231658256847','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016122316584604190','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016122412482044967','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM201612121417489854','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016121214325248217','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016121214352376049','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016121214362106650','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016121214363809593','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016121214365781512','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016121214373237174','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016121214380315234','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016121214381922945','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM201612121442020218','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM201612121442262686','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016121214424548012','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016121214431210560','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016121214435061029','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016121214444685582','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016121214451800642','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016121214454009858','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016121214461300741','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016121214470517562','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016122409521459050','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016121214481743755','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016121214490617928','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016121214495421331','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2017010716513610148','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016121215224762287','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016121215231084357','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM201612121523320451','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016121215243785360','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016121215251717619','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016121215255452846','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2017010914405037621','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016121215265650515','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016121215272427591','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016121215275638278','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016121215281752118','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016121215304545522','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016121215310612145','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016121215323620971','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016121215325117652','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2017010417014842122','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2017010417045374357','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM201701041705127446','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2017010419535061899','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016121215332251046','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016121215342898771','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016121215345041790','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016121215411661735','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016121215414008454','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016121215431330778','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016121215435401753','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016121215443012922','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016121215444925722','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016121215462081241','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016121215465935188','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016121215475590373','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016121215491223788','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2017010715093123723','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016121215501001074','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016121215511604893','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016121215513360129','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2017010715095226059','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016121215521211246','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016121215522782115','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016121215524418148','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016121215534398095','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2017010715111895455','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016121215543215610','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016121215550321785','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016121215581659738','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016121215584215568','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016121215590135675','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016121215592553949','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016121216034068624','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016121216040106058','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016121216045274832','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016121610074423689','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016121610081124138','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016121610083504294','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016121610085798139','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_menu_role` (`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SR201600000000000000','SM2016121610102404834','admin',now(),NULL,'CD-CZH000001');

/*
-- Query: SELECT code,type,account,password,remark,company_code,system_code FROM zhpay_std_user.tstd_cpassword where system_code = 'CD-CZH000001'
-- Date: 2017-01-06 12:00
*/
INSERT INTO `tstd_cpassword` (`code`,`type`,`account`,`password`,`remark`,`company_code`,`system_code`) VALUES ('CD-CZH000001-001','1','org_name','tianleios',NULL,'CD-CZH000001','CD-CZH000001');
INSERT INTO `tstd_cpassword` (`code`,`type`,`account`,`password`,`remark`,`company_code`,`system_code`) VALUES ('CD-CZH000001-002','1','app_name','zh-dev',NULL,'CD-CZH000001','CD-CZH000001');
INSERT INTO `tstd_cpassword` (`code`,`type`,`account`,`password`,`remark`,`company_code`,`system_code`) VALUES ('CD-CZH000001-003','2','ACCESS_KEY','M0atdzBYOQ-oloFpRJFtX7HDDU1NTBBvRUu3MS1T',NULL,'CD-CZH000001','CD-CZH000001');
INSERT INTO `tstd_cpassword` (`code`,`type`,`account`,`password`,`remark`,`company_code`,`system_code`) VALUES ('CD-CZH000001-004','2','SECRET_KEY','F8eJ94o1WoFIB7VxTwtI5rB8RLi7IHC7cY47Bnwh',NULL,'CD-CZH000001','CD-CZH000001');
INSERT INTO `tstd_cpassword` (`code`,`type`,`account`,`password`,`remark`,`company_code`,`system_code`) VALUES ('CD-CZH000001-005','2','bucket','tianleidb',NULL,'CD-CZH000001','CD-CZH000001');

/*
-- Query: SELECT * FROM zhpay_std_user.tsys_config
-- Date: 2017-01-03 10:57
*/
INSERT INTO `tsys_config` (`id`,`ckey`,`cvalue`,`note`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1,'aboutus','关于我们','<p>我们的故事爱就爱的值得</p><p>错也错的值得</p>','admin',now(),NULL,'CD-CZH000001');

/*
-- Query: select `type`,`parent_key`,`dkey`,`dvalue`,`updater`,now() as update_datetime,`remark`,`system_code` from tsys_dict where system_code = 'CD-CZH000001'
LIMIT 0, 50000

-- Date: 2017-01-10 23:04
*/
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('0',NULL,'user_status','用户状态','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','user_status','0','正常','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','user_status','1','程序锁定','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','user_status','2','人工锁定','admin',now(),NULL,'CD-CZH000001');

INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('0',NULL,'id_kind','证件类型','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','id_kind','1','身份证','admin',now(),NULL,'CD-CZH000001');

INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('0',NULL,'role_level','角色等级','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','role_level','1','运维','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','role_level','2','运营','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','role_level','3','客户','admin',now(),NULL,'CD-CZH000001');

INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('0',NULL,'res_type','资源类型','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','res_type','1','菜单','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','res_type','2','按钮','admin',now(),NULL,'CD-CZH000001');

INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('0',NULL,'lock_direction','锁定方向','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','lock_direction','1','用锁','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','lock_direction','2','解锁','admin',now(),NULL,'CD-CZH000001');

INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('0',NULL,'notice_status','公告状态','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','notice_status','0','待发送','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','notice_status','1','使用中','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','notice_status','2','过期','admin',now(),NULL,'CD-CZH000001');

INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('0',NULL,'news_status','信息状态','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','news_status','0','待发送','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','news_status','1','已发送','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','news_status','2','发送失败','admin',now(),NULL,'CD-CZH000001');

INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('0',NULL,'toKind','针对人群','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','toKind','1','C端用户','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','toKind','2','B端用户','admin',now(),NULL,'CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','toKind','3','平台用户','admin',now(),NULL,'CD-CZH000001');

INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('0',NULL,'order_status','订单状态','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','order_status','1','待支付','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','order_status','2','已支付待发货','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','order_status','3','已发货待收货','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','order_status','4','已收货','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','order_status','91','用户取消','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','order_status','92','商户取消','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','order_status','93','快递异常','admin',now(),'','CD-CZH000001');

INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('0',NULL,'product_status','商品状态','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','product_status','0','待审批','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','product_status','1','审批通过','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','product_status','2','审批不通过','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','product_status','3','已上架','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','product_status','4','已下架','admin',now(),'','CD-CZH000001');

INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('0',NULL,'pro_location','商品位置','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','pro_location','1','普通','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','pro_location','2','热门','admin',now(),'','CD-CZH000001');

INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('0',NULL,'banner_location',' 广告图位置','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','banner_location','1','用户首页','admin',now(),'','CD-CZH000001');

INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('0',NULL,'merchant_kind','商家类型','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','merchant_kind','1','美食','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','merchant_kind','2','KTV','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','merchant_kind','3','电影','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','merchant_kind','4','酒店','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','merchant_kind','5','休闲娱乐','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','merchant_kind','6','汽车','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','merchant_kind','8','足疗按摩','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','merchant_kind','9','生活服务','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','merchant_kind','10','旅游','admin',now(),'','CD-CZH000001');

INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('0',NULL,'merchant_status','商户状态','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','merchant_status','0','待审核','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','merchant_status','1','已上架，关店','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','merchant_status','2','已上架，开店','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','merchant_status','3','已下架，关店','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','merchant_status','91','审核不通过','admin',now(),'','CD-CZH000001');

INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('0',NULL,'card_kind','卡券种类','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','card_kind','1','满减','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','card_kind','2','返现','admin',now(),'','CD-CZH000001');

INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('0',NULL,'stock_status','股份状态','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','stock_status','0','假删除','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','stock_status','1','使用中','admin',now(),'','CD-CZH000001');

INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('0',NULL,'tree_status','摇钱树状态','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','tree_status','0','待支付','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','tree_status','1','未激活','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','tree_status','2','激活','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','tree_status','3','已冻结','admin',now(),'','CD-CZH000001');

INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('0',NULL,'treasure_status','夺宝状态','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','treasure_status','0','待审批','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','treasure_status','1','审批通过/募集中','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','treasure_status','2','审批不通过','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','treasure_status','3','到期','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','treasure_status','4','待发货','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','treasure_status','5','已发货','admin',now(),'','CD-CZH000001');

INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('0',NULL,'currency_kind','货币种类','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','currency_kind','CNY','人民币','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','currency_kind','XNB','虚拟币','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','currency_kind','GXJL','贡献奖励','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','currency_kind','QBB','钱包币','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','currency_kind','GWB','购物币','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','currency_kind','HBB','红包','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','currency_kind','HBYJ','红包业绩','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','currency_kind','FRB','分润','admin',now(),'','CD-CZH000001');

INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('0',NULL,'bankcard_status','银行卡状态','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','bankcard_status','0','弃用','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','bankcard_status','1','启用','admin',now(),'','CD-CZH000001');

INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('0',NULL,'account_kind','账户类型','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','account_kind','C','C端用户','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','account_kind','B','B端用户','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','account_kind','P','平台用户','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','account_kind','PA','合伙人','admin',now(),'','CD-CZH000001');

INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('0',NULL,'account_status','账户状态','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','account_status','0','正常','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','account_status','1','程序锁定','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','account_status','2','人工锁定','admin',now(),'','CD-CZH000001');

INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('0',NULL,'jour_status','流水状态','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','jour_status','0','刚生成待回调','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','jour_status','1','已回调通过待对账','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','jour_status','2','回调不通过','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','jour_status','3','已对账且账不平','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','jour_status','4','账不平待调账','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','jour_status','5','已调账','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','jour_status','9','无需对账','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','jour_status','6','待审批','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','jour_status','7','审批通过','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','jour_status','8','审批不通过','admin',now(),'','CD-CZH000001');

INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('0',NULL,'channel_type','渠道类型','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','channel_type','30','支付宝支付','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','channel_type','01','线下_橙账本','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','channel_type','0','内部账','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','channel_type','9','调账','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','channel_type','10','轧账','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','channel_type','1','币种兑换','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','channel_type','35','微信公众号支付','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','channel_type','36','微信APP支付','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','channel_type','11','易宝支付-网关','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','channel_type','12','易宝支付-WAP','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','channel_type','13','宝付支付-网关','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','channel_type','14','宝付支付-WAP','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','channel_type','15','富友支付-网关','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','channel_type','16','富友支付-WAP','admin',now(),'','CD-CZH000001');

INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('0',NULL,'rule_kind','规则种类','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','rule_kind','A','分销规则','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','rule_kind','B','摇一摇规则','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','rule_kind','C','虚拟币规则','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','rule_kind','D','定位规则','admin',now(),'','CD-CZH000001');

INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('0',NULL,'dtb_type','分销规则分类','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','dtb_type','B1','O2O消费','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','dtb_type','B2','买福利月卡分润','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','dtb_type','B3','买汇赚宝分润','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','dtb_type','B4','摇一摇红包业绩','admin',now(),'','CD-CZH000001');

INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('0',NULL,'bank_currency','银行币种','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','bank_currency','CNY','人民币','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','bank_currency','USD','美元','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','bank_currency','EUR','欧元','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','bank_currency','HKD','港币','admin',now(),'','CD-CZH000001');

INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('0',NULL,'menu_location','菜单位置','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','menu_location','1','会员端菜单','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','menu_location','2','商户端菜单','admin',now(),'','CD-CZH000001');

INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('0',NULL,'stockord_status','股份购买状态','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','stockord_status','0','待支付','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','stockord_status','1','未清算','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','stockord_status','2','已清算','admin',now(),'','CD-CZH000001');

INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('0',NULL,'biz_type','业务类型','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','biz_type','11','充值','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','biz_type','-11','取现','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','biz_type','19','蓝补','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','biz_type','-19','红冲','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','biz_type','-30','购物','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','biz_type','30','购物退款','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','biz_type','-31','店铺消费','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','biz_type','-32','购买折扣券','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','biz_type','-33','购买福利月卡','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','biz_type','34','福利月卡分成','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','biz_type','35','福利月卡返还','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','biz_type','-36','购买汇赚宝','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','biz_type','37','购买汇赚宝分成','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','biz_type','38','汇赚宝摇一摇奖励','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','biz_type','39','摇一摇分成','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','biz_type','50','红包兑分润','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','biz_type','52','红包业绩兑分润','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','biz_type','54','红包业绩兑贡献奖励','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','biz_type','56','分润兑人民币','admin',now(),'','CD-CZH000001');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('1','biz_type','58','贡献奖励兑人民币','admin',now(),'','CD-CZH000001');
