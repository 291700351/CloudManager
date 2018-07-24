-- MySQL Script generated by MySQL Workbench
-- Sun May 13 15:01:00 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema manager
-- -----------------------------------------------------
-- 密码管理项目后台数据库
DROP SCHEMA IF EXISTS `manager` ;

-- -----------------------------------------------------
-- Schema manager
--
-- 密码管理项目后台数据库
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `manager` DEFAULT CHARACTER SET utf8 ;
SHOW WARNINGS;
USE `manager` ;

-- -----------------------------------------------------
-- Table `manager`.`t_admin`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `manager`.`t_admin` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `manager`.`t_admin` (
  `id` VARCHAR(32) NOT NULL COMMENT 'UUID主键ID',
  `username` VARCHAR(255) NOT NULL COMMENT '管理员登录用户名',
  `salt` VARCHAR(32) NULL COMMENT '密码加盐',
  `password` VARCHAR(32) NOT NULL COMMENT 'MD5之后持久化导数据库的密码',
  `head` VARCHAR(255) NULL COMMENT '用户头像',
  `real_name` VARCHAR(45) NOT NULL COMMENT '真实姓名',
  `status` INT NOT NULL DEFAULT 0 COMMENT '用户状态（0：待激活，1：已激活，2：禁用，3：已删除）',
  `mobile` VARCHAR(45) NULL COMMENT '手机号码',
  `email` VARCHAR(45) NULL COMMENT '邮箱地址',
  `sex` TINYINT NULL DEFAULT 0 COMMENT '性别（0：未知，1：男，2：女）',
  `birth` DATETIME NULL COMMENT '生日',
  `qq` VARCHAR(45) NULL COMMENT '联系qq',
  `wechat` VARCHAR(45) NULL COMMENT '微信号码',
  `create_time` DATETIME NOT NULL DEFAULT now(),
  `update_time` DATETIME NOT NULL DEFAULT now() COMMENT '最后修改时间',
  `last_login_time` DATETIME NULL DEFAULT now() COMMENT '最后登录时间',
  `last_login_ip` VARCHAR(45) NULL COMMENT '最后登录ip',
  `create_id` VARCHAR(32) NULL COMMENT '创建者id',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `manager`.`t_role`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `manager`.`t_role` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `manager`.`t_role` (
  `id` VARCHAR(32) NOT NULL COMMENT '主键ID',
  `name` VARCHAR(45) NOT NULL COMMENT '角色名称',
  `sign` VARCHAR(45) NOT NULL,
  `sort` INT(11) NULL DEFAULT 10000 COMMENT '排序标志',
  `role_describe` VARCHAR(255) NULL COMMENT '角色描述',
  `create_admin` VARCHAR(32) NOT NULL COMMENT '创建者ID',
  `create_time` DATETIME NOT NULL DEFAULT now() COMMENT '创建时间',
  `update_time` DATETIME NOT NULL DEFAULT now() COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `manager`.`t_permission`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `manager`.`t_permission` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `manager`.`t_permission` (
  `id` VARCHAR(32) NOT NULL COMMENT '主键ID',
  `name` VARCHAR(45) NOT NULL COMMENT '权限名称',
  `sign` VARCHAR(45) NULL COMMENT '权限标示',
  `sort` INT(11) NULL DEFAULT 10000 COMMENT '排序',
  `permission_describe` VARCHAR(255) NULL COMMENT '描述',
  `parent_id` VARCHAR(32) NULL COMMENT '父权限ID',
  `create_time` DATETIME NOT NULL DEFAULT now() COMMENT '创建时间',
  `update_time` DATETIME NOT NULL DEFAULT now() COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `manager`.`t_menu`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `manager`.`t_menu` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `manager`.`t_menu` (
  `id` VARCHAR(32) NOT NULL,
  `name` VARCHAR(45) NOT NULL COMMENT '菜单名称，显示在界面上的名称',
  `url` VARCHAR(255) NULL COMMENT '菜单点击跳转的url，作为容器，是显示的默认url地址',
  `type` INT(11) NOT NULL DEFAULT 0 COMMENT '菜单类型 0：目录，1：菜单',
  `container` TINYINT NOT NULL DEFAULT 0 COMMENT '是否是容器',
  `icon` VARCHAR(255) NULL COMMENT '菜单图标',
  `sort` INT(11) NOT NULL DEFAULT 10000 COMMENT '排序',
  `status` INT(11) NOT NULL DEFAULT 0 COMMENT '状态（0：禁用，1：启用）',
  `parent_id` VARCHAR(32) NULL COMMENT '父容器ID',
  `create_by` VARCHAR(32) NULL COMMENT '创建者ID',
  `create_time` DATETIME NOT NULL DEFAULT now() COMMENT '创建时间',
  `update_time` DATETIME NOT NULL DEFAULT now() COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `manager`.`t_admin_has_role`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `manager`.`t_admin_has_role` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `manager`.`t_admin_has_role` (
  `admin_id` VARCHAR(32) NOT NULL,
  `role_id` VARCHAR(32) NOT NULL,
  PRIMARY KEY (`admin_id`, `role_id`),
  INDEX `fk_t_admin_has_t_role_t_role1_idx` (`role_id` ASC),
  INDEX `fk_t_admin_has_t_role_t_admin_idx` (`admin_id` ASC),
  CONSTRAINT `fk_t_admin_has_t_role_t_admin`
    FOREIGN KEY (`admin_id`)
    REFERENCES `manager`.`t_admin` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_t_admin_has_t_role_t_role1`
    FOREIGN KEY (`role_id`)
    REFERENCES `manager`.`t_role` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `manager`.`t_admin_has_permission`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `manager`.`t_admin_has_permission` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `manager`.`t_admin_has_permission` (
  `admin_id` VARCHAR(32) NOT NULL,
  `permission_id` VARCHAR(32) NOT NULL,
  PRIMARY KEY (`admin_id`, `permission_id`),
  INDEX `fk_t_admin_has_t_permission_t_permission1_idx` (`permission_id` ASC),
  INDEX `fk_t_admin_has_t_permission_t_admin1_idx` (`admin_id` ASC),
  CONSTRAINT `fk_t_admin_has_t_permission_t_admin1`
    FOREIGN KEY (`admin_id`)
    REFERENCES `manager`.`t_admin` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_t_admin_has_t_permission_t_permission1`
    FOREIGN KEY (`permission_id`)
    REFERENCES `manager`.`t_permission` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `manager`.`t_role_has_menu`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `manager`.`t_role_has_menu` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `manager`.`t_role_has_menu` (
  `role_id` VARCHAR(32) NOT NULL,
  `menu_id` VARCHAR(32) NOT NULL,
  PRIMARY KEY (`role_id`, `menu_id`),
  INDEX `fk_t_role_has_t_menu_t_menu1_idx` (`menu_id` ASC),
  INDEX `fk_t_role_has_t_menu_t_role1_idx` (`role_id` ASC),
  CONSTRAINT `fk_t_role_has_t_menu_t_role1`
    FOREIGN KEY (`role_id`)
    REFERENCES `manager`.`t_role` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_t_role_has_t_menu_t_menu1`
    FOREIGN KEY (`menu_id`)
    REFERENCES `manager`.`t_menu` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `manager`.`t_user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `manager`.`t_user` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `manager`.`t_user` (
  `id` VARCHAR(32) NOT NULL COMMENT 'UUID主键ID',
  `username` VARCHAR(255) NOT NULL COMMENT '管理员登录用户名',
  `salt` VARCHAR(32) NULL COMMENT '密码加盐',
  `password` VARCHAR(32) NOT NULL COMMENT 'MD5之后持久化导数据库的密码',
  `token` VARCHAR(32) NULL COMMENT '用户token',
  `head` VARCHAR(255) NULL COMMENT '用户头像',
  `real_name` VARCHAR(45) NULL COMMENT '真实姓名',
  `status` INT NOT NULL DEFAULT 0 COMMENT '用户状态（0：待激活，1：已激活，2：禁用，3：已删除）',
  `mobile` VARCHAR(45) NULL COMMENT '手机号码',
  `email` VARCHAR(45) NULL COMMENT '邮箱地址',
  `sex` TINYINT NULL DEFAULT 0 COMMENT '性别（0：未知，1：男，2：女）',
  `birth` DATETIME NULL COMMENT '生日',
  `qq` VARCHAR(45) NULL COMMENT '联系qq',
  `wechat` VARCHAR(45) NULL COMMENT '微信号码',
  `create_time` DATETIME NOT NULL DEFAULT now(),
  `update_time` DATETIME NOT NULL DEFAULT now() COMMENT '最后修改时间',
  `last_login_time` DATETIME NULL DEFAULT now() COMMENT '最后登录时间',
  `last_login_ip` VARCHAR(45) NULL COMMENT '最后登录ip',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `manager`.`t_platform`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `manager`.`t_platform` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `manager`.`t_platform` (
  `id` VARCHAR(32) NOT NULL COMMENT '主键id',
  `url` VARCHAR(255) NULL COMMENT '平台url地址',
  `username` VARCHAR(45) NULL COMMENT '平台登录用户名',
  `password` VARCHAR(45) NULL COMMENT '平台登录密码',
  `mobile` VARCHAR(45) NULL COMMENT '手机号码',
  `email` VARCHAR(45) NULL COMMENT '注册邮箱',
  `explain` VARCHAR(255) NULL COMMENT '说明',
  `register_time` DATETIME NULL DEFAULT now() COMMENT '注册时间',
  `user_id` VARCHAR(32) NOT NULL,
  PRIMARY KEY (`id`, `user_id`),
  INDEX `fk_t_platform_t_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_t_platform_t_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `manager`.`t_user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `manager`.`t_admin`
-- -----------------------------------------------------
START TRANSACTION;
USE `manager`;
INSERT INTO `manager`.`t_admin` (`id`, `username`, `salt`, `password`, `head`, `real_name`, `status`, `mobile`, `email`, `sex`, `birth`, `qq`, `wechat`, `create_time`, `update_time`, `last_login_time`, `last_login_ip`, `create_id`) VALUES ('1', 'admin', 'D86DF71AD7C842CAA2467EF47A6FA7AE', '23F327C5498B056E04782A3FEA5E1BD3', NULL, 'Admin', 1, '18201515723', 'lb291700351@live.cn', 1, now(), '291700351', '291700351', now(), now(), now(), '127.0.0.1', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `manager`.`t_role`
-- -----------------------------------------------------
START TRANSACTION;
USE `manager`;
INSERT INTO `manager`.`t_role` (`id`, `name`, `sign`, `sort`, `role_describe`, `create_admin`, `create_time`, `update_time`) VALUES ('1', 'Admin', 'admin', 10000, '系统最高管理员', '1', now(), DEFAULT);

COMMIT;


-- -----------------------------------------------------
-- Data for table `manager`.`t_permission`
-- -----------------------------------------------------
START TRANSACTION;
USE `manager`;
INSERT INTO `manager`.`t_permission` (`id`, `name`, `sign`, `sort`, `permission_describe`, `parent_id`, `create_time`, `update_time`) VALUES ('1', '管理员管理', NULL, 10000, '管理员增删改查容器', NULL, DEFAULT, DEFAULT);
INSERT INTO `manager`.`t_permission` (`id`, `name`, `sign`, `sort`, `permission_describe`, `parent_id`, `create_time`, `update_time`) VALUES ('2', '管理员列表查询', 'admin:query', 10000, '查询管理员权限', '1', DEFAULT, DEFAULT);
INSERT INTO `manager`.`t_permission` (`id`, `name`, `sign`, `sort`, `permission_describe`, `parent_id`, `create_time`, `update_time`) VALUES ('3', '添加管理员', 'admin:add', 10001, '添加管理员的权限', '1', DEFAULT, DEFAULT);
INSERT INTO `manager`.`t_permission` (`id`, `name`, `sign`, `sort`, `permission_describe`, `parent_id`, `create_time`, `update_time`) VALUES ('4', '修改管理员', 'admin:update', 10002, '修改管理员的权限', '1', DEFAULT, DEFAULT);

COMMIT;


-- -----------------------------------------------------
-- Data for table `manager`.`t_menu`
-- -----------------------------------------------------
START TRANSACTION;
USE `manager`;
INSERT INTO `manager`.`t_menu` (`id`, `name`, `url`, `type`, `container`, `icon`, `sort`, `status`, `parent_id`, `create_by`, `create_time`, `update_time`) VALUES ('1', '系统管理', '/page/admin/list.html', 0, false, NULL, 10000, 1, NULL, '1',  now(),  now());
INSERT INTO `manager`.`t_menu` (`id`, `name`, `url`, `type`, `container`, `icon`, `sort`, `status`, `parent_id`, `create_by`, `create_time`, `update_time`) VALUES ('2', '管理员管理', NULL, 1, true, 'fa fa-desktop', 10000, 1, '1', '1',  now(),  now());
INSERT INTO `manager`.`t_menu` (`id`, `name`, `url`, `type`, `container`, `icon`, `sort`, `status`, `parent_id`, `create_by`, `create_time`, `update_time`) VALUES ('3', '管理员列表', '/page/admin/list.html', 1, false, 'fa fa-users', 10000, 1, '2', '1',  now(),  now());
INSERT INTO `manager`.`t_menu` (`id`, `name`, `url`, `type`, `container`, `icon`, `sort`, `status`, `parent_id`, `create_by`, `create_time`, `update_time`) VALUES ('4', '菜单列表', 'http://localhost/page/menu/list.html', 1, false, NULL, 10001, 1, '2', '1',  now(),  now());
INSERT INTO `manager`.`t_menu` (`id`, `name`, `url`, `type`, `container`, `icon`, `sort`, `status`, `parent_id`, `create_by`, `create_time`, `update_time`) VALUES ('5', '代码管理', NULL, 0, false, NULL, 10001, 1, NULL, '1',  now(),  now());
INSERT INTO `manager`.`t_menu` (`id`, `name`, `url`, `type`, `container`, `icon`, `sort`, `status`, `parent_id`, `create_by`, `create_time`, `update_time`) VALUES ('6', '数据表管理', NULL, 1, true, NULL, 10000, 1, '4', '1',  now(),  now());
INSERT INTO `manager`.`t_menu` (`id`, `name`, `url`, `type`, `container`, `icon`, `sort`, `status`, `parent_id`, `create_by`, `create_time`, `update_time`) VALUES ('7', '表列表', NULL, 1, false, NULL, 10000, 1, '5', '1',  now(),  now());
INSERT INTO `manager`.`t_menu` (`id`, `name`, `url`, `type`, `container`, `icon`, `sort`, `status`, `parent_id`, `create_by`, `create_time`, `update_time`) VALUES ('8', '创建新表', NULL, 1, false, NULL, 10001, 1, '5', '1',  now(),  now());

COMMIT;


-- -----------------------------------------------------
-- Data for table `manager`.`t_admin_has_role`
-- -----------------------------------------------------
START TRANSACTION;
USE `manager`;
INSERT INTO `manager`.`t_admin_has_role` (`admin_id`, `role_id`) VALUES ('1', '1');

COMMIT;


-- -----------------------------------------------------
-- Data for table `manager`.`t_admin_has_permission`
-- -----------------------------------------------------
START TRANSACTION;
USE `manager`;
INSERT INTO `manager`.`t_admin_has_permission` (`admin_id`, `permission_id`) VALUES ('1', '1');
INSERT INTO `manager`.`t_admin_has_permission` (`admin_id`, `permission_id`) VALUES ('1', '2');
INSERT INTO `manager`.`t_admin_has_permission` (`admin_id`, `permission_id`) VALUES ('1', '3');
INSERT INTO `manager`.`t_admin_has_permission` (`admin_id`, `permission_id`) VALUES ('1', '4');

COMMIT;


-- -----------------------------------------------------
-- Data for table `manager`.`t_role_has_menu`
-- -----------------------------------------------------
START TRANSACTION;
USE `manager`;
INSERT INTO `manager`.`t_role_has_menu` (`role_id`, `menu_id`) VALUES ('1', '1');
INSERT INTO `manager`.`t_role_has_menu` (`role_id`, `menu_id`) VALUES ('1', '2');
INSERT INTO `manager`.`t_role_has_menu` (`role_id`, `menu_id`) VALUES ('1', '3');
INSERT INTO `manager`.`t_role_has_menu` (`role_id`, `menu_id`) VALUES ('1', '4');
INSERT INTO `manager`.`t_role_has_menu` (`role_id`, `menu_id`) VALUES ('1', '5');
INSERT INTO `manager`.`t_role_has_menu` (`role_id`, `menu_id`) VALUES ('1', '6');
INSERT INTO `manager`.`t_role_has_menu` (`role_id`, `menu_id`) VALUES ('1', '7');
INSERT INTO `manager`.`t_role_has_menu` (`role_id`, `menu_id`) VALUES ('1', '8');

COMMIT;

