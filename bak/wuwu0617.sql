/*
Navicat MySQL Data Transfer

Source Server         : new11
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : wuwu

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2017-06-17 10:10:39
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for wu_adm
-- ----------------------------
DROP TABLE IF EXISTS `wu_adm`;
CREATE TABLE `wu_adm` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理员ID，系统自增',
  `account` varchar(50) NOT NULL COMMENT '管理员账号',
  `pass` varchar(100) NOT NULL COMMENT '管理员密码',
  `email` varchar(50) NOT NULL COMMENT '管理员邮箱',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0未审核1正常2管理员锁定',
  `if_system` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '系统管理员',
  `vpass` varchar(50) NOT NULL COMMENT '二次验证密码，两次MD5加密',
  `fullname` varchar(100) NOT NULL COMMENT '姓名',
  `close_tip` varchar(255) NOT NULL COMMENT '关闭提示',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='管理员信息';

-- ----------------------------
-- Records of wu_adm
-- ----------------------------
INSERT INTO `wu_adm` VALUES ('1', 'admin', '6e7685bf0cbcd518259e245c1c00cfc9:50', '1216065136@qq.com', '1', '1', '', '', '');

-- ----------------------------
-- Table structure for wu_all
-- ----------------------------
DROP TABLE IF EXISTS `wu_all`;
CREATE TABLE `wu_all` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `site_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '网站ID',
  `identifier` varchar(100) NOT NULL COMMENT '标识串',
  `title` varchar(200) NOT NULL COMMENT '分类名称',
  `ico` varchar(255) NOT NULL COMMENT '图标',
  `is_system` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0普通１系统',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1允许0不允许',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COMMENT='分类管理';

-- ----------------------------
-- Records of wu_all
-- ----------------------------
INSERT INTO `wu_all` VALUES ('4', '1', 'ext', '扩展', 'images/ico/about2.png', '0', '1');

-- ----------------------------
-- Table structure for wu_cate
-- ----------------------------
DROP TABLE IF EXISTS `wu_cate`;
CREATE TABLE `wu_cate` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `site_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '网站ID',
  `parent_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '父级ID，0为根分类',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0不使用1正常使用',
  `title` varchar(200) NOT NULL COMMENT '分类名称',
  `taxis` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '分类排序，值越小越往前靠',
  `tpl_list` varchar(255) NOT NULL COMMENT '列表模板',
  `tpl_content` varchar(255) NOT NULL COMMENT '内容模板',
  `psize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '列表每页数量',
  `seo_title` varchar(255) NOT NULL COMMENT 'SEO标题',
  `seo_keywords` varchar(255) NOT NULL COMMENT 'SEO关键字',
  `seo_desc` varchar(255) NOT NULL COMMENT 'SEO描述',
  `identifier` varchar(255) NOT NULL COMMENT '分类标识串',
  `tag` varchar(255) NOT NULL COMMENT '自身Tag设置',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `site_id` (`site_id`,`status`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='分类管理';

-- ----------------------------
-- Records of wu_cate
-- ----------------------------
INSERT INTO `wu_cate` VALUES ('1', '1', '0', '1', '资讯分类', '10', '', '', '0', '', '', '', 'infocate', '');
INSERT INTO `wu_cate` VALUES ('2', '1', '1', '1', 'Company News', '10', '', '', '0', '', '', '', 'company-news', '');
INSERT INTO `wu_cate` VALUES ('3', '1', '1', '1', 'Industry News', '20', '', '', '0', '', '', '', 'industry-news', '');
INSERT INTO `wu_cate` VALUES ('4', '1', '0', '1', '公司相册', '20', '', '', '0', '', '', '', 'company-photo-album', '');
INSERT INTO `wu_cate` VALUES ('5', '1', '4', '1', '活动图集', '10', '', '', '0', '', '', '', 'hdtj', '');
INSERT INTO `wu_cate` VALUES ('6', '1', '4', '1', '公司环境', '20', '', '', '0', '', '', '', 'gshj', '');
INSERT INTO `wu_cate` VALUES ('7', '1', '0', '1', '产品展示', '30', '', '', '0', '', '', '', 'chanpinzhanshi', '');
INSERT INTO `wu_cate` VALUES ('8', '1', '7', '1', 'Thorium Tungsten Electrodes', '10', '', '', '0', '', '', '', 'thorium-tungsten-electrodes', '');
INSERT INTO `wu_cate` VALUES ('9', '1', '7', '1', 'Cerium Tungsten Electrodes', '20', '', '', '0', '', '', '', 'cerium-tungsten-electrodes', '');
INSERT INTO `wu_cate` VALUES ('10', '1', '7', '1', 'Lanthanum Tungsten Electrodes', '30', '', '', '0', '', '', '', 'lanthanum-tungsten-electrodes', '');
INSERT INTO `wu_cate` VALUES ('11', '1', '7', '1', 'Pure Tungsten Electrodes', '40', '', '', '0', '', '', '', 'pure-tungsten-electrodes', '');
INSERT INTO `wu_cate` VALUES ('12', '1', '7', '1', 'Zirconium Tungsten Electrodes', '50', '', '', '0', '', '', '', 'zirconium-tungsten-electrodes', '');
INSERT INTO `wu_cate` VALUES ('13', '1', '7', '1', 'Yttrium Tungsten Electrodes', '60', '', '', '0', '', '', '', 'yttrium-tungsten-electrodes', '');
INSERT INTO `wu_cate` VALUES ('14', '1', '7', '1', 'Compound Tungsten Electrodes', '70', '', '', '0', '', '', '', 'compound-tungsten-electrodes', '');
INSERT INTO `wu_cate` VALUES ('15', '1', '7', '1', 'Sharpened Tungsten Electrodes', '80', '', '', '0', '', '', '', 'sharpened-tungsten-electrodes', '');

-- ----------------------------
-- Table structure for wu_email
-- ----------------------------
DROP TABLE IF EXISTS `wu_email`;
CREATE TABLE `wu_email` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `site_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '网站ID，0表示全部网站',
  `identifier` varchar(255) NOT NULL COMMENT '发送标识',
  `title` varchar(200) NOT NULL COMMENT '邮件主题',
  `content` text NOT NULL COMMENT '邮件内容',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='邮件内容';

-- ----------------------------
-- Records of wu_email
-- ----------------------------
INSERT INTO `wu_email` VALUES ('6', '1', 'project_save', '主题添加通知', '<p>您好，管理员</p><blockquote><p>您的网站（<a href=\"http://{$sys.url}\" target=\"_self\">{$sys.url}</a>）新增了一篇主题，下述是主题的基本信息：<br/></p><p>主题名称：{$rs.title}</p><p>项目类型：{$page_rs.title}</p><p><br/></p><p>请登录网站查询</p></blockquote>');

-- ----------------------------
-- Table structure for wu_ext
-- ----------------------------
DROP TABLE IF EXISTS `wu_ext`;
CREATE TABLE `wu_ext` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '字段ID，自增',
  `module` varchar(100) NOT NULL COMMENT '模块',
  `title` varchar(255) NOT NULL COMMENT '字段名称',
  `identifier` varchar(50) NOT NULL COMMENT '字段标识串',
  `field_type` varchar(255) NOT NULL DEFAULT '200' COMMENT '字段存储类型',
  `note` varchar(255) NOT NULL COMMENT '字段内容备注',
  `form_type` varchar(100) NOT NULL COMMENT '表单类型',
  `form_style` varchar(255) NOT NULL COMMENT '表单CSS',
  `format` varchar(100) NOT NULL COMMENT '格式化方式',
  `content` text NOT NULL COMMENT '默认值',
  `taxis` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '排序',
  `ext` text NOT NULL COMMENT '扩展内容',
  PRIMARY KEY (`id`),
  KEY `module` (`module`)
) ENGINE=MyISAM AUTO_INCREMENT=304 DEFAULT CHARSET=utf8 COMMENT='字段管理器';

-- ----------------------------
-- Records of wu_ext
-- ----------------------------
INSERT INTO `wu_ext` VALUES ('35', 'all-4', '内容', 'content', 'longtext', '', 'code_editor', '', 'html_js', '', '90', 'a:2:{s:5:\"width\";s:3:\"700\";s:6:\"height\";s:3:\"200\";}');
INSERT INTO `wu_ext` VALUES ('274', 'project-166', '轮播图片高度', 'height', '200', '设置首页轮播图片展示高度，为空使用300，只填写数字', 'text', '', 'int', '', '20', 'a:4:{s:8:\"form_btn\";s:0:\"\";s:5:\"width\";s:3:\"100\";s:15:\"ext_quick_words\";s:0:\"\";s:14:\"ext_quick_type\";s:0:\"\";}');
INSERT INTO `wu_ext` VALUES ('276', 'project-167', '通栏图片', 'banner', 'varchar', '', 'upload', '', 'safe', '', '40', 'a:3:{s:7:\"cate_id\";s:1:\"1\";s:11:\"is_multiple\";s:1:\"0\";s:11:\"upload_auto\";s:1:\"1\";}');
INSERT INTO `wu_ext` VALUES ('296', 'project-173', '通栏图片', 'banner', 'varchar', '', 'upload', '', 'safe', '', '40', 'a:3:{s:7:\"cate_id\";s:1:\"1\";s:11:\"is_multiple\";s:1:\"0\";s:11:\"upload_auto\";s:1:\"1\";}');
INSERT INTO `wu_ext` VALUES ('295', 'project-173', '邮箱', 'email', 'varchar', '', 'text', '', 'safe', '', '130', 'a:4:{s:8:\"form_btn\";s:0:\"\";s:5:\"width\";s:3:\"300\";s:15:\"ext_quick_words\";s:0:\"\";s:14:\"ext_quick_type\";s:0:\"\";}');
INSERT INTO `wu_ext` VALUES ('285', 'project-168', '通栏图片', 'banner', 'varchar', '', 'upload', '', 'safe', '', '10', 'a:3:{s:7:\"cate_id\";s:1:\"1\";s:11:\"is_multiple\";s:1:\"0\";s:11:\"upload_auto\";s:1:\"1\";}');
INSERT INTO `wu_ext` VALUES ('287', 'project-169', '通栏图片', 'banner', 'varchar', '', 'upload', '', 'safe', '', '10', 'a:3:{s:7:\"cate_id\";s:1:\"1\";s:11:\"is_multiple\";s:1:\"0\";s:11:\"upload_auto\";s:1:\"1\";}');
INSERT INTO `wu_ext` VALUES ('288', 'list-1456', '缩略图', 'thumb', 'varchar', '', 'upload', '', 'safe', '', '30', 'a:3:{s:7:\"cate_id\";s:1:\"1\";s:11:\"is_multiple\";s:1:\"0\";s:11:\"upload_auto\";s:1:\"1\";}');
INSERT INTO `wu_ext` VALUES ('289', 'list-1456', '摘要', 'note', 'longtext', '简要文字描述', 'editor', '', 'html', '', '20', 'a:13:{s:5:\"width\";s:3:\"800\";s:6:\"height\";s:3:\"100\";s:7:\"is_code\";s:0:\"\";s:9:\"btn_image\";s:0:\"\";s:9:\"btn_video\";s:0:\"\";s:8:\"btn_file\";s:0:\"\";s:8:\"btn_page\";s:0:\"\";s:8:\"btn_info\";s:0:\"\";s:7:\"is_read\";s:0:\"\";s:5:\"etype\";s:6:\"simple\";s:7:\"btn_map\";s:0:\"\";s:7:\"inc_tag\";s:0:\"\";s:10:\"paste_text\";s:0:\"\";}');
INSERT INTO `wu_ext` VALUES ('290', 'project-173', '企业名称', 'company', 'varchar', '', 'text', '', 'safe', '', '200', 'a:4:{s:8:\"form_btn\";s:0:\"\";s:5:\"width\";s:3:\"500\";s:15:\"ext_quick_words\";s:0:\"\";s:14:\"ext_quick_type\";s:0:\"\";}');
INSERT INTO `wu_ext` VALUES ('291', 'project-173', '姓名', 'fullname', 'varchar', '', 'text', '', 'safe', '', '10', 'a:4:{s:8:\"form_btn\";s:0:\"\";s:5:\"width\";s:3:\"300\";s:15:\"ext_quick_words\";s:0:\"\";s:14:\"ext_quick_type\";s:0:\"\";}');
INSERT INTO `wu_ext` VALUES ('292', 'project-173', '联系电话', 'tel', 'varchar', '', 'text', '', 'safe', '', '89', 'a:4:{s:8:\"form_btn\";s:0:\"\";s:5:\"width\";s:3:\"300\";s:15:\"ext_quick_words\";s:0:\"\";s:14:\"ext_quick_type\";s:0:\"\";}');
INSERT INTO `wu_ext` VALUES ('293', 'project-173', '联系地址', 'address', 'varchar', '', 'text', '', 'safe', '', '79', 'a:4:{s:8:\"form_btn\";s:0:\"\";s:5:\"width\";s:3:\"500\";s:15:\"ext_quick_words\";s:0:\"\";s:14:\"ext_quick_type\";s:0:\"\";}');
INSERT INTO `wu_ext` VALUES ('294', 'project-173', '内容', 'content', 'longtext', '', 'editor', '', 'html', '', '255', 'a:13:{s:5:\"width\";s:3:\"950\";s:6:\"height\";s:3:\"360\";s:7:\"is_code\";s:0:\"\";s:9:\"btn_image\";s:1:\"1\";s:9:\"btn_video\";s:0:\"\";s:8:\"btn_file\";s:0:\"\";s:8:\"btn_page\";s:0:\"\";s:8:\"btn_info\";s:0:\"\";s:7:\"is_read\";s:0:\"\";s:5:\"etype\";s:4:\"full\";s:7:\"btn_map\";s:1:\"1\";s:7:\"inc_tag\";s:0:\"\";s:10:\"paste_text\";s:0:\"\";}');
INSERT INTO `wu_ext` VALUES ('297', 'project-170', '通栏图片', 'banner', 'varchar', '', 'upload', '', 'safe', '', '40', 'a:3:{s:7:\"cate_id\";s:1:\"1\";s:11:\"is_multiple\";s:1:\"0\";s:11:\"upload_auto\";s:1:\"1\";}');
INSERT INTO `wu_ext` VALUES ('298', 'project-176', '通栏图片', 'banner', 'varchar', '', 'upload', '', 'safe', '', '40', 'a:3:{s:7:\"cate_id\";s:1:\"1\";s:11:\"is_multiple\";s:1:\"0\";s:11:\"upload_auto\";s:1:\"1\";}');
INSERT INTO `wu_ext` VALUES ('299', 'project-177', '内容', 'content', 'longtext', '', 'editor', '', 'html', '', '255', 'a:13:{s:5:\"width\";s:3:\"950\";s:6:\"height\";s:3:\"360\";s:7:\"is_code\";s:0:\"\";s:9:\"btn_image\";s:1:\"1\";s:9:\"btn_video\";s:1:\"1\";s:8:\"btn_file\";s:1:\"1\";s:8:\"btn_page\";s:0:\"\";s:8:\"btn_info\";s:0:\"\";s:7:\"is_read\";s:0:\"\";s:5:\"etype\";s:4:\"full\";s:7:\"btn_map\";s:0:\"\";s:7:\"inc_tag\";s:0:\"\";s:10:\"paste_text\";s:0:\"\";}');
INSERT INTO `wu_ext` VALUES ('300', 'project-178', '内容', 'content', 'longtext', '', 'editor', '', 'html', '', '255', 'a:13:{s:5:\"width\";s:3:\"950\";s:6:\"height\";s:3:\"360\";s:7:\"is_code\";s:0:\"\";s:9:\"btn_image\";s:1:\"1\";s:9:\"btn_video\";s:1:\"1\";s:8:\"btn_file\";s:1:\"1\";s:8:\"btn_page\";s:0:\"\";s:8:\"btn_info\";s:0:\"\";s:7:\"is_read\";s:0:\"\";s:5:\"etype\";s:4:\"full\";s:7:\"btn_map\";s:0:\"\";s:7:\"inc_tag\";s:0:\"\";s:10:\"paste_text\";s:0:\"\";}');
INSERT INTO `wu_ext` VALUES ('301', 'project-171', '通栏图片', 'banner', 'varchar', '', 'upload', '', 'safe', '', '40', 'a:3:{s:7:\"cate_id\";s:1:\"1\";s:11:\"is_multiple\";s:1:\"0\";s:11:\"upload_auto\";s:1:\"1\";}');
INSERT INTO `wu_ext` VALUES ('302', 'project-175', '通栏图片', 'banner', 'varchar', '', 'upload', '', 'safe', '', '40', 'a:3:{s:7:\"cate_id\";s:1:\"1\";s:11:\"is_multiple\";s:1:\"0\";s:11:\"upload_auto\";s:1:\"1\";}');
INSERT INTO `wu_ext` VALUES ('303', 'project-166', '手机版高度', 'mheight', '200', '请根据轮播图片宽高比例调整手机轮播图片高度', 'text', '', 'safe', '95', '30', 'a:4:{s:8:\"form_btn\";s:0:\"\";s:5:\"width\";s:0:\"\";s:15:\"ext_quick_words\";s:0:\"\";s:14:\"ext_quick_type\";s:0:\"\";}');

-- ----------------------------
-- Table structure for wu_extc
-- ----------------------------
DROP TABLE IF EXISTS `wu_extc`;
CREATE TABLE `wu_extc` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '内容值ID，对应ext表中的id',
  `content` longtext NOT NULL COMMENT '内容文本',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='扩展字段内容维护';

-- ----------------------------
-- Records of wu_extc
-- ----------------------------
INSERT INTO `wu_extc` VALUES ('35', 'Powered By  copyright © , All right reserved.');
INSERT INTO `wu_extc` VALUES ('274', '300');
INSERT INTO `wu_extc` VALUES ('276', '1156');
INSERT INTO `wu_extc` VALUES ('296', '1156');
INSERT INTO `wu_extc` VALUES ('295', 'zibohengnuo@126.com');
INSERT INTO `wu_extc` VALUES ('285', '1156');
INSERT INTO `wu_extc` VALUES ('287', '1138');
INSERT INTO `wu_extc` VALUES ('289', '');
INSERT INTO `wu_extc` VALUES ('288', '');
INSERT INTO `wu_extc` VALUES ('291', '');
INSERT INTO `wu_extc` VALUES ('293', 'Golden business center, Huaguang road, Zhangdian district, Zibo,Shandong, China');
INSERT INTO `wu_extc` VALUES ('292', '+86-533-6121640');
INSERT INTO `wu_extc` VALUES ('290', 'ZIBO HENGNUO IMP.& EXP. CO.,LTD');
INSERT INTO `wu_extc` VALUES ('294', '<p><br/></p><p>ZIBO HENGNUO IMP.&amp; EXP. CO.,LTD</p><p>Add: Golden business center, Huaguang road, Zhangdian district, Zibo,Shandong, China</p><p>TEL/FAX: +86-533-6121640</p><p>MOB.:+86-13589480880</p><p>E-MAIL:zibohengnuo@126.com</p><p>WEB: http://www.zibohengnuo.com</p><p><br/></p><p>-Global professional supplier and manufacturer of welding accesseries</p><p><br/></p>');
INSERT INTO `wu_extc` VALUES ('298', '1132');
INSERT INTO `wu_extc` VALUES ('299', '<p>核心理念：让想干事的人有机会，能干事的人有舞台，干成事的人有地位有待遇。唯才是举，真才必用。</p><blockquote><ol class=\" list-paddingleft-2\" style=\"list-style-type: decimal;\"><li><p>德才兼备原则。选拔和使用人才按照全面衡量，德才兼备的要求，坚持有德无才是庸人，有才无德是小人，德才不可偏废。</p></li><li><p>“效果论”原则。在用才上，我们不看学历看能力，不看文凭看水平，无论是什么身份，什么学历，什么年龄，只要干得好，干得比其他人出色，业绩突出，就大胆启用，委以重任。目前，公司技术人员和中层管理人员平均年龄都在35岁左右，车间主任平均年龄在30岁左右。这些人虽然年龄不大，有的学历也不是很高，但有能力、有干劲、有业绩。我们坚持的“效果论”用人机制，使一大批德才兼备的人才脱颖而出，成为企业发展的栋梁。</p></li><li><p>实践第一的原则。“试玉要烧三日满，辨才须待七年期”。历年来，凡到时风集团工作的各类专业人才，我们都先安排到车间生产一线，让其在实践中锻炼提高，然后通过公开考试，择优选拔。</p></li><li><p>优胜劣汰的原则。在选用人才上，我们实现了由“伯乐相马”向“赛场选马”的转变，谁干得最好，我们就作为人才加以重用；否则，只能被淘汰出局。</p></li><li><p>“人人是人才”的原则。在人才使用上，消除模式化和神秘化，做到因人而宜，量才适用。只要在合适的岗位上发挥出最大程度的才智，就是一定意义的人才。我们按照这个原则，根据每个员工的水平、特长、阅历、性格等，将其安排到相对适宜的岗位上，做到了人尽其才，才尽其能，促进了企业持续、快速、高效发展。 </p></li></ol></blockquote><p>用人唯才，人尽其才。</p><p>人才是企业的灵魂，公司视人才为最大财富，始终把人才作为企业发展的创业之本、竞争之本、发展之本。 </p><p>公司为员工提供一个能发挥才能的宽广舞台，展示才华的广阔空间，做到发现人才、培养人才、尊重人才、发展人才。</p><p>注重人才的引进和再培养，配套全方位的技术培训和业务培训，增强各层次员工在工作上的实际操作能力，做到以人为本、任人唯贤、人尽其才。</p><p>我们有一支年轻、高学历的员工队伍、一个和谐、勤勉的工作氛围、一种共同发展的团队精神。</p><p><br/></p>');
INSERT INTO `wu_extc` VALUES ('300', '<p>作为教育行业软件领先企业，我们有完善的培训教育体系——为员工完善自我提供可靠的资源保证。我们秉承：“企业的竞争优势来源于你比竞争对手学习得更快”。员工的不断学习与发展是正方成长的动力，也是正方激情创新的的源泉。我们将给员工提供更多的学习和成长的机会，这是公司每位领导与员工共同的责任。</p><p><br/></p><p><strong>职业培训 </strong></p><p>公司高度重视员工培训，新员工从加入公司开始，就接受系统的各类培训，使能够快速融入团队，正常开展工作，并在正方得到良好的职业发展。</p><p>公司开展“送出去，请进来”培训规则。提供优秀员工送出去培训的机会，请进来各类专家、顾问、导师到公司指导培训全体员工。</p><p><br/></p><p><strong>新员工导师制度</strong></p><p>通过导师制帮助新员工尽快融入正方文化氛围、熟悉工作环境、流程、产品、技术和业务，尽快顺利接手工作、进入工作角色。</p><p><br/></p><p><strong>新员工入职培训</strong></p><p>新员工入职培训课程包括公司发展历程、企业文化、公司管理制度体系、公司产品体系、公司业务体系、行业知识、职业素养技能等，快速引导新员工理解公司的价值观和经营理念，认同公司文化，顺利进入工作角色。</p><p><br/></p><p><strong>员工在职培训</strong></p><p>员工在职培训包括专业技能培训和管理培训。根据员工岗位和任职要求，提供相应的专业技能和管理培训，涵盖产品管理、研发、市场、销售、咨询实施、人力资源、行政管理、企业管理等方面，帮助员工有效工作，并为员工在公司平台上不断职业发展提供更有利的支持。</p><p><br/></p>');
INSERT INTO `wu_extc` VALUES ('301', '1156');
INSERT INTO `wu_extc` VALUES ('297', '1137');
INSERT INTO `wu_extc` VALUES ('302', '1156');
INSERT INTO `wu_extc` VALUES ('303', '95');

-- ----------------------------
-- Table structure for wu_fields
-- ----------------------------
DROP TABLE IF EXISTS `wu_fields`;
CREATE TABLE `wu_fields` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '字段ID，自增',
  `title` varchar(255) NOT NULL COMMENT '字段名称',
  `identifier` varchar(50) NOT NULL COMMENT '字段标识串',
  `field_type` varchar(255) NOT NULL DEFAULT '200' COMMENT '字段存储类型',
  `note` varchar(255) NOT NULL COMMENT '字段内容备注',
  `form_type` varchar(100) NOT NULL COMMENT '表单类型',
  `form_style` varchar(255) NOT NULL COMMENT '表单CSS',
  `format` varchar(100) NOT NULL COMMENT '格式化方式',
  `content` varchar(100) NOT NULL COMMENT '默认值',
  `taxis` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '排序',
  `ext` text NOT NULL COMMENT '扩展内容',
  `area` text NOT NULL COMMENT '使用范围，多个应用范围用英文逗号隔开',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=128 DEFAULT CHARSET=utf8 COMMENT='字段管理器';

-- ----------------------------
-- Records of wu_fields
-- ----------------------------
INSERT INTO `wu_fields` VALUES ('6', '内容', 'content', 'longtext', '', 'editor', '', 'html', '', '255', 'a:13:{s:5:\"width\";s:3:\"950\";s:6:\"height\";s:3:\"360\";s:7:\"is_code\";s:0:\"\";s:9:\"btn_image\";s:1:\"1\";s:9:\"btn_video\";s:1:\"1\";s:8:\"btn_file\";s:1:\"1\";s:8:\"btn_page\";s:0:\"\";s:8:\"btn_info\";s:0:\"\";s:7:\"is_read\";s:0:\"\";s:5:\"etype\";s:4:\"full\";s:7:\"btn_map\";s:0:\"\";s:7:\"inc_tag\";s:0:\"\";s:10:\"paste_text\";s:0:\"\";}', 'module,project');
INSERT INTO `wu_fields` VALUES ('7', '图片', 'pictures', 'varchar', '支持多图', 'upload', '', 'safe', '', '50', 'a:3:{s:7:\"cate_id\";s:1:\"1\";s:11:\"is_multiple\";s:1:\"1\";s:11:\"upload_auto\";s:1:\"0\";}', 'all,cate,module,project');
INSERT INTO `wu_fields` VALUES ('8', '缩略图', 'thumb', 'varchar', '', 'upload', '', 'safe', '', '30', 'a:3:{s:7:\"cate_id\";s:1:\"1\";s:11:\"is_multiple\";s:1:\"0\";s:11:\"upload_auto\";s:1:\"1\";}', 'module');
INSERT INTO `wu_fields` VALUES ('127', '单个文件', 'dfile', 'varchar', '请上传要下载的文件', 'upload', '', 'int', '', '255', 'a:3:{s:7:\"cate_id\";s:1:\"1\";s:11:\"is_multiple\";s:1:\"0\";s:11:\"upload_auto\";s:1:\"1\";}', 'all,cate,module,project');
INSERT INTO `wu_fields` VALUES ('11', '链接', 'link', 'longtext', '手动指定外部链接时，伪静态链接可以留空', 'url', '', 'safe', '', '90', 'a:1:{s:5:\"width\";s:3:\"500\";}', 'all,cate,module,project');
INSERT INTO `wu_fields` VALUES ('12', '摘要', 'note', 'longtext', '简要文字描述', 'textarea', '', 'safe', '', '20', 'a:2:{s:5:\"width\";s:3:\"600\";s:6:\"height\";s:2:\"80\";}', 'all,cate,module,project');
INSERT INTO `wu_fields` VALUES ('13', '性别', 'gender', 'varchar', '', 'radio', '', 'safe', '女', '120', 'a:3:{s:11:\"option_list\";s:0:\"\";s:9:\"put_order\";s:1:\"0\";s:10:\"ext_select\";s:8:\"男\r\n女\";}', 'all,cate,module,project');
INSERT INTO `wu_fields` VALUES ('14', '邮箱', 'email', 'varchar', '', 'text', '', 'safe', '', '130', 'a:4:{s:8:\"form_btn\";s:0:\"\";s:5:\"width\";s:3:\"300\";s:15:\"ext_quick_words\";s:0:\"\";s:14:\"ext_quick_type\";s:0:\"\";}', 'all,cate,module,project');
INSERT INTO `wu_fields` VALUES ('37', '链接方式', 'target', 'varchar', '设置是否在新窗口打开', 'radio', '', 'safe', '_self', '100', 'a:1:{s:11:\"option_list\";s:5:\"opt:6\";}', 'cate,module,project');
INSERT INTO `wu_fields` VALUES ('30', '姓名', 'fullname', 'varchar', '', 'text', '', 'safe', '', '10', 'a:4:{s:8:\"form_btn\";s:0:\"\";s:5:\"width\";s:3:\"300\";s:15:\"ext_quick_words\";s:0:\"\";s:14:\"ext_quick_type\";s:0:\"\";}', 'all,cate,module,project');
INSERT INTO `wu_fields` VALUES ('31', '通栏图片', 'banner', 'varchar', '', 'upload', '', 'safe', '', '40', 'a:3:{s:7:\"cate_id\";s:1:\"1\";s:11:\"is_multiple\";s:1:\"0\";s:11:\"upload_auto\";s:1:\"1\";}', 'all,cate,module,project');
INSERT INTO `wu_fields` VALUES ('34', '附件', 'files', 'varchar', '仅支持rar和zip的压缩包，支持多附件', 'upload', '', 'safe', '', '70', 'a:3:{s:11:\"upload_type\";s:3:\"zip\";s:7:\"cate_id\";s:1:\"1\";s:11:\"is_multiple\";s:1:\"1\";}', 'all,cate,module,project');
INSERT INTO `wu_fields` VALUES ('36', '视频', 'video', 'varchar', '支持并推荐您使用FlV格式视频', 'upload', '', 'int', '', '110', 'a:3:{s:7:\"cate_id\";s:0:\"\";s:11:\"is_multiple\";s:1:\"0\";s:11:\"upload_auto\";s:1:\"0\";}', 'all,cate,module,project');
INSERT INTO `wu_fields` VALUES ('60', '客服QQ', 'qq', 'varchar', '', 'text', '', 'safe', '', '150', 'a:4:{s:8:\"form_btn\";s:0:\"\";s:5:\"width\";s:3:\"300\";s:15:\"ext_quick_words\";s:0:\"\";s:14:\"ext_quick_type\";s:0:\"\";}', 'all,cate,module,project');
INSERT INTO `wu_fields` VALUES ('116', '广告内容', 'ad', 'longtext', '', 'editor', '', 'html_js', '', '255', 'a:12:{s:5:\"width\";s:3:\"600\";s:6:\"height\";s:3:\"100\";s:7:\"is_code\";i:1;s:9:\"btn_image\";i:1;s:9:\"btn_video\";i:1;s:8:\"btn_file\";b:0;s:8:\"btn_page\";b:0;s:8:\"btn_info\";b:0;s:7:\"is_read\";b:0;s:5:\"etype\";s:6:\"simple\";s:7:\"btn_tpl\";b:0;s:7:\"btn_map\";b:0;}', 'all,cate,module,project');
INSERT INTO `wu_fields` VALUES ('75', '联系地址', 'address', 'varchar', '', 'text', '', 'safe', '', '79', 'a:4:{s:8:\"form_btn\";s:0:\"\";s:5:\"width\";s:3:\"500\";s:15:\"ext_quick_words\";s:0:\"\";s:14:\"ext_quick_type\";s:0:\"\";}', 'all,module,project');
INSERT INTO `wu_fields` VALUES ('76', '联系电话', 'tel', 'varchar', '', 'text', '', 'safe', '', '89', 'a:4:{s:8:\"form_btn\";s:0:\"\";s:5:\"width\";s:3:\"300\";s:15:\"ext_quick_words\";s:0:\"\";s:14:\"ext_quick_type\";s:0:\"\";}', 'all,cate,module,project');
INSERT INTO `wu_fields` VALUES ('77', '邮编', 'zipcode', 'varchar', '请填写六位数字的邮编号码', 'text', '', 'safe', '', '30', 'a:2:{s:8:\"form_btn\";b:0;s:5:\"width\";s:3:\"300\";}', 'all,module');
INSERT INTO `wu_fields` VALUES ('79', 'LOGO', 'logo', 'varchar', '网站LOGO，规格：88x31', 'text', '', 'safe', '', '160', 'a:2:{s:8:\"form_btn\";s:5:\"image\";s:5:\"width\";s:3:\"500\";}', 'all,cate,module,project');
INSERT INTO `wu_fields` VALUES ('80', '图片', 'pic', 'varchar', '', 'text', '', 'safe', '', '255', 'a:4:{s:8:\"form_btn\";s:5:\"image\";s:5:\"width\";s:3:\"500\";s:15:\"ext_quick_words\";s:0:\"\";s:14:\"ext_quick_type\";s:0:\"\";}', 'all,cate,module,project');
INSERT INTO `wu_fields` VALUES ('82', '备案号', 'cert', 'varchar', '', 'text', '', 'safe', '', '255', 'a:2:{s:8:\"form_btn\";b:0;s:5:\"width\";s:3:\"300\";}', 'all');
INSERT INTO `wu_fields` VALUES ('95', '发货时间', 'sendtime', 'varchar', '设置发货时间', 'text', '', 'time', '', '255', 'a:2:{s:8:\"form_btn\";s:4:\"date\";s:5:\"width\";s:3:\"300\";}', 'module');
INSERT INTO `wu_fields` VALUES ('96', '企业名称', 'company', 'varchar', '', 'text', '', 'safe', '', '255', 'a:4:{s:8:\"form_btn\";s:0:\"\";s:5:\"width\";s:3:\"500\";s:15:\"ext_quick_words\";s:0:\"\";s:14:\"ext_quick_type\";s:0:\"\";}', 'all,module,project');
INSERT INTO `wu_fields` VALUES ('106', '管理员回复', 'adm_reply', 'longtext', '', 'editor', '', 'html', '', '255', 'a:12:{s:5:\"width\";s:3:\"800\";s:6:\"height\";s:3:\"180\";s:7:\"is_code\";b:0;s:9:\"btn_image\";i:1;s:9:\"btn_video\";i:1;s:8:\"btn_file\";i:1;s:8:\"btn_page\";b:0;s:8:\"btn_info\";b:0;s:7:\"is_read\";b:0;s:5:\"etype\";s:6:\"simple\";s:7:\"btn_tpl\";b:0;s:7:\"btn_map\";b:0;}', 'module');
INSERT INTO `wu_fields` VALUES ('114', '手机号', 'mobile', 'varchar', '', 'text', '', 'safe', '', '255', 'a:4:{s:8:\"form_btn\";s:0:\"\";s:5:\"width\";s:3:\"300\";s:15:\"ext_quick_words\";s:0:\"\";s:14:\"ext_quick_type\";s:0:\"\";}', 'all,cate,module,project');
INSERT INTO `wu_fields` VALUES ('119', '页脚版权', 'copyright', 'longtext', '', 'editor', '', 'html', '', '255', 'a:12:{s:5:\"width\";s:3:\"800\";s:6:\"height\";s:3:\"100\";s:7:\"is_code\";b:0;s:9:\"btn_image\";s:1:\"1\";s:9:\"btn_video\";b:0;s:8:\"btn_file\";b:0;s:8:\"btn_page\";b:0;s:8:\"btn_info\";b:0;s:7:\"is_read\";b:0;s:5:\"etype\";s:6:\"simple\";s:7:\"btn_tpl\";b:0;s:7:\"btn_map\";b:0;}', 'all,module');
INSERT INTO `wu_fields` VALUES ('120', '英文标题', 'entitle', 'varchar', '设置与主题名称相对应的英文标题', 'text', '', 'safe', '', '255', 'a:4:{s:8:\"form_btn\";s:0:\"\";s:5:\"width\";s:3:\"500\";s:15:\"ext_quick_words\";s:0:\"\";s:14:\"ext_quick_type\";s:0:\"\";}', 'all,cate,module,project');
INSERT INTO `wu_fields` VALUES ('121', '二维码图片', 'barcode', 'varchar', '请上传相应的二维码图片', 'upload', '', 'safe', '', '255', 'a:3:{s:7:\"cate_id\";s:1:\"1\";s:11:\"is_multiple\";s:1:\"0\";s:11:\"upload_auto\";s:1:\"0\";}', 'all,cate,module,project');
INSERT INTO `wu_fields` VALUES ('122', '子标题', 'subtitle', 'varchar', '', 'text', '', 'safe', '', '20', 'a:4:{s:8:\"form_btn\";s:0:\"\";s:5:\"width\";s:3:\"300\";s:15:\"ext_quick_words\";s:0:\"\";s:14:\"ext_quick_type\";s:0:\"\";}', 'all,cate,module,project');
INSERT INTO `wu_fields` VALUES ('124', '自定义链接', 'linkurl', 'varchar', '请填写链接地址，外链请输入http://或https://', 'text', '', 'safe', '', '255', 'a:4:{s:8:\"form_btn\";s:3:\"url\";s:5:\"width\";s:3:\"500\";s:15:\"ext_quick_words\";s:0:\"\";s:14:\"ext_quick_type\";s:0:\"\";}', 'all,cate,module,project');
INSERT INTO `wu_fields` VALUES ('125', '背景颜色', 'bgcolor', 'varchar', '实现在不支持CSS3的情况与背景融合', 'text', '', 'safe', 'FFFFFF', '255', 'a:4:{s:8:\"form_btn\";s:5:\"color\";s:5:\"width\";s:0:\"\";s:15:\"ext_quick_words\";s:0:\"\";s:14:\"ext_quick_type\";s:0:\"\";}', 'all,cate,module,project');

-- ----------------------------
-- Table structure for wu_gd
-- ----------------------------
DROP TABLE IF EXISTS `wu_gd`;
CREATE TABLE `wu_gd` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID号',
  `identifier` varchar(100) NOT NULL COMMENT '标识串',
  `width` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '图片宽度',
  `height` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '图片高度',
  `mark_picture` varchar(255) NOT NULL COMMENT '水印图片位置',
  `mark_position` varchar(100) NOT NULL COMMENT '水印位置',
  `cut_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '图片生成方式，支持缩放法、裁剪法、等宽、等高及自定义五种，默认使用缩放法',
  `quality` tinyint(3) unsigned NOT NULL DEFAULT '100' COMMENT '图片生成质量，默认是100',
  `bgcolor` varchar(10) NOT NULL DEFAULT 'FFFFFF' COMMENT '补白背景色，默认是白色',
  `trans` tinyint(3) unsigned NOT NULL DEFAULT '65' COMMENT '透明度',
  `editor` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0普通1默认插入编辑器',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='上传图片自动生成方案';

-- ----------------------------
-- Records of wu_gd
-- ----------------------------
INSERT INTO `wu_gd` VALUES ('2', 'thumb', '200', '200', '', 'bottom-right', '1', '80', 'FFFFFF', '0', '0');
INSERT INTO `wu_gd` VALUES ('12', 'auto', '0', '0', 'res/201502/26/36afa2d3dfe37cbd.png', 'bottom-right', '0', '80', 'FFFFFF', '0', '1');
INSERT INTO `wu_gd` VALUES ('30', 'mobile', '310', '0', '', 'bottom-right', '0', '80', 'FFFFFF', '0', '0');

-- ----------------------------
-- Table structure for wu_list
-- ----------------------------
DROP TABLE IF EXISTS `wu_list`;
CREATE TABLE `wu_list` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID号',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '0为根主题，其他ID对应list表的id字段',
  `cate_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '分类ID',
  `module_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '模块ID',
  `project_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '项目ID',
  `site_id` mediumint(8) unsigned NOT NULL COMMENT '网站ID',
  `title` varchar(255) NOT NULL COMMENT '主题',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发布时间',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0未审核，1已审核',
  `hidden` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0显示，1隐藏',
  `hits` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '查看次数',
  `tpl` varchar(255) NOT NULL COMMENT '自定义的模板',
  `seo_title` varchar(255) NOT NULL COMMENT 'SEO标题',
  `seo_keywords` varchar(255) NOT NULL COMMENT 'SEO关键字',
  `seo_desc` varchar(255) NOT NULL COMMENT 'SEO描述',
  `tag` varchar(255) NOT NULL COMMENT 'tag标签',
  `attr` varchar(255) NOT NULL COMMENT '主题属性',
  `replydate` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后回复时间',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID号，为0表示管理员发布',
  `identifier` varchar(255) NOT NULL COMMENT '内容标识串',
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`),
  KEY `site_id` (`site_id`,`identifier`,`status`)
) ENGINE=MyISAM AUTO_INCREMENT=1517 DEFAULT CHARSET=utf8 COMMENT='内容主表';

-- ----------------------------
-- Records of wu_list
-- ----------------------------
INSERT INTO `wu_list` VALUES ('1398', '0', '0', '73', '165', '1', 'Home', '1441460487', '10', '1', '0', '0', '', '', '', '', '', '', '0', '0', '');
INSERT INTO `wu_list` VALUES ('1399', '0', '0', '73', '165', '1', 'About Us', '1441460497', '20', '1', '0', '0', '', '', '', '', '', '', '0', '0', '');
INSERT INTO `wu_list` VALUES ('1400', '0', '0', '73', '165', '1', 'News', '1441460518', '30', '1', '0', '0', '', '', '', '', '', '', '0', '0', '');
INSERT INTO `wu_list` VALUES ('1401', '0', '0', '73', '165', '1', 'Products', '1441460539', '40', '1', '0', '0', '', '', '', '', '', '', '0', '0', '');
INSERT INTO `wu_list` VALUES ('1402', '0', '0', '73', '165', '1', '资料下载', '1441460594', '50', '0', '1', '0', '', '', '', '', '', '', '0', '0', '');
INSERT INTO `wu_list` VALUES ('1403', '0', '0', '73', '165', '1', '公司相册', '1441460603', '60', '0', '1', '0', '', '', '', '', '', '', '0', '0', '');
INSERT INTO `wu_list` VALUES ('1404', '0', '0', '73', '165', '1', '人才招聘', '1441460616', '70', '0', '1', '0', '', '', '', '', '', '', '0', '0', '');
INSERT INTO `wu_list` VALUES ('1405', '0', '0', '73', '165', '1', 'GestBook', '1441460658', '80', '1', '0', '0', '', '', '', '', '', '', '0', '0', '');
INSERT INTO `wu_list` VALUES ('1406', '0', '0', '73', '165', '1', 'Contact Us', '1441460674', '90', '1', '0', '0', '', '', '', '', '', '', '0', '0', '');
INSERT INTO `wu_list` VALUES ('1407', '1399', '0', '73', '165', '1', 'Company Profile', '1441460738', '10', '0', '1', '0', '', '', '', '', '', '', '0', '0', '');
INSERT INTO `wu_list` VALUES ('1408', '1399', '0', '73', '165', '1', 'Company Culture', '1441460769', '20', '0', '1', '0', '', '', '', '', '', '', '0', '0', '');
INSERT INTO `wu_list` VALUES ('1459', '0', '5', '76', '169', '1', '华为P7', '1445872241', '0', '1', '0', '0', '', '', '', '', '', '', '0', '0', '');
INSERT INTO `wu_list` VALUES ('1410', '1399', '0', '73', '165', '1', '发展历程', '1441460789', '30', '0', '1', '0', '', '', '', '', '', '', '0', '0', '');
INSERT INTO `wu_list` VALUES ('1507', '0', '0', '82', '175', '1', 'dfgvdgsd', '1497091552', '0', '1', '0', '0', '', '', '', '', '', '', '0', '0', '');
INSERT INTO `wu_list` VALUES ('1412', '0', '0', '74', '166', '1', 'two', '1441463198', '0', '1', '0', '0', '', '', '', '', '', '', '0', '0', '');
INSERT INTO `wu_list` VALUES ('1413', '0', '0', '74', '166', '1', 'Company product 1', '1441463217', '0', '1', '0', '0', '', '', '', '', '', '', '0', '0', '');
INSERT INTO `wu_list` VALUES ('1456', '0', '0', '77', '168', '1', 'Company Profile', '1442473294', '1', '1', '0', '149', '', '', '', '', '', '', '0', '0', 'about-us');
INSERT INTO `wu_list` VALUES ('1457', '0', '0', '77', '168', '1', 'Company Culture', '1442477302', '2', '1', '0', '17', '', '', '', '', '', '', '0', '0', 'culture');
INSERT INTO `wu_list` VALUES ('1458', '0', '0', '77', '168', '1', '发展历程', '1442477842', '3', '0', '1', '17', '', '', '', '', '', '', '0', '0', 'development');
INSERT INTO `wu_list` VALUES ('1460', '0', '5', '76', '169', '1', '华为P7-2', '1445872645', '0', '1', '0', '5', '', '', '', '', '', '', '0', '0', '');
INSERT INTO `wu_list` VALUES ('1461', '0', '6', '76', '169', '1', '苹果手机-1', '1445874367', '0', '1', '0', '3', '', '', '', '', '', '', '0', '0', '');
INSERT INTO `wu_list` VALUES ('1462', '0', '6', '76', '169', '1', '小米手机', '1445904334', '0', '1', '0', '2', '', '', '', '', '', '', '0', '0', '');
INSERT INTO `wu_list` VALUES ('1463', '0', '5', '76', '169', '1', '魅族MX4-1', '1445904354', '0', '1', '0', '6', '', '', '', '', '', '', '0', '0', '');
INSERT INTO `wu_list` VALUES ('1464', '0', '5', '76', '169', '1', '魅族MX4-2', '1445904369', '0', '1', '0', '4', '', '', '', '', '', '', '0', '0', '');
INSERT INTO `wu_list` VALUES ('1467', '0', '0', '79', '172', '1', 'PHPOK企业站', '1449990258', '0', '1', '0', '1', '', '', '', '', '', '', '0', '0', '');
INSERT INTO `wu_list` VALUES ('1468', '0', '0', '79', '172', '1', '中国站长站', '1449990269', '0', '1', '0', '1', '', '', '', '', '', '', '0', '0', '');
INSERT INTO `wu_list` VALUES ('1469', '0', '0', '79', '172', '1', '梦幻网络', '1449990300', '0', '1', '0', '1', '', '', '', '', '', '', '0', '0', '');
INSERT INTO `wu_list` VALUES ('1470', '0', '0', '79', '172', '1', '启邦互动', '1449990328', '0', '1', '0', '1', '', '', '', '', '', '', '0', '0', '');
INSERT INTO `wu_list` VALUES ('1510', '0', '9', '78', '171', '1', 'Cerium Tungsten Electrodes', '1497097652', '0', '1', '0', '3', '', '', '', '', '', '', '0', '0', '');
INSERT INTO `wu_list` VALUES ('1511', '0', '10', '78', '171', '1', 'Lanthanum Tungsten Electrodes', '1497097828', '0', '1', '0', '3', '', '', '', '', '', '', '0', '0', '');
INSERT INTO `wu_list` VALUES ('1512', '0', '11', '78', '171', '1', 'Pure Tungsten Electrodes', '1497098130', '0', '1', '0', '4', '', '', '', '', '', '', '0', '0', '');
INSERT INTO `wu_list` VALUES ('1509', '0', '8', '78', '171', '1', 'Thorium Tungsten Electrodes', '1497095809', '0', '1', '0', '16', '', '', '', '', '', '', '0', '0', '');
INSERT INTO `wu_list` VALUES ('1476', '0', '0', '81', '170', '1', '魅族图片1', '1450143224', '0', '1', '0', '0', '', '', '', '', '', '', '0', '0', '');
INSERT INTO `wu_list` VALUES ('1477', '0', '0', '81', '170', '1', '魅族图片2', '1450143270', '0', '1', '0', '0', '', '', '', '', '', '', '0', '0', '');
INSERT INTO `wu_list` VALUES ('1478', '0', '0', '81', '170', '1', '华为图片1', '1450143282', '0', '1', '0', '2', '', '', '', '', '', '', '0', '0', '');
INSERT INTO `wu_list` VALUES ('1479', '0', '0', '81', '170', '1', '华为图片2', '1450143292', '0', '1', '0', '25', '', '', '', '', '', '', '0', '0', '');
INSERT INTO `wu_list` VALUES ('1481', '0', '0', '82', '175', '1', 'fasdf', '1450148164', '0', '1', '0', '0', '', '', '', '', '', '', '0', '0', '');
INSERT INTO `wu_list` VALUES ('1482', '0', '0', '82', '175', '1', '测试留言', '1450153800', '0', '1', '0', '0', '', '', '', '', '', '', '0', '0', '');
INSERT INTO `wu_list` VALUES ('1483', '0', '0', '83', '176', '1', 'PHP开发工程师', '1450168112', '0', '1', '0', '25', '', '', '', '', '', '', '0', '0', '');
INSERT INTO `wu_list` VALUES ('1484', '0', '0', '83', '176', '1', '销售经理', '1450170104', '0', '1', '0', '17', '', '', '', '', '', '', '0', '0', '');
INSERT INTO `wu_list` VALUES ('1486', '0', '0', '85', '180', '1', '客服1', '1450173751', '0', '1', '0', '0', '', '', '', '', '', '', '0', '0', '');
INSERT INTO `wu_list` VALUES ('1487', '0', '0', '85', '180', '1', '客服2', '1450173764', '0', '1', '0', '0', '', '', '', '', '', '', '0', '0', '');
INSERT INTO `wu_list` VALUES ('1513', '0', '12', '78', '171', '1', 'Zirconium Tungsten Electrodes', '1497660090', '0', '1', '0', '2', '', '', '', '', '', '', '0', '0', '');
INSERT INTO `wu_list` VALUES ('1514', '0', '13', '78', '171', '1', 'Yttrium Tungsten Electrodes', '1497660366', '0', '1', '0', '2', '', '', '', '', '', '', '0', '0', '');
INSERT INTO `wu_list` VALUES ('1515', '0', '14', '78', '171', '1', 'Compound Tungsten Electrodes', '1497660464', '0', '1', '0', '0', '', '', '', '', '', '', '0', '0', '');
INSERT INTO `wu_list` VALUES ('1516', '0', '15', '78', '171', '1', 'Sharpened Tungsten Electrodes', '1497660574', '0', '1', '0', '2', '', '', '', '', '', '', '0', '0', '');
INSERT INTO `wu_list` VALUES ('1497', '0', '2', '75', '167', '1', 'In the event of a fire back before', '1450175243', '0', '1', '0', '9', '', '', '', '', '', '', '0', '0', '');
INSERT INTO `wu_list` VALUES ('1498', '0', '3', '75', '167', '1', 'Use the correct conductive mouth', '1450175243', '0', '1', '0', '11', '', '', '', '', '', '', '0', '0', '');
INSERT INTO `wu_list` VALUES ('1508', '0', '0', '82', '175', '1', '', '1497093081', '0', '0', '0', '0', '', '', '', '', '', '', '0', '0', '');

-- ----------------------------
-- Table structure for wu_list_73
-- ----------------------------
DROP TABLE IF EXISTS `wu_list_73`;
CREATE TABLE `wu_list_73` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '主题ID',
  `site_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '网站ID',
  `project_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '项目ID',
  `cate_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '主分类ID',
  `target` varchar(255) NOT NULL DEFAULT '_self' COMMENT '链接方式',
  `link` longtext NOT NULL COMMENT '链接',
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`,`project_id`,`cate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='导航菜单';

-- ----------------------------
-- Records of wu_list_73
-- ----------------------------
INSERT INTO `wu_list_73` VALUES ('1398', '1', '165', '0', '_self', 'a:2:{s:7:\"default\";s:9:\"index.php\";s:7:\"rewrite\";s:9:\"index.php\";}');
INSERT INTO `wu_list_73` VALUES ('1399', '1', '165', '0', '_self', 'a:2:{s:7:\"default\";s:21:\"index.php?id=about-us\";s:7:\"rewrite\";s:13:\"about-us.html\";}');
INSERT INTO `wu_list_73` VALUES ('1400', '1', '165', '0', '_self', 'a:2:{s:7:\"default\";s:20:\"index.php?id=article\";s:7:\"rewrite\";s:12:\"article.html\";}');
INSERT INTO `wu_list_73` VALUES ('1401', '1', '165', '0', '_self', 'a:2:{s:7:\"default\";s:20:\"index.php?id=product\";s:7:\"rewrite\";s:12:\"product.html\";}');
INSERT INTO `wu_list_73` VALUES ('1402', '1', '165', '0', '_self', 'a:2:{s:7:\"default\";s:18:\"index.php?id=files\";s:7:\"rewrite\";s:10:\"files.html\";}');
INSERT INTO `wu_list_73` VALUES ('1403', '1', '165', '0', '_self', 'a:2:{s:7:\"default\";s:18:\"index.php?id=photo\";s:7:\"rewrite\";s:10:\"photo.html\";}');
INSERT INTO `wu_list_73` VALUES ('1404', '1', '165', '0', '_self', 'a:2:{s:7:\"default\";s:19:\"index.php?id=talent\";s:7:\"rewrite\";s:11:\"talent.html\";}');
INSERT INTO `wu_list_73` VALUES ('1405', '1', '165', '0', '_self', 'a:2:{s:7:\"default\";s:20:\"index.php?id=message\";s:7:\"rewrite\";s:12:\"message.html\";}');
INSERT INTO `wu_list_73` VALUES ('1406', '1', '165', '0', '_self', 'a:2:{s:7:\"default\";s:20:\"index.php?id=contact\";s:7:\"rewrite\";s:12:\"contact.html\";}');
INSERT INTO `wu_list_73` VALUES ('1407', '1', '165', '0', '_self', 'a:2:{s:7:\"default\";s:21:\"index.php?id=about-us\";s:7:\"rewrite\";s:13:\"about-us.html\";}');
INSERT INTO `wu_list_73` VALUES ('1408', '1', '165', '0', '_self', 'a:2:{s:7:\"default\";s:20:\"index.php?id=culture\";s:7:\"rewrite\";s:12:\"culture.html\";}');
INSERT INTO `wu_list_73` VALUES ('1410', '1', '165', '0', '_self', 'a:2:{s:7:\"default\";s:24:\"index.php?id=development\";s:7:\"rewrite\";s:16:\"development.html\";}');

-- ----------------------------
-- Table structure for wu_list_74
-- ----------------------------
DROP TABLE IF EXISTS `wu_list_74`;
CREATE TABLE `wu_list_74` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '主题ID',
  `site_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '网站ID',
  `project_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '项目ID',
  `cate_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '主分类ID',
  `banner` varchar(255) NOT NULL DEFAULT '' COMMENT '通栏图片',
  `link` longtext NOT NULL COMMENT '链接',
  `target` varchar(255) NOT NULL DEFAULT '_self' COMMENT '链接方式',
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`,`project_id`,`cate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='图片播放器';

-- ----------------------------
-- Records of wu_list_74
-- ----------------------------
INSERT INTO `wu_list_74` VALUES ('1412', '1', '166', '0', '1155', 'a:2:{s:7:\"default\";s:9:\"index.php\";s:7:\"rewrite\";s:10:\"index.html\";}', '_self');
INSERT INTO `wu_list_74` VALUES ('1413', '1', '166', '0', '1154', 'a:2:{s:7:\"default\";s:9:\"index.php\";s:7:\"rewrite\";s:10:\"index.html\";}', '_self');

-- ----------------------------
-- Table structure for wu_list_75
-- ----------------------------
DROP TABLE IF EXISTS `wu_list_75`;
CREATE TABLE `wu_list_75` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '主题ID',
  `site_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '网站ID',
  `project_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '项目ID',
  `cate_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '主分类ID',
  `thumb` varchar(255) NOT NULL DEFAULT '' COMMENT '缩略图',
  `note` longtext NOT NULL COMMENT '摘要',
  `content` longtext NOT NULL COMMENT '内容',
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`,`project_id`,`cate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='新闻资讯';

-- ----------------------------
-- Records of wu_list_75
-- ----------------------------
INSERT INTO `wu_list_75` VALUES ('1497', '1', '167', '2', '1155', 'In the event of a fire back before', '<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; list-style: none; color: rgb(102, 102, 102); font-family: Arial; font-size: 14.4px; white-space: normal;\">Use the correct conductive mouth (inner diameter and length)</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; list-style: none; color: rgb(102, 102, 102); font-family: Arial; font-size: 14.4px; white-space: normal;\">The longer the conductive mouth, wire feeding effect is best, conductive mouth diameter should be 10% larger than the diameter of a wire.</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; list-style: none; color: rgb(102, 102, 102); font-family: Arial; font-size: 14.4px; white-space: normal;\">Maintain proper dust cover and conductive mouth relations</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; list-style: none; color: rgb(102, 102, 102); font-family: Arial; font-size: 14.4px; white-space: normal;\">Conductive mouth should be concave inside the dust cover, from the dust cover distance from about 1/16 of an inch (1.6 mm) to the largest 1/4 inch</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; list-style: none; color: rgb(102, 102, 102); font-family: Arial; font-size: 14.4px; white-space: normal;\">Use of the straight type nozzle welding torch or choose the goose neck</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; list-style: none; color: rgb(102, 102, 102); font-family: Arial; font-size: 14.4px; white-space: normal;\">Choose straight type welding torch need to wire feeding wheel pressure.</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; list-style: none; color: rgb(102, 102, 102); font-family: Arial; font-size: 14.4px; white-space: normal;\">Using nonmetal (teflon/nylon) input and output leads the mouth</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; list-style: none; color: rgb(102, 102, 102); font-family: Arial; font-size: 14.4px; white-space: normal;\">Using U transmission wheel</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; list-style: none; color: rgb(102, 102, 102); font-family: Arial; font-size: 14.4px; white-space: normal;\">Other types of wire feeding wheel would twist wire break the arc or scraping leading to produce more fire back. Sure U wheel has been to Angle instead of sharp edges.</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; list-style: none; color: rgb(102, 102, 102); font-family: Arial; font-size: 14.4px; white-space: normal;\">Will guide wheel is arranged on a straight line</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; list-style: none; color: rgb(102, 102, 102); font-family: Arial; font-size: 14.4px; white-space: normal;\">Improper arrangement godet wheel or pressure too high can cause distortion welding wire, wire feeding problems.</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; list-style: none; color: rgb(102, 102, 102); font-family: Arial; font-size: 14.4px; white-space: normal;\">Check whether there is water gas leaks</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; list-style: none; color: rgb(102, 102, 102); font-family: Arial; font-size: 14.4px; white-space: normal;\">Used in the teflon hose, don&#39;t put the pipe and the exchange use inch cushion gas hose.</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; list-style: none; color: rgb(102, 102, 102); font-family: Arial; font-size: 14.4px; white-space: normal;\">Use the appropriate power supply</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; list-style: none; color: rgb(102, 102, 102); font-family: Arial; font-size: 14.4px; white-space: normal;\">Welding equipment has many types, so want to choose the suitable for aluminum alloy welding machines and related accessories.</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; list-style: none; color: rgb(102, 102, 102); font-family: Arial; font-size: 14.4px; white-space: normal;\">Don&#39;t crimp or bending conductive mouth</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; list-style: none; color: rgb(102, 102, 102); font-family: Arial; font-size: 14.4px; white-space: normal;\">Use of conductive mouth can effectively reduce the conductive mouth straight accumulation and conductive mouth of arc.</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; list-style: none; color: rgb(102, 102, 102); font-family: Arial; font-size: 14.4px; white-space: normal;\">In the event of a fire back before, need to clear all wire feed tube and wire</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; list-style: none; color: rgb(102, 102, 102); font-family: Arial; font-size: 14.4px; white-space: normal;\">If it is found that wire to beat or spiral phenomenon, need to change a new conductive mouth, electric conductive mouth diameter or polishing</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; list-style: none; color: rgb(102, 102, 102); font-family: Arial; font-size: 14.4px; white-space: normal;\">Use from a circular blade, the inner diameter of the new conductive mouth even if used conductive mouth will finished.</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; list-style: none; color: rgb(102, 102, 102); font-family: Arial; font-size: 14.4px; white-space: normal;\">Appropriate protection and storage of welding wire</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; list-style: none; color: rgb(102, 102, 102); font-family: Arial; font-size: 14.4px; white-space: normal;\">Don&#39;t for the night, the wire on the wire feeding machine is best stored in a temperature and humidity control box, relative humidity must be less than 30%.</p><p><br/></p>');
INSERT INTO `wu_list_75` VALUES ('1498', '1', '167', '3', '1121', 'Use the correct conductive mouth', '<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; list-style: none; color: rgb(102, 102, 102); font-family: Arial; font-size: 14.4px; white-space: normal;\">Use the correct conductive mouth (inner diameter and length)</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; list-style: none; color: rgb(102, 102, 102); font-family: Arial; font-size: 14.4px; white-space: normal;\">The longer the conductive mouth, wire feeding effect is best, conductive mouth diameter should be 10% larger than the diameter of a wire.</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; list-style: none; color: rgb(102, 102, 102); font-family: Arial; font-size: 14.4px; white-space: normal;\">Maintain proper dust cover and conductive mouth relations</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; list-style: none; color: rgb(102, 102, 102); font-family: Arial; font-size: 14.4px; white-space: normal;\">Conductive mouth should be concave inside the dust cover, from the dust cover distance from about 1/16 of an inch (1.6 mm) to the largest 1/4 inch</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; list-style: none; color: rgb(102, 102, 102); font-family: Arial; font-size: 14.4px; white-space: normal;\">Use of the straight type nozzle welding torch or choose the goose neck</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; list-style: none; color: rgb(102, 102, 102); font-family: Arial; font-size: 14.4px; white-space: normal;\">Choose straight type welding torch need to wire feeding wheel pressure.</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; list-style: none; color: rgb(102, 102, 102); font-family: Arial; font-size: 14.4px; white-space: normal;\">Using nonmetal (teflon/nylon) input and output leads the mouth</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; list-style: none; color: rgb(102, 102, 102); font-family: Arial; font-size: 14.4px; white-space: normal;\">Using U transmission wheel</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; list-style: none; color: rgb(102, 102, 102); font-family: Arial; font-size: 14.4px; white-space: normal;\">Other types of wire feeding wheel would twist wire break the arc or scraping leading to produce more fire back. Sure U wheel has been to Angle instead of sharp edges.</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; list-style: none; color: rgb(102, 102, 102); font-family: Arial; font-size: 14.4px; white-space: normal;\">Will guide wheel is arranged on a straight line</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; list-style: none; color: rgb(102, 102, 102); font-family: Arial; font-size: 14.4px; white-space: normal;\">Improper arrangement godet wheel or pressure too high can cause distortion welding wire, wire feeding problems.</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; list-style: none; color: rgb(102, 102, 102); font-family: Arial; font-size: 14.4px; white-space: normal;\">Check whether there is water gas leaks</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; list-style: none; color: rgb(102, 102, 102); font-family: Arial; font-size: 14.4px; white-space: normal;\">Used in the teflon hose, don&#39;t put the pipe and the exchange use inch cushion gas hose.</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; list-style: none; color: rgb(102, 102, 102); font-family: Arial; font-size: 14.4px; white-space: normal;\">Use the appropriate power supply</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; list-style: none; color: rgb(102, 102, 102); font-family: Arial; font-size: 14.4px; white-space: normal;\">Welding equipment has many types, so want to choose the suitable for aluminum alloy welding machines and related accessories.</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; list-style: none; color: rgb(102, 102, 102); font-family: Arial; font-size: 14.4px; white-space: normal;\">Don&#39;t crimp or bending conductive mouth</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; list-style: none; color: rgb(102, 102, 102); font-family: Arial; font-size: 14.4px; white-space: normal;\">Use of conductive mouth can effectively reduce the conductive mouth straight accumulation and conductive mouth of arc.</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; list-style: none; color: rgb(102, 102, 102); font-family: Arial; font-size: 14.4px; white-space: normal;\">In the event of a fire back before, need to clear all wire feed tube and wire</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; list-style: none; color: rgb(102, 102, 102); font-family: Arial; font-size: 14.4px; white-space: normal;\">If it is found that wire to beat or spiral phenomenon, need to change a new conductive mouth, electric conductive mouth diameter or polishing</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; list-style: none; color: rgb(102, 102, 102); font-family: Arial; font-size: 14.4px; white-space: normal;\">Use from a circular blade, the inner diameter of the new conductive mouth even if used conductive mouth will finished.</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; list-style: none; color: rgb(102, 102, 102); font-family: Arial; font-size: 14.4px; white-space: normal;\">Appropriate protection and storage of welding wire</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; list-style: none; color: rgb(102, 102, 102); font-family: Arial; font-size: 14.4px; white-space: normal;\">Don&#39;t for the night, the wire on the wire feeding machine is best stored in a temperature and humidity control box, relative humidity must be less than 30%.</p><p><br/></p>');

-- ----------------------------
-- Table structure for wu_list_76
-- ----------------------------
DROP TABLE IF EXISTS `wu_list_76`;
CREATE TABLE `wu_list_76` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '主题ID',
  `site_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '网站ID',
  `project_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '项目ID',
  `cate_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '主分类ID',
  `thumb` varchar(255) NOT NULL DEFAULT '' COMMENT '缩略图',
  `pictures` varchar(255) NOT NULL DEFAULT '' COMMENT '图片',
  `content` longtext NOT NULL COMMENT '内容',
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`,`project_id`,`cate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='相册';

-- ----------------------------
-- Records of wu_list_76
-- ----------------------------
INSERT INTO `wu_list_76` VALUES ('1459', '1', '169', '5', '1125', '1125,1126', '<p>华为P7</p>');
INSERT INTO `wu_list_76` VALUES ('1460', '1', '169', '5', '1126', '1126,1125', '<p>华为P7-2</p>');
INSERT INTO `wu_list_76` VALUES ('1461', '1', '169', '6', '1120', '1119,1120', '<p>苹果手机-1</p>');
INSERT INTO `wu_list_76` VALUES ('1462', '1', '169', '6', '1122', '1121,1122', '<p>小米手机</p>');
INSERT INTO `wu_list_76` VALUES ('1463', '1', '169', '5', '1124', '1123,1124', '<p>魅族MX4-1</p>');
INSERT INTO `wu_list_76` VALUES ('1464', '1', '169', '5', '1123', '1123,1124', '<p>魅族MX4-2</p>');

-- ----------------------------
-- Table structure for wu_list_77
-- ----------------------------
DROP TABLE IF EXISTS `wu_list_77`;
CREATE TABLE `wu_list_77` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '主题ID',
  `site_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '网站ID',
  `project_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '项目ID',
  `cate_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '主分类ID',
  `content` longtext NOT NULL COMMENT '内容',
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`,`project_id`,`cate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='单页面';

-- ----------------------------
-- Records of wu_list_77
-- ----------------------------
INSERT INTO `wu_list_77` VALUES ('1456', '1', '168', '0', '<p><img src=\"res/201706/10/auto_1156.jpg\" alt=\"auto_1156.jpg\"/></p><p>The development of Hengnuo originates from a dream to establish a new standard fortungsten electrode industry of China and to upgrade the height of this whole industry. ZIBO MAIKE WELDING EQUIPMENT CO., LTD is the pioneer of this field and is challenging the new project ceaselessly with technological methods. During the process, the staff of Hengnuo cultivate the unique corporate culture with their great enthusiasm, attic faith and original technique. The corporate culture reflects the idea of development thatHengnuo must be responsible for the whole society.The base of R&amp;D and manufacturing factory of Hengnuo is located in ZIBO which is famous for its heavy industry. We supply goods, services and solving proposal to worldwideindustries which include navigation field, motor-dom, petroleum field, electric power field, machinery industry, light industry, textile industry, civil manufacturing field, and etc. Our tenet is combining the advanced technology and service of the world together with our local nature, industry and human environment. Hengnuo tries the best to meet the requirements of customers and create the actual value for them finally. Meanwhile, they bring the high quality service mode to the customers and guarantee the benefits for them.Hengnuo is well known and universally acknowledged by its creative corporate culture, perfect managerial system and its promise of protecting the environment. And our customers are from all over the world. With the principle of ”equality, opening up, participation, cooperation and mutual benefits,” Hengnuo is building firm relationship with our customers on the basis of understanding, sincerity and enthusiasm. The base of R&amp;D and manufacturing factory of Hengnuo is located in ZIBO which is famous for its heavy industry.  The corporation holds the concept of: specialty and concentration; technology and innovation, fully understand customers’ real requirements, and then create value for customers. We adopt international advanced technology and equipment, follow and carry out the international quality production standards. Committing ourselves into developing and manufacturing the product series of Thorium-Tungsten, Cerium-Tungsten Electrodes, Lanthanum-Tungsten Electrodes, Zirconium-Tungsten Electrodes, Pure-Tungsten Electrodes, Yttrium-Tungsten Electrodes and Combined-Tungsten Electrodes and Thorium Tungsten Wires.</p>');
INSERT INTO `wu_list_77` VALUES ('1457', '1', '168', '0', '<p><span style=\";font-family:宋体;font-size:14px\">The standardized process of our enterprise regulates our behaviors, which makes our product quality unified and stable. </span><span style=\";font-family:Calibri;font-size:14px\">Meanwhile</span><span style=\";font-family:宋体;font-size:14px\">,</span><span style=\";font-family:Calibri;font-size:14px\"> this does not limit our creativity</span><span style=\";font-family:宋体;font-size:14px\">.</span><span style=\";font-family:Calibri;font-size:14px\"> </span><span style=\";font-family:宋体;font-size:14px\">W</span><span style=\";font-family:Calibri;font-size:14px\">e challenge the most </span><span style=\";font-family:Calibri;font-size:14px\">advanced science and technology by broad-mind and opened attitude.</span><span style=\";font-family:宋体;font-size:14px\">, a</span><span style=\";font-family:Calibri;font-size:14px\">nd</span><span style=\";font-family:宋体;font-size:14px\"> </span><span style=\";font-family:Calibri;font-size:14px\">develop original solutions for customers</span><span style=\";font-family:宋体;font-size:14px\"> by this technology</span><span style=\";font-family:Calibri;font-size:14px\">. The high flexibility and strong strength </span><span style=\";font-family:宋体;font-size:14px\">ensure</span><span style=\";font-family:Calibri;font-size:14px\"> us </span><span style=\";font-family:宋体;font-size:14px\">to </span><span style=\";font-family:Calibri;font-size:14px\">gain the leadership in the market by the innovative products, and also help us supply </span><span style=\";font-family:宋体;font-size:14px\">the </span><span style=\";font-family:Calibri;font-size:14px\">best products and service to customers.</span><span style=\";font-family:Calibri;font-size:14px\">The basic standards of Hengnuo’s products and services are the excellent </span><span style=\";font-family:宋体;font-size:14px\">technique</span><span style=\";font-family:Calibri;font-size:14px\"> and high quality. We </span><span style=\";font-family:宋体;font-size:14px\">create excellence </span><span style=\";font-family:Calibri;font-size:14px\">and prepare to take new challenges with positive</span><span style=\";font-family:宋体;font-size:14px\"> attitude. </span><span style=\";font-family:Calibri;font-size:14px\">Hengnuo</span><span style=\";font-family:宋体;font-size:14px\"> continually enrich ourselves and enhance the work level through mutual cooperation &amp; exchanges with different fields of professionals</span><span style=\";font-family:Calibri;font-size:14px\">. We insist to seek</span><span style=\";font-family:宋体;font-size:14px\"> win-win oriented </span><span style=\";font-family:Calibri;font-size:14px\">development</span><span style=\";font-family:宋体;font-size:14px\"> approach</span><span style=\";font-family:Calibri;font-size:14px\"> in the process of all activities and </span><span style=\";font-family:宋体;font-size:14px\">improve</span><span style=\";font-family:Calibri;font-size:14px\"> our efficiency.</span><span style=\";font-family:Calibri;font-size:14px\">From the relationship </span><span style=\";font-family:宋体;font-size:14px\">between</span><span style=\";font-family:Calibri;font-size:14px\"> the customers and the suppliers to business policies </span><span style=\";font-family:宋体;font-size:14px\">in company</span><span style=\";font-family:Calibri;font-size:14px\">, Hengnuo adopted various measures to keep our promises. Hengnuo is building its strong corporate culture based on sincerity and norm by</span><span style=\";font-family:宋体;font-size:14px\"> dedicatedly implementing </span><span style=\";font-family:Calibri;font-size:14px\">its management</span><span style=\";font-family:宋体;font-size:14px\"> concepts</span><span style=\";font-family:Calibri;font-size:14px\">.</span><span style=\";font-family:宋体;font-size:14px\"> </span><span style=\";font-family:Calibri;font-size:14px\">At any time, </span><span style=\";font-family:宋体;font-size:14px\">we </span><span style=\";font-family:Calibri;font-size:14px\">keep</span><span style=\";font-family:宋体;font-size:14px\"> </span><span style=\";font-family:Calibri;font-size:14px\">our responsibility to the personal, society and environment both within and outside the company</span><span style=\";font-family:宋体;font-size:14px\"> in mind</span><span style=\";font-family:Calibri;font-size:14px\">. Respect, enthusiasm and keep</span><span style=\";font-family:宋体;font-size:14px\">ing</span><span style=\";font-family:Calibri;font-size:14px\"> commitment are the</span><span style=\";font-family:宋体;font-size:14px\"> standards</span><span style=\";font-family:Calibri;font-size:14px\"> of all of our </span><span style=\";font-family:宋体;font-size:14px\">behaviors.</span><span style=\";font-family:Calibri;font-size:14px\"> We </span><span style=\";font-family:宋体;font-size:14px\">deeply understand </span><span style=\";font-family:Calibri;font-size:14px\">customers’ expectation and requirements </span><span style=\";font-family:宋体;font-size:14px\">on</span><span style=\";font-family:Calibri;font-size:14px\"> the reliability of supply, In order to provide the best service, we set up the customers’ file management system. There will be the standard management system of services </span><span style=\";font-family:宋体;font-size:14px\">upon </span><span style=\";font-family:Calibri;font-size:14px\">rece</span><span style=\";font-family:宋体;font-size:14px\">i</span><span style=\";font-family:Calibri;font-size:14px\">pt the order, </span><span style=\";font-family:宋体;font-size:14px\">easy to</span><span style=\";font-family:Calibri;font-size:14px\"> response to customers and initiative communication with customers.</span><span style=\";font-family:Calibri;font-size:14px\">The quality of st</span><span style=\";font-family:宋体;font-size:14px\">aff is the most important in all enterprise elements. T</span><span style=\";font-family:Calibri;font-size:14px\">herefore, we master the three </span><span style=\";font-family:宋体;font-size:14px\">aspects</span><span style=\";font-family:Calibri;font-size:14px\">: selection, training, discipline.</span><span style=\";font-family:Calibri;font-size:14px\">In Hengnuo, </span><span style=\";font-family:宋体;font-size:14px\">only</span><span style=\";font-family:Calibri;font-size:14px\"> lofty idea</span><span style=\";font-family:宋体;font-size:14px\">l</span><span style=\";font-family:Calibri;font-size:14px\">s </span><span style=\";font-family:宋体;font-size:14px\">are</span><span style=\";font-family:Calibri;font-size:14px\"> not enough, imagination must be constrained by moral</span><span style=\";font-family:宋体;font-size:14px\">ity</span><span style=\";font-family:Calibri;font-size:14px\">, principle of faith, our company’s high standards attracts a group of </span><span style=\";font-family:宋体;font-size:14px\">outstanding</span><span style=\";font-family:Calibri;font-size:14px\"> young people, includ</span><span style=\";font-family:宋体;font-size:14px\">ing</span><span style=\";font-family:Calibri;font-size:14px\"> 3 senior engineers, more than 50 persons above bachelor degree, </span><span style=\";font-family:宋体;font-size:14px\">ev</span><span style=\";font-family:Calibri;font-size:14px\">erybody</span><span style=\";font-family:宋体;font-size:14px\"> </span><span style=\";font-family:Calibri;font-size:14px\">continuously pursue</span><span style=\";font-family:宋体;font-size:14px\">s</span><span style=\";font-family:Calibri;font-size:14px\"> their own progresses</span><span style=\";font-family:宋体;font-size:14px\"> </span><span style=\";font-family:Calibri;font-size:14px\">each day for the c</span><span style=\";font-family:宋体;font-size:14px\">on</span><span style=\";font-family:Calibri;font-size:14px\">struction </span><span style=\";font-family:宋体;font-size:14px\">o</span><span style=\";font-family:Calibri;font-size:14px\">f the excellent enterprise even for a better world.</span><span style=\";font-family:宋体;font-size:14px\"> </span></p><p><br/></p>');
INSERT INTO `wu_list_77` VALUES ('1458', '1', '168', '0', '<table interlaced=\"disabled\" width=\"100%\"><tbody><tr class=\"firstRow\"><td colspan=\"1\" rowspan=\"1\" align=\"right\" valign=\"middle\" style=\"margin: 0px;\"><span style=\"color: rgb(153, 0, 0); font-weight: bold;\">2015年6月</span></td><td colspan=\"1\" rowspan=\"1\" align=\"left\" valign=\"middle\" style=\"margin: 0px;\">PHPOK4.3发布</td></tr><tr><td colspan=\"1\" rowspan=\"1\" align=\"right\" valign=\"middle\" style=\"margin: 0px;\"><span style=\"color: rgb(153, 0, 0); font-weight: bold;\">2015年3月</span></td><td colspan=\"1\" rowspan=\"1\" align=\"left\" valign=\"middle\" style=\"margin: 0px;\">PHPOK手册新鲜出炉</td></tr><tr><td colspan=\"1\" rowspan=\"1\" align=\"right\" valign=\"middle\" style=\"margin: 0px;\"><span style=\"color: rgb(153, 0, 0); font-weight: bold;\">2014年10月</span></td><td colspan=\"1\" rowspan=\"1\" style=\"margin: 0px;\">PHPOK4.2发布并成立公司<strong>深圳市锟铻科技有限公司</strong></td></tr><tr><td colspan=\"1\" rowspan=\"1\" align=\"right\" valign=\"middle\" style=\"margin: 0px;\"><span style=\"color: rgb(153, 0, 0); font-weight: bold;\">2014年8月</span></td><td colspan=\"1\" rowspan=\"1\" style=\"margin: 0px;\">PHPOK4.1发布</td></tr><tr><td colspan=\"1\" rowspan=\"1\" align=\"right\" valign=\"middle\" style=\"margin: 0px;\"><span style=\"color: rgb(153, 0, 0); font-weight: bold;\">2014年1月</span></td><td colspan=\"1\" rowspan=\"1\" style=\"margin: 0px;\">PHPOK4.0发布<br/></td></tr><tr><td align=\"right\" valign=\"middle\" style=\"margin: 0px;\"><span style=\"color: rgb(153, 0, 0); font-weight: bold;\">2011年12月</span></td><td style=\"margin: 0px;\">PHPOK3.4版发布（后台更换为桌面式）</td></tr><tr><td align=\"right\" valign=\"middle\" style=\"margin: 0px;\"><span style=\"color: rgb(153, 0, 0); font-weight: bold;\">2011年9月</span></td><td style=\"margin: 0px;\">phpok3.3完整版发布</td></tr><tr><td align=\"right\" valign=\"middle\" style=\"margin: 0px;\"><span style=\"color: rgb(153, 0, 0); font-weight: bold;\">2010年8月</span></td><td style=\"margin: 0px;\">PHPOK3.0完整版发布</td></tr><tr><td align=\"right\" valign=\"middle\" style=\"margin: 0px;\"><span style=\"color: rgb(153, 0, 0); font-weight: bold;\">2008年9月</span></td><td style=\"margin: 0px;\">PHPOK3.0精简版发布</td></tr><tr><td align=\"right\" valign=\"middle\" style=\"margin: 0px;\"><span style=\"color: rgb(153, 0, 0); font-weight: bold;\">2008年5月</span></td><td style=\"margin: 0px;\">PHPOK2.2发布（稳定版本）</td></tr><tr><td align=\"right\" valign=\"middle\" style=\"margin: 0px;\"><span style=\"color: rgb(153, 0, 0); font-weight: bold;\">2008年3月</span></td><td style=\"margin: 0px;\">PHPOK2.0发布</td></tr><tr><td align=\"right\" valign=\"middle\" style=\"margin: 0px;\"><span style=\"color: rgb(153, 0, 0); font-weight: bold;\">2007年5月</span></td><td style=\"margin: 0px;\">qgweb5.2发布，同时更名为：PHPOK1.0.0版！</td></tr><tr><td align=\"right\" valign=\"middle\" style=\"margin: 0px;\"><span style=\"color: rgb(153, 0, 0); font-weight: bold;\">2007年1月</span></td><td style=\"margin: 0px;\">qgweb5.0发布（首次实现多语言多风格功能）</td></tr><tr><td align=\"right\" valign=\"middle\" style=\"margin: 0px;\"><span style=\"color: rgb(153, 0, 0); font-weight: bold;\">2006年10月</span></td><td style=\"margin: 0px;\">qgweb4.2发布（GBK）</td></tr><tr><td align=\"right\" valign=\"middle\" style=\"margin: 0px;\"><span style=\"color: rgb(153, 0, 0); font-weight: bold;\">2006年8月</span></td><td style=\"margin: 0px;\">qgweb4.1发布（UTF）</td></tr><tr><td align=\"right\" valign=\"middle\" style=\"margin: 0px;\"><span style=\"color: rgb(153, 0, 0); font-weight: bold;\">2006年8月</span></td><td style=\"margin: 0px;\">团队决定开发进销存管理系统</td></tr><tr><td align=\"right\" valign=\"middle\" style=\"margin: 0px;\"><span style=\"color: rgb(153, 0, 0); font-weight: bold;\">2006年6月</span></td><td style=\"margin: 0px;\">qgweb4.0发布</td></tr><tr><td align=\"right\" valign=\"middle\" style=\"margin: 0px;\"><span style=\"color: rgb(153, 0, 0); font-weight: bold;\">2005年11月</span></td><td style=\"margin: 0px;\">qgWeb3.0发布（分企业版及个人版）</td></tr><tr><td align=\"right\" valign=\"middle\" style=\"margin: 0px;\"><span style=\"color: rgb(153, 0, 0); font-weight: bold;\">2005年8月</span></td><td style=\"margin: 0px;\">工作室论坛开通</td></tr><tr><td align=\"right\" valign=\"middle\" style=\"margin: 0px;\"><span style=\"color: rgb(153, 0, 0); font-weight: bold;\">2005年7月</span></td><td style=\"margin: 0px;\">qgWeb1.0发布</td></tr><tr><td align=\"right\" valign=\"middle\" style=\"margin: 0px;\"><span style=\"color: rgb(153, 0, 0); font-weight: bold;\">2005年4月</span></td><td style=\"margin: 0px;\">qgWeb0.54版发布</td></tr></tbody></table><p><br/></p>');

-- ----------------------------
-- Table structure for wu_list_78
-- ----------------------------
DROP TABLE IF EXISTS `wu_list_78`;
CREATE TABLE `wu_list_78` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '主题ID',
  `site_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '网站ID',
  `project_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '项目ID',
  `cate_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '主分类ID',
  `thumb` varchar(255) NOT NULL DEFAULT '' COMMENT '缩略图',
  `content` longtext NOT NULL COMMENT '内容',
  `attrs` longtext NOT NULL COMMENT '产品属性',
  `price` varchar(255) NOT NULL DEFAULT '' COMMENT '价格',
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`,`project_id`,`cate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='产品展示';

-- ----------------------------
-- Records of wu_list_78
-- ----------------------------
INSERT INTO `wu_list_78` VALUES ('1510', '1', '171', '9', '1174', '<p><img src=\"res/201706/10/auto_1176.jpg\" title=\"wc20-1\" style=\"white-space: normal;\"/></p><p><img src=\"res/201706/10/auto_1175.jpg\" style=\"\" title=\"wc 拷贝\"/></p><p><br/></p><p><img src=\"res/201706/10/auto_1177.jpg\" style=\"\" title=\"wc20\"/></p><p><br/></p>', 'a:2:{s:5:\"title\";s:0:\"\";s:7:\"content\";s:0:\"\";}', '');
INSERT INTO `wu_list_78` VALUES ('1513', '1', '171', '12', '1194', '<p><img src=\"res/201706/17/auto_1194.jpg\" alt=\"auto_1194.jpg\"/></p><p><img src=\"res/201706/17/auto_1195.jpg\" style=\"\" title=\"wzr 拷贝\"/></p><p><img src=\"res/201706/17/auto_1196.jpg\" style=\"\" title=\"wz8\"/></p><p><br/></p>', 'a:2:{s:5:\"title\";s:0:\"\";s:7:\"content\";s:0:\"\";}', '');
INSERT INTO `wu_list_78` VALUES ('1514', '1', '171', '13', '', '<p><img src=\"res/201706/17/auto_1197.jpg\" alt=\"auto_1197.jpg\"/></p>', 'a:2:{s:5:\"title\";s:0:\"\";s:7:\"content\";s:0:\"\";}', '');
INSERT INTO `wu_list_78` VALUES ('1515', '1', '171', '14', '1200', '<p><img src=\"res/201706/17/auto_1200.jpg\" style=\"\"/></p><p><br/></p><p><img src=\"res/201706/17/auto_1195.jpg\" style=\"\"/></p><p><img src=\"res/201706/17/auto_1199.jpg\" style=\"white-space: normal;\"/></p><p><br/></p>', 'a:2:{s:5:\"title\";s:0:\"\";s:7:\"content\";s:0:\"\";}', '');
INSERT INTO `wu_list_78` VALUES ('1516', '1', '171', '15', '', '<p><img src=\"res/201706/17/auto_1202.jpg\" style=\"\"/></p><p><img src=\"res/201706/17/auto_1201.jpg\" style=\"\"/></p><p><br/></p>', 'a:2:{s:5:\"title\";s:0:\"\";s:7:\"content\";s:0:\"\";}', '');
INSERT INTO `wu_list_78` VALUES ('1511', '1', '171', '10', '1180', '<p><img src=\"res/201706/10/auto_1182.jpg\" title=\"wl20\" style=\"white-space: normal;\"/></p><p><img src=\"res/201706/10/auto_1181.jpg\" style=\"\" title=\"wl 拷贝\"/></p><p><br/></p><p><br/></p>', 'a:2:{s:5:\"title\";s:0:\"\";s:7:\"content\";s:0:\"\";}', '');
INSERT INTO `wu_list_78` VALUES ('1512', '1', '171', '11', '1187', '<p><br/></p><p><img src=\"res/201706/10/auto_1193.jpg\" title=\"hihfh\" style=\"white-space: normal;\"/></p><p><br/></p><p><img src=\"res/201706/10/auto_1191.jpg\" style=\"\" title=\"fjjfdksjf\"/></p><p><img src=\"res/201706/10/auto_1192.jpg\" style=\"\" title=\"ggdga\"/></p><p><br/></p><p><br/></p>', 'a:2:{s:5:\"title\";s:0:\"\";s:7:\"content\";s:0:\"\";}', '');
INSERT INTO `wu_list_78` VALUES ('1509', '1', '171', '8', '1166', '<p><img src=\"res/201706/10/auto_1171.jpg\" title=\"wth 附图\" style=\"white-space: normal;\"/></p><p><img src=\"res/201706/10/auto_1168.jpg\" style=\"\" title=\"3 拷贝\"/></p><p><img src=\"res/201706/10/auto_1169.jpg\" style=\"\" title=\"wt20\"/></p><p><img src=\"res/201706/10/auto_1170.jpg\" style=\"\" title=\"tb20wqbdxxxxxbbxpxxxxxxxxxx-825613311 拷贝\"/></p><p><br/></p><p><br/></p>', 'a:2:{s:5:\"title\";s:0:\"\";s:7:\"content\";s:0:\"\";}', '');

-- ----------------------------
-- Table structure for wu_list_79
-- ----------------------------
DROP TABLE IF EXISTS `wu_list_79`;
CREATE TABLE `wu_list_79` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '主题ID',
  `site_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '网站ID',
  `project_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '项目ID',
  `cate_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '主分类ID',
  `linkurl` varchar(255) NOT NULL DEFAULT '' COMMENT '自定义链接',
  `target` varchar(255) NOT NULL DEFAULT '_self' COMMENT '链接方式',
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`,`project_id`,`cate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='友情链接';

-- ----------------------------
-- Records of wu_list_79
-- ----------------------------
INSERT INTO `wu_list_79` VALUES ('1467', '1', '172', '0', 'http://www.phpok.com', '_blank');
INSERT INTO `wu_list_79` VALUES ('1468', '1', '172', '0', 'http://www.chinaz.com', '_blank');
INSERT INTO `wu_list_79` VALUES ('1469', '1', '172', '0', 'http://www.7139.com', '_blank');
INSERT INTO `wu_list_79` VALUES ('1470', '1', '172', '0', 'http://www.sz-qibang.com', '_blank');

-- ----------------------------
-- Table structure for wu_list_80
-- ----------------------------
DROP TABLE IF EXISTS `wu_list_80`;
CREATE TABLE `wu_list_80` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '主题ID',
  `site_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '网站ID',
  `project_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '项目ID',
  `cate_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '主分类ID',
  `fullname` varchar(255) NOT NULL DEFAULT '' COMMENT '姓名',
  `mobile` varchar(255) NOT NULL DEFAULT '' COMMENT '手机号',
  `note` longtext NOT NULL COMMENT '咨询内容',
  `furl` varchar(255) NOT NULL DEFAULT '' COMMENT '产品网址',
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`,`project_id`,`cate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='订购咨询';

-- ----------------------------
-- Records of wu_list_80
-- ----------------------------

-- ----------------------------
-- Table structure for wu_list_81
-- ----------------------------
DROP TABLE IF EXISTS `wu_list_81`;
CREATE TABLE `wu_list_81` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '主题ID',
  `site_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '网站ID',
  `project_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '项目ID',
  `cate_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '主分类ID',
  `dfile` varchar(255) NOT NULL DEFAULT '' COMMENT '单个文件',
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`,`project_id`,`cate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文件库';

-- ----------------------------
-- Records of wu_list_81
-- ----------------------------
INSERT INTO `wu_list_81` VALUES ('1476', '1', '170', '0', '1124');
INSERT INTO `wu_list_81` VALUES ('1477', '1', '170', '0', '1123');
INSERT INTO `wu_list_81` VALUES ('1478', '1', '170', '0', '1125');
INSERT INTO `wu_list_81` VALUES ('1479', '1', '170', '0', '1126');

-- ----------------------------
-- Table structure for wu_list_82
-- ----------------------------
DROP TABLE IF EXISTS `wu_list_82`;
CREATE TABLE `wu_list_82` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '主题ID',
  `site_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '网站ID',
  `project_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '项目ID',
  `cate_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '主分类ID',
  `fullname` varchar(255) NOT NULL DEFAULT '' COMMENT 'Name',
  `mobile` varchar(255) NOT NULL DEFAULT '' COMMENT 'Tel',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT 'E-mail',
  `content` longtext NOT NULL COMMENT 'Content',
  `adm_reply` longtext NOT NULL COMMENT '管理员回复',
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`,`project_id`,`cate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='留言';

-- ----------------------------
-- Records of wu_list_82
-- ----------------------------
INSERT INTO `wu_list_82` VALUES ('1481', '1', '175', '0', 'faf', 'fas', 'dfas', 'fasdf', '<p>谢谢支持</p>');
INSERT INTO `wu_list_82` VALUES ('1482', '1', '175', '0', '测试留言', '测试留言', '测试留言', '测试留言测试留言测试留言', '');
INSERT INTO `wu_list_82` VALUES ('1507', '1', '175', '0', 'gfds', 'gfds', 'gfsdg', 'gfsdgdsg', '<p>wosdhfkdsj</p>');
INSERT INTO `wu_list_82` VALUES ('1508', '1', '175', '0', '', '', '', '', '');

-- ----------------------------
-- Table structure for wu_list_83
-- ----------------------------
DROP TABLE IF EXISTS `wu_list_83`;
CREATE TABLE `wu_list_83` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '主题ID',
  `site_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '网站ID',
  `project_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '项目ID',
  `cate_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '主分类ID',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '工作地点',
  `persons` varchar(255) NOT NULL DEFAULT '' COMMENT '招聘人数',
  `years` varchar(255) NOT NULL DEFAULT '' COMMENT '工作年限',
  `schools` varchar(255) NOT NULL DEFAULT '' COMMENT '学历要求',
  `content` longtext NOT NULL COMMENT '工作描述',
  `price` varchar(255) NOT NULL DEFAULT '面议' COMMENT '薪水范围',
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`,`project_id`,`cate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='人才招聘';

-- ----------------------------
-- Records of wu_list_83
-- ----------------------------
INSERT INTO `wu_list_83` VALUES ('1483', '1', '176', '0', '深圳', '3人', '1年以上', '本科', '<p>任职要求：</p><ol class=\" list-paddingleft-2\" style=\"list-style-type: decimal;\"><li><p>大专及以上学历，具有1年以上互联网后端开发工作经历；</p></li><li><p>熟悉php语言及mysql数据库管理，能熟练运用linux做后台管理；</p></li><li><p>精通数据结构及算法，对于大数据有一定的认识；</p></li><li><p>熟悉基本的计算机网络概念，熟悉HTTP协议，了解TCP/IP的基本工作原理，熟悉各种Web标准规范；</p></li><li><p>有良好的团队合作能力，技术视野开阔，有敏捷开发团队实践经验者优先；</p></li><li><p>如果有开源社区贡献和个人技术博客者，请在简历中附上可作为加分项。</p></li></ol><p><br/>岗位职责：</p><ol class=\" list-paddingleft-2\" style=\"list-style-type: decimal;\"><li><p>负责后台代码编写，对接APP及web前端；</p></li><li><p>对数据处理及数据库查询进行优化；</p></li><li><p>处理大规模数据运算；</p></li><li><p>优化系统结构，保证系统运行稳定性。</p></li></ol><p><br/></p>', '7500-1万元');
INSERT INTO `wu_list_83` VALUES ('1484', '1', '176', '0', '深圳', '若干', '3年以上', '大专', '<p>岗位职责 ： <br/>1、负责公司《正方数字化校园信息平台》系列产品的销售工作，完成公司分配的销售指标 <br/>2、负责当地市场的开拓，开发潜在客户，维护客户关系，与部门协同完成销售目标 <br/>3、负责按时向部门经理提交书面的工作总结，接受部门经理对业务的指导 <br/>4、负责完成公司交办的其它事宜 <br/>任职资格： <br/>1、大专以上学历，市场营销、计算机、软件等相关专业； <br/>2、三年以上企业应用软件销售或相关工作经验，熟悉软件行业销售流程；对市场营销工作有较深刻认知； <br/>3、能很快熟悉本项目产品信息、客户信息、销售模式； <br/>4、人品诚实稳重、善于沟通、能吃苦；对企业有很强的归宿感，无限的忠诚； <br/>5、高度的工作热情，积极主动，良好的团队合作精神；能在较大的压力下保持良好的工作状态； <br/>6、很强的观察力和应变能力； <br/>7、有良好的市场判断能力和开拓能力，有极强的组织管理能力； <br/>8、有教育行业工作经验优先考虑。</p>', '面议');

-- ----------------------------
-- Table structure for wu_list_84
-- ----------------------------
DROP TABLE IF EXISTS `wu_list_84`;
CREATE TABLE `wu_list_84` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '主题ID',
  `site_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '网站ID',
  `project_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '项目ID',
  `cate_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '主分类ID',
  `fullname` varchar(255) NOT NULL DEFAULT '' COMMENT '姓名',
  `mobile` varchar(255) NOT NULL DEFAULT '' COMMENT '手机号',
  `dfile` varchar(255) NOT NULL DEFAULT '' COMMENT '简历',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`,`project_id`,`cate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='在线岗位应聘';

-- ----------------------------
-- Records of wu_list_84
-- ----------------------------

-- ----------------------------
-- Table structure for wu_list_85
-- ----------------------------
DROP TABLE IF EXISTS `wu_list_85`;
CREATE TABLE `wu_list_85` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '主题ID',
  `site_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '网站ID',
  `project_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '项目ID',
  `cate_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '主分类ID',
  `qq` varchar(255) NOT NULL DEFAULT '' COMMENT 'QQ号',
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`,`project_id`,`cate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='在线客服';

-- ----------------------------
-- Records of wu_list_85
-- ----------------------------
INSERT INTO `wu_list_85` VALUES ('1486', '1', '180', '0', '40782502');
INSERT INTO `wu_list_85` VALUES ('1487', '1', '180', '0', '150467466');

-- ----------------------------
-- Table structure for wu_list_cate
-- ----------------------------
DROP TABLE IF EXISTS `wu_list_cate`;
CREATE TABLE `wu_list_cate` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '主题ID',
  `cate_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类ID',
  PRIMARY KEY (`id`,`cate_id`),
  KEY `id` (`id`),
  KEY `cate_id` (`cate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='主题绑定的分类';

-- ----------------------------
-- Records of wu_list_cate
-- ----------------------------
INSERT INTO `wu_list_cate` VALUES ('1392', '215');
INSERT INTO `wu_list_cate` VALUES ('1392', '216');
INSERT INTO `wu_list_cate` VALUES ('1393', '207');
INSERT INTO `wu_list_cate` VALUES ('1394', '207');
INSERT INTO `wu_list_cate` VALUES ('1395', '68');
INSERT INTO `wu_list_cate` VALUES ('1415', '3');
INSERT INTO `wu_list_cate` VALUES ('1417', '3');
INSERT INTO `wu_list_cate` VALUES ('1459', '5');
INSERT INTO `wu_list_cate` VALUES ('1460', '5');
INSERT INTO `wu_list_cate` VALUES ('1461', '6');
INSERT INTO `wu_list_cate` VALUES ('1462', '6');
INSERT INTO `wu_list_cate` VALUES ('1463', '5');
INSERT INTO `wu_list_cate` VALUES ('1464', '5');
INSERT INTO `wu_list_cate` VALUES ('1497', '2');
INSERT INTO `wu_list_cate` VALUES ('1498', '3');
INSERT INTO `wu_list_cate` VALUES ('1509', '8');
INSERT INTO `wu_list_cate` VALUES ('1510', '9');
INSERT INTO `wu_list_cate` VALUES ('1511', '10');
INSERT INTO `wu_list_cate` VALUES ('1512', '11');
INSERT INTO `wu_list_cate` VALUES ('1513', '12');
INSERT INTO `wu_list_cate` VALUES ('1514', '13');
INSERT INTO `wu_list_cate` VALUES ('1515', '14');
INSERT INTO `wu_list_cate` VALUES ('1516', '15');

-- ----------------------------
-- Table structure for wu_module
-- ----------------------------
DROP TABLE IF EXISTS `wu_module`;
CREATE TABLE `wu_module` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID号',
  `title` varchar(255) NOT NULL COMMENT '模块名称',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0不使用1使用',
  `taxis` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '模块排序',
  `note` varchar(255) NOT NULL COMMENT '模块说明',
  `layout` text NOT NULL COMMENT '布局',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=86 DEFAULT CHARSET=utf8 COMMENT='模块管理，每创建一个模块自动创建一个表';

-- ----------------------------
-- Records of wu_module
-- ----------------------------
INSERT INTO `wu_module` VALUES ('73', '导航', '1', '10', '', 'link,target');
INSERT INTO `wu_module` VALUES ('74', '图片播放器', '1', '20', '', 'banner,link,target');
INSERT INTO `wu_module` VALUES ('75', '资讯', '1', '30', '', 'hits,dateline,thumb');
INSERT INTO `wu_module` VALUES ('76', '相册', '1', '40', '', 'hits,dateline,thumb');
INSERT INTO `wu_module` VALUES ('77', '单页面', '1', '50', '', 'hits,dateline');
INSERT INTO `wu_module` VALUES ('78', '产品展示', '1', '60', '', 'hits,dateline,thumb,price');
INSERT INTO `wu_module` VALUES ('79', '友情链接', '1', '70', '', 'hits,linkurl,target');
INSERT INTO `wu_module` VALUES ('80', '订购咨询', '1', '80', '', 'dateline,fullname,mobile,furl');
INSERT INTO `wu_module` VALUES ('81', '文件库', '1', '90', '', 'hits,dateline,dfile');
INSERT INTO `wu_module` VALUES ('82', '留言', '1', '100', '', 'dateline,fullname,mobile,email,pictures');
INSERT INTO `wu_module` VALUES ('83', '人才招聘', '1', '110', '', 'hits,dateline,address,persons,years,schools,price');
INSERT INTO `wu_module` VALUES ('84', '在线岗位应聘', '1', '120', '', 'dateline,fullname,mobile,email,dfile');
INSERT INTO `wu_module` VALUES ('85', '在线客服', '1', '130', '', 'qq');

-- ----------------------------
-- Table structure for wu_module_fields
-- ----------------------------
DROP TABLE IF EXISTS `wu_module_fields`;
CREATE TABLE `wu_module_fields` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '字段ID，自增',
  `module_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '模块ID',
  `title` varchar(255) NOT NULL COMMENT '字段名称',
  `identifier` varchar(50) NOT NULL COMMENT '字段标识串',
  `field_type` varchar(255) NOT NULL DEFAULT '200' COMMENT '字段存储类型',
  `note` varchar(255) NOT NULL COMMENT '字段内容备注',
  `form_type` varchar(100) NOT NULL COMMENT '表单类型',
  `form_style` varchar(255) NOT NULL COMMENT '表单CSS',
  `format` varchar(100) NOT NULL COMMENT '格式化方式',
  `content` varchar(255) NOT NULL COMMENT '默认值',
  `taxis` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '排序',
  `ext` text NOT NULL COMMENT '扩展内容',
  `is_front` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0前端不可用1前端可用',
  PRIMARY KEY (`id`),
  KEY `module_id` (`module_id`)
) ENGINE=MyISAM AUTO_INCREMENT=314 DEFAULT CHARSET=utf8 COMMENT='字段管理器';

-- ----------------------------
-- Records of wu_module_fields
-- ----------------------------
INSERT INTO `wu_module_fields` VALUES ('274', '73', '链接', 'link', 'longtext', '手动指定外部链接时，伪静态链接可以留空', 'url', '', 'safe', '', '10', 'a:1:{s:5:\"width\";s:3:\"500\";}', '0');
INSERT INTO `wu_module_fields` VALUES ('275', '74', '通栏图片', 'banner', 'varchar', '图片限宽高为：980x300', 'upload', '', 'safe', '', '10', 'a:3:{s:7:\"cate_id\";s:1:\"1\";s:11:\"is_multiple\";s:1:\"0\";s:11:\"upload_auto\";s:1:\"1\";}', '0');
INSERT INTO `wu_module_fields` VALUES ('273', '73', '链接方式', 'target', 'varchar', '设置是否在新窗口打开', 'radio', '', 'safe', '_self', '20', 'a:1:{s:11:\"option_list\";s:5:\"opt:6\";}', '0');
INSERT INTO `wu_module_fields` VALUES ('276', '74', '链接', 'link', 'longtext', '手动指定外部链接时，伪静态链接可以留空', 'url', '', 'safe', '', '20', 'a:1:{s:5:\"width\";s:3:\"500\";}', '0');
INSERT INTO `wu_module_fields` VALUES ('277', '74', '链接方式', 'target', 'varchar', '设置是否在新窗口打开', 'radio', '', 'safe', '_self', '30', 'a:1:{s:11:\"option_list\";s:5:\"opt:6\";}', '0');
INSERT INTO `wu_module_fields` VALUES ('278', '75', '缩略图', 'thumb', 'varchar', '建议上传的图片不要超过200KB', 'upload', '', 'safe', '', '10', 'a:3:{s:7:\"cate_id\";s:1:\"1\";s:11:\"is_multiple\";s:1:\"0\";s:11:\"upload_auto\";s:1:\"1\";}', '0');
INSERT INTO `wu_module_fields` VALUES ('279', '75', '摘要', 'note', 'longtext', '填写该资讯的一部分摘要信息', 'textarea', '', 'safe', '', '20', 'a:2:{s:5:\"width\";s:3:\"600\";s:6:\"height\";s:2:\"80\";}', '0');
INSERT INTO `wu_module_fields` VALUES ('280', '75', '内容', 'content', 'longtext', '', 'editor', '', 'html', '', '30', 'a:11:{s:5:\"width\";s:3:\"950\";s:6:\"height\";s:3:\"360\";s:7:\"is_code\";s:0:\"\";s:9:\"btn_image\";s:1:\"1\";s:9:\"btn_video\";s:1:\"1\";s:8:\"btn_file\";s:1:\"1\";s:8:\"btn_page\";s:0:\"\";s:8:\"btn_info\";s:0:\"\";s:7:\"is_read\";s:0:\"\";s:5:\"etype\";s:4:\"full\";s:7:\"btn_map\";s:0:\"\";}', '0');
INSERT INTO `wu_module_fields` VALUES ('281', '76', '缩略图', 'thumb', 'varchar', '要求上传的图片大小不能超过200KB', 'upload', '', 'safe', '', '10', 'a:3:{s:7:\"cate_id\";s:1:\"1\";s:11:\"is_multiple\";s:1:\"0\";s:11:\"upload_auto\";s:1:\"1\";}', '0');
INSERT INTO `wu_module_fields` VALUES ('282', '76', '图片', 'pictures', 'varchar', '支持多图，每张图片上传不能超过300KB', 'upload', '', 'safe', '', '20', 'a:3:{s:7:\"cate_id\";s:1:\"1\";s:11:\"is_multiple\";s:1:\"1\";s:11:\"upload_auto\";s:1:\"1\";}', '0');
INSERT INTO `wu_module_fields` VALUES ('283', '76', '内容', 'content', 'longtext', '', 'editor', '', 'html', '', '30', 'a:11:{s:5:\"width\";s:3:\"950\";s:6:\"height\";s:3:\"360\";s:7:\"is_code\";s:0:\"\";s:9:\"btn_image\";s:1:\"1\";s:9:\"btn_video\";s:1:\"1\";s:8:\"btn_file\";s:1:\"1\";s:8:\"btn_page\";s:0:\"\";s:8:\"btn_info\";s:0:\"\";s:7:\"is_read\";s:0:\"\";s:5:\"etype\";s:4:\"full\";s:7:\"btn_map\";s:0:\"\";}', '0');
INSERT INTO `wu_module_fields` VALUES ('284', '77', '内容', 'content', 'longtext', '', 'editor', '', 'html', '', '10', 'a:11:{s:5:\"width\";s:3:\"950\";s:6:\"height\";s:3:\"360\";s:7:\"is_code\";s:0:\"\";s:9:\"btn_image\";s:1:\"1\";s:9:\"btn_video\";s:1:\"1\";s:8:\"btn_file\";s:1:\"1\";s:8:\"btn_page\";s:0:\"\";s:8:\"btn_info\";s:0:\"\";s:7:\"is_read\";s:0:\"\";s:5:\"etype\";s:4:\"full\";s:7:\"btn_map\";s:0:\"\";}', '0');
INSERT INTO `wu_module_fields` VALUES ('286', '78', '缩略图', 'thumb', 'varchar', '支持多个产品图片，建议不超过5个', 'upload', '', 'safe', '', '10', 'a:3:{s:7:\"cate_id\";s:1:\"1\";s:11:\"is_multiple\";s:1:\"1\";s:11:\"upload_auto\";s:1:\"1\";}', '0');
INSERT INTO `wu_module_fields` VALUES ('287', '79', '自定义链接', 'linkurl', 'varchar', '请填写链接地址，外链请输入http://或https://', 'text', '', 'safe', '', '10', 'a:4:{s:8:\"form_btn\";s:3:\"url\";s:5:\"width\";s:3:\"500\";s:15:\"ext_quick_words\";s:0:\"\";s:14:\"ext_quick_type\";s:0:\"\";}', '0');
INSERT INTO `wu_module_fields` VALUES ('288', '79', '链接方式', 'target', 'varchar', '设置是否在新窗口打开', 'radio', '', 'safe', '_blank', '20', 'a:3:{s:11:\"option_list\";s:5:\"opt:6\";s:9:\"put_order\";s:1:\"0\";s:10:\"ext_select\";s:0:\"\";}', '0');
INSERT INTO `wu_module_fields` VALUES ('289', '78', '内容', 'content', 'longtext', '', 'editor', '', 'html', '', '20', 'a:13:{s:5:\"width\";s:3:\"950\";s:6:\"height\";s:3:\"360\";s:7:\"is_code\";s:0:\"\";s:9:\"btn_image\";s:1:\"1\";s:9:\"btn_video\";s:1:\"1\";s:8:\"btn_file\";s:1:\"1\";s:8:\"btn_page\";s:0:\"\";s:8:\"btn_info\";s:0:\"\";s:7:\"is_read\";s:0:\"\";s:5:\"etype\";s:4:\"full\";s:7:\"btn_map\";s:0:\"\";s:7:\"inc_tag\";s:0:\"\";s:10:\"paste_text\";s:0:\"\";}', '0');
INSERT INTO `wu_module_fields` VALUES ('290', '78', '产品属性', 'attrs', 'longtext', '', 'param', '', 'safe', '', '15', 'a:3:{s:6:\"p_name\";s:27:\"型号\n大小\n外观\n重量\";s:6:\"p_type\";s:1:\"0\";s:7:\"p_width\";s:0:\"\";}', '0');
INSERT INTO `wu_module_fields` VALUES ('291', '78', '价格', 'price', 'varchar', '请设置产品的价格', 'text', '', 'safe', '', '30', 'a:4:{s:8:\"form_btn\";s:0:\"\";s:5:\"width\";s:0:\"\";s:15:\"ext_quick_words\";s:13:\"面议\n免费\";s:14:\"ext_quick_type\";s:0:\"\";}', '0');
INSERT INTO `wu_module_fields` VALUES ('292', '80', '姓名', 'fullname', 'varchar', '', 'text', '', 'safe', '', '10', 'a:4:{s:8:\"form_btn\";s:0:\"\";s:5:\"width\";s:3:\"300\";s:15:\"ext_quick_words\";s:0:\"\";s:14:\"ext_quick_type\";s:0:\"\";}', '1');
INSERT INTO `wu_module_fields` VALUES ('293', '80', '手机号', 'mobile', 'varchar', '', 'text', '', 'safe', '', '20', 'a:4:{s:8:\"form_btn\";s:0:\"\";s:5:\"width\";s:3:\"300\";s:15:\"ext_quick_words\";s:0:\"\";s:14:\"ext_quick_type\";s:0:\"\";}', '1');
INSERT INTO `wu_module_fields` VALUES ('294', '80', '咨询内容', 'note', 'longtext', '请填写要咨询的内容', 'textarea', '', 'safe', '', '30', 'a:2:{s:5:\"width\";s:3:\"300\";s:6:\"height\";s:2:\"80\";}', '1');
INSERT INTO `wu_module_fields` VALUES ('295', '80', '产品网址', 'furl', 'varchar', '', 'text', '', 'safe', '', '40', 'a:4:{s:8:\"form_btn\";s:0:\"\";s:5:\"width\";s:3:\"300\";s:15:\"ext_quick_words\";s:0:\"\";s:14:\"ext_quick_type\";s:0:\"\";}', '1');
INSERT INTO `wu_module_fields` VALUES ('296', '81', '单个文件', 'dfile', 'varchar', '请上传要下载的文件', 'upload', '', 'int', '', '10', 'a:3:{s:7:\"cate_id\";s:1:\"1\";s:11:\"is_multiple\";s:1:\"0\";s:11:\"upload_auto\";s:1:\"1\";}', '0');
INSERT INTO `wu_module_fields` VALUES ('297', '82', 'Name', 'fullname', 'varchar', '', 'text', '', 'safe', '', '10', 'a:4:{s:8:\"form_btn\";s:0:\"\";s:5:\"width\";s:3:\"300\";s:15:\"ext_quick_words\";s:0:\"\";s:14:\"ext_quick_type\";s:0:\"\";}', '1');
INSERT INTO `wu_module_fields` VALUES ('298', '82', 'Tel', 'mobile', 'varchar', '', 'text', '', 'safe', '', '20', 'a:4:{s:8:\"form_btn\";s:0:\"\";s:5:\"width\";s:3:\"300\";s:15:\"ext_quick_words\";s:0:\"\";s:14:\"ext_quick_type\";s:0:\"\";}', '1');
INSERT INTO `wu_module_fields` VALUES ('299', '82', 'E-mail', 'email', 'varchar', '', 'text', '', 'safe', '', '30', 'a:4:{s:8:\"form_btn\";s:0:\"\";s:5:\"width\";s:3:\"300\";s:15:\"ext_quick_words\";s:0:\"\";s:14:\"ext_quick_type\";s:0:\"\";}', '1');
INSERT INTO `wu_module_fields` VALUES ('300', '82', 'Content', 'content', 'longtext', '', 'textarea', '', 'safe', '', '40', 'a:2:{s:5:\"width\";s:3:\"500\";s:6:\"height\";s:3:\"200\";}', '1');
INSERT INTO `wu_module_fields` VALUES ('301', '82', '管理员回复', 'adm_reply', 'longtext', '', 'editor', '', 'html', '', '50', 'a:13:{s:5:\"width\";s:3:\"800\";s:6:\"height\";s:3:\"180\";s:7:\"is_code\";s:0:\"\";s:9:\"btn_image\";s:1:\"1\";s:9:\"btn_video\";s:1:\"1\";s:8:\"btn_file\";s:1:\"1\";s:8:\"btn_page\";s:0:\"\";s:8:\"btn_info\";s:0:\"\";s:7:\"is_read\";s:0:\"\";s:5:\"etype\";s:6:\"simple\";s:7:\"btn_map\";s:0:\"\";s:7:\"inc_tag\";s:0:\"\";s:10:\"paste_text\";s:0:\"\";}', '0');
INSERT INTO `wu_module_fields` VALUES ('303', '83', '工作地点', 'address', 'varchar', '', 'text', '', 'safe', '深圳', '10', 'a:4:{s:8:\"form_btn\";s:0:\"\";s:5:\"width\";s:3:\"500\";s:15:\"ext_quick_words\";s:22:\"深圳\r\n上海\r\n北京\";s:14:\"ext_quick_type\";s:4:\"none\";}', '0');
INSERT INTO `wu_module_fields` VALUES ('304', '83', '招聘人数', 'persons', 'varchar', '请填写招聘人数', 'text', '', 'safe', '若干', '20', 'a:4:{s:8:\"form_btn\";s:0:\"\";s:5:\"width\";s:3:\"300\";s:15:\"ext_quick_words\";s:14:\"若干\r\n不限\";s:14:\"ext_quick_type\";s:4:\"none\";}', '0');
INSERT INTO `wu_module_fields` VALUES ('305', '83', '工作年限', 'years', 'varchar', '请填写对应聘人员的工作年限要求，不限制请填写不限，或无要求', 'text', '', 'safe', '不限', '30', 'a:4:{s:8:\"form_btn\";s:0:\"\";s:5:\"width\";s:3:\"500\";s:15:\"ext_quick_words\";s:41:\"不限\r\n无要求\r\n1年以上\r\n3年以上\";s:14:\"ext_quick_type\";s:4:\"none\";}', '0');
INSERT INTO `wu_module_fields` VALUES ('306', '83', '学历要求', 'schools', 'varchar', '请填写相应的学历要求', 'text', '', 'safe', '不限', '40', 'a:4:{s:8:\"form_btn\";s:0:\"\";s:5:\"width\";s:3:\"500\";s:15:\"ext_quick_words\";s:62:\"不限\r\n初中\r\n中专\r\n高中\r\n大专\r\n本科\r\n硕士\r\n博士\";s:14:\"ext_quick_type\";s:4:\"none\";}', '0');
INSERT INTO `wu_module_fields` VALUES ('307', '83', '工作描述', 'content', 'longtext', '', 'editor', '', 'html', '', '50', 'a:13:{s:5:\"width\";s:3:\"950\";s:6:\"height\";s:3:\"360\";s:7:\"is_code\";s:0:\"\";s:9:\"btn_image\";s:1:\"1\";s:9:\"btn_video\";s:1:\"1\";s:8:\"btn_file\";s:1:\"1\";s:8:\"btn_page\";s:0:\"\";s:8:\"btn_info\";s:0:\"\";s:7:\"is_read\";s:0:\"\";s:5:\"etype\";s:4:\"full\";s:7:\"btn_map\";s:0:\"\";s:7:\"inc_tag\";s:0:\"\";s:10:\"paste_text\";s:0:\"\";}', '0');
INSERT INTO `wu_module_fields` VALUES ('308', '83', '薪水范围', 'price', 'varchar', '', 'text', '', 'safe', '面议', '45', 'a:4:{s:8:\"form_btn\";s:0:\"\";s:5:\"width\";s:3:\"500\";s:15:\"ext_quick_words\";s:63:\"面议\r\n3500-5500元\r\n5600-7500元\r\n7500-1万元\r\n1万元以上\";s:14:\"ext_quick_type\";s:4:\"none\";}', '0');
INSERT INTO `wu_module_fields` VALUES ('309', '84', '姓名', 'fullname', 'varchar', '', 'text', '', 'safe', '', '10', 'a:4:{s:8:\"form_btn\";s:0:\"\";s:5:\"width\";s:3:\"300\";s:15:\"ext_quick_words\";s:0:\"\";s:14:\"ext_quick_type\";s:0:\"\";}', '1');
INSERT INTO `wu_module_fields` VALUES ('310', '84', '手机号', 'mobile', 'varchar', '', 'text', '', 'safe', '', '20', 'a:4:{s:8:\"form_btn\";s:0:\"\";s:5:\"width\";s:3:\"300\";s:15:\"ext_quick_words\";s:0:\"\";s:14:\"ext_quick_type\";s:0:\"\";}', '1');
INSERT INTO `wu_module_fields` VALUES ('311', '84', '简历', 'dfile', 'varchar', '请上传简历', 'upload', '', 'int', '', '40', 'a:3:{s:7:\"cate_id\";s:1:\"1\";s:11:\"is_multiple\";s:1:\"0\";s:11:\"upload_auto\";s:1:\"1\";}', '1');
INSERT INTO `wu_module_fields` VALUES ('312', '84', '邮箱', 'email', 'varchar', '请填写邮件', 'text', '', 'safe', '', '30', 'a:4:{s:8:\"form_btn\";s:0:\"\";s:5:\"width\";s:3:\"300\";s:15:\"ext_quick_words\";s:0:\"\";s:14:\"ext_quick_type\";s:0:\"\";}', '1');
INSERT INTO `wu_module_fields` VALUES ('313', '85', 'QQ号', 'qq', 'varchar', '请填写QQ号', 'text', '', 'safe', '', '10', 'a:4:{s:8:\"form_btn\";s:0:\"\";s:5:\"width\";s:3:\"300\";s:15:\"ext_quick_words\";s:0:\"\";s:14:\"ext_quick_type\";s:0:\"\";}', '0');

-- ----------------------------
-- Table structure for wu_opt
-- ----------------------------
DROP TABLE IF EXISTS `wu_opt`;
CREATE TABLE `wu_opt` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID号',
  `group_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '组ID',
  `parent_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '父级ID',
  `title` varchar(255) NOT NULL COMMENT '名称',
  `val` varchar(255) NOT NULL COMMENT '值',
  `taxis` int(10) unsigned NOT NULL DEFAULT '255' COMMENT '排序，值越小越往前靠',
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=65 DEFAULT CHARSET=utf8 COMMENT='表单列表选项';

-- ----------------------------
-- Records of wu_opt
-- ----------------------------
INSERT INTO `wu_opt` VALUES ('1', '1', '0', '女', '', '20');
INSERT INTO `wu_opt` VALUES ('2', '1', '0', '男', '1', '10');
INSERT INTO `wu_opt` VALUES ('17', '4', '0', '是', '1', '10');
INSERT INTO `wu_opt` VALUES ('18', '4', '0', '否', '', '20');
INSERT INTO `wu_opt` VALUES ('21', '6', '0', '当前窗口', '_self', '10');
INSERT INTO `wu_opt` VALUES ('22', '6', '0', '新窗口', '_blank', '20');

-- ----------------------------
-- Table structure for wu_opt_group
-- ----------------------------
DROP TABLE IF EXISTS `wu_opt_group`;
CREATE TABLE `wu_opt_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID ',
  `title` varchar(100) NOT NULL COMMENT '名称，用于后台管理',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='可选菜单管理器';

-- ----------------------------
-- Records of wu_opt_group
-- ----------------------------
INSERT INTO `wu_opt_group` VALUES ('1', '性别');
INSERT INTO `wu_opt_group` VALUES ('4', '是与否');
INSERT INTO `wu_opt_group` VALUES ('6', '窗口打开方式');

-- ----------------------------
-- Table structure for wu_phpok
-- ----------------------------
DROP TABLE IF EXISTS `wu_phpok`;
CREATE TABLE `wu_phpok` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID号',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '项目ID',
  `type_id` varchar(255) NOT NULL COMMENT '调用类型',
  `identifier` varchar(100) NOT NULL COMMENT '标识串，同一个站点中只能唯一',
  `site_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '站点ID',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `cateid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类ID',
  `ext` text NOT NULL COMMENT '扩展属性',
  PRIMARY KEY (`id`),
  UNIQUE KEY `identifier` (`identifier`,`site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='数据调用中心';

-- ----------------------------
-- Records of wu_phpok
-- ----------------------------
INSERT INTO `wu_phpok` VALUES ('1', '导航菜单', '165', 'arclist', 'menu', '1', '1', '0', 'a:13:{s:5:\"psize\";s:3:\"999\";s:6:\"offset\";i:0;s:7:\"is_list\";s:1:\"1\";s:4:\"attr\";s:0:\"\";s:11:\"fields_need\";s:0:\"\";s:3:\"tag\";s:0:\"\";s:8:\"keywords\";s:0:\"\";s:7:\"orderby\";s:0:\"\";s:4:\"cate\";s:0:\"\";s:13:\"fields_format\";i:0;s:4:\"user\";s:0:\"\";s:6:\"in_sub\";s:1:\"1\";s:8:\"title_id\";s:0:\"\";}');
INSERT INTO `wu_phpok` VALUES ('2', '图片播放器', '166', 'arclist', 'picplayer', '1', '1', '0', 'a:13:{s:5:\"psize\";s:1:\"5\";s:6:\"offset\";i:0;s:7:\"is_list\";s:1:\"1\";s:4:\"attr\";s:0:\"\";s:11:\"fields_need\";s:10:\"ext.banner\";s:3:\"tag\";s:0:\"\";s:8:\"keywords\";s:0:\"\";s:7:\"orderby\";s:0:\"\";s:4:\"cate\";s:0:\"\";s:13:\"fields_format\";i:0;s:4:\"user\";s:0:\"\";s:6:\"in_sub\";i:0;s:8:\"title_id\";s:0:\"\";}');
INSERT INTO `wu_phpok` VALUES ('3', '新闻资讯', '167', 'arclist', 'news', '1', '1', '1', 'a:13:{s:5:\"psize\";s:2:\"11\";s:6:\"offset\";i:0;s:7:\"is_list\";s:1:\"1\";s:4:\"attr\";s:0:\"\";s:11:\"fields_need\";s:0:\"\";s:3:\"tag\";s:0:\"\";s:8:\"keywords\";s:0:\"\";s:7:\"orderby\";s:0:\"\";s:4:\"cate\";s:0:\"\";s:13:\"fields_format\";i:0;s:4:\"user\";s:0:\"\";s:6:\"in_sub\";i:0;s:8:\"title_id\";s:0:\"\";}');
INSERT INTO `wu_phpok` VALUES ('9', '联系我们', '173', 'project', 'contact', '1', '1', '0', 'a:13:{s:5:\"psize\";i:0;s:6:\"offset\";i:0;s:7:\"is_list\";s:1:\"1\";s:4:\"attr\";s:0:\"\";s:11:\"fields_need\";s:0:\"\";s:3:\"tag\";s:0:\"\";s:8:\"keywords\";s:0:\"\";s:7:\"orderby\";s:0:\"\";s:4:\"cate\";s:0:\"\";s:13:\"fields_format\";i:0;s:4:\"user\";s:0:\"\";s:6:\"in_sub\";i:0;s:8:\"title_id\";s:0:\"\";}');
INSERT INTO `wu_phpok` VALUES ('5', '公司相册', '169', 'arclist', 'photo', '1', '1', '4', 'a:13:{s:5:\"psize\";s:1:\"6\";s:6:\"offset\";i:0;s:7:\"is_list\";s:1:\"1\";s:4:\"attr\";s:0:\"\";s:11:\"fields_need\";s:9:\"ext.thumb\";s:3:\"tag\";s:0:\"\";s:8:\"keywords\";s:0:\"\";s:7:\"orderby\";s:0:\"\";s:4:\"cate\";s:0:\"\";s:13:\"fields_format\";i:0;s:4:\"user\";s:0:\"\";s:6:\"in_sub\";i:0;s:8:\"title_id\";s:0:\"\";}');
INSERT INTO `wu_phpok` VALUES ('6', '关于我们', '168', 'arc', 'about', '1', '1', '0', 'a:13:{s:5:\"psize\";i:0;s:6:\"offset\";i:0;s:7:\"is_list\";s:1:\"1\";s:4:\"attr\";s:0:\"\";s:11:\"fields_need\";s:0:\"\";s:3:\"tag\";s:0:\"\";s:8:\"keywords\";s:0:\"\";s:7:\"orderby\";s:0:\"\";s:4:\"cate\";s:0:\"\";s:13:\"fields_format\";i:0;s:4:\"user\";s:0:\"\";s:6:\"in_sub\";i:0;s:8:\"title_id\";s:4:\"1456\";}');
INSERT INTO `wu_phpok` VALUES ('7', '友情链接', '172', 'arclist', 'link', '1', '1', '0', 'a:13:{s:5:\"psize\";s:2:\"50\";s:6:\"offset\";i:0;s:7:\"is_list\";s:1:\"1\";s:4:\"attr\";s:0:\"\";s:11:\"fields_need\";s:0:\"\";s:3:\"tag\";s:0:\"\";s:8:\"keywords\";s:0:\"\";s:7:\"orderby\";s:0:\"\";s:4:\"cate\";s:0:\"\";s:13:\"fields_format\";i:0;s:4:\"user\";s:0:\"\";s:6:\"in_sub\";i:0;s:8:\"title_id\";s:0:\"\";}');
INSERT INTO `wu_phpok` VALUES ('8', '产品展示', '171', 'arclist', 'product', '1', '1', '7', 'a:13:{s:5:\"psize\";s:2:\"10\";s:6:\"offset\";i:0;s:7:\"is_list\";s:1:\"1\";s:4:\"attr\";s:0:\"\";s:11:\"fields_need\";s:9:\"ext.thumb\";s:3:\"tag\";s:0:\"\";s:8:\"keywords\";s:0:\"\";s:7:\"orderby\";s:0:\"\";s:4:\"cate\";s:0:\"\";s:13:\"fields_format\";i:0;s:4:\"user\";s:0:\"\";s:6:\"in_sub\";i:0;s:8:\"title_id\";s:0:\"\";}');
INSERT INTO `wu_phpok` VALUES ('10', '产品咨询服务', '174', 'fields', 'zxform', '1', '1', '0', 'a:13:{s:5:\"psize\";i:0;s:6:\"offset\";i:0;s:7:\"is_list\";s:1:\"1\";s:4:\"attr\";s:0:\"\";s:11:\"fields_need\";s:0:\"\";s:3:\"tag\";s:0:\"\";s:8:\"keywords\";s:0:\"\";s:7:\"orderby\";s:0:\"\";s:4:\"cate\";s:0:\"\";s:13:\"fields_format\";s:1:\"1\";s:4:\"user\";s:0:\"\";s:6:\"in_sub\";i:0;s:8:\"title_id\";s:0:\"\";}');
INSERT INTO `wu_phpok` VALUES ('11', '在线应聘', '179', 'fields', 'applied-online', '1', '1', '0', 'a:13:{s:5:\"psize\";i:0;s:6:\"offset\";i:0;s:7:\"is_list\";s:1:\"1\";s:4:\"attr\";s:0:\"\";s:11:\"fields_need\";s:0:\"\";s:3:\"tag\";s:0:\"\";s:8:\"keywords\";s:0:\"\";s:7:\"orderby\";s:0:\"\";s:4:\"cate\";s:0:\"\";s:13:\"fields_format\";s:1:\"1\";s:4:\"user\";s:0:\"\";s:6:\"in_sub\";i:0;s:8:\"title_id\";s:0:\"\";}');
INSERT INTO `wu_phpok` VALUES ('12', '在线客服', '180', 'arclist', 'online-service', '1', '1', '0', 'a:13:{s:5:\"psize\";s:2:\"10\";s:6:\"offset\";i:0;s:7:\"is_list\";s:1:\"1\";s:4:\"attr\";s:0:\"\";s:11:\"fields_need\";s:0:\"\";s:3:\"tag\";s:0:\"\";s:8:\"keywords\";s:0:\"\";s:7:\"orderby\";s:0:\"\";s:4:\"cate\";s:0:\"\";s:13:\"fields_format\";i:0;s:4:\"user\";s:0:\"\";s:6:\"in_sub\";i:0;s:8:\"title_id\";s:0:\"\";}');

-- ----------------------------
-- Table structure for wu_plugins
-- ----------------------------
DROP TABLE IF EXISTS `wu_plugins`;
CREATE TABLE `wu_plugins` (
  `id` varchar(100) NOT NULL COMMENT '插件ID，仅限字母，数字及下划线',
  `title` varchar(255) NOT NULL COMMENT '插件名称',
  `author` varchar(255) NOT NULL COMMENT '开发者',
  `version` varchar(50) NOT NULL COMMENT '插件版本号',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0禁用1使用',
  `taxis` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '值越小越往前靠',
  `note` varchar(255) NOT NULL COMMENT '摘要说明',
  `param` text NOT NULL COMMENT '参数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='插件管理器';

-- ----------------------------
-- Records of wu_plugins
-- ----------------------------
INSERT INTO `wu_plugins` VALUES ('identifier', '标识串自动生成工具', 'phpok.com', '1.0', '1', '20', '实现将“title”字段的表单数据翻译符合系统要求的标识串', 'a:3:{s:9:\"is_youdao\";s:0:\"\";s:10:\"is_pingyin\";s:1:\"1\";s:5:\"is_py\";s:1:\"1\";}');
INSERT INTO `wu_plugins` VALUES ('collection', '采集器', 'phpok.com', '1.0', '1', '30', '实现网站基本信息采集，适用于网站迁移', 'a:5:{s:7:\"root_id\";s:1:\"5\";s:10:\"sysmenu_id\";i:75;s:7:\"rescate\";s:1:\"1\";s:7:\"keyfrom\";s:0:\"\";s:5:\"keyid\";s:0:\"\";}');

-- ----------------------------
-- Table structure for wu_project
-- ----------------------------
DROP TABLE IF EXISTS `wu_project`;
CREATE TABLE `wu_project` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID，也是应用ID',
  `parent_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '上一级ID',
  `site_id` mediumint(8) unsigned NOT NULL COMMENT '网站ID',
  `module` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '指定模型ID，为0表页面空白',
  `cate` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '绑定根分类ID',
  `title` varchar(255) NOT NULL COMMENT '名称',
  `nick_title` varchar(255) NOT NULL COMMENT '后台别称',
  `taxis` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '排序，值越小越往前靠',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0不使用1使用',
  `tpl_index` varchar(255) NOT NULL COMMENT '封面页',
  `tpl_list` varchar(255) NOT NULL COMMENT '列表页',
  `tpl_content` varchar(255) NOT NULL COMMENT '详细页',
  `is_identifier` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否自定义标识',
  `ico` varchar(255) NOT NULL COMMENT '图标',
  `orderby` text NOT NULL COMMENT '排序',
  `alias_title` varchar(255) NOT NULL COMMENT '主题别名',
  `alias_note` varchar(255) NOT NULL COMMENT '主题备注',
  `psize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '0表示不限制，每页显示数量',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID号，为0表示管理员维护',
  `identifier` varchar(255) NOT NULL COMMENT '标识',
  `seo_title` varchar(255) NOT NULL COMMENT 'SEO标题',
  `seo_keywords` varchar(255) NOT NULL COMMENT 'SEO关键字',
  `seo_desc` varchar(255) NOT NULL COMMENT 'SEO描述',
  `subtopics` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否启用子主题功能',
  `is_search` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否支持搜索',
  `is_tag` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '必填Tag',
  `is_biz` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0不启用电商，1启用电商',
  `is_userid` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否绑定会员',
  `is_tpl_content` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否自定义内容模板',
  `is_seo` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否默认使用seo',
  `currency_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '默认货币ID',
  `admin_note` text NOT NULL COMMENT '管理员备注，给编辑人员使用的',
  `hidden` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0显示1隐藏',
  `post_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '发布模式，0不启用1启用',
  `comment_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '启用评论功能',
  `post_tpl` varchar(255) NOT NULL COMMENT '发布页模板',
  `etpl_admin` varchar(255) NOT NULL COMMENT '通知管理员邮件模板',
  `etpl_user` varchar(255) NOT NULL COMMENT '发布邮件通知会员模板',
  `etpl_comment_admin` varchar(255) NOT NULL COMMENT '评论邮件通知管理员模板',
  `etpl_comment_user` varchar(255) NOT NULL COMMENT '评论邮件通知会员',
  `is_attr` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1启用主题属性0不启用',
  `tag` varchar(255) NOT NULL COMMENT '自身Tag设置',
  `is_appoint` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '指定维护',
  `cate_multiple` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0分类单选1分类支持多选',
  `biz_attr` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '产品属性，0不使用1使用',
  `freight` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '运费模板ID',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `site_id` (`site_id`,`status`)
) ENGINE=MyISAM AUTO_INCREMENT=182 DEFAULT CHARSET=utf8 COMMENT='项目管理器';

-- ----------------------------
-- Records of wu_project
-- ----------------------------
INSERT INTO `wu_project` VALUES ('165', '0', '1', '73', '0', '导航菜单', '', '10', '1', '', '', '', '0', 'images/ico/menu.png', 'l.sort ASC,l.dateline DESC,l.id DESC', '导航名称', '', '30', '0', 'menu', '', '', '', '1', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '', '', '', '', '', '0', '', '0', '0', '0', '0');
INSERT INTO `wu_project` VALUES ('166', '0', '1', '74', '0', '图片播放器', '', '20', '1', '', '', '', '0', 'images/ico/picplayer.png', 'l.sort ASC,l.dateline DESC,l.id DESC', '', '', '30', '0', 'picplayer', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '', '', '', '', '', '0', '', '0', '0', '0', '0');
INSERT INTO `wu_project` VALUES ('167', '0', '1', '75', '1', 'News', '', '30', '1', '', '', '', '0', 'images/ico/article.png', 'l.sort ASC,l.dateline DESC,l.id DESC', '', '', '8', '0', 'article', '', '', '', '0', '1', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '', '', '', '', '', '0', '', '0', '0', '0', '0');
INSERT INTO `wu_project` VALUES ('168', '0', '1', '77', '0', 'About Us', '', '40', '1', '', '', '', '1', 'images/ico/company.png', 'l.sort ASC,l.dateline DESC,l.id DESC', '', '', '30', '0', 'about', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '', '', '', '', '', '0', '', '0', '0', '0', '0');
INSERT INTO `wu_project` VALUES ('169', '0', '1', '76', '4', '公司相册', '', '50', '1', '', '', '', '0', 'images/ico/photo.png', 'l.sort ASC,l.dateline DESC,l.id DESC', '', '', '12', '0', 'photo', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '', '', '', '', '', '0', '', '0', '0', '0', '0');
INSERT INTO `wu_project` VALUES ('170', '0', '1', '81', '0', '资料下载', '', '60', '1', '', '', '', '0', 'images/ico/download3.png', 'l.sort ASC,l.dateline DESC,l.id DESC', '', '', '30', '0', 'files', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '', '', '', '', '', '0', '', '0', '0', '0', '0');
INSERT INTO `wu_project` VALUES ('171', '0', '1', '78', '7', 'Products', '', '70', '1', '', '', '', '0', 'images/ico/product.png', 'l.sort ASC,l.dateline DESC,l.id DESC', '', '', '12', '0', 'product', '', '', '', '0', '1', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '', '', '', '', '', '0', '', '0', '0', '0', '0');
INSERT INTO `wu_project` VALUES ('172', '0', '1', '79', '0', '友情链接', '', '80', '1', '', '', '', '0', 'images/ico/link.png', 'l.sort ASC,l.dateline DESC,l.id DESC', '网站名称', '', '30', '0', 'link', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '', '', '', '', '', '0', '', '0', '0', '0', '0');
INSERT INTO `wu_project` VALUES ('173', '0', '1', '0', '0', 'Contact Us', '', '90', '1', '', '', '', '0', 'images/ico/email2.png', 'l.sort ASC,l.dateline DESC,l.id DESC', '', '', '30', '0', 'contact', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '', '', '', '', '', '0', '', '0', '0', '0', '0');
INSERT INTO `wu_project` VALUES ('174', '0', '1', '80', '0', '产品咨询服务', '', '100', '1', '', '', '', '0', 'images/ico/activities.png', 'l.sort ASC,l.dateline DESC,l.id DESC', '产品名称', '', '30', '0', 'zxservice', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1', '0', '', '', '', '', '', '0', '', '0', '0', '0', '0');
INSERT INTO `wu_project` VALUES ('175', '0', '1', '82', '0', 'GestBook', '', '110', '1', '', '', '', '0', 'images/ico/paper.png', 'l.sort ASC,l.dateline DESC,l.id DESC', 'Topic', '', '15', '0', 'message', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1', '0', '', '', '', '', '', '0', '', '0', '0', '0', '0');
INSERT INTO `wu_project` VALUES ('176', '0', '1', '83', '0', '人才招聘', '', '120', '1', '', '', '', '0', 'images/ico/user.png', 'l.sort ASC,l.dateline DESC,l.id DESC', '职位', '', '30', '0', 'job', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '', '', '', '', '', '0', '', '0', '0', '0', '0');
INSERT INTO `wu_project` VALUES ('177', '176', '1', '0', '0', '人才理念', '', '10', '1', 'job_page', '', '', '0', 'images/ico/manage.png', 'l.sort ASC,l.dateline DESC,l.id DESC', '', '', '30', '0', 'talent', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '', '', '', '', '', '0', '', '0', '0', '0', '0');
INSERT INTO `wu_project` VALUES ('178', '176', '1', '0', '0', '培训发展', '', '20', '1', 'job_page', '', '', '0', 'images/ico/manage.png', 'l.sort ASC,l.dateline DESC,l.id DESC', '', '', '30', '0', 'training', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '', '', '', '', '', '0', '', '0', '0', '0', '0');
INSERT INTO `wu_project` VALUES ('179', '0', '1', '84', '0', '在线应聘', '', '130', '1', '', '', '', '0', 'images/ico/activities.png', 'l.sort ASC,l.dateline DESC,l.id DESC', '应聘岗位', '', '30', '0', 'apply', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1', '0', '', '', '', '', '', '0', '', '0', '0', '0', '0');
INSERT INTO `wu_project` VALUES ('180', '0', '1', '85', '0', '在线客服', '', '140', '1', '', '', '', '0', 'images/ico/qq.png', 'l.sort ASC,l.dateline DESC,l.id DESC', '客服昵称', '', '30', '0', 'online-service', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '', '', '', '', '', '0', '', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for wu_res
-- ----------------------------
DROP TABLE IF EXISTS `wu_res`;
CREATE TABLE `wu_res` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '资源ID',
  `cate_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '分类ID',
  `folder` varchar(255) NOT NULL COMMENT '存储目录',
  `name` varchar(255) NOT NULL COMMENT '资源文件名',
  `ext` varchar(30) NOT NULL COMMENT '资源后缀，如jpg等',
  `filename` varchar(255) NOT NULL COMMENT '文件名带路径',
  `ico` varchar(255) NOT NULL COMMENT 'ICO图标文件',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `title` varchar(255) NOT NULL COMMENT '内容',
  `attr` text NOT NULL COMMENT '附件属性',
  `note` text NOT NULL COMMENT '备注',
  `session_id` varchar(100) NOT NULL COMMENT '操作者 ID，即会员ID用于检测是否有权限删除 ',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID，当该ID为时检则sesson_id，如不相同则不能删除 ',
  `download` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员ID',
  PRIMARY KEY (`id`),
  KEY `ext` (`ext`)
) ENGINE=MyISAM AUTO_INCREMENT=1203 DEFAULT CHARSET=utf8 COMMENT='资源ID';

-- ----------------------------
-- Records of wu_res
-- ----------------------------
INSERT INTO `wu_res` VALUES ('964', '1', 'res/201509/05/', '128631859541c31c.png', 'png', 'res/201509/05/128631859541c31c.png', 'res/201509/05/_964.png', '1441446392', 'phpok4simple', 'a:2:{s:5:\"width\";i:213;s:6:\"height\";i:60;}', '', '', '0', '0', '1');
INSERT INTO `wu_res` VALUES ('965', '1', 'res/201509/05/', '664c88fb68dfba8a.jpg', 'jpg', 'res/201509/05/664c88fb68dfba8a.jpg', 'res/201509/05/_965.jpg', '1441463193', '001', 'a:2:{s:5:\"width\";i:980;s:6:\"height\";i:300;}', '', '', '0', '0', '1');
INSERT INTO `wu_res` VALUES ('966', '1', 'res/201509/05/', '8a9cbeff1c2e38db.jpg', 'jpg', 'res/201509/05/8a9cbeff1c2e38db.jpg', 'res/201509/05/_966.jpg', '1441463201', '002', 'a:2:{s:5:\"width\";i:980;s:6:\"height\";i:300;}', '', '', '0', '0', '1');
INSERT INTO `wu_res` VALUES ('967', '1', 'res/201509/05/', 'aa86c1b6b3686292.jpg', 'jpg', 'res/201509/05/aa86c1b6b3686292.jpg', 'res/201509/05/_967.jpg', '1441463220', '003', 'a:2:{s:5:\"width\";i:980;s:6:\"height\";i:300;}', '', '', '0', '0', '1');
INSERT INTO `wu_res` VALUES ('1135', '1', 'res/201512/17/', '93db3b8d84820e6c.jpg', 'jpg', 'res/201512/17/93db3b8d84820e6c.jpg', 'res/201512/17/_1135.jpg', '1450341048', '新闻', 'a:2:{s:5:\"width\";i:980;s:6:\"height\";i:180;}', '', '', '0', '0', '1');
INSERT INTO `wu_res` VALUES ('1042', '1', 'res/201509/06/', '01ef8ecd64ec452b.jpg', 'jpg', 'res/201509/06/01ef8ecd64ec452b.jpg', 'res/201509/06/_1042.jpg', '1441508820', 'PHPOK4，经典在继续', 'a:2:{s:5:\"width\";i:980;s:6:\"height\";i:180;}', '', '', '0', '0', '1');
INSERT INTO `wu_res` VALUES ('1043', '1', 'res/201509/06/', '3202d207ef467cda.jpg', 'jpg', 'res/201509/06/3202d207ef467cda.jpg', 'res/201509/06/_1043.jpg', '1441508820', 'PHPOK4，经典企业建站系统', 'a:2:{s:5:\"width\";i:980;s:6:\"height\";i:180;}', '', '', '0', '0', '1');
INSERT INTO `wu_res` VALUES ('1117', '1', 'res/201510/27/', '095175723d9b74cf.jpg', 'jpg', 'res/201510/27/095175723d9b74cf.jpg', 'res/201510/27/_1117.jpg', '1445930390', '100x100', 'a:2:{s:5:\"width\";i:100;s:6:\"height\";i:100;}', '', '', '0', '0', '1');
INSERT INTO `wu_res` VALUES ('1120', '1', 'res/201512/14/', '68a520e799122aba.jpg', 'jpg', 'res/201512/14/68a520e799122aba.jpg', 'res/201512/14/_1120.jpg', '1450063499', '002', 'a:2:{s:5:\"width\";i:500;s:6:\"height\";i:500;}', '', '', '0', '0', '1');
INSERT INTO `wu_res` VALUES ('1119', '1', 'res/201512/14/', '18826ad78276a076.jpg', 'jpg', 'res/201512/14/18826ad78276a076.jpg', 'res/201512/14/_1119.jpg', '1450060530', '001', 'a:2:{s:5:\"width\";i:500;s:6:\"height\";i:500;}', '', '', '0', '0', '1');
INSERT INTO `wu_res` VALUES ('1121', '1', 'res/201512/14/', '8bcd24d491784ad4.jpg', 'jpg', 'res/201512/14/8bcd24d491784ad4.jpg', 'res/201512/14/_1121.jpg', '1450066100', '001', 'a:2:{s:5:\"width\";i:750;s:6:\"height\";i:750;}', '', '', '0', '0', '1');
INSERT INTO `wu_res` VALUES ('1122', '1', 'res/201512/14/', '8422d8f0debab240.jpg', 'jpg', 'res/201512/14/8422d8f0debab240.jpg', 'res/201512/14/_1122.jpg', '1450066101', '002', 'a:2:{s:5:\"width\";i:750;s:6:\"height\";i:750;}', '', '', '0', '0', '1');
INSERT INTO `wu_res` VALUES ('1123', '1', 'res/201512/14/', '6770cbd0a8a8393f.jpg', 'jpg', 'res/201512/14/6770cbd0a8a8393f.jpg', 'res/201512/14/_1123.jpg', '1450066557', '001', 'a:2:{s:5:\"width\";i:600;s:6:\"height\";i:600;}', '', '', '0', '0', '1');
INSERT INTO `wu_res` VALUES ('1124', '1', 'res/201512/14/', '8059eb07544f97de.jpg', 'jpg', 'res/201512/14/8059eb07544f97de.jpg', 'res/201512/14/_1124.jpg', '1450066558', '002', 'a:2:{s:5:\"width\";i:500;s:6:\"height\";i:500;}', '', '', '0', '0', '1');
INSERT INTO `wu_res` VALUES ('1125', '1', 'res/201512/14/', '1d5a32c753050d2e.jpg', 'jpg', 'res/201512/14/1d5a32c753050d2e.jpg', 'res/201512/14/_1125.jpg', '1450067141', '001', 'a:2:{s:5:\"width\";i:600;s:6:\"height\";i:600;}', '', '', '0', '1', '1');
INSERT INTO `wu_res` VALUES ('1126', '1', 'res/201512/14/', '6a8bc10eefcb3618.jpg', 'jpg', 'res/201512/14/6a8bc10eefcb3618.jpg', 'res/201512/14/_1126.jpg', '1450067142', '002', 'a:2:{s:5:\"width\";i:500;s:6:\"height\";i:500;}', '', '', '0', '5', '1');
INSERT INTO `wu_res` VALUES ('1133', '1', 'res/201512/15/', 'e8c4e65ddb1e3084.jpg', 'jpg', 'res/201512/15/e8c4e65ddb1e3084.jpg', 'res/201512/15/_1133.jpg', '1450173247', '产品展示', 'a:2:{s:5:\"width\";i:980;s:6:\"height\";i:180;}', '', 'p5h3d865lr5kn35v0f0plkm9u3', '0', '0', '0');
INSERT INTO `wu_res` VALUES ('1132', '1', 'res/201512/15/', '3eaa1b66078b877b.jpg', 'jpg', 'res/201512/15/3eaa1b66078b877b.jpg', 'res/201512/15/_1132.jpg', '1450171796', '人才招聘', 'a:2:{s:5:\"width\";i:980;s:6:\"height\";i:180;}', '', '', '0', '0', '1');
INSERT INTO `wu_res` VALUES ('1134', '1', 'res/201512/17/', '753077bdbfb8419f.jpg', 'jpg', 'res/201512/17/753077bdbfb8419f.jpg', 'res/201512/17/_1134.jpg', '1450340951', '关于我们', 'a:2:{s:5:\"width\";i:980;s:6:\"height\";i:180;}', '', '', '0', '0', '1');
INSERT INTO `wu_res` VALUES ('1136', '1', 'res/201512/17/', '82c1df0cc9195c0a.jpg', 'jpg', 'res/201512/17/82c1df0cc9195c0a.jpg', 'res/201512/17/_1136.jpg', '1450341088', '产品展示', 'a:2:{s:5:\"width\";i:980;s:6:\"height\";i:180;}', '', '', '0', '0', '1');
INSERT INTO `wu_res` VALUES ('1137', '1', 'res/201512/17/', 'ebe95b50f8a5a5d3.jpg', 'jpg', 'res/201512/17/ebe95b50f8a5a5d3.jpg', 'res/201512/17/_1137.jpg', '1450341114', '资料下载', 'a:2:{s:5:\"width\";i:980;s:6:\"height\";i:180;}', '', '', '0', '0', '1');
INSERT INTO `wu_res` VALUES ('1138', '1', 'res/201512/17/', '3fb43517555c4eab.jpg', 'jpg', 'res/201512/17/3fb43517555c4eab.jpg', 'res/201512/17/_1138.jpg', '1450341164', '公司相册', 'a:2:{s:5:\"width\";i:980;s:6:\"height\";i:180;}', '', '', '0', '0', '1');
INSERT INTO `wu_res` VALUES ('1139', '1', 'res/201512/17/', '6a0d30bd5fac255d.jpg', 'jpg', 'res/201512/17/6a0d30bd5fac255d.jpg', 'res/201512/17/_1139.jpg', '1450341195', '在线留言', 'a:2:{s:5:\"width\";i:980;s:6:\"height\";i:180;}', '', '', '0', '0', '1');
INSERT INTO `wu_res` VALUES ('1140', '1', 'res/201512/17/', '59e72786a79babd0.jpg', 'jpg', 'res/201512/17/59e72786a79babd0.jpg', 'res/201512/17/_1140.jpg', '1450341225', '联系我们', 'a:2:{s:5:\"width\";i:980;s:6:\"height\";i:180;}', '', '', '0', '0', '1');
INSERT INTO `wu_res` VALUES ('1147', '1', 'res/201512/31/', '9e520aae7eba822f.jpg', 'jpg', 'res/201512/31/9e520aae7eba822f.jpg', 'res/201512/31/_1147.jpg', '1451536445', '100x100', 'a:2:{s:5:\"width\";i:100;s:6:\"height\";i:100;}', '', '9oft5nkk6bg7e8rodmhe4i9101', '0', '0', '0');
INSERT INTO `wu_res` VALUES ('1148', '1', 'res/201606/16/', '1466046565_0_280.png', 'png', 'res/201606/16/1466046565_0_280.png', 'res/201606/16/_1148.png', '1466046606', '1466046565_0_280.png', 'a:2:{s:5:\"width\";i:150;s:6:\"height\";i:150;}', '', '', '0', '0', '1');
INSERT INTO `wu_res` VALUES ('1149', '1', 'res/201606/16/', '1466046565_0_873.jpg', 'jpg', 'res/201606/16/1466046565_0_873.jpg', 'res/201606/16/_1149.jpg', '1466046606', '1466046565_0_873.jpg', 'a:2:{s:5:\"width\";i:525;s:6:\"height\";i:308;}', '', '', '0', '0', '1');
INSERT INTO `wu_res` VALUES ('1150', '1', 'res/201706/10/', '8708ae3553f98bd6.png', 'png', 'res/201706/10/8708ae3553f98bd6.png', 'res/201706/10/_1150.png', '1497055653', 'logo', 'a:2:{s:5:\"width\";i:325;s:6:\"height\";i:305;}', '', '', '0', '0', '1');
INSERT INTO `wu_res` VALUES ('1151', '1', 'res/201706/10/', 'b3951b089f4ccab1.png', 'png', 'res/201706/10/b3951b089f4ccab1.png', 'res/201706/10/_1151.png', '1497055811', 'logo', 'a:2:{s:5:\"width\";i:94;s:6:\"height\";i:88;}', '', '', '0', '0', '1');
INSERT INTO `wu_res` VALUES ('1152', '1', 'res/201706/10/', 'fc63d7c67aa264d8_14_0.619831', '619831', 'res/201706/10/fc63d7c67aa264d8_14_0.619831', 'images/filetype-large/unknown.jpg', '1497061598', 'staticimage?center=114.047795,22&zoom=15&width=530&height=340&markers=114.047795,22', '', '', '', '0', '0', '1');
INSERT INTO `wu_res` VALUES ('1153', '1', 'res/201706/10/', '57559148d8271069.png', 'png', 'res/201706/10/57559148d8271069.png', 'res/201706/10/_1153.png', '1497061766', '未标题-3', 'a:2:{s:5:\"width\";i:1821;s:6:\"height\";i:589;}', '', '', '0', '0', '1');
INSERT INTO `wu_res` VALUES ('1154', '1', 'res/201706/10/', '0faf389ac1f246b0.jpg', 'jpg', 'res/201706/10/0faf389ac1f246b0.jpg', 'res/201706/10/_1154.jpg', '1497090433', '1封面', 'a:2:{s:5:\"width\";i:2480;s:6:\"height\";i:1205;}', '', '', '0', '0', '1');
INSERT INTO `wu_res` VALUES ('1155', '1', 'res/201706/10/', 'c2d4c8c38457c7f4.jpg', 'jpg', 'res/201706/10/c2d4c8c38457c7f4.jpg', 'res/201706/10/_1155.jpg', '1497090503', '7', 'a:2:{s:5:\"width\";i:4961;s:6:\"height\";i:1831;}', '', '', '0', '0', '1');
INSERT INTO `wu_res` VALUES ('1156', '1', 'res/201706/10/', '0aefd688bcecae4a.jpg', 'jpg', 'res/201706/10/0aefd688bcecae4a.jpg', 'res/201706/10/_1156.jpg', '1497090883', '工厂图片', 'a:2:{s:5:\"width\";i:2480;s:6:\"height\";i:1831;}', '', '', '0', '0', '1');
INSERT INTO `wu_res` VALUES ('1157', '1', 'res/201706/10/', '5e07477072c816cc.jpg', 'jpg', 'res/201706/10/5e07477072c816cc.jpg', 'res/201706/10/_1157.jpg', '1497090887', '盒子图片', 'a:2:{s:5:\"width\";i:2953;s:6:\"height\";i:2953;}', '', '', '0', '0', '1');
INSERT INTO `wu_res` VALUES ('1158', '1', 'res/201706/10/', '26b89c6b02cc2f29.png', 'png', 'res/201706/10/26b89c6b02cc2f29.png', 'res/201706/10/_1158.png', '1497094140', 'namec', 'a:2:{s:5:\"width\";i:1064;s:6:\"height\";i:99;}', '', '', '0', '0', '1');
INSERT INTO `wu_res` VALUES ('1159', '1', 'res/201706/10/', 'f0d062804ba44310.png', 'png', 'res/201706/10/f0d062804ba44310.png', 'res/201706/10/_1159.png', '1497094597', 'lm', 'a:2:{s:5:\"width\";i:812;s:6:\"height\";i:98;}', '', '', '0', '0', '1');
INSERT INTO `wu_res` VALUES ('1160', '1', 'res/201706/10/', 'b249c25b189701a9.jpg', 'jpg', 'res/201706/10/b249c25b189701a9.jpg', 'res/201706/10/_1160.jpg', '1497095849', '3 拷贝', 'a:2:{s:5:\"width\";i:2480;s:6:\"height\";i:1831;}', '', '', '0', '0', '1');
INSERT INTO `wu_res` VALUES ('1161', '1', 'res/201706/10/', '7115bd3fa67e850a.jpg', 'jpg', 'res/201706/10/7115bd3fa67e850a.jpg', 'res/201706/10/_1161.jpg', '1497095911', 'wth 附图', 'a:2:{s:5:\"width\";i:800;s:6:\"height\";i:800;}', '', '', '0', '0', '1');
INSERT INTO `wu_res` VALUES ('1162', '1', 'res/201706/10/', '21719183766c1b21.jpg', 'jpg', 'res/201706/10/21719183766c1b21.jpg', 'res/201706/10/_1162.jpg', '1497095911', '3 拷贝', 'a:2:{s:5:\"width\";i:2480;s:6:\"height\";i:1831;}', '', '', '0', '0', '1');
INSERT INTO `wu_res` VALUES ('1163', '1', 'res/201706/10/', 'd3ff1c6837ba5626.jpg', 'jpg', 'res/201706/10/d3ff1c6837ba5626.jpg', 'res/201706/10/_1163.jpg', '1497095911', 'wt20', 'a:2:{s:5:\"width\";i:2480;s:6:\"height\";i:1831;}', '', '', '0', '0', '1');
INSERT INTO `wu_res` VALUES ('1164', '1', 'res/201706/10/', 'dd6b730aec2a89fa.jpg', 'jpg', 'res/201706/10/dd6b730aec2a89fa.jpg', 'res/201706/10/_1164.jpg', '1497096850', 'TB20wqBdXXXXXbbXpXXXXXXXXXX-825613311 拷贝', 'a:2:{s:5:\"width\";i:500;s:6:\"height\";i:500;}', '', '', '0', '0', '1');
INSERT INTO `wu_res` VALUES ('1165', '1', 'res/201706/10/', 'f0da4b42a93f5e92.jpg', 'jpg', 'res/201706/10/f0da4b42a93f5e92.jpg', 'res/201706/10/_1165.jpg', '1497096958', 'WT20-1', 'a:2:{s:5:\"width\";i:2953;s:6:\"height\";i:2953;}', '', '', '0', '0', '1');
INSERT INTO `wu_res` VALUES ('1166', '1', 'res/201706/10/', '66a07fbaba38c91c.jpg', 'jpg', 'res/201706/10/66a07fbaba38c91c.jpg', 'res/201706/10/_1166.jpg', '1497097036', 'WTh 附图', 'a:2:{s:5:\"width\";i:800;s:6:\"height\";i:800;}', '', '', '0', '0', '1');
INSERT INTO `wu_res` VALUES ('1167', '1', 'res/201706/10/', 'db95f1a705f6606d.jpg', 'jpg', 'res/201706/10/db95f1a705f6606d.jpg', 'res/201706/10/_1167.jpg', '1497097036', 'WT20', 'a:2:{s:5:\"width\";i:2480;s:6:\"height\";i:1831;}', '', '', '0', '0', '1');
INSERT INTO `wu_res` VALUES ('1168', '1', 'res/201706/10/', '82ee1dd05f710f50.jpg', 'jpg', 'res/201706/10/82ee1dd05f710f50.jpg', 'res/201706/10/_1168.jpg', '1497097593', '3 拷贝', 'a:2:{s:5:\"width\";i:2480;s:6:\"height\";i:1831;}', '', '', '0', '0', '1');
INSERT INTO `wu_res` VALUES ('1169', '1', 'res/201706/10/', '30978bea3ce28aa5.jpg', 'jpg', 'res/201706/10/30978bea3ce28aa5.jpg', 'res/201706/10/_1169.jpg', '1497097593', 'wt20', 'a:2:{s:5:\"width\";i:2480;s:6:\"height\";i:1831;}', '', '', '0', '0', '1');
INSERT INTO `wu_res` VALUES ('1170', '1', 'res/201706/10/', 'f7476eb602cfcc58.jpg', 'jpg', 'res/201706/10/f7476eb602cfcc58.jpg', 'res/201706/10/_1170.jpg', '1497097594', 'tb20wqbdxxxxxbbxpxxxxxxxxxx-825613311 拷贝', 'a:2:{s:5:\"width\";i:500;s:6:\"height\";i:500;}', '', '', '0', '0', '1');
INSERT INTO `wu_res` VALUES ('1171', '1', 'res/201706/10/', 'a9a816e8c1a7e536.jpg', 'jpg', 'res/201706/10/a9a816e8c1a7e536.jpg', 'res/201706/10/_1171.jpg', '1497097597', 'wth 附图', 'a:2:{s:5:\"width\";i:800;s:6:\"height\";i:800;}', '', '', '0', '0', '1');
INSERT INTO `wu_res` VALUES ('1172', '1', 'res/201706/10/', '6dbbbb6da359b8c7.jpg', 'jpg', 'res/201706/10/6dbbbb6da359b8c7.jpg', 'res/201706/10/_1172.jpg', '1497097676', 'WC20', 'a:2:{s:5:\"width\";i:2480;s:6:\"height\";i:1831;}', '', '', '0', '0', '1');
INSERT INTO `wu_res` VALUES ('1173', '1', 'res/201706/10/', 'd204ed3a3ec6f80a.jpg', 'jpg', 'res/201706/10/d204ed3a3ec6f80a.jpg', 'res/201706/10/_1173.jpg', '1497097677', 'WC 拷贝', 'a:2:{s:5:\"width\";i:2480;s:6:\"height\";i:1831;}', '', '', '0', '0', '1');
INSERT INTO `wu_res` VALUES ('1174', '1', 'res/201706/10/', 'c3f8bfb2946c2a79.jpg', 'jpg', 'res/201706/10/c3f8bfb2946c2a79.jpg', 'res/201706/10/_1174.jpg', '1497097682', 'WC20-1', 'a:2:{s:5:\"width\";i:2953;s:6:\"height\";i:2953;}', '', '', '0', '0', '1');
INSERT INTO `wu_res` VALUES ('1175', '1', 'res/201706/10/', '71b26da308bf94b6.jpg', 'jpg', 'res/201706/10/71b26da308bf94b6.jpg', 'res/201706/10/_1175.jpg', '1497097741', 'wc 拷贝', 'a:2:{s:5:\"width\";i:2480;s:6:\"height\";i:1831;}', '', '', '0', '0', '1');
INSERT INTO `wu_res` VALUES ('1176', '1', 'res/201706/10/', 'd8726be01e1545d0.jpg', 'jpg', 'res/201706/10/d8726be01e1545d0.jpg', 'res/201706/10/_1176.jpg', '1497097741', 'wc20-1', 'a:2:{s:5:\"width\";i:2953;s:6:\"height\";i:2953;}', '', '', '0', '0', '1');
INSERT INTO `wu_res` VALUES ('1177', '1', 'res/201706/10/', 'a614b8ad59fd8723.jpg', 'jpg', 'res/201706/10/a614b8ad59fd8723.jpg', 'res/201706/10/_1177.jpg', '1497097741', 'wc20', 'a:2:{s:5:\"width\";i:2480;s:6:\"height\";i:1831;}', '', '', '0', '0', '1');
INSERT INTO `wu_res` VALUES ('1178', '1', 'res/201706/10/', '1d43df3649e53fac.jpg', 'jpg', 'res/201706/10/1d43df3649e53fac.jpg', 'res/201706/10/_1178.jpg', '1497097851', 'WL 单只拷贝', 'a:2:{s:5:\"width\";i:2480;s:6:\"height\";i:1831;}', '', '', '0', '0', '1');
INSERT INTO `wu_res` VALUES ('1179', '1', 'res/201706/10/', '09fc887ca3d30ed0.jpg', 'jpg', 'res/201706/10/09fc887ca3d30ed0.jpg', 'res/201706/10/_1179.jpg', '1497097856', 'WL15', 'a:2:{s:5:\"width\";i:2953;s:6:\"height\";i:2953;}', '', '', '0', '0', '1');
INSERT INTO `wu_res` VALUES ('1180', '1', 'res/201706/10/', '01b6b0dee394b45a.jpg', 'jpg', 'res/201706/10/01b6b0dee394b45a.jpg', 'res/201706/10/_1180.jpg', '1497097861', 'WL20', 'a:2:{s:5:\"width\";i:2953;s:6:\"height\";i:2953;}', '', '', '0', '0', '1');
INSERT INTO `wu_res` VALUES ('1181', '1', 'res/201706/10/', 'aab75a4f2725f6fe.jpg', 'jpg', 'res/201706/10/aab75a4f2725f6fe.jpg', 'res/201706/10/_1181.jpg', '1497097952', 'wl 拷贝', 'a:2:{s:5:\"width\";i:2480;s:6:\"height\";i:1831;}', '', '', '0', '0', '1');
INSERT INTO `wu_res` VALUES ('1182', '1', 'res/201706/10/', '28a03f8abf2cdecc.jpg', 'jpg', 'res/201706/10/28a03f8abf2cdecc.jpg', 'res/201706/10/_1182.jpg', '1497097952', 'wl20', 'a:2:{s:5:\"width\";i:2953;s:6:\"height\";i:2953;}', '', '', '0', '0', '1');
INSERT INTO `wu_res` VALUES ('1183', '1', 'res/201706/10/', 'faf1ba5667fcd775.jpg', 'jpg', 'res/201706/10/faf1ba5667fcd775.jpg', 'res/201706/10/_1183.jpg', '1497098156', 'WP-1', 'a:2:{s:5:\"width\";i:2953;s:6:\"height\";i:2953;}', '', '', '0', '0', '1');
INSERT INTO `wu_res` VALUES ('1184', '1', 'res/201706/10/', '33ffa2a30a9d2f5d.jpg', 'jpg', 'res/201706/10/33ffa2a30a9d2f5d.jpg', 'res/201706/10/_1184.jpg', '1497098159', 'WP', 'a:2:{s:5:\"width\";i:2480;s:6:\"height\";i:1831;}', '', '', '0', '0', '1');
INSERT INTO `wu_res` VALUES ('1185', '1', 'res/201706/10/', '42c6bc2d3e9bc9d0.jpg', 'jpg', 'res/201706/10/42c6bc2d3e9bc9d0.jpg', 'res/201706/10/_1185.jpg', '1497098187', 'WP', 'a:2:{s:5:\"width\";i:2480;s:6:\"height\";i:1831;}', '', '', '0', '0', '1');
INSERT INTO `wu_res` VALUES ('1186', '1', 'res/201706/10/', '6649b680f5f2f194.jpg', 'jpg', 'res/201706/10/6649b680f5f2f194.jpg', 'res/201706/10/_1186.jpg', '1497098187', 'WP 拷贝', 'a:2:{s:5:\"width\";i:2480;s:6:\"height\";i:1831;}', '', '', '0', '0', '1');
INSERT INTO `wu_res` VALUES ('1187', '1', 'res/201706/10/', '8a729ca54de050ae.jpg', 'jpg', 'res/201706/10/8a729ca54de050ae.jpg', 'res/201706/10/_1187.jpg', '1497098193', 'WP-1', 'a:2:{s:5:\"width\";i:2953;s:6:\"height\";i:2953;}', '', '', '0', '0', '1');
INSERT INTO `wu_res` VALUES ('1188', '1', 'res/201706/10/', '4debb5e0a70d8234.jpg', 'jpg', 'res/201706/10/4debb5e0a70d8234.jpg', 'res/201706/10/_1188.jpg', '1497098235', 'wp', 'a:2:{s:5:\"width\";i:2480;s:6:\"height\";i:1831;}', '', '', '0', '0', '1');
INSERT INTO `wu_res` VALUES ('1189', '1', 'res/201706/10/', 'ba0b38b40d9e7b72.jpg', 'jpg', 'res/201706/10/ba0b38b40d9e7b72.jpg', 'res/201706/10/_1189.jpg', '1497098235', 'wp 拷贝', 'a:2:{s:5:\"width\";i:2480;s:6:\"height\";i:1831;}', '', '', '0', '0', '1');
INSERT INTO `wu_res` VALUES ('1190', '1', 'res/201706/10/', '0eb002c69c9bdfbb.jpg', 'jpg', 'res/201706/10/0eb002c69c9bdfbb.jpg', 'res/201706/10/_1190.jpg', '1497098235', 'wp-1', 'a:2:{s:5:\"width\";i:2953;s:6:\"height\";i:2953;}', '', '', '0', '0', '1');
INSERT INTO `wu_res` VALUES ('1191', '1', 'res/201706/10/', 'f4c439986277cb0d.jpg', 'jpg', 'res/201706/10/f4c439986277cb0d.jpg', 'res/201706/10/_1191.jpg', '1497098389', 'fjjfdksjf', 'a:2:{s:5:\"width\";i:2480;s:6:\"height\";i:1831;}', '', '', '0', '0', '1');
INSERT INTO `wu_res` VALUES ('1192', '1', 'res/201706/10/', 'c2609cf1822aefca.jpg', 'jpg', 'res/201706/10/c2609cf1822aefca.jpg', 'res/201706/10/_1192.jpg', '1497098390', 'ggdga', 'a:2:{s:5:\"width\";i:2480;s:6:\"height\";i:1831;}', '', '', '0', '0', '1');
INSERT INTO `wu_res` VALUES ('1193', '1', 'res/201706/10/', '7ea84feed3d2bc28.jpg', 'jpg', 'res/201706/10/7ea84feed3d2bc28.jpg', 'res/201706/10/_1193.jpg', '1497098391', 'hihfh', 'a:2:{s:5:\"width\";i:2953;s:6:\"height\";i:2953;}', '', '', '0', '0', '1');
INSERT INTO `wu_res` VALUES ('1194', '1', 'res/201706/17/', '42e2afb3e9ab4767.jpg', 'jpg', 'res/201706/17/42e2afb3e9ab4767.jpg', 'res/201706/17/_1194.jpg', '1497660202', 'WZ8-1', 'a:2:{s:5:\"width\";i:2953;s:6:\"height\";i:2953;}', '', '', '0', '0', '1');
INSERT INTO `wu_res` VALUES ('1195', '1', 'res/201706/17/', '040d5b986b169d22.jpg', 'jpg', 'res/201706/17/040d5b986b169d22.jpg', 'res/201706/17/_1195.jpg', '1497660296', 'wzr 拷贝', 'a:2:{s:5:\"width\";i:2480;s:6:\"height\";i:1831;}', '', '', '0', '0', '1');
INSERT INTO `wu_res` VALUES ('1196', '1', 'res/201706/17/', 'd8114483f7052d03.jpg', 'jpg', 'res/201706/17/d8114483f7052d03.jpg', 'res/201706/17/_1196.jpg', '1497660296', 'wz8', 'a:2:{s:5:\"width\";i:2480;s:6:\"height\";i:1831;}', '', '', '0', '0', '1');
INSERT INTO `wu_res` VALUES ('1197', '1', 'res/201706/17/', '17dc6c4c2ca80984.jpg', 'jpg', 'res/201706/17/17dc6c4c2ca80984.jpg', 'res/201706/17/_1197.jpg', '1497660423', 'WY 拷贝', 'a:2:{s:5:\"width\";i:2480;s:6:\"height\";i:1831;}', '', '', '0', '0', '1');
INSERT INTO `wu_res` VALUES ('1198', '1', 'res/201706/17/', '27f661e90c7e0b84.jpg', 'jpg', 'res/201706/17/27f661e90c7e0b84.jpg', 'res/201706/17/_1198.jpg', '1497660509', 'WR 拷贝', 'a:2:{s:5:\"width\";i:2480;s:6:\"height\";i:1831;}', '', '', '0', '0', '1');
INSERT INTO `wu_res` VALUES ('1199', '1', 'res/201706/17/', '9fcfb71d356b9dd4.jpg', 'jpg', 'res/201706/17/9fcfb71d356b9dd4.jpg', 'res/201706/17/_1199.jpg', '1497660509', 'WR', 'a:2:{s:5:\"width\";i:2480;s:6:\"height\";i:1831;}', '', '', '0', '0', '1');
INSERT INTO `wu_res` VALUES ('1200', '1', 'res/201706/17/', 'cadfc495abbf44eb.jpg', 'jpg', 'res/201706/17/cadfc495abbf44eb.jpg', 'res/201706/17/_1200.jpg', '1497660515', 'WR-1', 'a:2:{s:5:\"width\";i:2953;s:6:\"height\";i:2953;}', '', '', '0', '0', '1');
INSERT INTO `wu_res` VALUES ('1201', '1', 'res/201706/17/', 'dadc8fd416dd1d90.jpg', 'jpg', 'res/201706/17/dadc8fd416dd1d90.jpg', 'res/201706/17/_1201.jpg', '1497660615', 'timg', 'a:2:{s:5:\"width\";i:600;s:6:\"height\";i:272;}', '', '', '0', '0', '1');
INSERT INTO `wu_res` VALUES ('1202', '1', 'res/201706/17/', '4d47a5ffa33c2133.jpg', 'jpg', 'res/201706/17/4d47a5ffa33c2133.jpg', 'res/201706/17/_1202.jpg', '1497660615', '7 拷贝', 'a:2:{s:5:\"width\";i:4961;s:6:\"height\";i:1831;}', '', '', '0', '0', '1');

-- ----------------------------
-- Table structure for wu_res_cate
-- ----------------------------
DROP TABLE IF EXISTS `wu_res_cate`;
CREATE TABLE `wu_res_cate` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '资源分类ID',
  `title` varchar(255) NOT NULL COMMENT '分类名称',
  `root` varchar(255) NOT NULL DEFAULT '/' COMMENT '存储目录',
  `folder` varchar(255) NOT NULL DEFAULT 'Ym/d/' COMMENT '存储目录格式',
  `is_default` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1默认0非默认',
  `filetypes` varchar(255) NOT NULL COMMENT '附件类型',
  `typeinfo` varchar(200) NOT NULL COMMENT '类型说明',
  `gdtypes` varchar(255) NOT NULL COMMENT '支持的GD方案，多个GD方案用英文ID分开',
  `gdall` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1支持全部GD方案0仅支持指定的GD方案',
  `ico` tinyint(1) NOT NULL DEFAULT '0' COMMENT '后台缩略图',
  `filemax` int(10) unsigned NOT NULL DEFAULT '2' COMMENT '上传文件大小限制',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='资源分类存储';

-- ----------------------------
-- Records of wu_res_cate
-- ----------------------------
INSERT INTO `wu_res_cate` VALUES ('1', '默认分类', 'res/', 'Ym/d/', '1', 'png,jpg,gif,rar,zip', '文件', '', '1', '1', '20480');

-- ----------------------------
-- Table structure for wu_res_ext
-- ----------------------------
DROP TABLE IF EXISTS `wu_res_ext`;
CREATE TABLE `wu_res_ext` (
  `res_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '附件ID',
  `gd_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'GD库方案ID',
  `filename` varchar(255) NOT NULL COMMENT '文件地址（含路径）',
  `filetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后',
  PRIMARY KEY (`res_id`,`gd_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='生成扩展图片';

-- ----------------------------
-- Records of wu_res_ext
-- ----------------------------
INSERT INTO `wu_res_ext` VALUES ('964', '30', 'res/201509/05/mobile_964.png', '1451191865');
INSERT INTO `wu_res_ext` VALUES ('965', '30', 'res/201509/05/mobile_965.jpg', '1451191864');
INSERT INTO `wu_res_ext` VALUES ('966', '30', 'res/201509/05/mobile_966.jpg', '1451191862');
INSERT INTO `wu_res_ext` VALUES ('967', '30', 'res/201509/05/mobile_967.jpg', '1451191861');
INSERT INTO `wu_res_ext` VALUES ('1135', '30', 'res/201512/17/mobile_1135.jpg', '1451191841');
INSERT INTO `wu_res_ext` VALUES ('1042', '30', 'res/201509/06/mobile_1042.jpg', '1451191860');
INSERT INTO `wu_res_ext` VALUES ('1043', '30', 'res/201509/06/mobile_1043.jpg', '1451191858');
INSERT INTO `wu_res_ext` VALUES ('1117', '30', 'res/201510/27/mobile_1117.jpg', '1451191857');
INSERT INTO `wu_res_ext` VALUES ('1120', '30', 'res/201512/14/mobile_1120.jpg', '1451191855');
INSERT INTO `wu_res_ext` VALUES ('1119', '30', 'res/201512/14/mobile_1119.jpg', '1451191856');
INSERT INTO `wu_res_ext` VALUES ('1121', '30', 'res/201512/14/mobile_1121.jpg', '1451191853');
INSERT INTO `wu_res_ext` VALUES ('1122', '30', 'res/201512/14/mobile_1122.jpg', '1451191852');
INSERT INTO `wu_res_ext` VALUES ('1123', '30', 'res/201512/14/mobile_1123.jpg', '1451191850');
INSERT INTO `wu_res_ext` VALUES ('1124', '30', 'res/201512/14/mobile_1124.jpg', '1451191849');
INSERT INTO `wu_res_ext` VALUES ('1125', '30', 'res/201512/14/mobile_1125.jpg', '1451191848');
INSERT INTO `wu_res_ext` VALUES ('1126', '30', 'res/201512/14/mobile_1126.jpg', '1451191846');
INSERT INTO `wu_res_ext` VALUES ('1133', '30', 'res/201512/15/mobile_1133.jpg', '1451191844');
INSERT INTO `wu_res_ext` VALUES ('1132', '30', 'res/201512/15/mobile_1132.jpg', '1451191845');
INSERT INTO `wu_res_ext` VALUES ('1134', '30', 'res/201512/17/mobile_1134.jpg', '1451191843');
INSERT INTO `wu_res_ext` VALUES ('1136', '30', 'res/201512/17/mobile_1136.jpg', '1451191840');
INSERT INTO `wu_res_ext` VALUES ('1137', '30', 'res/201512/17/mobile_1137.jpg', '1451191839');
INSERT INTO `wu_res_ext` VALUES ('1138', '30', 'res/201512/17/mobile_1138.jpg', '1451191838');
INSERT INTO `wu_res_ext` VALUES ('1139', '30', 'res/201512/17/mobile_1139.jpg', '1451191837');
INSERT INTO `wu_res_ext` VALUES ('1140', '30', 'res/201512/17/mobile_1140.jpg', '1451191835');
INSERT INTO `wu_res_ext` VALUES ('1140', '12', 'res/201512/17/auto_1140.jpg', '1451191835');
INSERT INTO `wu_res_ext` VALUES ('1140', '2', 'res/201512/17/thumb_1140.jpg', '1451191835');
INSERT INTO `wu_res_ext` VALUES ('1139', '12', 'res/201512/17/auto_1139.jpg', '1451191837');
INSERT INTO `wu_res_ext` VALUES ('1139', '2', 'res/201512/17/thumb_1139.jpg', '1451191837');
INSERT INTO `wu_res_ext` VALUES ('1138', '12', 'res/201512/17/auto_1138.jpg', '1451191838');
INSERT INTO `wu_res_ext` VALUES ('1138', '2', 'res/201512/17/thumb_1138.jpg', '1451191838');
INSERT INTO `wu_res_ext` VALUES ('1137', '12', 'res/201512/17/auto_1137.jpg', '1451191839');
INSERT INTO `wu_res_ext` VALUES ('1137', '2', 'res/201512/17/thumb_1137.jpg', '1451191839');
INSERT INTO `wu_res_ext` VALUES ('1136', '12', 'res/201512/17/auto_1136.jpg', '1451191840');
INSERT INTO `wu_res_ext` VALUES ('1136', '2', 'res/201512/17/thumb_1136.jpg', '1451191840');
INSERT INTO `wu_res_ext` VALUES ('1135', '12', 'res/201512/17/auto_1135.jpg', '1451191841');
INSERT INTO `wu_res_ext` VALUES ('1135', '2', 'res/201512/17/thumb_1135.jpg', '1451191841');
INSERT INTO `wu_res_ext` VALUES ('1134', '12', 'res/201512/17/auto_1134.jpg', '1451191843');
INSERT INTO `wu_res_ext` VALUES ('1134', '2', 'res/201512/17/thumb_1134.jpg', '1451191843');
INSERT INTO `wu_res_ext` VALUES ('1133', '12', 'res/201512/15/auto_1133.jpg', '1451191844');
INSERT INTO `wu_res_ext` VALUES ('1133', '2', 'res/201512/15/thumb_1133.jpg', '1451191844');
INSERT INTO `wu_res_ext` VALUES ('1132', '12', 'res/201512/15/auto_1132.jpg', '1451191845');
INSERT INTO `wu_res_ext` VALUES ('1132', '2', 'res/201512/15/thumb_1132.jpg', '1451191845');
INSERT INTO `wu_res_ext` VALUES ('1126', '12', 'res/201512/14/auto_1126.jpg', '1451191846');
INSERT INTO `wu_res_ext` VALUES ('1126', '2', 'res/201512/14/thumb_1126.jpg', '1451191846');
INSERT INTO `wu_res_ext` VALUES ('1125', '12', 'res/201512/14/auto_1125.jpg', '1451191848');
INSERT INTO `wu_res_ext` VALUES ('1125', '2', 'res/201512/14/thumb_1125.jpg', '1451191848');
INSERT INTO `wu_res_ext` VALUES ('1124', '12', 'res/201512/14/auto_1124.jpg', '1451191849');
INSERT INTO `wu_res_ext` VALUES ('1124', '2', 'res/201512/14/thumb_1124.jpg', '1451191849');
INSERT INTO `wu_res_ext` VALUES ('1123', '12', 'res/201512/14/auto_1123.jpg', '1451191850');
INSERT INTO `wu_res_ext` VALUES ('1123', '2', 'res/201512/14/thumb_1123.jpg', '1451191850');
INSERT INTO `wu_res_ext` VALUES ('1122', '12', 'res/201512/14/auto_1122.jpg', '1451191852');
INSERT INTO `wu_res_ext` VALUES ('1122', '2', 'res/201512/14/thumb_1122.jpg', '1451191852');
INSERT INTO `wu_res_ext` VALUES ('1121', '12', 'res/201512/14/auto_1121.jpg', '1451191853');
INSERT INTO `wu_res_ext` VALUES ('1121', '2', 'res/201512/14/thumb_1121.jpg', '1451191853');
INSERT INTO `wu_res_ext` VALUES ('1120', '12', 'res/201512/14/auto_1120.jpg', '1451191855');
INSERT INTO `wu_res_ext` VALUES ('1120', '2', 'res/201512/14/thumb_1120.jpg', '1451191855');
INSERT INTO `wu_res_ext` VALUES ('1119', '12', 'res/201512/14/auto_1119.jpg', '1451191856');
INSERT INTO `wu_res_ext` VALUES ('1119', '2', 'res/201512/14/thumb_1119.jpg', '1451191856');
INSERT INTO `wu_res_ext` VALUES ('1117', '12', 'res/201510/27/auto_1117.jpg', '1451191857');
INSERT INTO `wu_res_ext` VALUES ('1117', '2', 'res/201510/27/thumb_1117.jpg', '1451191857');
INSERT INTO `wu_res_ext` VALUES ('1043', '12', 'res/201509/06/auto_1043.jpg', '1451191858');
INSERT INTO `wu_res_ext` VALUES ('1043', '2', 'res/201509/06/thumb_1043.jpg', '1451191858');
INSERT INTO `wu_res_ext` VALUES ('1042', '12', 'res/201509/06/auto_1042.jpg', '1451191860');
INSERT INTO `wu_res_ext` VALUES ('1042', '2', 'res/201509/06/thumb_1042.jpg', '1451191860');
INSERT INTO `wu_res_ext` VALUES ('967', '12', 'res/201509/05/auto_967.jpg', '1451191861');
INSERT INTO `wu_res_ext` VALUES ('967', '2', 'res/201509/05/thumb_967.jpg', '1451191861');
INSERT INTO `wu_res_ext` VALUES ('966', '12', 'res/201509/05/auto_966.jpg', '1451191862');
INSERT INTO `wu_res_ext` VALUES ('966', '2', 'res/201509/05/thumb_966.jpg', '1451191862');
INSERT INTO `wu_res_ext` VALUES ('965', '12', 'res/201509/05/auto_965.jpg', '1451191864');
INSERT INTO `wu_res_ext` VALUES ('965', '2', 'res/201509/05/thumb_965.jpg', '1451191864');
INSERT INTO `wu_res_ext` VALUES ('964', '12', 'res/201509/05/auto_964.png', '1451191865');
INSERT INTO `wu_res_ext` VALUES ('964', '2', 'res/201509/05/thumb_964.png', '1451191865');
INSERT INTO `wu_res_ext` VALUES ('1147', '30', 'res/201512/31/mobile_1147.jpg', '1451536445');
INSERT INTO `wu_res_ext` VALUES ('1147', '12', 'res/201512/31/auto_1147.jpg', '1451536445');
INSERT INTO `wu_res_ext` VALUES ('1147', '2', 'res/201512/31/thumb_1147.jpg', '1451536445');
INSERT INTO `wu_res_ext` VALUES ('1148', '30', 'res/201606/16/mobile_1148.png', '1466046606');
INSERT INTO `wu_res_ext` VALUES ('1148', '12', 'res/201606/16/auto_1148.png', '1466046606');
INSERT INTO `wu_res_ext` VALUES ('1148', '2', 'res/201606/16/thumb_1148.png', '1466046606');
INSERT INTO `wu_res_ext` VALUES ('1149', '30', 'res/201606/16/mobile_1149.jpg', '1466046606');
INSERT INTO `wu_res_ext` VALUES ('1149', '12', 'res/201606/16/auto_1149.jpg', '1466046606');
INSERT INTO `wu_res_ext` VALUES ('1149', '2', 'res/201606/16/thumb_1149.jpg', '1466046606');
INSERT INTO `wu_res_ext` VALUES ('1150', '30', 'res/201706/10/mobile_1150.png', '1497055653');
INSERT INTO `wu_res_ext` VALUES ('1150', '12', 'res/201706/10/auto_1150.png', '1497055653');
INSERT INTO `wu_res_ext` VALUES ('1150', '2', 'res/201706/10/thumb_1150.png', '1497055653');
INSERT INTO `wu_res_ext` VALUES ('1151', '30', 'res/201706/10/mobile_1151.png', '1497055811');
INSERT INTO `wu_res_ext` VALUES ('1151', '12', 'res/201706/10/auto_1151.png', '1497055811');
INSERT INTO `wu_res_ext` VALUES ('1151', '2', 'res/201706/10/thumb_1151.png', '1497055811');
INSERT INTO `wu_res_ext` VALUES ('1153', '30', 'res/201706/10/mobile_1153.png', '1497061766');
INSERT INTO `wu_res_ext` VALUES ('1153', '12', 'res/201706/10/auto_1153.png', '1497061766');
INSERT INTO `wu_res_ext` VALUES ('1153', '2', 'res/201706/10/thumb_1153.png', '1497061766');
INSERT INTO `wu_res_ext` VALUES ('1154', '30', 'res/201706/10/mobile_1154.jpg', '1497090433');
INSERT INTO `wu_res_ext` VALUES ('1154', '12', 'res/201706/10/auto_1154.jpg', '1497090433');
INSERT INTO `wu_res_ext` VALUES ('1154', '2', 'res/201706/10/thumb_1154.jpg', '1497090433');
INSERT INTO `wu_res_ext` VALUES ('1155', '30', 'res/201706/10/mobile_1155.jpg', '1497090503');
INSERT INTO `wu_res_ext` VALUES ('1155', '12', 'res/201706/10/auto_1155.jpg', '1497090503');
INSERT INTO `wu_res_ext` VALUES ('1155', '2', 'res/201706/10/thumb_1155.jpg', '1497090503');
INSERT INTO `wu_res_ext` VALUES ('1156', '30', 'res/201706/10/mobile_1156.jpg', '1497090883');
INSERT INTO `wu_res_ext` VALUES ('1156', '12', 'res/201706/10/auto_1156.jpg', '1497090883');
INSERT INTO `wu_res_ext` VALUES ('1156', '2', 'res/201706/10/thumb_1156.jpg', '1497090883');
INSERT INTO `wu_res_ext` VALUES ('1157', '30', 'res/201706/10/mobile_1157.jpg', '1497090887');
INSERT INTO `wu_res_ext` VALUES ('1157', '12', 'res/201706/10/auto_1157.jpg', '1497090887');
INSERT INTO `wu_res_ext` VALUES ('1157', '2', 'res/201706/10/thumb_1157.jpg', '1497090887');
INSERT INTO `wu_res_ext` VALUES ('1158', '30', 'res/201706/10/mobile_1158.png', '1497094140');
INSERT INTO `wu_res_ext` VALUES ('1158', '12', 'res/201706/10/auto_1158.png', '1497094140');
INSERT INTO `wu_res_ext` VALUES ('1158', '2', 'res/201706/10/thumb_1158.png', '1497094140');
INSERT INTO `wu_res_ext` VALUES ('1159', '30', 'res/201706/10/mobile_1159.png', '1497094597');
INSERT INTO `wu_res_ext` VALUES ('1159', '12', 'res/201706/10/auto_1159.png', '1497094597');
INSERT INTO `wu_res_ext` VALUES ('1159', '2', 'res/201706/10/thumb_1159.png', '1497094597');
INSERT INTO `wu_res_ext` VALUES ('1160', '30', 'res/201706/10/mobile_1160.jpg', '1497095849');
INSERT INTO `wu_res_ext` VALUES ('1160', '12', 'res/201706/10/auto_1160.jpg', '1497095849');
INSERT INTO `wu_res_ext` VALUES ('1160', '2', 'res/201706/10/thumb_1160.jpg', '1497095849');
INSERT INTO `wu_res_ext` VALUES ('1161', '30', 'res/201706/10/mobile_1161.jpg', '1497095911');
INSERT INTO `wu_res_ext` VALUES ('1161', '12', 'res/201706/10/auto_1161.jpg', '1497095911');
INSERT INTO `wu_res_ext` VALUES ('1161', '2', 'res/201706/10/thumb_1161.jpg', '1497095911');
INSERT INTO `wu_res_ext` VALUES ('1162', '30', 'res/201706/10/mobile_1162.jpg', '1497095911');
INSERT INTO `wu_res_ext` VALUES ('1162', '12', 'res/201706/10/auto_1162.jpg', '1497095911');
INSERT INTO `wu_res_ext` VALUES ('1162', '2', 'res/201706/10/thumb_1162.jpg', '1497095911');
INSERT INTO `wu_res_ext` VALUES ('1163', '30', 'res/201706/10/mobile_1163.jpg', '1497095911');
INSERT INTO `wu_res_ext` VALUES ('1163', '12', 'res/201706/10/auto_1163.jpg', '1497095911');
INSERT INTO `wu_res_ext` VALUES ('1163', '2', 'res/201706/10/thumb_1163.jpg', '1497095911');
INSERT INTO `wu_res_ext` VALUES ('1164', '30', 'res/201706/10/mobile_1164.jpg', '1497096850');
INSERT INTO `wu_res_ext` VALUES ('1164', '12', 'res/201706/10/auto_1164.jpg', '1497096850');
INSERT INTO `wu_res_ext` VALUES ('1164', '2', 'res/201706/10/thumb_1164.jpg', '1497096850');
INSERT INTO `wu_res_ext` VALUES ('1165', '30', 'res/201706/10/mobile_1165.jpg', '1497096958');
INSERT INTO `wu_res_ext` VALUES ('1165', '12', 'res/201706/10/auto_1165.jpg', '1497096958');
INSERT INTO `wu_res_ext` VALUES ('1165', '2', 'res/201706/10/thumb_1165.jpg', '1497096958');
INSERT INTO `wu_res_ext` VALUES ('1166', '30', 'res/201706/10/mobile_1166.jpg', '1497097036');
INSERT INTO `wu_res_ext` VALUES ('1166', '12', 'res/201706/10/auto_1166.jpg', '1497097036');
INSERT INTO `wu_res_ext` VALUES ('1166', '2', 'res/201706/10/thumb_1166.jpg', '1497097036');
INSERT INTO `wu_res_ext` VALUES ('1167', '30', 'res/201706/10/mobile_1167.jpg', '1497097036');
INSERT INTO `wu_res_ext` VALUES ('1167', '12', 'res/201706/10/auto_1167.jpg', '1497097036');
INSERT INTO `wu_res_ext` VALUES ('1167', '2', 'res/201706/10/thumb_1167.jpg', '1497097036');
INSERT INTO `wu_res_ext` VALUES ('1168', '30', 'res/201706/10/mobile_1168.jpg', '1497097593');
INSERT INTO `wu_res_ext` VALUES ('1168', '12', 'res/201706/10/auto_1168.jpg', '1497097593');
INSERT INTO `wu_res_ext` VALUES ('1168', '2', 'res/201706/10/thumb_1168.jpg', '1497097593');
INSERT INTO `wu_res_ext` VALUES ('1169', '30', 'res/201706/10/mobile_1169.jpg', '1497097593');
INSERT INTO `wu_res_ext` VALUES ('1169', '12', 'res/201706/10/auto_1169.jpg', '1497097593');
INSERT INTO `wu_res_ext` VALUES ('1169', '2', 'res/201706/10/thumb_1169.jpg', '1497097593');
INSERT INTO `wu_res_ext` VALUES ('1170', '30', 'res/201706/10/mobile_1170.jpg', '1497097594');
INSERT INTO `wu_res_ext` VALUES ('1170', '12', 'res/201706/10/auto_1170.jpg', '1497097594');
INSERT INTO `wu_res_ext` VALUES ('1170', '2', 'res/201706/10/thumb_1170.jpg', '1497097594');
INSERT INTO `wu_res_ext` VALUES ('1171', '30', 'res/201706/10/mobile_1171.jpg', '1497097597');
INSERT INTO `wu_res_ext` VALUES ('1171', '12', 'res/201706/10/auto_1171.jpg', '1497097597');
INSERT INTO `wu_res_ext` VALUES ('1171', '2', 'res/201706/10/thumb_1171.jpg', '1497097597');
INSERT INTO `wu_res_ext` VALUES ('1172', '30', 'res/201706/10/mobile_1172.jpg', '1497097676');
INSERT INTO `wu_res_ext` VALUES ('1172', '12', 'res/201706/10/auto_1172.jpg', '1497097676');
INSERT INTO `wu_res_ext` VALUES ('1172', '2', 'res/201706/10/thumb_1172.jpg', '1497097676');
INSERT INTO `wu_res_ext` VALUES ('1173', '30', 'res/201706/10/mobile_1173.jpg', '1497097677');
INSERT INTO `wu_res_ext` VALUES ('1173', '12', 'res/201706/10/auto_1173.jpg', '1497097677');
INSERT INTO `wu_res_ext` VALUES ('1173', '2', 'res/201706/10/thumb_1173.jpg', '1497097677');
INSERT INTO `wu_res_ext` VALUES ('1174', '30', 'res/201706/10/mobile_1174.jpg', '1497097682');
INSERT INTO `wu_res_ext` VALUES ('1174', '12', 'res/201706/10/auto_1174.jpg', '1497097682');
INSERT INTO `wu_res_ext` VALUES ('1174', '2', 'res/201706/10/thumb_1174.jpg', '1497097682');
INSERT INTO `wu_res_ext` VALUES ('1175', '30', 'res/201706/10/mobile_1175.jpg', '1497097741');
INSERT INTO `wu_res_ext` VALUES ('1175', '12', 'res/201706/10/auto_1175.jpg', '1497097741');
INSERT INTO `wu_res_ext` VALUES ('1175', '2', 'res/201706/10/thumb_1175.jpg', '1497097741');
INSERT INTO `wu_res_ext` VALUES ('1176', '30', 'res/201706/10/mobile_1176.jpg', '1497097741');
INSERT INTO `wu_res_ext` VALUES ('1176', '12', 'res/201706/10/auto_1176.jpg', '1497097741');
INSERT INTO `wu_res_ext` VALUES ('1176', '2', 'res/201706/10/thumb_1176.jpg', '1497097741');
INSERT INTO `wu_res_ext` VALUES ('1177', '30', 'res/201706/10/mobile_1177.jpg', '1497097741');
INSERT INTO `wu_res_ext` VALUES ('1177', '12', 'res/201706/10/auto_1177.jpg', '1497097741');
INSERT INTO `wu_res_ext` VALUES ('1177', '2', 'res/201706/10/thumb_1177.jpg', '1497097741');
INSERT INTO `wu_res_ext` VALUES ('1178', '30', 'res/201706/10/mobile_1178.jpg', '1497097851');
INSERT INTO `wu_res_ext` VALUES ('1178', '12', 'res/201706/10/auto_1178.jpg', '1497097851');
INSERT INTO `wu_res_ext` VALUES ('1178', '2', 'res/201706/10/thumb_1178.jpg', '1497097851');
INSERT INTO `wu_res_ext` VALUES ('1179', '30', 'res/201706/10/mobile_1179.jpg', '1497097856');
INSERT INTO `wu_res_ext` VALUES ('1179', '12', 'res/201706/10/auto_1179.jpg', '1497097856');
INSERT INTO `wu_res_ext` VALUES ('1179', '2', 'res/201706/10/thumb_1179.jpg', '1497097856');
INSERT INTO `wu_res_ext` VALUES ('1180', '30', 'res/201706/10/mobile_1180.jpg', '1497097861');
INSERT INTO `wu_res_ext` VALUES ('1180', '12', 'res/201706/10/auto_1180.jpg', '1497097861');
INSERT INTO `wu_res_ext` VALUES ('1180', '2', 'res/201706/10/thumb_1180.jpg', '1497097861');
INSERT INTO `wu_res_ext` VALUES ('1181', '30', 'res/201706/10/mobile_1181.jpg', '1497097952');
INSERT INTO `wu_res_ext` VALUES ('1181', '12', 'res/201706/10/auto_1181.jpg', '1497097952');
INSERT INTO `wu_res_ext` VALUES ('1181', '2', 'res/201706/10/thumb_1181.jpg', '1497097952');
INSERT INTO `wu_res_ext` VALUES ('1182', '30', 'res/201706/10/mobile_1182.jpg', '1497097952');
INSERT INTO `wu_res_ext` VALUES ('1182', '12', 'res/201706/10/auto_1182.jpg', '1497097952');
INSERT INTO `wu_res_ext` VALUES ('1182', '2', 'res/201706/10/thumb_1182.jpg', '1497097952');
INSERT INTO `wu_res_ext` VALUES ('1183', '30', 'res/201706/10/mobile_1183.jpg', '1497098156');
INSERT INTO `wu_res_ext` VALUES ('1183', '12', 'res/201706/10/auto_1183.jpg', '1497098156');
INSERT INTO `wu_res_ext` VALUES ('1183', '2', 'res/201706/10/thumb_1183.jpg', '1497098156');
INSERT INTO `wu_res_ext` VALUES ('1184', '30', 'res/201706/10/mobile_1184.jpg', '1497098159');
INSERT INTO `wu_res_ext` VALUES ('1184', '12', 'res/201706/10/auto_1184.jpg', '1497098159');
INSERT INTO `wu_res_ext` VALUES ('1184', '2', 'res/201706/10/thumb_1184.jpg', '1497098159');
INSERT INTO `wu_res_ext` VALUES ('1185', '30', 'res/201706/10/mobile_1185.jpg', '1497098187');
INSERT INTO `wu_res_ext` VALUES ('1185', '12', 'res/201706/10/auto_1185.jpg', '1497098187');
INSERT INTO `wu_res_ext` VALUES ('1185', '2', 'res/201706/10/thumb_1185.jpg', '1497098187');
INSERT INTO `wu_res_ext` VALUES ('1186', '30', 'res/201706/10/mobile_1186.jpg', '1497098187');
INSERT INTO `wu_res_ext` VALUES ('1186', '12', 'res/201706/10/auto_1186.jpg', '1497098187');
INSERT INTO `wu_res_ext` VALUES ('1186', '2', 'res/201706/10/thumb_1186.jpg', '1497098187');
INSERT INTO `wu_res_ext` VALUES ('1187', '30', 'res/201706/10/mobile_1187.jpg', '1497098193');
INSERT INTO `wu_res_ext` VALUES ('1187', '12', 'res/201706/10/auto_1187.jpg', '1497098193');
INSERT INTO `wu_res_ext` VALUES ('1187', '2', 'res/201706/10/thumb_1187.jpg', '1497098193');
INSERT INTO `wu_res_ext` VALUES ('1188', '30', 'res/201706/10/mobile_1188.jpg', '1497098235');
INSERT INTO `wu_res_ext` VALUES ('1188', '12', 'res/201706/10/auto_1188.jpg', '1497098235');
INSERT INTO `wu_res_ext` VALUES ('1188', '2', 'res/201706/10/thumb_1188.jpg', '1497098235');
INSERT INTO `wu_res_ext` VALUES ('1189', '30', 'res/201706/10/mobile_1189.jpg', '1497098235');
INSERT INTO `wu_res_ext` VALUES ('1189', '12', 'res/201706/10/auto_1189.jpg', '1497098235');
INSERT INTO `wu_res_ext` VALUES ('1189', '2', 'res/201706/10/thumb_1189.jpg', '1497098235');
INSERT INTO `wu_res_ext` VALUES ('1190', '30', 'res/201706/10/mobile_1190.jpg', '1497098235');
INSERT INTO `wu_res_ext` VALUES ('1190', '12', 'res/201706/10/auto_1190.jpg', '1497098235');
INSERT INTO `wu_res_ext` VALUES ('1190', '2', 'res/201706/10/thumb_1190.jpg', '1497098235');
INSERT INTO `wu_res_ext` VALUES ('1191', '30', 'res/201706/10/mobile_1191.jpg', '1497098389');
INSERT INTO `wu_res_ext` VALUES ('1191', '12', 'res/201706/10/auto_1191.jpg', '1497098389');
INSERT INTO `wu_res_ext` VALUES ('1191', '2', 'res/201706/10/thumb_1191.jpg', '1497098389');
INSERT INTO `wu_res_ext` VALUES ('1192', '30', 'res/201706/10/mobile_1192.jpg', '1497098390');
INSERT INTO `wu_res_ext` VALUES ('1192', '12', 'res/201706/10/auto_1192.jpg', '1497098390');
INSERT INTO `wu_res_ext` VALUES ('1192', '2', 'res/201706/10/thumb_1192.jpg', '1497098390');
INSERT INTO `wu_res_ext` VALUES ('1193', '30', 'res/201706/10/mobile_1193.jpg', '1497098391');
INSERT INTO `wu_res_ext` VALUES ('1193', '12', 'res/201706/10/auto_1193.jpg', '1497098391');
INSERT INTO `wu_res_ext` VALUES ('1193', '2', 'res/201706/10/thumb_1193.jpg', '1497098391');
INSERT INTO `wu_res_ext` VALUES ('1194', '30', 'res/201706/17/mobile_1194.jpg', '1497660202');
INSERT INTO `wu_res_ext` VALUES ('1194', '12', 'res/201706/17/auto_1194.jpg', '1497660202');
INSERT INTO `wu_res_ext` VALUES ('1194', '2', 'res/201706/17/thumb_1194.jpg', '1497660202');
INSERT INTO `wu_res_ext` VALUES ('1195', '30', 'res/201706/17/mobile_1195.jpg', '1497660296');
INSERT INTO `wu_res_ext` VALUES ('1195', '12', 'res/201706/17/auto_1195.jpg', '1497660296');
INSERT INTO `wu_res_ext` VALUES ('1195', '2', 'res/201706/17/thumb_1195.jpg', '1497660296');
INSERT INTO `wu_res_ext` VALUES ('1196', '30', 'res/201706/17/mobile_1196.jpg', '1497660296');
INSERT INTO `wu_res_ext` VALUES ('1196', '12', 'res/201706/17/auto_1196.jpg', '1497660296');
INSERT INTO `wu_res_ext` VALUES ('1196', '2', 'res/201706/17/thumb_1196.jpg', '1497660296');
INSERT INTO `wu_res_ext` VALUES ('1197', '30', 'res/201706/17/mobile_1197.jpg', '1497660423');
INSERT INTO `wu_res_ext` VALUES ('1197', '12', 'res/201706/17/auto_1197.jpg', '1497660423');
INSERT INTO `wu_res_ext` VALUES ('1197', '2', 'res/201706/17/thumb_1197.jpg', '1497660423');
INSERT INTO `wu_res_ext` VALUES ('1198', '30', 'res/201706/17/mobile_1198.jpg', '1497660509');
INSERT INTO `wu_res_ext` VALUES ('1198', '12', 'res/201706/17/auto_1198.jpg', '1497660509');
INSERT INTO `wu_res_ext` VALUES ('1198', '2', 'res/201706/17/thumb_1198.jpg', '1497660509');
INSERT INTO `wu_res_ext` VALUES ('1199', '30', 'res/201706/17/mobile_1199.jpg', '1497660509');
INSERT INTO `wu_res_ext` VALUES ('1199', '12', 'res/201706/17/auto_1199.jpg', '1497660509');
INSERT INTO `wu_res_ext` VALUES ('1199', '2', 'res/201706/17/thumb_1199.jpg', '1497660509');
INSERT INTO `wu_res_ext` VALUES ('1200', '30', 'res/201706/17/mobile_1200.jpg', '1497660515');
INSERT INTO `wu_res_ext` VALUES ('1200', '12', 'res/201706/17/auto_1200.jpg', '1497660515');
INSERT INTO `wu_res_ext` VALUES ('1200', '2', 'res/201706/17/thumb_1200.jpg', '1497660515');
INSERT INTO `wu_res_ext` VALUES ('1201', '30', 'res/201706/17/mobile_1201.jpg', '1497660615');
INSERT INTO `wu_res_ext` VALUES ('1201', '12', 'res/201706/17/auto_1201.jpg', '1497660615');
INSERT INTO `wu_res_ext` VALUES ('1201', '2', 'res/201706/17/thumb_1201.jpg', '1497660615');
INSERT INTO `wu_res_ext` VALUES ('1202', '30', 'res/201706/17/mobile_1202.jpg', '1497660615');
INSERT INTO `wu_res_ext` VALUES ('1202', '12', 'res/201706/17/auto_1202.jpg', '1497660615');
INSERT INTO `wu_res_ext` VALUES ('1202', '2', 'res/201706/17/thumb_1202.jpg', '1497660615');

-- ----------------------------
-- Table structure for wu_site
-- ----------------------------
DROP TABLE IF EXISTS `wu_site`;
CREATE TABLE `wu_site` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '应用ID',
  `domain_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '默认域名ID',
  `title` varchar(255) NOT NULL COMMENT '网站名称',
  `dir` varchar(255) NOT NULL DEFAULT '/' COMMENT '安装目录，以/结尾',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `content` text NOT NULL COMMENT '网站关闭原因',
  `is_default` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1默认站点',
  `tpl_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '模板ID',
  `url_type` enum('default','rewrite','html') NOT NULL DEFAULT 'default' COMMENT '默认，即带?等能数，rewrite是伪静态页，html为生成的静态页',
  `logo` varchar(255) NOT NULL COMMENT '网站 LOGO ',
  `meta` text NOT NULL COMMENT '扩展配置',
  `adm_logo29` varchar(255) NOT NULL COMMENT '在后台左侧LOGO地址',
  `adm_logo180` varchar(255) NOT NULL COMMENT '登录LOGO地址',
  `lang` varchar(255) NOT NULL COMMENT '语言包',
  `api` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '0不走接口',
  `api_code` varchar(255) NOT NULL COMMENT 'API验证串',
  `email_charset` enum('gbk','utf-8') NOT NULL DEFAULT 'utf-8' COMMENT '邮箱模式',
  `email_server` varchar(100) NOT NULL COMMENT '邮件服务器',
  `email_port` varchar(10) NOT NULL COMMENT '端口',
  `email_ssl` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT 'SSL模式',
  `email_account` varchar(100) NOT NULL COMMENT '邮箱账号',
  `email_pass` varchar(100) NOT NULL COMMENT '邮箱密码',
  `email_name` varchar(100) NOT NULL COMMENT '发件人名称',
  `email` varchar(100) NOT NULL COMMENT '邮箱',
  `seo_title` varchar(255) NOT NULL COMMENT 'SEO主题',
  `seo_keywords` varchar(255) NOT NULL COMMENT 'SEO关键字',
  `seo_desc` text NOT NULL COMMENT 'SEO摘要',
  `upload_guest` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0禁止游客上传1允许游客上传',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='网站管理';

-- ----------------------------
-- Records of wu_site
-- ----------------------------
INSERT INTO `wu_site` VALUES ('1', '1', 'ZIBO HENGNUO IMP.& EXP. CO.,LTD', '/', '1', '网站正在建设中！', '1', '1', 'rewrite', 'res/201706/10/f0d062804ba44310.png', '', 'res/201706/10/b3951b089f4ccab1.png', 'res/201706/10/b3951b089f4ccab1.png', '', '0', '3383378a8fa34e064b', 'utf-8', 'smtp.qq.com', '25', '0', '', '123', '网站管理员', '', '', '', '', '1');

-- ----------------------------
-- Table structure for wu_site_domain
-- ----------------------------
DROP TABLE IF EXISTS `wu_site_domain`;
CREATE TABLE `wu_site_domain` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `site_id` mediumint(8) unsigned NOT NULL COMMENT '网站ID',
  `domain` varchar(255) NOT NULL COMMENT '域名信息',
  `is_mobile` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1此域名强制为手机版',
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='网站指定的域名';

-- ----------------------------
-- Records of wu_site_domain
-- ----------------------------
INSERT INTO `wu_site_domain` VALUES ('1', '1', 'www.wuwulocal.com', '0');

-- ----------------------------
-- Table structure for wu_sysmenu
-- ----------------------------
DROP TABLE IF EXISTS `wu_sysmenu`;
CREATE TABLE `wu_sysmenu` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID号',
  `parent_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '父级ID，0为根菜单',
  `title` varchar(100) NOT NULL COMMENT '分类名称',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态0禁用1正常',
  `appfile` varchar(100) NOT NULL COMMENT '应用文件名，放在phpok/admin/目录下，记录不带.php',
  `taxis` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '排序，值越小越往前靠，可选0-255',
  `func` varchar(100) NOT NULL COMMENT '应用函数，为空使用index',
  `identifier` varchar(100) NOT NULL COMMENT '标识串，用于区分同一应用文件的不同内容',
  `ext` varchar(255) NOT NULL COMMENT '表单扩展',
  `if_system` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0常规项目，1系统项目',
  `site_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '0表示全局网站',
  `icon` varchar(255) NOT NULL COMMENT '图标路径',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=77 DEFAULT CHARSET=utf8 COMMENT='PHPOK后台系统菜单';

-- ----------------------------
-- Records of wu_sysmenu
-- ----------------------------
INSERT INTO `wu_sysmenu` VALUES ('1', '0', '设置', '1', 'setting', '30', '', '', '', '1', '0', '');
INSERT INTO `wu_sysmenu` VALUES ('5', '0', '内容', '1', 'index', '10', '', '', '', '0', '0', '');
INSERT INTO `wu_sysmenu` VALUES ('6', '1', '表单选项', '1', 'opt', '30', '', '', '', '0', '0', '');
INSERT INTO `wu_sysmenu` VALUES ('7', '4', '字段维护', '1', 'fields', '20', '', '', '', '0', '0', '');
INSERT INTO `wu_sysmenu` VALUES ('8', '1', '模块管理', '1', 'module', '20', '', '', '', '0', '0', 'settings');
INSERT INTO `wu_sysmenu` VALUES ('9', '1', '核心配置', '1', 'system', '50', '', '', '', '1', '0', '');
INSERT INTO `wu_sysmenu` VALUES ('16', '4', '插件中心', '1', 'plugin', '30', '', '', '', '0', '0', '');
INSERT INTO `wu_sysmenu` VALUES ('18', '5', '分类管理', '1', 'cate', '30', '', '', '', '0', '0', 'stack');
INSERT INTO `wu_sysmenu` VALUES ('19', '5', '全局内容', '1', 'all', '10', '', '', '', '0', '0', '');
INSERT INTO `wu_sysmenu` VALUES ('20', '5', '内容管理', '1', 'list', '20', '', '', '', '0', '0', 'office');
INSERT INTO `wu_sysmenu` VALUES ('22', '5', '资源管理', '1', 'res', '60', '', '', '', '0', '0', 'download');
INSERT INTO `wu_sysmenu` VALUES ('23', '5', '数据调用', '1', 'call', '40', '', '', '', '0', '0', 'rocket');
INSERT INTO `wu_sysmenu` VALUES ('27', '1', '项目管理', '1', 'project', '10', '', '', '', '0', '0', 'finder');
INSERT INTO `wu_sysmenu` VALUES ('28', '1', '邮件模板', '1', 'email', '40', '', '', '', '0', '0', '');
INSERT INTO `wu_sysmenu` VALUES ('30', '1', '风格管理', '1', 'tpl', '60', '', '', '', '0', '0', '');
INSERT INTO `wu_sysmenu` VALUES ('4', '0', '工具', '1', 'tool', '50', '', '', '', '0', '0', '');
INSERT INTO `wu_sysmenu` VALUES ('57', '4', '数据库管理', '1', 'sql', '100', '', '', '', '0', '1', 'shield');
INSERT INTO `wu_sysmenu` VALUES ('58', '5', '标签管理', '1', 'tag', '70', '', '', '', '0', '1', '');
INSERT INTO `wu_sysmenu` VALUES ('62', '4', '附件分类管理', '1', 'rescate', '120', '', '', '', '0', '1', '');
INSERT INTO `wu_sysmenu` VALUES ('63', '4', 'GD图片方案', '1', 'gd', '130', '', '', '', '0', '1', 'image');
INSERT INTO `wu_sysmenu` VALUES ('74', '4', '伪静态页设置', '1', 'rewrite', '50', '', '', '', '0', '1', '');
INSERT INTO `wu_sysmenu` VALUES ('75', '5', '采集器', '1', 'plugin', '30', 'exec', '', 'id=collection&exec=manage', '0', '1', '');
INSERT INTO `wu_sysmenu` VALUES ('76', '1', '在线升级', '1', 'update', '70', '', '', '', '0', '1', 'earth');

-- ----------------------------
-- Table structure for wu_tag
-- ----------------------------
DROP TABLE IF EXISTS `wu_tag`;
CREATE TABLE `wu_tag` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `site_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '站点ID',
  `title` varchar(255) NOT NULL COMMENT '名称',
  `url` varchar(255) NOT NULL COMMENT '关键字网址',
  `target` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0原窗口打开，1新窗口打开',
  `hits` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击次数',
  `alt` varchar(255) NOT NULL COMMENT '链接里的提示',
  `is_global` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否全局状态1是0否',
  `replace_count` tinyint(4) NOT NULL DEFAULT '3' COMMENT '替换次数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='关键字管理器';

-- ----------------------------
-- Records of wu_tag
-- ----------------------------

-- ----------------------------
-- Table structure for wu_tag_stat
-- ----------------------------
DROP TABLE IF EXISTS `wu_tag_stat`;
CREATE TABLE `wu_tag_stat` (
  `title_id` varchar(200) NOT NULL COMMENT '主题ID，以p开头的表示项目ID，以c开头的表示分类ID',
  `tag_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'TAG标签ID',
  PRIMARY KEY (`title_id`,`tag_id`),
  KEY `title_id` (`title_id`),
  KEY `tag_id` (`tag_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Tag主题统计';

-- ----------------------------
-- Records of wu_tag_stat
-- ----------------------------

-- ----------------------------
-- Table structure for wu_tpl
-- ----------------------------
DROP TABLE IF EXISTS `wu_tpl`;
CREATE TABLE `wu_tpl` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `title` varchar(100) NOT NULL COMMENT '模板名称',
  `author` varchar(100) NOT NULL COMMENT '开发者名称',
  `folder` varchar(100) NOT NULL DEFAULT 'www' COMMENT '模板目录',
  `refresh_auto` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1自动判断更新刷新0不刷新',
  `refresh` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1强制刷新0普通刷新',
  `ext` varchar(20) NOT NULL DEFAULT 'html' COMMENT '后缀',
  `folder_change` varchar(255) NOT NULL COMMENT '更改目录',
  `phpfolder` varchar(200) NOT NULL COMMENT 'PHP执行文件目录',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='模板管理';

-- ----------------------------
-- Records of wu_tpl
-- ----------------------------
INSERT INTO `wu_tpl` VALUES ('1', '默认风格', 'phpok.com', 'www', '1', '0', 'html', 'css,images,js', 'phpinc');
