-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- 主机： localhost
-- 生成日期： 2021-05-30 21:59:33
-- 服务器版本： 5.5.62-log
-- PHP 版本： 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `yyyyyyyyyyyyyy`
--

-- --------------------------------------------------------

--
-- 表的结构 `xfs_admin`
--

CREATE TABLE `xfs_admin` (
  `id` int(11) NOT NULL,
  `rule` longtext,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `qq` int(11) DEFAULT NULL,
  `qqid` longtext,
  `token` varchar(255) DEFAULT NULL,
  `google_auth` int(11) DEFAULT '0',
  `google_auth_key` varchar(900) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `xfs_admin`
--

INSERT INTO `xfs_admin` (`id`, `rule`, `name`, `password`, `qq`, `qqid`, `token`, `google_auth`, `google_auth_key`) VALUES
(1, '[1]', 'admin', '21232f297a57a5a743894a0e4a801fc3', 805507465, NULL, NULL, 0, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `xfs_admin_log`
--

CREATE TABLE `xfs_admin_log` (
  `id` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `uname` varchar(900) DEFAULT NULL,
  `l_name` varchar(900) DEFAULT NULL,
  `l_type` varchar(900) DEFAULT NULL,
  `l_request` longtext,
  `l_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `xfs_admin_login_log`
--

CREATE TABLE `xfs_admin_login_log` (
  `id` int(11) NOT NULL,
  `l_ip` varchar(900) DEFAULT NULL,
  `l_name` varchar(900) DEFAULT NULL,
  `l_state` int(11) DEFAULT NULL,
  `l_remark` longtext,
  `l_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `xfs_fenxiao`
--

CREATE TABLE `xfs_fenxiao` (
  `id` int(11) NOT NULL,
  `f_sid` int(11) DEFAULT '0' COMMENT '上级Id',
  `f_state` int(11) NOT NULL COMMENT '0=禁用 1=正常',
  `f_name` varchar(900) DEFAULT NULL COMMENT '登录账号',
  `f_password` varchar(900) DEFAULT NULL COMMENT '登录密码',
  `f_web_ed` int(11) DEFAULT '0' COMMENT '主站额度',
  `f_ed` int(11) DEFAULT '0' COMMENT '分销额度',
  `f_qq` varchar(15) DEFAULT NULL COMMENT '联系人QQ',
  `f_remark` longtext COMMENT '备注信息',
  `f_login_token` varchar(900) DEFAULT NULL,
  `f_domain` longtext  DEFAULT   NULL,
  `f_date` datetime DEFAULT NULL COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `xfs_fenxiao_nls`
--

CREATE TABLE `xfs_fenxiao_nls` (
  `id` int(11) NOT NULL,
  `s_fid` int(11) DEFAULT NULL COMMENT '分销Id',
  `s_webId` int(11) DEFAULT NULL COMMENT '站点Id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `xfs_fenxiao_record`
--

CREATE TABLE `xfs_fenxiao_record` (
  `id` int(11) NOT NULL,
  `type` int(11) DEFAULT NULL COMMENT '0=分销 1=主站',
  `r_fid` int(11) DEFAULT NULL COMMENT '分销Id',
  `r_type` int(11) DEFAULT NULL COMMENT '0=减少 1=增加',
  `r_qnum` int(11) DEFAULT NULL COMMENT '前数量',
  `r_num` int(11) DEFAULT NULL COMMENT '数量',
  `r_hnum` int(11) DEFAULT NULL COMMENT '后数量',
  `r_remark` longtext,
  `r_date` datetime DEFAULT NULL COMMENT '时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `xfs_menu`
--

CREATE TABLE `xfs_menu` (
  `id` int(11) NOT NULL,
  `m_type` int(11) DEFAULT NULL,
  `m_pid` int(11) DEFAULT NULL,
  `m_name` varchar(900) DEFAULT NULL,
  `m_rule` varchar(900) DEFAULT NULL,
  `m_ico` varchar(900) DEFAULT NULL,
  `m_sort` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `xfs_menu`
--

INSERT INTO `xfs_menu` (`id`, `m_type`, `m_pid`, `m_name`, `m_rule`, `m_ico`, `m_sort`) VALUES
(1, 0, 0, '系统管理', NULL, 'fa-cogs', 0),
(2, 1, 1, '系统设置', '/system/index', NULL, 0),
(3, 1, 1, '菜单管理', '/menu/index', NULL, 0),
(4, 0, 0, '站点管理', NULL, 'fa-paper-plane-o', 0),
(5, 1, 4, '站点菜单', '/webmenu/index', NULL, 0),
(7, 0, 0, '用户管理', NULL, 'fa-user', 0),
(8, 1, 7, '用户列表', '/user/index', NULL, 0),
(9, 1, 7, '消费明细', '/userrmb/index', NULL, 0),
(14, 1, 1, '角色管理', '/role/index', NULL, 0),
(15, 1, 1, '账户管理', '/aduser/index', NULL, 0),
(16, 1, 1, '操作日志', '/log/admin', NULL, 0),
(17, 1, 1, '登录日志', '/log/login', NULL, 0),
(18, 1, 1, '请求日志', '/post/index', NULL, 0),
(19, 1, 4, '站点角色', '/webrole/index', NULL, 0),
(20, 1, 4, '商品模型', '/webgoodsmodel/index', NULL, 0),
(21, 1, 4, '站点列表', '/web/index', NULL, 0),
(23, 1, 7, '充值明细', '/userpay/index', NULL, 0),
(24, 0, 0, '数据管理', NULL, 'fa-database', 0),
(25, 1, 24, '订单管理', '/order/index', NULL, 0),
(26, 0, 0, '分销管理', NULL, 'fa-desktop', 0),
(27, 1, 26, '分销列表', '/fenxiao/index/index', NULL, 0),
(28, 1, 26, '分销明细', '/fenxiaorecord/index', NULL, 0),
(29, 1, 1, '运行日志', '/runtime/log', NULL, 0),
(30, 1, 24, '商品管理', '/goods/index', NULL, 0);

-- --------------------------------------------------------

--
-- 表的结构 `xfs_post`
--

CREATE TABLE `xfs_post` (
  `id` int(11) NOT NULL,
  `ip` varchar(900) DEFAULT NULL,
  `type` varchar(900) DEFAULT NULL,
  `url` longtext,
  `post` longtext,
  `get` longtext,
  `cookie` longtext,
  `date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `xfs_role`
--

CREATE TABLE `xfs_role` (
  `id` int(11) NOT NULL,
  `r_name` varchar(900) DEFAULT NULL,
  `r_rule` longtext,
  `r_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `xfs_role`
--

INSERT INTO `xfs_role` (`id`, `r_name`, `r_rule`, `r_date`) VALUES
(1, '系统管理员', '[[1,2],[1,3],[1,14],[1,15],[1,16],[1,17],[1,18],[4,5],[4,19],[4,20],[4,21],[7,8],[7,9],[7,23],[24,25],[26,27],[26,28]]', '2020-12-16 16:46:01');

-- --------------------------------------------------------

--
-- 表的结构 `xfs_system`
--

CREATE TABLE `xfs_system` (
  `id` int(11) NOT NULL,
  `s_img_type` int(11) DEFAULT '0',
  `s_qq` int(11) DEFAULT NULL,
  `s_logo` varchar(900) DEFAULT NULL,
  `s_title` varchar(255) DEFAULT NULL,
  `s_stitle` varchar(255) DEFAULT NULL,
  `s_desc` varchar(255) DEFAULT NULL,
  `s_keyword` varchar(255) DEFAULT NULL,
  `s_icp` varchar(255) DEFAULT NULL,
  `s_content` varchar(255) DEFAULT NULL,
  `s_alioss` longtext,
  `s_web_domain` longtext,
  `s_fenzhan_price` varchar(900) DEFAULT NULL COMMENT '分站版本价格',
  `s_open` longtext,
  `s_fenxiao` varchar(900) DEFAULT NULL COMMENT '分销配置'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `xfs_system`
--

INSERT INTO `xfs_system` (`id`, `s_img_type`, `s_qq`, `s_logo`, `s_title`, `s_stitle`, `s_desc`, `s_keyword`, `s_icp`, `s_content`, `s_alioss`, `s_web_domain`, `s_fenzhan_price`, `s_open`, `s_fenxiao`) VALUES
(1, 0, 805507465, 'http://xiaoyewl.oss-cn-beijing.aliyuncs.com/test/20210412/6ba913278b405e2db3d13f63cf454b0d.png', '云夜卡', '专业网站建设|网站搭建|网页制作|仿站|功能开发| xiaoyewl.net QQ:805507465', '专业低价仿站 xiaoyewl.net QQ:805507465|Asp|php|功能开发|网站搭建|网页搭建|网页定制|功能定制|', '专业低价仿站 xiaoyewl.net QQ:805507465', '粤ICP备14034619号', '版权所有 @小夜网 xiaoyewl.net 客服QQ:805507465', '||||', '612sq.cn', '10|20|30', 'http://open.xiaoyewl.net|XXXXXXXXXXXX', '0|50');

-- --------------------------------------------------------

--
-- 表的结构 `xfs_web`
--

CREATE TABLE `xfs_web` (
  `id` int(11) NOT NULL,
  `w_cre_date` datetime DEFAULT NULL COMMENT '开通时间',
  `w_end_date` datetime DEFAULT NULL COMMENT '到期时间',
  `w_role` int(11) DEFAULT NULL COMMENT '站点版本',
  `w_index_template` longtext COMMENT '首页模板',
  `w_user_template` longtext COMMENT '内页模板',
  `w_login_template` longtext COMMENT '登录页模板',
  `w_owner_qq` varchar(255) DEFAULT NULL COMMENT '拥有人QQ',
  `w_fen_ed` varchar(255) DEFAULT NULL COMMENT '分站额度',
  `w_state` int(11) DEFAULT NULL COMMENT '站点状态 1=正常0=禁用',
  `w_state_desc` longtext COMMENT '禁用描述',
  `w_remark` longtext COMMENT '站点备注'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `xfs_web_admin`
--

CREATE TABLE `xfs_web_admin` (
  `id` int(11) NOT NULL,
  `a_webId` int(11) DEFAULT NULL COMMENT '站点Id',
  `a_type` int(11) DEFAULT NULL COMMENT '类型0=站长 1=管理员',
  `a_menu` longtext,
  `a_state` int(11) DEFAULT NULL COMMENT '类型1=正常0=禁用',
  `a_name` varchar(900) DEFAULT NULL COMMENT '登录账号',
  `a_password` varchar(900) DEFAULT NULL COMMENT '登录密码',
  `a_login_token` varchar(900) DEFAULT NULL,
  `a_remark` longtext COMMENT '备注',
  `a_google_auth` int(11) DEFAULT '0' COMMENT '动态验证',
  `a_google_auth_key` varchar(900) DEFAULT NULL,
  `a_date` datetime DEFAULT NULL COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `xfs_web_config`
--

CREATE TABLE `xfs_web_config` (
  `id` int(11) NOT NULL,
  `c_webId` int(11) DEFAULT NULL COMMENT '站点编号',
  `c_title` varchar(900) DEFAULT NULL COMMENT '站点标题',
  `c_ico` varchar(900) DEFAULT NULL COMMENT '站点图标',
  `c_keyword` varchar(900) DEFAULT NULL COMMENT '站点关键字',
  `c_desc` varchar(900) DEFAULT NULL COMMENT '站点描述',
  `c_qq` varchar(20) DEFAULT NULL COMMENT '站点QQ',
  `c_icp` varchar(900) DEFAULT NULL COMMENT '站点ICp',
  `c_kefu` varchar(900) DEFAULT NULL COMMENT '站点客服信息',
  `c_content` longtext COMMENT '站点版权信息',
  `c_state` int(11) DEFAULT NULL COMMENT '状态 1=正常 0=禁用',
  `c_state_desc` varchar(900) DEFAULT NULL COMMENT '禁用描述',
  `c_order_remind` varchar(900) DEFAULT NULL COMMENT '订单提醒',
  `c_style` longtext COMMENT '自定义样式',
  `c_notice` longtext COMMENT '首页公告',
  `c_nav` longtext COMMENT '首页导航',
  `c_is_login` int(11) DEFAULT NULL COMMENT '0=不登录显示 1=登录显示商品',
  `c_is_register` int(11) DEFAULT NULL COMMENT '0=允许注册 1=禁止注册',
  `c_is_register_invite` int(11) DEFAULT '0' COMMENT '是否开启邀请码注册 0=关闭 1=开启',
  `c_default_level` int(11) DEFAULT '1' COMMENT '默认注册级别',
  `c_user_level` longtext COMMENT '用户等级信息配置',
  `c_index_template` varchar(900) DEFAULT NULL COMMENT '首页模板',
  `c_home_template` varchar(900) DEFAULT NULL COMMENT '内页模板',
  `c_login_template` varchar(900) DEFAULT NULL COMMENT '登录模板',
  `c_pay_config` varchar(900) DEFAULT NULL COMMENT '支付配置',
  `c_alipay_config` varchar(900) DEFAULT NULL,
  `c_alif2fpay_config` longtext,
  `c_epay_config` longtext,
  `c_web_config` longtext COMMENT '分站配置',
  `c_turntable_config` varchar(1500) DEFAULT NULL COMMENT '抽奖配置',
  `c_web_token` varchar(900) DEFAULT NULL COMMENT '后台密钥',
  `c_qq_weixin_browser` INT DEFAULT '1' COMMENT '是否允许QQ微信浏览器访问',
  `c_faq_config` varchar(2000) DEFAULT NULL COMMENT '自助问答配置',
  `c_signin_config` varchar(1500) DEFAULT NULL COMMENT '签到配置'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `xfs_web_domain`
--

CREATE TABLE `xfs_web_domain` (
  `id` int(11) NOT NULL,
  `d_webId` int(11) DEFAULT NULL COMMENT '站点ID',
  `d_webFid` int(11) DEFAULT NULL COMMENT '分站Id',
  `d_name` varchar(900) DEFAULT NULL COMMENT '域名',
  `d_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `xfs_web_ed`
--

CREATE TABLE `xfs_web_ed` (
  `id` int(11) NOT NULL,
  `e_webId` int(11) DEFAULT NULL COMMENT '站点Id',
  `e_webFid` int(11) DEFAULT '0',
  `e_find` int(11) DEFAULT NULL COMMENT '分站版本',
  `e_qnum` int(11) DEFAULT NULL COMMENT '消费前数量',
  `e_num` int(11) DEFAULT NULL COMMENT '消费数量',
  `e_hnum` int(11) DEFAULT NULL COMMENT '消费后数量',
  `e_type` int(11) DEFAULT NULL COMMENT '消费类型0=减少 1=增加',
  `e_date` datetime DEFAULT NULL COMMENT '消费时间',
  `e_remark` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `xfs_web_fenzhan`
--

CREATE TABLE `xfs_web_fenzhan` (
  `id` int(11) NOT NULL,
  `f_webId` int(11) DEFAULT NULL COMMENT '站点Id',
  `f_webFid` int(11) DEFAULT '0' COMMENT '分站Id',
  `f_uid` int(11) DEFAULT NULL COMMENT '归属用户',
  `f_shoukuan_image` varchar(900) DEFAULT NULL COMMENT '收款二维码',
  `f_find` int(11) DEFAULT NULL COMMENT '分站版本',
  `f_state` int(11) DEFAULT NULL COMMENT '分站状态 1=正常0=禁用',
  `f_title` varchar(900) DEFAULT NULL COMMENT '分站标题',
  `f_keyword` varchar(900) DEFAULT NULL COMMENT '关键字',
  `f_desc` varchar(900) DEFAULT NULL COMMENT '描述',
  `f_icp` varchar(900) DEFAULT NULL COMMENT '备案信息',
  `f_kefu` longtext COMMENT '客服信息',
  `f_content` longtext COMMENT '版权信息',
  `f_ico` varchar(900) DEFAULT NULL COMMENT '网站图标',
  `f_style` longtext COMMENT '自定义样式',
  `f_index_notice` longtext COMMENT '首页公告',
  `f_index_nav` longtext COMMENT '首页导航',
  `f_index_template` varchar(900) DEFAULT NULL COMMENT '分站首页模板',
  `f_home_template` varchar(900) DEFAULT NULL COMMENT '分站内页模板',
  `f_login_template` varchar(900) DEFAULT NULL COMMENT '分站登录模板',
  `f_ed` varchar(900) DEFAULT NULL COMMENT '分站额度',
  `f_date` datetime DEFAULT NULL COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `xfs_web_fenzhan_apply`
--

CREATE TABLE `xfs_web_fenzhan_apply` (
  `id` int(11) NOT NULL,
  `a_webId` int(11) DEFAULT NULL COMMENT '站点Id',
  `a_webFid` int(11) DEFAULT NULL COMMENT '分站Id',
  `a_rmb` double DEFAULT NULL COMMENT '提现金额',
  `a_sxf` double DEFAULT NULL COMMENT '提现手续费',
  `a_money` double DEFAULT NULL,
  `a_state` int(11) DEFAULT NULL COMMENT '0 待审核 1已拒绝 2 已通过',
  `a_remark` varchar(255) NOT NULL DEFAULT '' COMMENT '提现反馈',
  `a_image` varchar(255) DEFAULT NULL COMMENT '收款码',
  `a_date` datetime DEFAULT NULL COMMENT '提现时间',
  `a_dates` datetime DEFAULT NULL COMMENT '处理时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `xfs_web_fenzhan_goods`
--

CREATE TABLE `xfs_web_fenzhan_goods` (
  `id` int(11) NOT NULL,
  `g_webId` int(11) DEFAULT NULL COMMENT '主站编号',
  `g_webFid` int(11) DEFAULT NULL COMMENT '分站编号',
  `g_goods_id` int(11) DEFAULT NULL COMMENT '商品编号',
  `g_price_id` int(11) DEFAULT NULL COMMENT '加价模板',
  `g_date` datetime DEFAULT NULL COMMENT '创建时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `xfs_web_goods`
--

CREATE TABLE `xfs_web_goods` (
  `id` int(11) NOT NULL,
  `g_webId` int(11) DEFAULT NULL COMMENT '站点Id',
  `g_supId` int(11) DEFAULT '0' COMMENT '供货商Id',
  `g_status` int(11) DEFAULT '0' COMMENT '1=上架 0=下架',
  `g_shequ` int(11) NOT NULL COMMENT '0=自营 对接社区',
  `g_shequ_params` longtext CHARACTER SET utf8 COMMENT '对接参数',
  `g_shequ_join_code` int(11) DEFAULT '0' COMMENT '对接成功状态',
  `g_type` int(11) DEFAULT '0' COMMENT '商品类型 0=普通商品 1=卡密商品',
  `g_model` int(11) DEFAULT NULL COMMENT '商品下单模型',
  `g_class` int(11) DEFAULT NULL COMMENT '商品分类',
  `g_name` varchar(900) CHARACTER SET utf8 DEFAULT NULL COMMENT '商品名称',
  `g_desc` varchar(900) CHARACTER SET utf8 DEFAULT NULL COMMENT '商品描述',
  `g_keyword` varchar(900) CHARACTER SET utf8 DEFAULT NULL COMMENT '商品关键字',
  `g_image` varchar(900) CHARACTER SET utf8 DEFAULT NULL COMMENT '商品图片',
  `g_sort` int(11) DEFAULT NULL COMMENT '商品排序',
  `g_price` double DEFAULT NULL COMMENT '商品价格',
  `g_price_model` int(11) NOT NULL COMMENT '商品价格模板',
  `g_content` longtext CHARACTER SET utf8 COMMENT '商品内容',
  `g_min_num` int(11) NOT NULL COMMENT '最低下单数量',
  `g_max_num` int(11) NOT NULL COMMENT '最高下单数量',
  `g_mijia` int(11) DEFAULT '1' COMMENT '1=允许密价 0=不允许密价',
  `g_refund` int(11) DEFAULT '1' COMMENT '1=允许退款 0=不允许退款',
  `g_cfxd` int(11) NOT NULL DEFAULT '0' COMMENT '重复下单 1=允许 0=禁止',
  `g_beishu` int(11) DEFAULT NULL COMMENT '下单倍数',
  `g_unit` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '商品单位',
  `g_unit_show` varchar(900) CHARACTER SET utf32 DEFAULT NULL COMMENT '单价显示',
  `g_date` datetime DEFAULT NULL COMMENT '创建时间'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `xfs_web_goods_card`
--

CREATE TABLE `xfs_web_goods_card` (
  `id` int(11) NOT NULL,
  `c_webId` int(11) DEFAULT NULL COMMENT '站点Id',
  `c_supId` int(11) DEFAULT '0' COMMENT '供货商Id',
  `c_goods_id` int(11) DEFAULT NULL COMMENT '商品Id',
  `c_order_id` varchar(255) DEFAULT NULL COMMENT '订单号',
  `c_info` varchar(255) DEFAULT NULL COMMENT '卡密信息',
  `c_state` int(11) DEFAULT NULL COMMENT '卡密状态 0=未使用 1=已使用',
  `c_qq` varchar(255) DEFAULT NULL COMMENT '购买者QQ',
  `c_date` datetime DEFAULT NULL COMMENT '创建时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `xfs_web_goods_class`
--

CREATE TABLE `xfs_web_goods_class` (
  `id` int(11) NOT NULL,
  `c_webId` int(11) DEFAULT NULL COMMENT '站点Id',
  `c_name` varchar(900) DEFAULT NULL COMMENT '分类名称',
  `c_image` varchar(900) DEFAULT NULL COMMENT '分类图片',
  `c_sort` int(11) DEFAULT NULL COMMENT '分类排序',
  `c_date` datetime DEFAULT NULL COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `xfs_web_goods_model`
--

CREATE TABLE `xfs_web_goods_model` (
  `id` int(11) NOT NULL,
  `webId` int(11) DEFAULT NULL COMMENT '所属站点',
  `supId` int(11) DEFAULT '0' COMMENT '所属供应商',
  `model_name` varchar(255) DEFAULT NULL COMMENT '模型名称',
  `model_data` longtext COMMENT '模型数据',
  `model_date` datetime DEFAULT NULL COMMENT '创建时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `xfs_web_goods_model`
--

INSERT INTO `xfs_web_goods_model` (`id`, `webId`, `supId`, `model_name`, `model_data`, `model_date`) VALUES
(1, 1, 0, 'QQ号码', '{\"list\":[{\"type\":\"input\",\"icon\":\"icon-input\",\"options\":{\"width\":\"100%\",\"defaultValue\":\"\",\"required\":true,\"dataType\":\"string\",\"pattern\":\"\",\"placeholder\":\"请输入QQ号\",\"disabled\":false,\"remoteFunc\":\"func_1620652921000_49356\"},\"name\":\"QQ号码\",\"key\":\"1620652921000_49356\",\"model\":\"qq\",\"rules\":[{\"type\":\"string\",\"message\":\"QQ号码格式不正确\"},{\"required\":true,\"message\":\"QQ号码必须填写\"}]}],\"config\":{\"labelWidth\":100,\"labelPosition\":\"right\",\"size\":\"small\"}}', '2021-05-10 21:21:51'),
(2, 0, 0, 'QQ号码+QQ密码', '{\"list\":[{\"type\":\"input\",\"icon\":\"icon-input\",\"options\":{\"width\":\"100%\",\"defaultValue\":\"\",\"required\":true,\"dataType\":\"string\",\"pattern\":\"\",\"placeholder\":\"请输入QQ号\",\"disabled\":false,\"remoteFunc\":\"func_1620739607000_2837\"},\"name\":\"QQ号码\",\"key\":\"1620739607000_2837\",\"model\":\"qq\",\"rules\":[{\"type\":\"string\",\"message\":\"QQ号码格式不正确\"},{\"required\":true,\"message\":\"QQ号码必须填写\"}]},{\"type\":\"input\",\"icon\":\"icon-input\",\"options\":{\"width\":\"100%\",\"defaultValue\":\"\",\"required\":true,\"dataType\":\"string\",\"pattern\":\"\",\"placeholder\":\"请输入QQ密码\",\"disabled\":false,\"remoteFunc\":\"func_1620739608000_86491\"},\"name\":\"QQ密码\",\"key\":\"1620739608000_86491\",\"model\":\"password\",\"rules\":[{\"type\":\"string\",\"message\":\"QQ密码格式不正确\"},{\"required\":true,\"message\":\"QQ密码必须填写\"}]}],\"config\":{\"labelWidth\":100,\"labelPosition\":\"right\",\"size\":\"small\"}}', '2021-05-11 21:26:59'),
(3, 0, 0, '下单账号', '{\"list\":[{\"type\":\"input\",\"icon\":\"icon-input\",\"options\":{\"width\":\"100%\",\"defaultValue\":\"\",\"required\":true,\"dataType\":\"string\",\"pattern\":\"\",\"placeholder\":\"请输入下单账号\",\"disabled\":false,\"remoteFunc\":\"func_1620739646000_20654\"},\"name\":\"下单账号\",\"key\":\"1620739646000_20654\",\"model\":\"xdzh\",\"rules\":[{\"type\":\"string\",\"message\":\"下单账号格式不正确\"},{\"required\":true,\"message\":\"下单账号必须填写\"}]}],\"config\":{\"labelWidth\":100,\"labelPosition\":\"right\",\"size\":\"small\"}}', '2021-05-11 21:27:25'),
(4, 0, 0, '通用账号+密码', '{\"list\":[{\"type\":\"input\",\"icon\":\"icon-input\",\"options\":{\"width\":\"100%\",\"defaultValue\":\"\",\"required\":true,\"dataType\":\"string\",\"pattern\":\"\",\"placeholder\":\"请输入账号\",\"disabled\":false,\"remoteFunc\":\"func_1586432808000_80751\"},\"name\":\"账号\",\"key\":\"1586432808000_80751\",\"model\":\"zh\",\"rules\":[{\"type\":\"string\",\"message\":\"账号格式不正确\"},{\"required\":true,\"message\":\"账号必须填写\"}]},{\"type\":\"input\",\"icon\":\"icon-input\",\"options\":{\"width\":\"100%\",\"defaultValue\":\"\",\"required\":true,\"dataType\":\"string\",\"pattern\":\"\",\"placeholder\":\"请输入密码\",\"disabled\":false,\"remoteFunc\":\"func_1586432809000_45135\"},\"name\":\"密码\",\"key\":\"1586432809000_45135\",\"model\":\"password\",\"rules\":[{\"type\":\"string\",\"message\":\"密码格式不正确\"},{\"required\":true,\"message\":\"密码必须填写\"}]}],\"config\":{\"labelWidth\":100,\"labelPosition\":\"right\",\"size\":\"small\"}}', '2021-05-11 21:27:59'),
(5, 0, 0, '网页链接', '{\"list\":[{\"type\":\"input\",\"icon\":\"icon-input\",\"options\":{\"width\":\"100%\",\"defaultValue\":\"\",\"required\":true,\"dataType\":\"url\",\"pattern\":\"\",\"placeholder\":\"请输入网址Url\",\"disabled\":false,\"remoteFunc\":\"func_1586432845000_25877\"},\"name\":\"网页链接\",\"key\":\"1586432845000_25877\",\"model\":\"input_url\",\"rules\":[{\"type\":\"url\",\"message\":\"网页链接格式不正确\"},{\"required\":true,\"message\":\"网页链接必须填写\"}]}],\"config\":{\"labelWidth\":100,\"labelPosition\":\"right\",\"size\":\"small\"}}', '2021-05-11 21:28:21'),
(6, 0, 0, '抖音歌曲ID+评论', '{\"list\":[{\"type\":\"input\",\"icon\":\"icon-input\",\"options\":{\"width\":\"100%\",\"defaultValue\":\"\",\"required\":true,\"dataType\":\"xfs_dyid\",\"pattern\":\"\",\"placeholder\":\"请输入抖音歌曲Id\",\"disabled\":false,\"remoteFunc\":\"func_1586433183000_86054\"},\"name\":\"抖音歌曲Id\",\"key\":\"1586433183000_86054\",\"model\":\"input_dysongid\",\"rules\":[{\"type\":\"xfs_dyid\",\"message\":\"抖音歌曲Id格式不正确\"},{\"required\":true,\"message\":\"抖音歌曲Id必须填写\"}]},{\"type\":\"textarea\",\"icon\":\"icon-diy-com-textarea\",\"options\":{\"width\":\"100%\",\"defaultValue\":\"\",\"required\":true,\"disabled\":false,\"pattern\":\"\",\"placeholder\":\"请输入评论内容\",\"remoteFunc\":\"func_1586433209000_50247\"},\"name\":\"评论内容\",\"key\":\"1586433209000_50247\",\"model\":\"textarea_content\",\"rules\":[{\"required\":true,\"message\":\"评论内容必须填写\"}]}],\"config\":{\"labelWidth\":100,\"labelPosition\":\"right\",\"size\":\"small\"}}', '2021-05-11 21:29:07'),
(7, 0, 0, '抖音主页ID', '{\"list\":[{\"type\":\"input\",\"icon\":\"icon-input\",\"options\":{\"width\":\"100%\",\"defaultValue\":\"\",\"required\":true,\"dataType\":\"xfs_dyid\",\"pattern\":\"\",\"placeholder\":\"请输入抖音主页Id\",\"disabled\":false,\"remoteFunc\":\"func_1586433228000_14344\"},\"name\":\"抖音主页ID\",\"key\":\"1586433228000_14344\",\"model\":\"douyinzhuyeid\",\"rules\":[{\"type\":\"xfs_dyid\",\"message\":\"抖音主页ID格式不正确\"},{\"required\":true,\"message\":\"抖音主页ID必须填写\"}]}],\"config\":{\"labelWidth\":100,\"labelPosition\":\"right\",\"size\":\"small\"}}', '2021-05-11 21:29:50'),
(8, 0, 0, '快手作者ID', '{\"list\":[{\"type\":\"input\",\"icon\":\"icon-input\",\"options\":{\"width\":\"100%\",\"defaultValue\":\"\",\"required\":true,\"dataType\":\"xfs_kszz\",\"pattern\":\"\",\"placeholder\":\"请输入快手作者Id\",\"disabled\":false,\"remoteFunc\":\"func_1586433257000_12741\"},\"name\":\"快手作者ID\",\"key\":\"1586433257000_12741\",\"model\":\"kszuozheid\",\"rules\":[{\"type\":\"xfs_kszz\",\"message\":\"快手作者ID格式不正确\"},{\"required\":true,\"message\":\"快手作者ID必须填写\"}]}],\"config\":{\"labelWidth\":100,\"labelPosition\":\"right\",\"size\":\"small\"}}', '2021-05-11 21:30:31'),
(9, 0, 0, '快手视频ID+评论内容', '{\"list\":[{\"type\":\"input\",\"icon\":\"icon-input\",\"options\":{\"width\":\"100%\",\"defaultValue\":\"\",\"required\":true,\"dataType\":\"xfs_ksid\",\"pattern\":\"\",\"placeholder\":\"请输入快手视频Id\",\"disabled\":false,\"remoteFunc\":\"func_1586433389000_3829\"},\"name\":\"快手视频ID\",\"key\":\"1586433389000_3829\",\"model\":\"input_1586433389000_3829\",\"rules\":[{\"type\":\"xfs_ksid\",\"message\":\"快手视频ID格式不正确\"},{\"required\":true,\"message\":\"快手视频ID必须填写\"}]},{\"type\":\"textarea\",\"icon\":\"icon-diy-com-textarea\",\"options\":{\"width\":\"100%\",\"defaultValue\":\"\",\"required\":true,\"disabled\":false,\"pattern\":\"\",\"placeholder\":\"请输入评论内容\",\"remoteFunc\":\"func_1586433413000_95837\"},\"name\":\"评论内容\",\"key\":\"1586433413000_95837\",\"model\":\"textarea_content\",\"rules\":[{\"required\":true,\"message\":\"评论内容必须填写\"}]}],\"config\":{\"labelWidth\":100,\"labelPosition\":\"right\",\"size\":\"small\"}}', '2021-05-11 21:31:02'),
(10, 0, 0, '一直播', '{\"list\":[{\"type\":\"input\",\"icon\":\"icon-input\",\"options\":{\"width\":\"100%\",\"defaultValue\":\"\",\"required\":true,\"dataType\":\"string\",\"pattern\":\"\",\"placeholder\":\"\",\"disabled\":false,\"remoteFunc\":\"func_1589382138000_98529\"},\"name\":\"主播Id\",\"key\":\"1589382138000_98529\",\"model\":\"yk_id\",\"rules\":[{\"type\":\"string\",\"message\":\"主播Id格式不正确\"},{\"required\":true,\"message\":\"主播Id必须填写\"}]}],\"config\":{\"labelWidth\":100,\"labelPosition\":\"right\",\"size\":\"small\"}}', '2021-05-15 15:07:55'),
(11, 0, 0, '一直播[粉丝]', '{\"list\":[{\"type\":\"input\",\"icon\":\"icon-input\",\"options\":{\"width\":\"100%\",\"defaultValue\":\"\",\"required\":true,\"dataType\":\"string\",\"pattern\":\"\",\"placeholder\":\"\",\"disabled\":false,\"remoteFunc\":\"func_1589388626000_86794\"},\"name\":\"主播Id\",\"key\":\"1589388626000_86794\",\"model\":\"xkx_id\",\"rules\":[{\"type\":\"string\",\"message\":\"主播Id格式不正确\"},{\"required\":true,\"message\":\"主播Id必须填写\"}]}],\"config\":{\"labelWidth\":100,\"labelPosition\":\"right\",\"size\":\"small\"}}', '2021-05-15 15:08:31'),
(12, 0, 0, '一直播[回放]', '{\"list\":[{\"type\":\"input\",\"icon\":\"icon-input\",\"options\":{\"width\":\"100%\",\"defaultValue\":\"\",\"required\":true,\"dataType\":\"string\",\"pattern\":\"\",\"placeholder\":\"\",\"disabled\":false,\"remoteFunc\":\"func_1589388626000_86794\"},\"name\":\"视频链接\",\"key\":\"1589388626000_86794\",\"model\":\"xkx_id\",\"rules\":[{\"type\":\"string\",\"message\":\"视频链接格式不正确\"},{\"required\":true,\"message\":\"视频链接必须填写\"}]}],\"config\":{\"labelWidth\":100,\"labelPosition\":\"right\",\"size\":\"small\"}}', '2021-05-15 15:08:57'),
(13, 0, 0, '一直播[带留言]', '{\"list\":[{\"type\":\"input\",\"icon\":\"icon-input\",\"options\":{\"width\":\"100%\",\"defaultValue\":\"\",\"required\":true,\"dataType\":\"string\",\"pattern\":\"\",\"placeholder\":\"\",\"disabled\":false,\"remoteFunc\":\"func_1589382138000_98529\"},\"name\":\"主播Id\",\"key\":\"1589382138000_98529\",\"model\":\"yk_id\",\"rules\":[{\"type\":\"string\",\"message\":\"主播Id格式不正确\"},{\"required\":true,\"message\":\"主播Id必须填写\"}]},{\"type\":\"input\",\"icon\":\"icon-input\",\"options\":{\"width\":\"100%\",\"defaultValue\":\"\",\"required\":true,\"dataType\":\"number\",\"pattern\":\"\",\"placeholder\":\"发言间隔/秒\",\"disabled\":false,\"remoteFunc\":\"func_1589390299000_67114\"},\"name\":\"发言间隔\",\"key\":\"1589390299000_67114\",\"model\":\"miao\",\"rules\":[{\"type\":\"number\",\"message\":\"发言间隔格式不正确\"},{\"required\":true,\"message\":\"发言间隔必须填写\"}]},{\"type\":\"input\",\"icon\":\"icon-input\",\"options\":{\"width\":\"100%\",\"defaultValue\":\"\",\"required\":true,\"dataType\":\"number\",\"pattern\":\"\",\"placeholder\":\"循环次数\",\"disabled\":false,\"remoteFunc\":\"func_1589390347000_91832\"},\"name\":\"循环次数\",\"key\":\"1589390347000_91832\",\"model\":\"ci\",\"rules\":[{\"type\":\"number\",\"message\":\"循环次数格式不正确\"},{\"required\":true,\"message\":\"循环次数必须填写\"}]},{\"type\":\"textarea\",\"icon\":\"icon-diy-com-textarea\",\"options\":{\"width\":\"100%\",\"defaultValue\":\"\",\"required\":true,\"disabled\":false,\"pattern\":\"\",\"placeholder\":\"自定义内容（换行请用”|”）\",\"remoteFunc\":\"func_1589390369000_16862\"},\"name\":\"自定义文本\",\"key\":\"1589390369000_16862\",\"model\":\"zidingyi\",\"rules\":[{\"required\":true,\"message\":\"自定义文本必须填写\"}]}],\"config\":{\"labelWidth\":100,\"labelPosition\":\"right\",\"size\":\"small\"}}', '2021-05-15 15:09:22');

-- --------------------------------------------------------

--
-- 表的结构 `xfs_web_goods_monitor`
--

CREATE TABLE `xfs_web_goods_monitor` (
  `id` int(11) NOT NULL,
  `m_webId` int(11) DEFAULT NULL COMMENT '站点编号',
  `m_type` int(11) DEFAULT NULL COMMENT '0=下调 1=上涨',
  `m_goods_id` int(11) DEFAULT NULL COMMENT '商品编号',
  `m_goods_old_price` double DEFAULT NULL COMMENT '商品旧价格',
  `m_goods_new_price` double DEFAULT NULL COMMENT '商品价格',
  `m_date` datetime DEFAULT NULL COMMENT '变动时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `xfs_web_goods_price`
--

CREATE TABLE `xfs_web_goods_price` (
  `id` int(11) NOT NULL,
  `p_webId` int(11) DEFAULT NULL COMMENT '站点Id',
  `p_webFid` int(11) DEFAULT NULL COMMENT '分站Id',
  `p_supId` int(11) DEFAULT NULL COMMENT '供应商Id',
  `p_name` varchar(900) DEFAULT NULL COMMENT '价格名称',
  `p_type` int(11) DEFAULT NULL COMMENT '价格类型0=固定1 =百分比',
  `p_user_val` longtext COMMENT '用户加价',
  `p_web_val` longtext COMMENT '分站加价',
  `p_date` datetime DEFAULT NULL COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `xfs_web_login_log`
--

CREATE TABLE `xfs_web_login_log` (
  `id` int(11) NOT NULL,
  `l_webId` int(11) DEFAULT NULL,
  `l_id` int(11) DEFAULT NULL COMMENT '登录人Id',
  `l_type` int(11) DEFAULT NULL COMMENT '登录类型 0=站长 1=管理员',
  `l_ip` varchar(900) DEFAULT NULL,
  `l_city` varchar(900) DEFAULT NULL,
  `l_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `xfs_web_menu`
--

CREATE TABLE `xfs_web_menu` (
  `id` int(11) NOT NULL,
  `m_type` int(11) DEFAULT NULL,
  `m_pid` int(11) DEFAULT NULL,
  `m_name` varchar(900) DEFAULT NULL,
  `m_rule` varchar(900) DEFAULT NULL,
  `m_ico` varchar(900) DEFAULT NULL,
  `m_sort` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `xfs_web_menu`
--

INSERT INTO `xfs_web_menu` (`id`, `m_type`, `m_pid`, `m_name`, `m_rule`, `m_ico`, `m_sort`) VALUES
(1, 0, 0, '系统管理', NULL, 'fa-cogs', 0),
(2, 1, 1, '系统设置', '/system/index', NULL, 0),
(3, 1, 1, '模板设置', '/template/index', NULL, 0),
(4, 1, 1, '登录日志', '/loginlog/index', NULL, 0),
(5, 1, 1, '支付设置', '/payment/index', NULL, 0),
(8, 0, 0, '对接管理', NULL, 'fa-cloud', 0),
(9, 1, 8, '对接列表', '/shequ/index', NULL, 0),
(10, 1, 8, '对接日志', '/shequlog/index', NULL, 0),
(11, 0, 0, '商品管理', NULL, 'fa-shopping-cart', 0),
(12, 1, 11, '下单模板', '/goodsmodel/index', NULL, 0),
(13, 1, 11, '加价模板', '/goodsprice/index', NULL, 0),
(14, 1, 11, '商品分类', '/goodsclass/index', NULL, 0),
(15, 1, 11, '商品列表', '/goods/index', NULL, 0),
(16, 1, 11, '商品卡密', '/goodscard/index', NULL, 0),
(17, 0, 0, '会员管理', NULL, 'fa-user', 0),
(18, 1, 17, '站内消息', '/message/index', NULL, 0),
(19, 1, 17, '会员密价', '/usermijia/index', NULL, 0),
(20, 1, 17, '用户列表', '/user/index', NULL, 0),
(21, 1, 17, '余额明细', '/userrmb/index', NULL, 0),
(22, 1, 17, '充值明细', '/userpay/index', NULL, 0),
(23, 0, 0, '供货商管理', NULL, 'fa-users', 0),
(24, 1, 23, '供货商列表', '/supplier/index', NULL, 0),
(25, 1, 23, '供货商商品', '/supplier/goods', NULL, 0),
(26, 1, 23, '供货商提现', '/supapply/index', NULL, 0),
(27, 1, 23, '供货商明细', '/suprmb/index', NULL, 0),
(28, 0, 0, '充值卡密', NULL, 'fa-credit-card', 0),
(29, 1, 28, '卡组列表', '/paycardgroup/index', NULL, 0),
(30, 1, 28, '卡密列表', '/paycard/index', NULL, 0),
(31, 0, 0, '分站管理', NULL, 'fa-sitemap', 0),
(32, 1, 31, '分站列表', '/fenzhan/index', NULL, 0),
(33, 1, 31, '分站额度', '/fenzhanfed/index', NULL, 0),
(34, 1, 31, '分站提现', '/fenzhanapply/index', NULL, 0),
(35, 1, 31, '额度明细', '/fenzhaned/index', NULL, 0),
(36, 0, 0, '订单管理', NULL, 'fa-bell-o', 0),
(37, 1, 36, '订单列表', '/order/index', NULL, 0),
(38, 1, 36, '订单退款', '/orderrefund/index', NULL, 0),
(39, 0, 0, '抽奖管理', NULL, 'fa-asterisk', 0),
(40, 1, 39, '抽奖配置', '/turntable/set', NULL, 0),
(41, 1, 39, '奖品配置', '/turntable/list', NULL, 0),
(42, 1, 39, '抽奖记录', '/turntablerecord/index', NULL, 0),
(43, 0, 0, '其他功能', NULL, 'fa-tasks', 0),
(44, 1, 43, '定时任务', '/task/index', NULL, 0),
(45, 1, 1, '管理员', '/admin/index', NULL, 0),
(46, 1, 8, '批量对接', '/shequcopy/index', NULL, 0),
(47, 1, 43, '程序更新', '/version/index', NULL, 99),
(48, 1, 11, '价格变动', '/goodsmonitor/index', NULL, 0),
(49, 1, 17, '会员邀请码', '/userinvite/index', NULL, 0),
(50, 1, 43, '异步任务', '/notifytask/index', NULL, 0),
(51, 1, 36, '订单统计', '/ordercount/index', NULL, 0),
(52, 1, 43, '问答系统', '/faq/index', NULL, 0),
(53, 1, 43, '在线签到', '/signin/index', NULL, 0);

-- --------------------------------------------------------

--
-- 表的结构 `xfs_web_message`
--

CREATE TABLE `xfs_web_message` (
  `id` int(11) NOT NULL,
  `m_webId` int(11) DEFAULT NULL COMMENT '站点Id',
  `m_uid` int(11) DEFAULT NULL COMMENT '接收人 0 = 所有人',
  `m_uname` varchar(255) DEFAULT NULL COMMENT '接收人名称',
  `m_title` varchar(255) DEFAULT NULL COMMENT '消息标题',
  `m_content` longtext COMMENT '消息内容',
  `m_date` datetime DEFAULT NULL COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `xfs_web_message_read`
--

CREATE TABLE `xfs_web_message_read` (
  `id` int(11) NOT NULL,
  `r_webId` int(11) DEFAULT NULL,
  `r_uid` int(11) DEFAULT NULL,
  `r_uname` varchar(255) DEFAULT NULL,
  `r_read_id` int(11) DEFAULT NULL,
  `r_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `xfs_web_order`
--

CREATE TABLE `xfs_web_order` (
  `id` int(11) NOT NULL,
  `order_webId` int(11) DEFAULT NULL COMMENT '站点Id',
  `order_webFid` int(11) DEFAULT '0' COMMENT '分站Id',
  `order_supId` int(11) DEFAULT '0' COMMENT '供货商Id',
  `order_uid` int(11) DEFAULT NULL COMMENT '用户Id',
  `order_uname` varchar(255) DEFAULT NULL COMMENT '用户名称',
  `order_id` varchar(255) DEFAULT NULL COMMENT '订单号',
  `order_gtype` int(11) DEFAULT NULL COMMENT '订单类型0=普通商品 1=卡密商品',
  `order_gid` int(11) DEFAULT NULL COMMENT '订单商品Id',
  `order_gname` varchar(255) DEFAULT NULL COMMENT '商品名称',
  `order_gprice` double DEFAULT NULL COMMENT '商品单价',
  `order_grefund` int(11) DEFAULT '0' COMMENT '是否允许退款',
  `order_num` int(11) DEFAULT '1' COMMENT '订单数量',
  `order_price` double DEFAULT NULL COMMENT '订单价格',
  `order_start_num` int(11) DEFAULT '0' COMMENT '订单开始数量',
  `order_end_num` int(11) DEFAULT '0' COMMENT '订单结束数量',
  `order_ticheng` double DEFAULT NULL COMMENT '订单提成',
  `order_web_ticheng` double DEFAULT NULL COMMENT '下级分站订单提成',
  `order_model` longtext COMMENT '下单模型',
  `order_value` longtext COMMENT '下单参数',
  `order_qq` varchar(13) DEFAULT NULL,
  `order_remark` varchar(255) DEFAULT NULL COMMENT '订单备注',
  `order_code` int(11) DEFAULT NULL COMMENT '订单状态',
  `order_join_id` int(11) DEFAULT '0' COMMENT '对接Id',
  `order_join_gid` int(11) DEFAULT NULL COMMENT '对接商品Id',
  `order_join_params` longtext COMMENT '对接参数',
  `order_join_msg` longtext COMMENT '对接返回信息',
  `order_join_outId` longtext COMMENT '对接返回Id',
  `order_date` datetime DEFAULT NULL COMMENT '订单时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `xfs_web_order_refund`
--

CREATE TABLE `xfs_web_order_refund` (
  `id` int(11) NOT NULL,
  `r_webId` int(11) DEFAULT NULL COMMENT '站点Id',
  `r_supId` int(11) DEFAULT '0',
  `r_order_id` longtext COMMENT '订单号',
  `r_type` int(11) DEFAULT NULL COMMENT '退款类型 0=固定 1=百分比 2=下单数量',
  `r_value` double DEFAULT NULL COMMENT '退款值',
  `r_rmb` double DEFAULT NULL COMMENT '退款金额',
  `r_date` datetime NOT NULL COMMENT '退款时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `xfs_web_pay`
--

CREATE TABLE `xfs_web_pay` (
  `id` int(11) NOT NULL,
  `u_webId` int(11) DEFAULT NULL,
  `u_webFid` int(11) DEFAULT '0',
  `u_name` varchar(255) DEFAULT NULL,
  `u_password` varchar(255) DEFAULT NULL,
  `u_qq` varchar(255) DEFAULT NULL,
  `u_rmb` double DEFAULT NULL,
  `u_level` int(11) DEFAULT NULL,
  `u_qqid` longtext,
  `u_token` longtext,
  `u_login_token` varchar(900) DEFAULT NULL,
  `u_google_auth` int(11) DEFAULT '0',
  `u_google_auth_key` varchar(900) DEFAULT NULL,
  `u_ip` varchar(255) DEFAULT NULL,
  `u_state` int(11) NOT NULL DEFAULT '1',
  `u_state_desc` varchar(900) NOT NULL,
  `u_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `xfs_web_pay_card`
--

CREATE TABLE `xfs_web_pay_card` (
  `id` int(11) NOT NULL,
  `c_webId` int(11) DEFAULT NULL COMMENT '站点Id',
  `c_uid` int(11) DEFAULT NULL COMMENT '使用人Id',
  `c_uname` varchar(255) DEFAULT NULL COMMENT '使用人名称',
  `c_group` int(11) DEFAULT NULL COMMENT '卡密分组',
  `c_info` varchar(255) DEFAULT NULL COMMENT '卡密信息',
  `c_rmb` double DEFAULT NULL COMMENT '卡密余额',
  `c_state` int(11) DEFAULT NULL COMMENT '卡密状态 0=未使用 1=已使用',
  `c_date` datetime DEFAULT NULL COMMENT '创建时间',
  `c_dates` datetime DEFAULT NULL COMMENT '使用时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `xfs_web_pay_card_group`
--

CREATE TABLE `xfs_web_pay_card_group` (
  `id` int(11) NOT NULL,
  `g_webId` int(11) DEFAULT NULL COMMENT '站点Id',
  `g_name` varchar(900) DEFAULT NULL COMMENT '分组名称',
  `g_date` datetime DEFAULT NULL COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `xfs_web_role`
--

CREATE TABLE `xfs_web_role` (
  `id` int(11) NOT NULL,
  `r_name` varchar(900) DEFAULT NULL,
  `r_rule` longtext,
  `r_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `xfs_web_role`
--

INSERT INTO `xfs_web_role` (`id`, `r_name`, `r_rule`, `r_date`) VALUES
(1, '旗舰版', '[[1,2],[1,3],[1,4],[1,5],[1,45],[8,9],[8,10],[8,46],[11,12],[11,13],[11,14],[11,15],[11,16],[11,48],[17,18],[17,19],[17,20],[17,21],[17,22],[17,49],[23,24],[23,25],[23,26],[23,27],[28,29],[28,30],[31,32],[31,33],[31,34],[31,35],[36,37],[36,38],[39,40],[39,41],[39,42],[43,44],[43,50],[43,47]]', '2021-04-27 23:39:57'),
(2, '专业版', '[[1,2],[1,3],[1,4],[1,5],[1,45]]', '2021-05-26 22:46:33');

-- --------------------------------------------------------

--
-- 表的结构 `xfs_web_shequ`
--

CREATE TABLE `xfs_web_shequ` (
  `id` int(11) NOT NULL,
  `s_webId` int(11) DEFAULT NULL COMMENT '站点Id',
  `s_supId` int(11) DEFAULT NULL COMMENT '供货商Id',
  `s_type` int(11) DEFAULT NULL COMMENT '社区类型',
  `s_name` varchar(900) DEFAULT NULL COMMENT '社区名称',
  `s_domain` varchar(900) DEFAULT NULL COMMENT '社区域名',
  `s_user` varchar(900) DEFAULT NULL COMMENT '社区账号',
  `s_password` varchar(900) DEFAULT NULL COMMENT '社区密码',
  `s_other` longtext COMMENT '更多信息',
  `s_date` datetime DEFAULT NULL COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `xfs_web_shequ_log`
--

CREATE TABLE `xfs_web_shequ_log` (
  `id` int(11) NOT NULL,
  `l_webId` int(11) NOT NULL,
  `l_order_id` varchar(255) DEFAULT NULL,
  `l_domain` varchar(255) DEFAULT NULL,
  `l_params` longtext,
  `l_result` longtext,
  `l_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `xfs_web_shequ_type`
--

CREATE TABLE `xfs_web_shequ_type` (
  `id` int(11) NOT NULL,
  `s_type` int(11) DEFAULT NULL,
  `s_name` varchar(900) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `xfs_web_shequ_type`
--

INSERT INTO `xfs_web_shequ_type` (`id`, `s_type`, `s_name`) VALUES
(1, 1, '云夜卡'),
(2, 2, '玖五系统'),
(3, 3, '亿乐系统'),
(4, 4, '卡乐购系统'),
(5, 5, '卡易信系统'),
(6, 6, '卡商网'),
(7, 7, '一直播');

-- --------------------------------------------------------

--
-- 表的结构 `xfs_web_supplier`
--

CREATE TABLE `xfs_web_supplier` (
  `id` int(11) NOT NULL,
  `s_webId` int(11) NOT NULL,
  `s_name` varchar(900) DEFAULT NULL COMMENT '登录账号',
  `s_password` varchar(900) DEFAULT NULL COMMENT '登录密码',
  `s_qq` varchar(15) DEFAULT NULL COMMENT 'QQ',
  `s_apply_sxf` double DEFAULT NULL COMMENT '提现手续费',
  `s_rmb` double DEFAULT NULL COMMENT '余额',
  `s_shoukuanma` varchar(900) DEFAULT NULL COMMENT '收款码',
  `s_state` int(11) DEFAULT NULL COMMENT '0=禁止 1=正常',
  `s_remark` varchar(1500) NOT NULL COMMENT '备注',
  `s_login_token` varchar(900) DEFAULT NULL,
  `s_date` datetime DEFAULT NULL COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `xfs_web_sup_apply`
--

CREATE TABLE `xfs_web_sup_apply` (
  `id` int(11) NOT NULL,
  `a_webId` int(11) DEFAULT NULL COMMENT '站点Id',
  `a_supId` int(11) DEFAULT NULL COMMENT '供货商Id',
  `a_supName` varchar(255) DEFAULT NULL COMMENT '供货商名称',
  `a_rmb` double DEFAULT NULL COMMENT '提现金额',
  `a_sxf` double DEFAULT NULL COMMENT '提现手续费',
  `a_money` double DEFAULT NULL,
  `a_state` int(11) DEFAULT NULL COMMENT '0 待审核 1已拒绝 2 已通过',
  `a_remark` varchar(255) NOT NULL DEFAULT '' COMMENT '提现反馈',
  `a_image` varchar(255) DEFAULT NULL COMMENT '收款码',
  `a_date` datetime DEFAULT NULL COMMENT '提现时间',
  `a_dates` datetime DEFAULT NULL COMMENT '处理时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `xfs_web_sup_rmb`
--

CREATE TABLE `xfs_web_sup_rmb` (
  `id` int(11) NOT NULL,
  `r_webId` int(11) DEFAULT NULL COMMENT '站点Id',
  `r_type` int(11) DEFAULT NULL COMMENT '0=减少 1=增加',
  `r_sup_id` int(11) DEFAULT NULL,
  `r_sup_name` varchar(500) DEFAULT NULL,
  `r_qje` double DEFAULT NULL,
  `r_je` double DEFAULT NULL,
  `r_hje` double DEFAULT NULL,
  `r_remark` longtext,
  `r_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `xfs_web_task`
--

CREATE TABLE `xfs_web_task` (
  `id` int(11) NOT NULL,
  `t_webId` int(11) DEFAULT NULL COMMENT '站点编号',
  `t_name` varchar(900) DEFAULT NULL COMMENT '任务标题',
  `t_type` int(11) DEFAULT NULL COMMENT '0=发邮件',
  `t_content` longtext COMMENT '任务参数',
  `t_result` longtext COMMENT '任务执行结果',
  `t_state` int(11) DEFAULT NULL COMMENT '任务状态 0=未进行 1=已完成',
  `t_cre_date` datetime DEFAULT NULL COMMENT '创建时间',
  `t_end_date` datetime DEFAULT NULL COMMENT '完成时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `xfs_web_template`
--

CREATE TABLE `xfs_web_template` (
  `id` int(11) NOT NULL,
  `t_type` int(11) DEFAULT NULL COMMENT '1=PC 2=WAP 3=LOGIN 4=HOME',
  `t_name` varchar(900) DEFAULT NULL,
  `t_path` varchar(900) DEFAULT NULL,
  `t_image` varchar(900) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `xfs_web_template`
--

INSERT INTO `xfs_web_template` (`id`, `t_type`, `t_name`, `t_path`, `t_image`) VALUES
(1, 1, '默认模板', 'default', '/static/template/index/default.png'),
(2, 1, '简约风格', 'fresh', '/static/template/index/fresh.png'),
(3, 1, '图片列表', 'default_pic', '/static/template/index/default_pic.png'),
(4, 1, '清爽风格', 'refreshing', '/static/template/index/refreshing.png'),
(5, 2, '默认模板', 'default', '/static/template/index/default.png'),
(6, 2, '简约风格', 'fresh', '/static/template/index/fresh.png'),
(7, 2, '图片列表', 'default_pic', '/static/template/index/default_pic.png'),
(8, 2, '清爽风格', 'refreshing', '/static/template/index/refreshing.png'),
(9, 3, '默认风格', 'default', '/static/template/login/default.png'),
(10, 4, '默认风格', 'default', '/static/template/user/default.png');

-- --------------------------------------------------------

--
-- 表的结构 `xfs_web_turntable`
--

CREATE TABLE `xfs_web_turntable` (
  `id` int(11) NOT NULL,
  `t_webId` int(11) DEFAULT NULL COMMENT '站点Id',
  `t_type` int(11) DEFAULT NULL COMMENT '0=谢谢参与1=红包2=其他奖品',
  `t_name` varchar(255) DEFAULT NULL COMMENT '奖品名称',
  `t_image` varchar(255) DEFAULT NULL COMMENT '奖品图片',
  `t_rmb` double DEFAULT NULL COMMENT '奖品金额',
  `t_total` int(11) DEFAULT NULL COMMENT '奖品数量',
  `t_retotal` int(11) DEFAULT NULL COMMENT '奖品剩余数量',
  `t_date` datetime DEFAULT NULL COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `xfs_web_turntable_record`
--

CREATE TABLE `xfs_web_turntable_record` (
  `id` int(11) NOT NULL,
  `r_webId` int(11) NOT NULL COMMENT '站点Id',
  `r_webFid` int(11) DEFAULT NULL COMMENT '分站Id',
  `r_uid` int(11) DEFAULT NULL COMMENT '用户Id',
  `r_uname` varchar(255) DEFAULT NULL COMMENT '用户名称',
  `r_type` int(11) DEFAULT NULL COMMENT '奖品类型 0=谢谢参与 1=红包 2=其他',
  `r_name` varchar(255) DEFAULT NULL COMMENT '奖品名称',
  `r_state` int(11) DEFAULT NULL COMMENT '奖品状态',
  `r_date` datetime DEFAULT NULL COMMENT '抽奖时间',
  `r_dates` datetime DEFAULT NULL COMMENT '发放时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `xfs_web_user`
--

CREATE TABLE `xfs_web_user` (
  `id` int(11) NOT NULL,
  `u_webId` int(11) DEFAULT NULL COMMENT '站点Id',
  `u_webFid` int(11) DEFAULT '0' COMMENT '分站Id',
  `u_name` varchar(255) DEFAULT NULL COMMENT '用户名',
  `u_password` varchar(255) DEFAULT NULL COMMENT '用户密码',
  `u_qq` varchar(255) DEFAULT NULL COMMENT '用户QQ',
  `u_rmb` double DEFAULT NULL COMMENT '用户余额',
  `u_level` int(11) DEFAULT NULL COMMENT '用户等级',
  `u_qqid` longtext COMMENT 'QQ登录Id',
  `u_token` varchar(900) DEFAULT NULL COMMENT '用户Token',
  `u_login_token` longtext COMMENT '登录Token',
  `u_google_auth` int(11) DEFAULT NULL COMMENT '谷歌验证',
  `u_google_auth_key` varchar(900) DEFAULT NULL COMMENT '谷歌验证Key',
  `u_ip` varchar(900) DEFAULT NULL,
  `u_state` int(11) DEFAULT '1' COMMENT '0=禁用1=正常',
  `u_state_desc` varchar(900) DEFAULT NULL COMMENT '禁用描述',
  `u_date` datetime DEFAULT NULL COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `xfs_web_user_invite`
--

CREATE TABLE `xfs_web_user_invite` (
  `id` int(11) NOT NULL,
  `i_webId` int(11) DEFAULT NULL COMMENT '站点编号',
  `i_code` varchar(900) DEFAULT NULL COMMENT '邀请码',
  `i_status` int(11) DEFAULT NULL COMMENT '状态0=未使用 1=已使用',
  `i_uid` int(11) DEFAULT NULL COMMENT '使用人Id',
  `i_uname` varchar(900) DEFAULT NULL COMMENT '使用人名称',
  `i_cre_date` datetime DEFAULT NULL COMMENT '创建时间',
  `i_up_date` datetime DEFAULT NULL COMMENT '使用时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `xfs_web_user_level`
--

CREATE TABLE `xfs_web_user_level` (
  `id` int(11) NOT NULL,
  `l_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

INSERT INTO `xfs_web_user_level` (`id`, `l_name`) VALUES
(1, '普通会员'),
(2, '高级会员'),
(3, '至尊会员'),
(4, '皇冠会员'),
(5, '钻石会员');


--
-- 表的结构 `xfs_web_user_login_record`
--

CREATE TABLE `xfs_web_user_login_record` (
  `id` int(11) NOT NULL,
  `l_webId` int(11) DEFAULT NULL COMMENT '站点Id',
  `l_uid` int(11) DEFAULT NULL COMMENT '登录UID',
  `l_uname` varchar(900) DEFAULT NULL COMMENT '登录用户',
  `l_type` int(11) DEFAULT NULL COMMENT '0=网页登录 1=QQ登录 2APP登录 ',
  `l_ip` varchar(900) DEFAULT NULL COMMENT '登录IP',
  `l_city` varchar(900) DEFAULT NULL COMMENT '登录城市',
  `l_date` date DEFAULT NULL COMMENT '登录时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `xfs_web_user_mijia`
--

CREATE TABLE `xfs_web_user_mijia` (
  `id` int(11) NOT NULL,
  `m_webId` int(11) DEFAULT NULL COMMENT '站点Id',
  `m_uid` int(11) DEFAULT NULL COMMENT '所属用户',
  `m_uname` varchar(255) DEFAULT NULL COMMENT '用户名称',
  `m_gid` int(11) DEFAULT NULL COMMENT '所属商品 0=全部商品',
  `m_type` int(11) DEFAULT NULL COMMENT '0=固定 1=成本+固定 2=成本+百分比',
  `m_value` double DEFAULT NULL COMMENT '密价值',
  `m_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `xfs_web_user_pay_record`
--

CREATE TABLE `xfs_web_user_pay_record` (
  `id` int(11) NOT NULL,
  `r_webId` int(11) NOT NULL COMMENT '站点Id',
  `r_webFid` int(11) DEFAULT NULL COMMENT '分站编号',
  `r_uid` int(11) DEFAULT NULL COMMENT '用户Id',
  `r_uname` varchar(255) DEFAULT NULL COMMENT '用户名',
  `r_id` varchar(255) DEFAULT NULL COMMENT '订单号',
  `r_rmb` double DEFAULT NULL COMMENT '充值金额',
  `r_type` varchar(255) DEFAULT NULL COMMENT '充值类型',
  `r_state` int(11) DEFAULT NULL COMMENT '充值状态0=未支付 1=已支付',
  `r_date` datetime DEFAULT NULL COMMENT '充值时间',
  `r_pay_date` datetime DEFAULT NULL COMMENT '支付时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `xfs_web_user_rmb`
--

CREATE TABLE `xfs_web_user_rmb` (
  `id` int(11) NOT NULL,
  `r_webId` int(11) DEFAULT NULL COMMENT '站点Id',
  `r_webFid` int(11) DEFAULT NULL,
  `r_type` int(11) DEFAULT NULL COMMENT '0=减少 1=增加',
  `r_uid` int(11) DEFAULT NULL,
  `r_uname` varchar(500) DEFAULT NULL,
  `r_qje` double DEFAULT NULL,
  `r_je` double DEFAULT NULL,
  `r_hje` double DEFAULT NULL,
  `r_remark` longtext,
  `r_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转储表的索引
--

--
-- 表的索引 `xfs_admin`
--
ALTER TABLE `xfs_admin`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `xfs_admin_log`
--
ALTER TABLE `xfs_admin_log`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `xfs_admin_login_log`
--
ALTER TABLE `xfs_admin_login_log`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `xfs_fenxiao`
--
ALTER TABLE `xfs_fenxiao`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `xfs_fenxiao_nls`
--
ALTER TABLE `xfs_fenxiao_nls`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `xfs_fenxiao_record`
--
ALTER TABLE `xfs_fenxiao_record`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `xfs_menu`
--
ALTER TABLE `xfs_menu`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `xfs_post`
--
ALTER TABLE `xfs_post`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `xfs_role`
--
ALTER TABLE `xfs_role`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `xfs_system`
--
ALTER TABLE `xfs_system`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `xfs_web`
--
ALTER TABLE `xfs_web`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `xfs_web_admin`
--
ALTER TABLE `xfs_web_admin`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `xfs_web_config`
--
ALTER TABLE `xfs_web_config`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `xfs_web_domain`
--
ALTER TABLE `xfs_web_domain`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `xfs_web_ed`
--
ALTER TABLE `xfs_web_ed`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `xfs_web_fenzhan`
--
ALTER TABLE `xfs_web_fenzhan`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `xfs_web_fenzhan_apply`
--
ALTER TABLE `xfs_web_fenzhan_apply`
  ADD PRIMARY KEY (`id`,`a_remark`),
  ADD KEY `zid` (`a_webId`,`a_webFid`);

--
-- 表的索引 `xfs_web_fenzhan_goods`
--
ALTER TABLE `xfs_web_fenzhan_goods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `zid` (`g_webId`,`g_webFid`,`g_goods_id`),
  ADD KEY `pid` (`g_price_id`);

--
-- 表的索引 `xfs_web_goods`
--
ALTER TABLE `xfs_web_goods`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `xfs_web_goods_card`
--
ALTER TABLE `xfs_web_goods_card`
  ADD PRIMARY KEY (`id`),
  ADD KEY `zid` (`c_webId`,`c_supId`,`c_goods_id`,`c_order_id`),
  ADD KEY `card_id` (`c_info`);

--
-- 表的索引 `xfs_web_goods_class`
--
ALTER TABLE `xfs_web_goods_class`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `xfs_web_goods_model`
--
ALTER TABLE `xfs_web_goods_model`
  ADD PRIMARY KEY (`id`),
  ADD KEY `zid` (`webId`,`supId`);

--
-- 表的索引 `xfs_web_goods_monitor`
--
ALTER TABLE `xfs_web_goods_monitor`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `xfs_web_goods_price`
--
ALTER TABLE `xfs_web_goods_price`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `xfs_web_login_log`
--
ALTER TABLE `xfs_web_login_log`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `xfs_web_menu`
--
ALTER TABLE `xfs_web_menu`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `xfs_web_message`
--
ALTER TABLE `xfs_web_message`
  ADD PRIMARY KEY (`id`),
  ADD KEY `zid` (`m_webId`,`m_uid`);

--
-- 表的索引 `xfs_web_message_read`
--
ALTER TABLE `xfs_web_message_read`
  ADD PRIMARY KEY (`id`),
  ADD KEY `zid` (`r_webId`,`r_uid`,`r_read_id`);

--
-- 表的索引 `xfs_web_order`
--
ALTER TABLE `xfs_web_order`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `order_id` (`order_id`),
  ADD KEY `zid` (`order_webId`,`order_webFid`,`order_supId`,`order_uid`),
  ADD KEY `order_join_id` (`order_join_id`,`order_join_gid`);

--
-- 表的索引 `xfs_web_order_refund`
--
ALTER TABLE `xfs_web_order_refund`
  ADD PRIMARY KEY (`id`),
  ADD KEY `zid` (`r_webId`);

--
-- 表的索引 `xfs_web_pay`
--
ALTER TABLE `xfs_web_pay`
  ADD PRIMARY KEY (`id`),
  ADD KEY `zid` (`u_webId`),
  ADD KEY `fid` (`u_webFid`),
  ADD KEY `user_name` (`u_name`),
  ADD KEY `user_qq` (`u_qq`);

--
-- 表的索引 `xfs_web_pay_card`
--
ALTER TABLE `xfs_web_pay_card`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `xfs_web_pay_card_group`
--
ALTER TABLE `xfs_web_pay_card_group`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `xfs_web_role`
--
ALTER TABLE `xfs_web_role`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `xfs_web_shequ`
--
ALTER TABLE `xfs_web_shequ`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `xfs_web_shequ_log`
--
ALTER TABLE `xfs_web_shequ_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `zid` (`l_webId`);

--
-- 表的索引 `xfs_web_shequ_type`
--
ALTER TABLE `xfs_web_shequ_type`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `xfs_web_supplier`
--
ALTER TABLE `xfs_web_supplier`
  ADD PRIMARY KEY (`id`),
  ADD KEY `s_webId` (`s_webId`);

--
-- 表的索引 `xfs_web_sup_apply`
--
ALTER TABLE `xfs_web_sup_apply`
  ADD PRIMARY KEY (`id`,`a_remark`),
  ADD KEY `zid` (`a_webId`,`a_supId`);

--
-- 表的索引 `xfs_web_sup_rmb`
--
ALTER TABLE `xfs_web_sup_rmb`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `xfs_web_task`
--
ALTER TABLE `xfs_web_task`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `xfs_web_template`
--
ALTER TABLE `xfs_web_template`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `xfs_web_turntable`
--
ALTER TABLE `xfs_web_turntable`
  ADD PRIMARY KEY (`id`),
  ADD KEY `zid` (`t_webId`);

--
-- 表的索引 `xfs_web_turntable_record`
--
ALTER TABLE `xfs_web_turntable_record`
  ADD PRIMARY KEY (`id`),
  ADD KEY `zid` (`r_webId`,`r_webFid`,`r_uid`);

--
-- 表的索引 `xfs_web_user`
--
ALTER TABLE `xfs_web_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `zid` (`u_webId`),
  ADD KEY `fid` (`u_webFid`),
  ADD KEY `user_name` (`u_name`),
  ADD KEY `user_qq` (`u_qq`);

--
-- 表的索引 `xfs_web_user_invite`
--
ALTER TABLE `xfs_web_user_invite`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `xfs_web_user_level`
--
ALTER TABLE `xfs_web_user_level`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `xfs_web_user_login_record`
--
ALTER TABLE `xfs_web_user_login_record`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `xfs_web_user_mijia`
--
ALTER TABLE `xfs_web_user_mijia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `zid` (`m_webId`,`m_uid`);

--
-- 表的索引 `xfs_web_user_pay_record`
--
ALTER TABLE `xfs_web_user_pay_record`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `xfs_web_user_rmb`
--
ALTER TABLE `xfs_web_user_rmb`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `xfs_admin`
--
ALTER TABLE `xfs_admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `xfs_admin_log`
--
ALTER TABLE `xfs_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `xfs_admin_login_log`
--
ALTER TABLE `xfs_admin_login_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `xfs_fenxiao`
--
ALTER TABLE `xfs_fenxiao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `xfs_fenxiao_nls`
--
ALTER TABLE `xfs_fenxiao_nls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `xfs_fenxiao_record`
--
ALTER TABLE `xfs_fenxiao_record`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `xfs_menu`
--
ALTER TABLE `xfs_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- 使用表AUTO_INCREMENT `xfs_post`
--
ALTER TABLE `xfs_post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `xfs_role`
--
ALTER TABLE `xfs_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- 使用表AUTO_INCREMENT `xfs_system`
--
ALTER TABLE `xfs_system`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `xfs_web`
--
ALTER TABLE `xfs_web`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `xfs_web_admin`
--
ALTER TABLE `xfs_web_admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `xfs_web_config`
--
ALTER TABLE `xfs_web_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `xfs_web_domain`
--
ALTER TABLE `xfs_web_domain`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `xfs_web_ed`
--
ALTER TABLE `xfs_web_ed`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `xfs_web_fenzhan`
--
ALTER TABLE `xfs_web_fenzhan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `xfs_web_fenzhan_apply`
--
ALTER TABLE `xfs_web_fenzhan_apply`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `xfs_web_fenzhan_goods`
--
ALTER TABLE `xfs_web_fenzhan_goods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `xfs_web_goods`
--
ALTER TABLE `xfs_web_goods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `xfs_web_goods_card`
--
ALTER TABLE `xfs_web_goods_card`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `xfs_web_goods_class`
--
ALTER TABLE `xfs_web_goods_class`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `xfs_web_goods_model`
--
ALTER TABLE `xfs_web_goods_model`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- 使用表AUTO_INCREMENT `xfs_web_goods_monitor`
--
ALTER TABLE `xfs_web_goods_monitor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `xfs_web_goods_price`
--
ALTER TABLE `xfs_web_goods_price`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `xfs_web_login_log`
--
ALTER TABLE `xfs_web_login_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `xfs_web_menu`
--
ALTER TABLE `xfs_web_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- 使用表AUTO_INCREMENT `xfs_web_message`
--
ALTER TABLE `xfs_web_message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `xfs_web_message_read`
--
ALTER TABLE `xfs_web_message_read`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `xfs_web_order`
--
ALTER TABLE `xfs_web_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `xfs_web_order_refund`
--
ALTER TABLE `xfs_web_order_refund`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `xfs_web_pay`
--
ALTER TABLE `xfs_web_pay`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `xfs_web_pay_card`
--
ALTER TABLE `xfs_web_pay_card`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `xfs_web_pay_card_group`
--
ALTER TABLE `xfs_web_pay_card_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `xfs_web_role`
--
ALTER TABLE `xfs_web_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `xfs_web_shequ`
--
ALTER TABLE `xfs_web_shequ`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `xfs_web_shequ_log`
--
ALTER TABLE `xfs_web_shequ_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `xfs_web_shequ_type`
--
ALTER TABLE `xfs_web_shequ_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- 使用表AUTO_INCREMENT `xfs_web_supplier`
--
ALTER TABLE `xfs_web_supplier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `xfs_web_sup_apply`
--
ALTER TABLE `xfs_web_sup_apply`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `xfs_web_sup_rmb`
--
ALTER TABLE `xfs_web_sup_rmb`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `xfs_web_task`
--
ALTER TABLE `xfs_web_task`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `xfs_web_template`
--
ALTER TABLE `xfs_web_template`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- 使用表AUTO_INCREMENT `xfs_web_turntable`
--
ALTER TABLE `xfs_web_turntable`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `xfs_web_turntable_record`
--
ALTER TABLE `xfs_web_turntable_record`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `xfs_web_user`
--
ALTER TABLE `xfs_web_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- 使用表AUTO_INCREMENT `xfs_web_user_invite`
--
ALTER TABLE `xfs_web_user_invite`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `xfs_web_user_level`
--
ALTER TABLE `xfs_web_user_level`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `xfs_web_user_login_record`
--
ALTER TABLE `xfs_web_user_login_record`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `xfs_web_user_mijia`
--
ALTER TABLE `xfs_web_user_mijia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `xfs_web_user_pay_record`
--
ALTER TABLE `xfs_web_user_pay_record`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `xfs_web_user_rmb`
--
ALTER TABLE `xfs_web_user_rmb`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;




--
-- 表的结构 `xfs_web_faq`
--

CREATE TABLE `xfs_web_faq` (
  `id` int(11) NOT NULL,
  `f_webId` int(11) DEFAULT NULL,
  `f_sort` int(11) DEFAULT NULL,
  `f_title` varchar(255) DEFAULT NULL,
  `f_content` longtext,
  `f_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转储表的索引
--

--
-- 表的索引 `xfs_web_faq`
--
ALTER TABLE `xfs_web_faq`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `xfs_web_faq`
--
ALTER TABLE `xfs_web_faq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;



--
-- 表的结构 `xfs_web_order_shequ_refund`
--

CREATE TABLE `xfs_web_order_shequ_refund` (
  `id` int(11) NOT NULL,
  `r_webId` int(11) DEFAULT NULL COMMENT '站点id',
  `r_order_id` varchar(500) DEFAULT NULL COMMENT '订单号',
  `r_domain` varchar(500) DEFAULT NULL COMMENT '对接域名',
  `r_id` varchar(500) DEFAULT NULL COMMENT '对接单号',
  `r_type` int(11) DEFAULT NULL COMMENT '退款类型',
  `r_val` int(11) DEFAULT NULL COMMENT '退款值',
  `r_state` int(11) DEFAULT NULL COMMENT '退款状态',
  `r_message` varchar(900) DEFAULT NULL COMMENT '退款结果',
  `r_result` longtext COMMENT '退款结果',
  `r_date` datetime DEFAULT NULL COMMENT '退款时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转储表的索引
--

--
-- 表的索引 `xfs_web_order_shequ_refund`
--
ALTER TABLE `xfs_web_order_shequ_refund`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `xfs_web_order_shequ_refund`
--
ALTER TABLE `xfs_web_order_shequ_refund`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;




--
-- 表的结构 `xfs_web_signin_record`
--

CREATE TABLE `xfs_web_signin_record` (
  `id` int(11) NOT NULL,
  `r_webId` int(11) NOT NULL COMMENT '站点Id',
  `r_uid` int(11) NOT NULL COMMENT '用户Id',
  `r_uname` varchar(900) NOT NULL COMMENT '用户名称',
  `r_ip` varchar(255) NOT NULL COMMENT '签到Ip',
  `r_city` varchar(900) NOT NULL COMMENT '签到地点',
  `r_rmb` double NOT NULL COMMENT '签到金额',
  `r_date` datetime NOT NULL COMMENT '签到时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转储表的索引
--

--
-- 表的索引 `xfs_web_signin_record`
--
ALTER TABLE `xfs_web_signin_record`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `xfs_web_signin_record`
--
ALTER TABLE `xfs_web_signin_record`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;


