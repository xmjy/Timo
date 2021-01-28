/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50721
 Source Host           : localhost:3306
 Source Schema         : timo

 Target Server Type    : MySQL
 Target Server Version : 50721
 File Encoding         : 65001

 Date: 28/01/2021 10:48:08
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for order_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime(0) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` tinyint(4) NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT NULL,
  `create_by` bigint(20) NULL DEFAULT NULL,
  `update_by` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKbmqdr5ts1am9d7ko623oewum6`(`create_by`) USING BTREE,
  INDEX `FKhmvnbof10fry0boxyen56ksvn`(`update_by`) USING BTREE,
  CONSTRAINT `FKbmqdr5ts1am9d7ko623oewum6` FOREIGN KEY (`create_by`) REFERENCES `sys_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKhmvnbof10fry0boxyen56ksvn` FOREIGN KEY (`update_by`) REFERENCES `sys_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_detail
-- ----------------------------
INSERT INTO `order_detail` VALUES (1, '2021-01-27 11:44:41', 'second edit', 1, '第一条订单详情', '2021-01-27 16:10:02', 1, 1);
INSERT INTO `order_detail` VALUES (2, '2021-01-27 16:17:33', 'this is git 教程', 1, 'Git详细教程', '2021-01-27 16:20:09', 1, 4);

-- ----------------------------
-- Table structure for sys_action_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_action_log`;
CREATE TABLE `sys_action_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志名称',
  `type` tinyint(4) NULL DEFAULT NULL COMMENT '日志类型',
  `ipaddr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作IP地址',
  `clazz` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产生日志的类',
  `method` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产生日志的方法',
  `model` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产生日志的表',
  `record_id` bigint(20) NULL DEFAULT NULL COMMENT '产生日志的数据id',
  `message` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '日志消息',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '记录时间',
  `oper_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产生日志的用户昵称',
  `oper_by` bigint(20) NULL DEFAULT NULL COMMENT '产生日志的用户',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK32gm4dja0jetx58r9dc2uljiu`(`oper_by`) USING BTREE,
  CONSTRAINT `FK32gm4dja0jetx58r9dc2uljiu` FOREIGN KEY (`oper_by`) REFERENCES `sys_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 245 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_action_log
-- ----------------------------
INSERT INTO `sys_action_log` VALUES (1, '用户登录', 2, '127.0.0.1', 'com.linln.admin.system.controller.LoginController', 'login', NULL, NULL, '后台登录成功', '2019-10-31 15:20:29', '超级管理员', 1);
INSERT INTO `sys_action_log` VALUES (2, '用户登录', 2, '127.0.0.1', 'com.linln.admin.system.controller.LoginController', 'login', NULL, NULL, '后台登录成功', '2019-10-31 17:51:54', '超级管理员', 1);
INSERT INTO `sys_action_log` VALUES (3, '用户管理', 1, '127.0.0.1', 'com.linln.admin.system.controller.UserController', 'save', 'sys_user', 1, '更新用户成功：admin', '2019-10-31 18:04:23', '超级管理员', 1);
INSERT INTO `sys_action_log` VALUES (4, '用户登录', 2, '127.0.0.1', 'com.linln.admin.system.controller.LoginController', 'login', NULL, NULL, '后台登录失败：[admin]用户名或密码错误', '2019-11-01 15:36:05', 'admin', NULL);
INSERT INTO `sys_action_log` VALUES (5, '用户登录', 2, '127.0.0.1', 'com.linln.admin.system.controller.LoginController', 'login', NULL, NULL, '后台登录失败：[admin]用户名或密码错误', '2019-11-01 15:36:16', 'admin', NULL);
INSERT INTO `sys_action_log` VALUES (6, '用户登录', 2, '127.0.0.1', 'com.linln.admin.system.controller.LoginController', 'login', NULL, NULL, '后台登录成功', '2019-11-01 15:36:37', '超级管理员', 1);
INSERT INTO `sys_action_log` VALUES (7, '用户登录', 2, '127.0.0.1', 'com.linln.admin.system.controller.LoginController', 'login', NULL, NULL, '后台登录成功', '2019-11-06 19:51:41', '超级管理员', 1);
INSERT INTO `sys_action_log` VALUES (8, '字典管理', 1, '127.0.0.1', 'com.linln.admin.system.controller.DictController', 'save', 'sys_dict', 4, '更新字典：菜单类型', '2019-11-06 20:08:46', '超级管理员', 1);
INSERT INTO `sys_action_log` VALUES (9, '用户密码', 1, '127.0.0.1', 'com.linln.admin.system.controller.UserController', 'editPassword', 'sys_user', 1, '修改用户密码成功admin', '2019-11-06 20:09:17', '超级管理员', 1);
INSERT INTO `sys_action_log` VALUES (10, '用户密码', 1, '127.0.0.1', 'com.linln.admin.system.controller.UserController', 'editPassword', 'sys_user', 2, '修改用户密码成功linln', '2019-11-06 20:09:17', '超级管理员', 1);
INSERT INTO `sys_action_log` VALUES (216, '用户登录', 2, '0:0:0:0:0:0:0:1', 'com.linln.admin.system.controller.LoginController', 'login', NULL, NULL, '后台登录成功', '2021-01-25 11:46:54', '超级管理员', 1);
INSERT INTO `sys_action_log` VALUES (217, '用户管理', 1, '0:0:0:0:0:0:0:1', 'com.linln.admin.system.controller.UserController', 'save', 'sys_user', 3, '添加用户成功：albert.fang', '2021-01-25 14:07:39', '超级管理员', 1);
INSERT INTO `sys_action_log` VALUES (218, '角色分配', 1, '0:0:0:0:0:0:0:1', 'com.linln.admin.system.controller.UserController', 'auth', 'sys_user', 3, '角色分配成功：albert.fang', '2021-01-25 14:09:33', '超级管理员', 1);
INSERT INTO `sys_action_log` VALUES (219, '用户登录', 2, '0:0:0:0:0:0:0:1', 'com.linln.admin.system.controller.LoginController', 'login', NULL, NULL, '后台登录成功', '2021-01-25 14:10:14', 'albert', 3);
INSERT INTO `sys_action_log` VALUES (220, '用户状态', 1, '0:0:0:0:0:0:0:1', 'com.linln.admin.system.controller.UserController', 'updateStatus', NULL, NULL, '删除ID：[2]', '2021-01-25 14:15:02', 'albert', 3);
INSERT INTO `sys_action_log` VALUES (221, '角色分配', 1, '0:0:0:0:0:0:0:1', 'com.linln.admin.system.controller.UserController', 'auth', 'sys_user', 3, '角色分配成功：albert.fang', '2021-01-25 14:21:11', 'albert', 3);
INSERT INTO `sys_action_log` VALUES (222, '角色授权', 1, '0:0:0:0:0:0:0:1', 'com.linln.admin.system.controller.RoleController', 'auth', 'sys_role', 2, '角色授权成功：开发组', '2021-01-25 14:25:11', 'albert', 3);
INSERT INTO `sys_action_log` VALUES (223, '用户登录', 2, '0:0:0:0:0:0:0:1', 'com.linln.admin.system.controller.LoginController', 'login', NULL, NULL, '后台登录成功', '2021-01-25 14:25:23', 'albert', 3);
INSERT INTO `sys_action_log` VALUES (224, '角色分配', 1, '0:0:0:0:0:0:0:1', 'com.linln.admin.system.controller.UserController', 'auth', 'sys_user', 3, '角色分配成功：albert.fang', '2021-01-25 14:25:42', 'albert', 3);
INSERT INTO `sys_action_log` VALUES (225, '用户登录', 2, '0:0:0:0:0:0:0:1', 'com.linln.admin.system.controller.LoginController', 'login', NULL, NULL, '后台登录成功', '2021-01-25 14:26:00', 'albert', 3);
INSERT INTO `sys_action_log` VALUES (226, '角色分配', 1, '0:0:0:0:0:0:0:1', 'com.linln.admin.system.controller.UserController', 'auth', 'sys_user', 3, '角色分配成功：albert.fang', '2021-01-25 14:28:01', 'albert', 3);
INSERT INTO `sys_action_log` VALUES (227, '用户登录', 2, '0:0:0:0:0:0:0:1', 'com.linln.admin.system.controller.LoginController', 'login', NULL, NULL, '后台登录成功', '2021-01-25 14:28:20', 'albert', 3);
INSERT INTO `sys_action_log` VALUES (228, '用户状态', 1, '0:0:0:0:0:0:0:1', 'com.linln.admin.system.controller.UserController', 'updateStatus', NULL, NULL, '删除ID：[3]', '2021-01-25 14:31:42', 'albert', 3);
INSERT INTO `sys_action_log` VALUES (229, '用户登录', 2, '0:0:0:0:0:0:0:1', 'com.linln.admin.system.controller.LoginController', 'login', NULL, NULL, '后台登录失败：[albert.fang]用户名或密码错误', '2021-01-25 14:31:51', 'albert.fang', NULL);
INSERT INTO `sys_action_log` VALUES (230, '用户登录', 2, '0:0:0:0:0:0:0:1', 'com.linln.admin.system.controller.LoginController', 'login', NULL, NULL, '后台登录失败：[albert.fang]用户名或密码错误', '2021-01-25 14:31:53', 'albert.fang', NULL);
INSERT INTO `sys_action_log` VALUES (231, '用户登录', 2, '0:0:0:0:0:0:0:1', 'com.linln.admin.system.controller.LoginController', 'login', NULL, NULL, '后台登录成功', '2021-01-25 14:31:57', '超级管理员', 1);
INSERT INTO `sys_action_log` VALUES (232, '用户登录', 2, '0:0:0:0:0:0:0:1', 'com.linln.admin.system.controller.LoginController', 'login', NULL, NULL, '后台登录失败：[sa]用户名或密码错误', '2021-01-27 10:43:56', 'sa', NULL);
INSERT INTO `sys_action_log` VALUES (233, '用户登录', 2, '0:0:0:0:0:0:0:1', 'com.linln.admin.system.controller.LoginController', 'login', NULL, NULL, '后台登录成功', '2021-01-27 10:44:16', '超级管理员', 1);
INSERT INTO `sys_action_log` VALUES (234, '用户登录', 2, '0:0:0:0:0:0:0:1', 'com.linln.admin.system.controller.LoginController', 'login', NULL, NULL, '后台登录成功', '2021-01-27 11:37:47', '超级管理员', 1);
INSERT INTO `sys_action_log` VALUES (235, '系统异常', 3, '0:0:0:0:0:0:0:1', 'com.linln.component.actionLog.exception.ActionLogProceedAdvice', 'run', NULL, NULL, 'org.springframework.dao.InvalidDataAccessApiUsageException: Path \'updateBy.dept.updateBy\' from root Detail must not span a cyclic property reference!\r\n[{ Detail(id=null, title=null, remark=null, createDate=null, updateDate=null, createBy=null, updateBy=User(id=1, username=admin, password=5fa04c0758ae596e2a93cd2802640693a5b08bdfacd4307abce323c85e481154, salt=7rl2t9, nickname=超级管理员, picture=null, sex=1, phone=10086, email=10086@163.com, createDate=2018-08-09 23:00:03.0, updateDate=2019-11-06 20:09:17.0, remark=, status=1), status=1) }] -updateBy-> [{ User(id=1, username=admin, password=5fa04c0758ae596e2a93cd2802640693a5b08bdfacd4307abce323c85e481154, salt=7rl2t9, nickname=超级管理员, picture=null, sex=1, phone=10086, email=10086@163.com, createDate=2018-08-09 23:00:03.0, updateDate=2019-11-06 20:09:17.0, remark=, status=1) }] -dept-> [{ Dept(id=1, title=总公司, pid=0, pids=[0], sort=1, remark=, createDate=2018-12-02 17:41:23.0, updateDate=2019-02-23 02:41:28.0, createBy=User(id=1, username=admin, password=5fa04c0758ae596e2a93cd2802640693a5b08bdfacd4307abce323c85e481154, salt=7rl2t9, nickname=超级管理员, picture=null, sex=1, phone=10086, email=10086@163.com, createDate=2018-08-09 23:00:03.0, updateDate=2019-11-06 20:09:17.0, remark=, status=1), updateBy=User(id=1, username=admin, password=5fa04c0758ae596e2a93cd2802640693a5b08bdfacd4307abce323c85e481154, salt=7rl2t9, nickname=超级管理员, picture=null, sex=1, phone=10086, email=10086@163.com, createDate=2018-08-09 23:00:03.0, updateDate=2019-11-06 20:09:17.0, remark=, status=1), status=1) }] -updateBy-> [{ User(id=1, username=admin, password=5fa04c0758ae596e2a93cd2802640693a5b08bdfacd4307abce323c85e481154, salt=7rl2t9, nickname=超级管理员, picture=null, sex=1, phone=10086, email=10086@163.com, createDate=2018-08-09 23:00:03.0, updateDate=2019-11-06 20:09:17.0, remark=, status=1) }]\n	org.springframework.data.jpa.convert.QueryByExamplePredicateBuilder.getPredicates(QueryByExamplePredicateBuilder.java:151)\n	org.springframework.data.jpa.convert.QueryByExamplePredicateBuilder.getPredicates(QueryByExamplePredicateBuilder.java:155)\n	org.springframework.data.jpa.convert.QueryByExamplePredicateBuilder.getPredicates(QueryByExamplePredicateBuilder.java:155)\n	org.springframework.data.jpa.convert.QueryByExamplePredicateBuilder.getPredicate(QueryByExamplePredicateBuilder.java:89)\n	org.springframework.data.jpa.repository.support.SimpleJpaRepository$ExampleSpecification.toPredicate(SimpleJpaRepository.java:812)\n	org.springframework.data.jpa.repository.support.SimpleJpaRepository.applySpecificationToCriteria(SimpleJpaRepository.java:694)\n	org.springframework.data.jpa.repository.support.SimpleJpaRepository.getQuery(SimpleJpaRepository.java:625)\n	org.springframework.data.jpa.repository.support.SimpleJpaRepository.getQuery(SimpleJpaRepository.java:598)\n	org.springframework.data.jpa.repository.support.SimpleJpaRepository.findAll(SimpleJpaRepository.java:460)\n	sun.reflect.GeneratedMethodAccessor180.invoke(Unknown Source)\n	sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	java.lang.reflect.Method.invoke(Method.java:498)\n	org.springframework.data.repository.core.support.RepositoryComposition$RepositoryFragments.invoke(RepositoryComposition.java:359)\n	org.springframework.data.repository.core.support.RepositoryComposition.invoke(RepositoryComposition.java:200)\n	org.springframework.data.repository.core.support.RepositoryFactorySupport$ImplementationMethodExecutionInterceptor.invoke(RepositoryFactorySupport.java:644)\n	org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	org.springframework.data.repository.core.support.RepositoryFactorySupport$QueryExecutorMethodInterceptor.doInvoke(RepositoryFactorySupport.java:608)\n	org.springframework.data.repository.core.support.RepositoryFactorySupport$QueryExecutorMethodInterceptor.lambda$invoke$3(RepositoryFactorySupport.java:595)\n	org.springframework.data.repository.core.support.RepositoryFactorySupport$QueryExecutorMethodInterceptor.invoke(RepositoryFactorySupport.java:595)\n	org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	org.springframework.data.projection.DefaultMethodInvokingMethodInterceptor.invoke(DefaultMethodInvokingMethodInterceptor.java:59)\n	org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	org.springframework.transaction.interceptor.TransactionAspectSupport.invokeWithinTransaction(TransactionAspectSupport.java:294)\n	org.springframework.transaction.interceptor.TransactionInterceptor.invoke(TransactionInterceptor.java:98)\n	org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	org.springframework.dao.support.PersistenceExceptionTranslationInterceptor.invoke(PersistenceExceptionTranslationInterceptor.java:139)\n	org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	org.springframework.data.jpa.repository.support.CrudMethodMetadataPostProcessor$CrudMethodMetadataPopulatingMethodInterceptor.invoke(CrudMethodMetadataPostProcessor.java:138)\n	org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:93)\n	org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	org.springframework.data.repository.core.support.SurroundingTransactionDetectorMethodInterceptor.invoke(SurroundingTransactionDetectorMethodInterceptor.java:61)\n	org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	org.springframework.aop.framework.JdkDynamicAopProxy.invoke(JdkDynamicAopProxy.java:212)\n	com.sun.proxy.$Proxy140.findAll(Unknown Source)\n	com.linln.modules.order.service.impl.DetailServiceImpl.getPageList(DetailServiceImpl.java:46)\n	com.linln.modules.order.service.impl.DetailServiceImpl$$FastClassBySpringCGLIB$$3501bcbe.invoke(<generated>)\n	org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\n	org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:684)\n	com.linln.modules.order.service.impl.DetailServiceImpl$$EnhancerBySpringCGLIB$$122a4c08.getPageList(<generated>)\n	com.linln.admin.order.controller.DetailController.index(DetailController.java:50)\n	com.linln.admin.order.controller.DetailController$$FastClassBySpringCGLIB$$7b000b8.invoke(<generated>)\n	org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\n	org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:749)\n	org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\n	org.apache.shiro.spring.security.interceptor.AopAllianceAnnotationsAuthorizingMethodInterceptor$1.proceed(AopAllianceAnnotationsAuthorizingMethodInterceptor.java:82)\n	org.apache.shiro.authz.aop.AuthorizingMethodInterceptor.invoke(AuthorizingMethodInterceptor.java:39)\n	org.apache.shiro.spring.security.interceptor.AopAllianceAnnotationsAuthorizingMethodInterceptor.invoke(AopAllianceAnnotationsAuthorizingMethodInterceptor.java:115)\n	org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:688)\n	com.linln.admin.order.controller.DetailController$$EnhancerBySpringCGLIB$$e0530af0.index(<generated>)\n	sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	java.lang.reflect.Method.invoke(Method.java:498)\n	org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:189)\n	org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:138)\n	org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:102)\n	org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:892)\n	org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:797)\n	org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\n	org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1038)\n	org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:942)\n	org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1005)\n	org.springframework.web.servlet.FrameworkServlet.doGet(FrameworkServlet.java:897)\n	javax.servlet.http.HttpServlet.service(HttpServlet.java:634)\n	org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:882)\n	javax.servlet.http.HttpServlet.service(HttpServlet.java:741)\n	org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\n	org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:53)\n	org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\n	org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\n	org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\n	org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\n	org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\n	org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:449)\n	org.apache.shiro.web.servlet.AbstractShiroFilter$1.call(AbstractShiroFilter.java:365)\n	org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\n	org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\n	org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:387)\n	org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:362)\n	org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\n	org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	com.linln.common.xss.XssFilter.doFilter(XssFilter.java:47)\n	org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:99)\n	org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:92)\n	org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	org.springframework.web.filter.HiddenHttpMethodFilter.doFilterInternal(HiddenHttpMethodFilter.java:93)\n	org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:200)\n	org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:200)\n	org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:96)\n	org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:490)\n	org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:139)\n	org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:92)\n	org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:74)\n	org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:343)\n	org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:408)\n	org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\n	org.apache.coyote.AbstractProtocol$ConnectionHandler.process(AbstractProtocol.java:834)\n	org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1415)\n	org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\n	java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)\n	java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:624)\n	org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)\n	java.lang.Thread.run(Thread.java:748)', '2021-01-27 11:49:08', '系统', 1);
INSERT INTO `sys_action_log` VALUES (236, '用户登录', 2, '0:0:0:0:0:0:0:1', 'com.linln.admin.system.controller.LoginController', 'login', NULL, NULL, '后台登录成功', '2021-01-27 15:35:27', '超级管理员', 1);
INSERT INTO `sys_action_log` VALUES (237, '用户管理', 1, '0:0:0:0:0:0:0:1', 'com.linln.admin.system.controller.UserController', 'save', 'sys_user', 4, '添加用户成功：albert.fang', '2021-01-27 16:18:43', '超级管理员', 1);
INSERT INTO `sys_action_log` VALUES (238, '角色分配', 1, '0:0:0:0:0:0:0:1', 'com.linln.admin.system.controller.UserController', 'auth', 'sys_user', 4, '角色分配成功：albert.fang', '2021-01-27 16:18:57', '超级管理员', 1);
INSERT INTO `sys_action_log` VALUES (239, '用户登录', 2, '0:0:0:0:0:0:0:1', 'com.linln.admin.system.controller.LoginController', 'login', NULL, NULL, '后台登录成功', '2021-01-27 16:19:17', 'albert', 4);
INSERT INTO `sys_action_log` VALUES (240, '系统异常', 3, '0:0:0:0:0:0:0:1', 'com.linln.component.actionLog.exception.ActionLogProceedAdvice', 'run', NULL, NULL, 'org.springframework.dao.InvalidDataAccessApiUsageException: Path \'updateBy.dept.createBy.dept.createBy\' from root Detail must not span a cyclic property reference!\r\n[{ Detail(id=null, title=null, remark=null, createDate=null, updateDate=null, createBy=null, updateBy=User(id=4, username=albert.fang, password=5050108411556052aab4e569f008f9bd8139c65dcee095a0c2d5d66ce7156f8b, salt=zbk8l2, nickname=albert, picture=null, sex=1, phone=13979347929, email=fxm970829@qq.com, createDate=2021-01-27 16:18:43.0, updateDate=2021-01-27 16:18:57.0, remark=开发部主管, status=1), status=1) }] -updateBy-> [{ User(id=4, username=albert.fang, password=5050108411556052aab4e569f008f9bd8139c65dcee095a0c2d5d66ce7156f8b, salt=zbk8l2, nickname=albert, picture=null, sex=1, phone=13979347929, email=fxm970829@qq.com, createDate=2021-01-27 16:18:43.0, updateDate=2021-01-27 16:18:57.0, remark=开发部主管, status=1) }] -dept-> [{ Dept(id=4, title=研发部门, pid=1, pids=[0],[1], sort=3, remark=, createDate=2018-12-02 17:51:55.0, updateDate=2019-04-27 13:12:20.0, createBy=User(id=1, username=admin, password=5fa04c0758ae596e2a93cd2802640693a5b08bdfacd4307abce323c85e481154, salt=7rl2t9, nickname=超级管理员, picture=null, sex=1, phone=10086, email=10086@163.com, createDate=2018-08-09 23:00:03.0, updateDate=2019-11-06 20:09:17.0, remark=, status=1), updateBy=User(id=1, username=admin, password=5fa04c0758ae596e2a93cd2802640693a5b08bdfacd4307abce323c85e481154, salt=7rl2t9, nickname=超级管理员, picture=null, sex=1, phone=10086, email=10086@163.com, createDate=2018-08-09 23:00:03.0, updateDate=2019-11-06 20:09:17.0, remark=, status=1), status=1) }] -createBy-> [{ User(id=1, username=admin, password=5fa04c0758ae596e2a93cd2802640693a5b08bdfacd4307abce323c85e481154, salt=7rl2t9, nickname=超级管理员, picture=null, sex=1, phone=10086, email=10086@163.com, createDate=2018-08-09 23:00:03.0, updateDate=2019-11-06 20:09:17.0, remark=, status=1) }] -dept-> [{ Dept(id=1, title=总公司, pid=0, pids=[0], sort=1, remark=, createDate=2018-12-02 17:41:23.0, updateDate=2019-02-23 02:41:28.0, createBy=User(id=1, username=admin, password=5fa04c0758ae596e2a93cd2802640693a5b08bdfacd4307abce323c85e481154, salt=7rl2t9, nickname=超级管理员, picture=null, sex=1, phone=10086, email=10086@163.com, createDate=2018-08-09 23:00:03.0, updateDate=2019-11-06 20:09:17.0, remark=, status=1), updateBy=User(id=1, username=admin, password=5fa04c0758ae596e2a93cd2802640693a5b08bdfacd4307abce323c85e481154, salt=7rl2t9, nickname=超级管理员, picture=null, sex=1, phone=10086, email=10086@163.com, createDate=2018-08-09 23:00:03.0, updateDate=2019-11-06 20:09:17.0, remark=, status=1), status=1) }] -createBy-> [{ User(id=1, username=admin, password=5fa04c0758ae596e2a93cd2802640693a5b08bdfacd4307abce323c85e481154, salt=7rl2t9, nickname=超级管理员, picture=null, sex=1, phone=10086, email=10086@163.com, createDate=2018-08-09 23:00:03.0, updateDate=2019-11-06 20:09:17.0, remark=, status=1) }]\n	org.springframework.data.jpa.convert.QueryByExamplePredicateBuilder.getPredicates(QueryByExamplePredicateBuilder.java:151)\n	org.springframework.data.jpa.convert.QueryByExamplePredicateBuilder.getPredicates(QueryByExamplePredicateBuilder.java:155)\n	org.springframework.data.jpa.convert.QueryByExamplePredicateBuilder.getPredicates(QueryByExamplePredicateBuilder.java:155)\n	org.springframework.data.jpa.convert.QueryByExamplePredicateBuilder.getPredicates(QueryByExamplePredicateBuilder.java:155)\n	org.springframework.data.jpa.convert.QueryByExamplePredicateBuilder.getPredicates(QueryByExamplePredicateBuilder.java:155)\n	org.springframework.data.jpa.convert.QueryByExamplePredicateBuilder.getPredicate(QueryByExamplePredicateBuilder.java:89)\n	org.springframework.data.jpa.repository.support.SimpleJpaRepository$ExampleSpecification.toPredicate(SimpleJpaRepository.java:812)\n	org.springframework.data.jpa.repository.support.SimpleJpaRepository.applySpecificationToCriteria(SimpleJpaRepository.java:694)\n	org.springframework.data.jpa.repository.support.SimpleJpaRepository.getQuery(SimpleJpaRepository.java:625)\n	org.springframework.data.jpa.repository.support.SimpleJpaRepository.getQuery(SimpleJpaRepository.java:598)\n	org.springframework.data.jpa.repository.support.SimpleJpaRepository.findAll(SimpleJpaRepository.java:460)\n	sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	java.lang.reflect.Method.invoke(Method.java:498)\n	org.springframework.data.repository.core.support.RepositoryComposition$RepositoryFragments.invoke(RepositoryComposition.java:359)\n	org.springframework.data.repository.core.support.RepositoryComposition.invoke(RepositoryComposition.java:200)\n	org.springframework.data.repository.core.support.RepositoryFactorySupport$ImplementationMethodExecutionInterceptor.invoke(RepositoryFactorySupport.java:644)\n	org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	org.springframework.data.repository.core.support.RepositoryFactorySupport$QueryExecutorMethodInterceptor.doInvoke(RepositoryFactorySupport.java:608)\n	org.springframework.data.repository.core.support.RepositoryFactorySupport$QueryExecutorMethodInterceptor.lambda$invoke$3(RepositoryFactorySupport.java:595)\n	org.springframework.data.repository.core.support.RepositoryFactorySupport$QueryExecutorMethodInterceptor.invoke(RepositoryFactorySupport.java:595)\n	org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	org.springframework.data.projection.DefaultMethodInvokingMethodInterceptor.invoke(DefaultMethodInvokingMethodInterceptor.java:59)\n	org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	org.springframework.transaction.interceptor.TransactionAspectSupport.invokeWithinTransaction(TransactionAspectSupport.java:294)\n	org.springframework.transaction.interceptor.TransactionInterceptor.invoke(TransactionInterceptor.java:98)\n	org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	org.springframework.dao.support.PersistenceExceptionTranslationInterceptor.invoke(PersistenceExceptionTranslationInterceptor.java:139)\n	org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	org.springframework.data.jpa.repository.support.CrudMethodMetadataPostProcessor$CrudMethodMetadataPopulatingMethodInterceptor.invoke(CrudMethodMetadataPostProcessor.java:138)\n	org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:93)\n	org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	org.springframework.data.repository.core.support.SurroundingTransactionDetectorMethodInterceptor.invoke(SurroundingTransactionDetectorMethodInterceptor.java:61)\n	org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	org.springframework.aop.framework.JdkDynamicAopProxy.invoke(JdkDynamicAopProxy.java:212)\n	com.sun.proxy.$Proxy141.findAll(Unknown Source)\n	com.linln.modules.order.service.impl.DetailServiceImpl.getPageList(DetailServiceImpl.java:46)\n	com.linln.modules.order.service.impl.DetailServiceImpl$$FastClassBySpringCGLIB$$3501bcbe.invoke(<generated>)\n	org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\n	org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:684)\n	com.linln.modules.order.service.impl.DetailServiceImpl$$EnhancerBySpringCGLIB$$c81f6b76.getPageList(<generated>)\n	com.linln.admin.order.controller.DetailController.index(DetailController.java:50)\n	com.linln.admin.order.controller.DetailController$$FastClassBySpringCGLIB$$7b000b8.invoke(<generated>)\n	org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\n	org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:749)\n	org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\n	org.apache.shiro.spring.security.interceptor.AopAllianceAnnotationsAuthorizingMethodInterceptor$1.proceed(AopAllianceAnnotationsAuthorizingMethodInterceptor.java:82)\n	org.apache.shiro.authz.aop.AuthorizingMethodInterceptor.invoke(AuthorizingMethodInterceptor.java:39)\n	org.apache.shiro.spring.security.interceptor.AopAllianceAnnotationsAuthorizingMethodInterceptor.invoke(AopAllianceAnnotationsAuthorizingMethodInterceptor.java:115)\n	org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:688)\n	com.linln.admin.order.controller.DetailController$$EnhancerBySpringCGLIB$$a7a6eb2d.index(<generated>)\n	sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	java.lang.reflect.Method.invoke(Method.java:498)\n	org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:189)\n	org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:138)\n	org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:102)\n	org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:892)\n	org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:797)\n	org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\n	org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1038)\n	org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:942)\n	org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1005)\n	org.springframework.web.servlet.FrameworkServlet.doGet(FrameworkServlet.java:897)\n	javax.servlet.http.HttpServlet.service(HttpServlet.java:634)\n	org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:882)\n	javax.servlet.http.HttpServlet.service(HttpServlet.java:741)\n	org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\n	org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:53)\n	org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\n	org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\n	org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\n	org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\n	org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\n	org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:449)\n	org.apache.shiro.web.servlet.AbstractShiroFilter$1.call(AbstractShiroFilter.java:365)\n	org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\n	org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\n	org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:387)\n	org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:362)\n	org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\n	org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	com.linln.common.xss.XssFilter.doFilter(XssFilter.java:47)\n	org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:99)\n	org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:92)\n	org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	org.springframework.web.filter.HiddenHttpMethodFilter.doFilterInternal(HiddenHttpMethodFilter.java:93)\n	org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:200)\n	org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:200)\n	org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:96)\n	org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:490)\n	org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:139)\n	org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:92)\n	org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:74)\n	org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:343)\n	org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:408)\n	org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\n	org.apache.coyote.AbstractProtocol$ConnectionHandler.process(AbstractProtocol.java:834)\n	org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1415)\n	org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\n	java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)\n	java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:624)\n	org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)\n	java.lang.Thread.run(Thread.java:748)', '2021-01-27 16:20:44', '系统', 4);
INSERT INTO `sys_action_log` VALUES (241, '系统异常', 3, '0:0:0:0:0:0:0:1', 'com.linln.component.actionLog.exception.ActionLogProceedAdvice', 'run', NULL, NULL, 'org.springframework.dao.InvalidDataAccessApiUsageException: Path \'createBy.dept.createBy.dept.createBy\' from root Detail must not span a cyclic property reference!\r\n[{ Detail(id=null, title=null, remark=null, createDate=null, updateDate=null, createBy=User(id=4, username=albert.fang, password=5050108411556052aab4e569f008f9bd8139c65dcee095a0c2d5d66ce7156f8b, salt=zbk8l2, nickname=albert, picture=null, sex=1, phone=13979347929, email=fxm970829@qq.com, createDate=2021-01-27 16:18:43.0, updateDate=2021-01-27 16:18:57.0, remark=开发部主管, status=1), updateBy=null, status=1) }] -createBy-> [{ User(id=4, username=albert.fang, password=5050108411556052aab4e569f008f9bd8139c65dcee095a0c2d5d66ce7156f8b, salt=zbk8l2, nickname=albert, picture=null, sex=1, phone=13979347929, email=fxm970829@qq.com, createDate=2021-01-27 16:18:43.0, updateDate=2021-01-27 16:18:57.0, remark=开发部主管, status=1) }] -dept-> [{ Dept(id=4, title=研发部门, pid=1, pids=[0],[1], sort=3, remark=, createDate=2018-12-02 17:51:55.0, updateDate=2019-04-27 13:12:20.0, createBy=User(id=1, username=admin, password=5fa04c0758ae596e2a93cd2802640693a5b08bdfacd4307abce323c85e481154, salt=7rl2t9, nickname=超级管理员, picture=null, sex=1, phone=10086, email=10086@163.com, createDate=2018-08-09 23:00:03.0, updateDate=2019-11-06 20:09:17.0, remark=, status=1), updateBy=User(id=1, username=admin, password=5fa04c0758ae596e2a93cd2802640693a5b08bdfacd4307abce323c85e481154, salt=7rl2t9, nickname=超级管理员, picture=null, sex=1, phone=10086, email=10086@163.com, createDate=2018-08-09 23:00:03.0, updateDate=2019-11-06 20:09:17.0, remark=, status=1), status=1) }] -createBy-> [{ User(id=1, username=admin, password=5fa04c0758ae596e2a93cd2802640693a5b08bdfacd4307abce323c85e481154, salt=7rl2t9, nickname=超级管理员, picture=null, sex=1, phone=10086, email=10086@163.com, createDate=2018-08-09 23:00:03.0, updateDate=2019-11-06 20:09:17.0, remark=, status=1) }] -dept-> [{ Dept(id=1, title=总公司, pid=0, pids=[0], sort=1, remark=, createDate=2018-12-02 17:41:23.0, updateDate=2019-02-23 02:41:28.0, createBy=User(id=1, username=admin, password=5fa04c0758ae596e2a93cd2802640693a5b08bdfacd4307abce323c85e481154, salt=7rl2t9, nickname=超级管理员, picture=null, sex=1, phone=10086, email=10086@163.com, createDate=2018-08-09 23:00:03.0, updateDate=2019-11-06 20:09:17.0, remark=, status=1), updateBy=User(id=1, username=admin, password=5fa04c0758ae596e2a93cd2802640693a5b08bdfacd4307abce323c85e481154, salt=7rl2t9, nickname=超级管理员, picture=null, sex=1, phone=10086, email=10086@163.com, createDate=2018-08-09 23:00:03.0, updateDate=2019-11-06 20:09:17.0, remark=, status=1), status=1) }] -createBy-> [{ User(id=1, username=admin, password=5fa04c0758ae596e2a93cd2802640693a5b08bdfacd4307abce323c85e481154, salt=7rl2t9, nickname=超级管理员, picture=null, sex=1, phone=10086, email=10086@163.com, createDate=2018-08-09 23:00:03.0, updateDate=2019-11-06 20:09:17.0, remark=, status=1) }]\n	org.springframework.data.jpa.convert.QueryByExamplePredicateBuilder.getPredicates(QueryByExamplePredicateBuilder.java:151)\n	org.springframework.data.jpa.convert.QueryByExamplePredicateBuilder.getPredicates(QueryByExamplePredicateBuilder.java:155)\n	org.springframework.data.jpa.convert.QueryByExamplePredicateBuilder.getPredicates(QueryByExamplePredicateBuilder.java:155)\n	org.springframework.data.jpa.convert.QueryByExamplePredicateBuilder.getPredicates(QueryByExamplePredicateBuilder.java:155)\n	org.springframework.data.jpa.convert.QueryByExamplePredicateBuilder.getPredicates(QueryByExamplePredicateBuilder.java:155)\n	org.springframework.data.jpa.convert.QueryByExamplePredicateBuilder.getPredicate(QueryByExamplePredicateBuilder.java:89)\n	org.springframework.data.jpa.repository.support.SimpleJpaRepository$ExampleSpecification.toPredicate(SimpleJpaRepository.java:812)\n	org.springframework.data.jpa.repository.support.SimpleJpaRepository.applySpecificationToCriteria(SimpleJpaRepository.java:694)\n	org.springframework.data.jpa.repository.support.SimpleJpaRepository.getQuery(SimpleJpaRepository.java:625)\n	org.springframework.data.jpa.repository.support.SimpleJpaRepository.getQuery(SimpleJpaRepository.java:598)\n	org.springframework.data.jpa.repository.support.SimpleJpaRepository.findAll(SimpleJpaRepository.java:460)\n	sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	java.lang.reflect.Method.invoke(Method.java:498)\n	org.springframework.data.repository.core.support.RepositoryComposition$RepositoryFragments.invoke(RepositoryComposition.java:359)\n	org.springframework.data.repository.core.support.RepositoryComposition.invoke(RepositoryComposition.java:200)\n	org.springframework.data.repository.core.support.RepositoryFactorySupport$ImplementationMethodExecutionInterceptor.invoke(RepositoryFactorySupport.java:644)\n	org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	org.springframework.data.repository.core.support.RepositoryFactorySupport$QueryExecutorMethodInterceptor.doInvoke(RepositoryFactorySupport.java:608)\n	org.springframework.data.repository.core.support.RepositoryFactorySupport$QueryExecutorMethodInterceptor.lambda$invoke$3(RepositoryFactorySupport.java:595)\n	org.springframework.data.repository.core.support.RepositoryFactorySupport$QueryExecutorMethodInterceptor.invoke(RepositoryFactorySupport.java:595)\n	org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	org.springframework.data.projection.DefaultMethodInvokingMethodInterceptor.invoke(DefaultMethodInvokingMethodInterceptor.java:59)\n	org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	org.springframework.transaction.interceptor.TransactionAspectSupport.invokeWithinTransaction(TransactionAspectSupport.java:294)\n	org.springframework.transaction.interceptor.TransactionInterceptor.invoke(TransactionInterceptor.java:98)\n	org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	org.springframework.dao.support.PersistenceExceptionTranslationInterceptor.invoke(PersistenceExceptionTranslationInterceptor.java:139)\n	org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	org.springframework.data.jpa.repository.support.CrudMethodMetadataPostProcessor$CrudMethodMetadataPopulatingMethodInterceptor.invoke(CrudMethodMetadataPostProcessor.java:138)\n	org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:93)\n	org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	org.springframework.data.repository.core.support.SurroundingTransactionDetectorMethodInterceptor.invoke(SurroundingTransactionDetectorMethodInterceptor.java:61)\n	org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	org.springframework.aop.framework.JdkDynamicAopProxy.invoke(JdkDynamicAopProxy.java:212)\n	com.sun.proxy.$Proxy141.findAll(Unknown Source)\n	com.linln.modules.order.service.impl.DetailServiceImpl.getPageList(DetailServiceImpl.java:46)\n	com.linln.modules.order.service.impl.DetailServiceImpl$$FastClassBySpringCGLIB$$3501bcbe.invoke(<generated>)\n	org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\n	org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:684)\n	com.linln.modules.order.service.impl.DetailServiceImpl$$EnhancerBySpringCGLIB$$e77a60b8.getPageList(<generated>)\n	com.linln.admin.order.controller.DetailController.index(DetailController.java:50)\n	com.linln.admin.order.controller.DetailController$$FastClassBySpringCGLIB$$7b000b8.invoke(<generated>)\n	org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\n	org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:749)\n	org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\n	org.apache.shiro.spring.security.interceptor.AopAllianceAnnotationsAuthorizingMethodInterceptor$1.proceed(AopAllianceAnnotationsAuthorizingMethodInterceptor.java:82)\n	org.apache.shiro.authz.aop.AuthorizingMethodInterceptor.invoke(AuthorizingMethodInterceptor.java:39)\n	org.apache.shiro.spring.security.interceptor.AopAllianceAnnotationsAuthorizingMethodInterceptor.invoke(AopAllianceAnnotationsAuthorizingMethodInterceptor.java:115)\n	org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:688)\n	com.linln.admin.order.controller.DetailController$$EnhancerBySpringCGLIB$$cfcb329c.index(<generated>)\n	sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	java.lang.reflect.Method.invoke(Method.java:498)\n	org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:189)\n	org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:138)\n	org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:102)\n	org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:892)\n	org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:797)\n	org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\n	org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1038)\n	org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:942)\n	org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1005)\n	org.springframework.web.servlet.FrameworkServlet.doGet(FrameworkServlet.java:897)\n	javax.servlet.http.HttpServlet.service(HttpServlet.java:634)\n	org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:882)\n	javax.servlet.http.HttpServlet.service(HttpServlet.java:741)\n	org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\n	org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:53)\n	org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\n	org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\n	org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\n	org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\n	org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\n	org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:449)\n	org.apache.shiro.web.servlet.AbstractShiroFilter$1.call(AbstractShiroFilter.java:365)\n	org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\n	org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\n	org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:387)\n	org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:362)\n	org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\n	org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	com.linln.common.xss.XssFilter.doFilter(XssFilter.java:47)\n	org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:99)\n	org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:92)\n	org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	org.springframework.web.filter.HiddenHttpMethodFilter.doFilterInternal(HiddenHttpMethodFilter.java:93)\n	org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:200)\n	org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:200)\n	org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:96)\n	org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:490)\n	org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:139)\n	org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:92)\n	org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:74)\n	org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:343)\n	org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:408)\n	org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\n	org.apache.coyote.AbstractProtocol$ConnectionHandler.process(AbstractProtocol.java:834)\n	org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1415)\n	org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\n	java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)\n	java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:624)\n	org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)\n	java.lang.Thread.run(Thread.java:748)', '2021-01-27 16:26:15', '系统', 4);
INSERT INTO `sys_action_log` VALUES (242, '菜单管理', 1, '0:0:0:0:0:0:0:1', 'com.linln.admin.system.controller.MenuController', 'save', 'sys_menu', 152, '添加菜单：业务逻辑', '2021-01-27 16:57:42', 'albert', 4);
INSERT INTO `sys_action_log` VALUES (243, '菜单管理', 1, '0:0:0:0:0:0:0:1', 'com.linln.admin.system.controller.MenuController', 'save', 'sys_menu', 147, '更新菜单：订单详情', '2021-01-27 16:58:30', 'albert', 4);
INSERT INTO `sys_action_log` VALUES (244, '用户登录', 2, '0:0:0:0:0:0:0:1', 'com.linln.admin.system.controller.LoginController', 'login', NULL, NULL, '后台登录成功', '2021-01-27 16:58:58', '超级管理员', 1);

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门名称',
  `pid` bigint(20) NULL DEFAULT NULL COMMENT '父级ID',
  `pids` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所有父级编号',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建用户',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新用户',
  `status` tinyint(4) NULL DEFAULT NULL COMMENT '状态（1:正常,2:冻结,3:删除）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKifwd1h4ciusl3nnxrpfpv316u`(`create_by`) USING BTREE,
  INDEX `FK83g45s1cjqqfpifhulqhv807m`(`update_by`) USING BTREE,
  CONSTRAINT `FK83g45s1cjqqfpifhulqhv807m` FOREIGN KEY (`update_by`) REFERENCES `sys_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKifwd1h4ciusl3nnxrpfpv316u` FOREIGN KEY (`create_by`) REFERENCES `sys_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (1, '总公司', 0, '[0]', 1, '', '2018-12-02 17:41:23', '2019-02-23 02:41:28', 1, 1, 1);
INSERT INTO `sys_dept` VALUES (2, '技术部门', 1, '[0],[1]', 1, '', '2018-12-02 17:51:04', '2019-04-27 13:12:46', 1, 1, 1);
INSERT INTO `sys_dept` VALUES (3, '市场部门', 1, '[0],[1]', 2, '', '2018-12-02 17:51:42', '2019-04-27 13:12:20', 1, 1, 1);
INSERT INTO `sys_dept` VALUES (4, '研发部门', 1, '[0],[1]', 3, '', '2018-12-02 17:51:55', '2019-04-27 13:12:20', 1, 1, 1);
INSERT INTO `sys_dept` VALUES (5, '测试部门', 1, '[0],[1]', 4, '', '2018-12-02 17:52:07', '2019-04-27 13:12:20', 1, 1, 1);

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字典名称',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字典键名',
  `type` tinyint(4) NULL DEFAULT NULL COMMENT '字典类型',
  `value` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '字典键值',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建用户',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新用户',
  `status` tinyint(4) NULL DEFAULT NULL COMMENT '状态（1:正常,2:冻结,3:删除）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKag4shuprf2tjot9i1mhh37kk6`(`create_by`) USING BTREE,
  INDEX `FKoyng5jlifhsme0gc1lwiub0lr`(`update_by`) USING BTREE,
  CONSTRAINT `FKag4shuprf2tjot9i1mhh37kk6` FOREIGN KEY (`create_by`) REFERENCES `sys_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKoyng5jlifhsme0gc1lwiub0lr` FOREIGN KEY (`update_by`) REFERENCES `sys_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES (1, '数据状态', 'DATA_STATUS', 2, '1:正常,2:冻结,3:删除', '', '2018-10-05 16:03:11', '2018-10-05 16:11:41', 1, 1, 1);
INSERT INTO `sys_dict` VALUES (2, '字典类型', 'DICT_TYPE', 2, '2:键值对', '', '2018-10-05 20:08:55', '2019-01-17 23:39:23', 1, 1, 1);
INSERT INTO `sys_dict` VALUES (3, '用户性别', 'USER_SEX', 2, '1:男,2:女', '', '2018-10-05 20:12:32', '2018-10-05 20:12:32', 1, 1, 1);
INSERT INTO `sys_dict` VALUES (4, '菜单类型', 'MENU_TYPE', 2, '1:目录,2:菜单,3:按钮', '', '2018-10-05 20:24:57', '2019-11-06 20:08:46', 1, 1, 1);
INSERT INTO `sys_dict` VALUES (5, '搜索栏状态', 'SEARCH_STATUS', 2, '1:正常,2:冻结', '', '2018-10-05 20:25:45', '2019-02-26 00:34:34', 1, 1, 1);
INSERT INTO `sys_dict` VALUES (6, '日志类型', 'LOG_TYPE', 2, '1:业务,2:登录,3:系统', '', '2018-10-05 20:28:47', '2019-02-26 00:31:43', 1, 1, 1);

-- ----------------------------
-- Table structure for sys_file
-- ----------------------------
DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE `sys_file`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件名',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件路径',
  `mime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'MIME文件类型',
  `size` bigint(20) NULL DEFAULT NULL COMMENT '文件大小',
  `md5` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'MD5值',
  `sha1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'SHA1值',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '上传者',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKkkles8yp0a156p4247cc22ovn`(`create_by`) USING BTREE,
  CONSTRAINT `FKkkles8yp0a156p4247cc22ovn` FOREIGN KEY (`create_by`) REFERENCES `sys_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `pid` bigint(20) NULL DEFAULT NULL COMMENT '父级编号',
  `pids` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所有父级编号',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'URL地址',
  `perms` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `type` tinyint(4) NULL DEFAULT NULL COMMENT '类型（1:一级菜单,2:子级菜单,3:不是菜单）',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建用户',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新用户',
  `status` tinyint(4) NULL DEFAULT NULL COMMENT '状态（1:正常,2:冻结,3:删除）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKoxg2hi96yr9pf2m0stjomr3we`(`create_by`) USING BTREE,
  INDEX `FKsiko0qcr8ddamvrxf1tk4opgc`(`update_by`) USING BTREE,
  CONSTRAINT `FKoxg2hi96yr9pf2m0stjomr3we` FOREIGN KEY (`create_by`) REFERENCES `sys_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKsiko0qcr8ddamvrxf1tk4opgc` FOREIGN KEY (`update_by`) REFERENCES `sys_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 153 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '菜单管理', 2, '[0],[2]', '/system/menu/index', 'system:menu:index', '', 2, 3, '', '2018-09-29 00:02:10', '2019-02-24 16:10:40', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (2, '系统管理', 0, '[0]', '#', '#', 'fa fa-cog', 1, 2, '', '2018-09-29 00:05:50', '2019-02-27 21:34:56', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (3, '添加', 1, '[0],[2],[1]', '/system/menu/add', 'system:menu:add', '', 3, 1, '', '2018-09-29 00:06:57', '2019-02-24 16:12:59', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (4, '角色管理', 2, '[0],[2]', '/system/role/index', 'system:role:index', '', 2, 2, '', '2018-09-29 00:08:14', '2019-02-24 16:10:34', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (5, '添加', 4, '[0],[2],[4]', '/system/role/add', 'system:role:add', '', 3, 1, '', '2018-09-29 00:09:04', '2019-02-24 16:12:04', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (6, '主页', 0, '[0]', '/index', 'index', 'layui-icon layui-icon-home', 1, 1, '', '2018-09-29 00:09:56', '2019-02-27 21:34:56', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (7, '用户管理', 2, '[0],[2]', '/system/user/index', 'system:user:index', '', 2, 1, '', '2018-09-29 00:43:50', '2019-04-05 17:43:25', 1, 2, 1);
INSERT INTO `sys_menu` VALUES (8, '编辑', 1, '[0],[2],[1]', '/system/menu/edit', 'system:menu:edit', '', 3, 2, '', '2018-09-29 00:57:33', '2019-02-24 16:13:05', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (9, '详细', 1, '[0],[2],[1]', '/system/menu/detail', 'system:menu:detail', '', 3, 3, '', '2018-09-29 01:03:00', '2019-02-24 16:13:12', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (10, '修改状态', 1, '[0],[2],[1]', '/system/menu/status', 'system:menu:status', '', 3, 4, '', '2018-09-29 01:03:43', '2019-02-24 16:13:21', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (11, '编辑', 4, '[0],[2],[4]', '/system/role/edit', 'system:role:edit', '', 3, 2, '', '2018-09-29 01:06:13', '2019-02-24 16:12:10', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (12, '授权', 4, '[0],[2],[4]', '/system/role/auth', 'system:role:auth', '', 3, 3, '', '2018-09-29 01:06:57', '2019-02-24 16:12:17', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (13, '详细', 4, '[0],[2],[4]', '/system/role/detail', 'system:role:detail', '', 3, 4, '', '2018-09-29 01:08:00', '2019-02-24 16:12:24', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (14, '修改状态', 4, '[0],[2],[4]', '/system/role/status', 'system:role:status', '', 3, 5, '', '2018-09-29 01:08:22', '2019-02-24 16:12:43', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (15, '编辑', 7, '[0],[2],[7]', '/system/user/edit', 'system:user:edit', '', 3, 2, '', '2018-09-29 21:17:17', '2019-02-24 16:11:03', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (16, '添加', 7, '[0],[2],[7]', '/system/user/add', 'system:user:add', '', 3, 1, '', '2018-09-29 21:17:58', '2019-02-24 16:10:28', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (17, '修改密码', 7, '[0],[2],[7]', '/system/user/pwd', 'system:user:pwd', '', 3, 3, '', '2018-09-29 21:19:40', '2019-02-24 16:11:11', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (18, '权限分配', 7, '[0],[2],[7]', '/system/user/role', 'system:user:role', '', 3, 4, '', '2018-09-29 21:20:35', '2019-02-24 16:11:18', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (19, '详细', 7, '[0],[2],[7]', '/system/user/detail', 'system:user:detail', '', 3, 5, '', '2018-09-29 21:21:00', '2019-02-24 16:11:26', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (20, '修改状态', 7, '[0],[2],[7]', '/system/user/status', 'system:user:status', '', 3, 6, '', '2018-09-29 21:21:18', '2019-02-24 16:11:35', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (21, '字典管理', 2, '[0],[2]', '/system/dict/index', 'system:dict:index', '', 2, 5, '', '2018-10-05 00:55:52', '2019-02-24 16:14:24', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (22, '字典添加', 21, '[0],[2],[21]', '/system/dict/add', 'system:dict:add', '', 3, 1, '', '2018-10-05 00:56:26', '2019-02-24 16:14:10', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (23, '字典编辑', 21, '[0],[2],[21]', '/system/dict/edit', 'system:dict:edit', '', 3, 2, '', '2018-10-05 00:57:08', '2019-02-24 16:14:34', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (24, '字典详细', 21, '[0],[2],[21]', '/system/dict/detail', 'system:dict:detail', '', 3, 3, '', '2018-10-05 00:57:42', '2019-02-24 16:14:41', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (25, '修改状态', 21, '[0],[2],[21]', '/system/dict/status', 'system:dict:status', '', 3, 4, '', '2018-10-05 00:58:27', '2019-02-24 16:14:49', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (26, '行为日志', 2, '[0],[2]', '/system/actionLog/index', 'system:actionLog:index', '', 2, 6, '', '2018-10-14 16:52:01', '2019-02-27 21:34:15', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (27, '日志详细', 26, '[0],[2],[26]', '/system/actionLog/detail', 'system:actionLog:detail', '', 3, 1, '', '2018-10-14 21:07:11', '2019-02-27 21:34:15', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (28, '日志删除', 26, '[0],[2],[26]', '/system/actionLog/delete', 'system:actionLog:delete', '', 3, 2, '', '2018-10-14 21:08:17', '2019-02-27 21:34:15', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (30, '开发中心', 0, '[0]', '#', '#', 'fa fa-gavel', 1, 3, '', '2018-10-19 16:38:23', '2019-02-27 21:34:56', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (31, '代码生成', 30, '[0],[30]', '/dev/code', '#', '', 2, 1, '', '2018-10-19 16:39:04', '2019-03-13 17:43:58', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (125, '表单构建', 30, '[0],[30]', '/dev/build', '#', '', 2, 2, '', '2018-11-25 16:12:23', '2019-02-24 16:16:40', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (136, '部门管理', 2, '[0],[2]', '/system/dept/index', 'system:dept:index', '', 2, 4, '', '2018-12-02 16:33:23', '2019-02-24 16:10:50', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (137, '添加', 136, '[0],[2],[136]', '/system/dept/add', 'system:dept:add', '', 3, 1, '', '2018-12-02 16:33:23', '2019-02-24 16:13:34', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (138, '编辑', 136, '[0],[2],[136]', '/system/dept/edit', 'system:dept:edit', '', 3, 2, '', '2018-12-02 16:33:23', '2019-02-24 16:13:42', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (139, '详细', 136, '[0],[2],[136]', '/system/dept/detail', 'system:dept:detail', '', 3, 3, '', '2018-12-02 16:33:23', '2019-02-24 16:13:49', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (140, '改变状态', 136, '[0],[2],[136]', '/system/dept/status', 'system:dept:status', '', 3, 4, '', '2018-12-02 16:33:23', '2019-02-24 16:13:57', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (146, '数据接口', 30, '[0],[30]', '/dev/swagger', '#', '', 2, 3, '', '2018-12-09 21:11:11', '2019-02-24 23:38:18', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (147, '订单详情', 152, '[0],[152]', '/order/detail/index', 'order:detail:index', '', 1, 1, '', '2021-01-27 10:59:46', '2021-01-27 16:58:30', 1, 4, 1);
INSERT INTO `sys_menu` VALUES (148, '添加', 147, '[0],[147]', '/order/detail/add', 'order:detail:add', NULL, 3, 1, NULL, '2021-01-27 10:59:46', '2021-01-27 10:59:46', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (149, '编辑', 147, '[0],[147]', '/order/detail/edit', 'order:detail:edit', NULL, 3, 1, NULL, '2021-01-27 10:59:46', '2021-01-27 10:59:46', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (150, '详细', 147, '[0],[147]', '/order/detail/detail', 'order:detail:detail', NULL, 3, 1, NULL, '2021-01-27 10:59:46', '2021-01-27 10:59:46', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (151, '修改状态', 147, '[0],[147]', '/order/detail/status', 'order:detail:status', NULL, 3, 1, NULL, '2021-01-27 10:59:46', '2021-01-27 10:59:46', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (152, '业务逻辑', 0, '[0]', '#', '#', 'layui-icon layui-icon-template-1', 1, 4, '所有业务逻辑功能放在该目录下面', '2021-01-27 16:57:42', '2021-01-27 16:57:42', 4, 4, 1);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称（中文名）',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标识名称',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建用户',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新用户',
  `status` tinyint(4) NULL DEFAULT NULL COMMENT '状态（1:正常,2:冻结,3:删除）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKdkwvv0rm6j3d5l6hwsy2dplol`(`create_by`) USING BTREE,
  INDEX `FKrouqqi3f2bgc5o83wdstlh6q4`(`update_by`) USING BTREE,
  CONSTRAINT `FKdkwvv0rm6j3d5l6hwsy2dplol` FOREIGN KEY (`create_by`) REFERENCES `sys_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKrouqqi3f2bgc5o83wdstlh6q4` FOREIGN KEY (`update_by`) REFERENCES `sys_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '管理员', 'admin', '', '2018-09-29 00:12:40', '2019-01-18 21:09:51', 1, 1, 1);
INSERT INTO `sys_role` VALUES (2, '开发组', 'group', '', '2018-09-30 16:04:32', '2021-01-25 14:25:11', 1, 3, 1);
INSERT INTO `sys_role` VALUES (3, '用户组', 'group1', '', '2018-09-30 16:24:20', '2019-04-28 00:11:09', 1, 1, 1);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NOT NULL,
  `menu_id` bigint(20) NOT NULL,
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE,
  INDEX `FKf3mud4qoc7ayew8nml4plkevo`(`menu_id`) USING BTREE,
  CONSTRAINT `FKf3mud4qoc7ayew8nml4plkevo` FOREIGN KEY (`menu_id`) REFERENCES `sys_menu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKkeitxsgxwayackgqllio4ohn5` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (1, 1);
INSERT INTO `sys_role_menu` VALUES (3, 1);
INSERT INTO `sys_role_menu` VALUES (1, 2);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (3, 2);
INSERT INTO `sys_role_menu` VALUES (1, 3);
INSERT INTO `sys_role_menu` VALUES (3, 3);
INSERT INTO `sys_role_menu` VALUES (1, 4);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (1, 5);
INSERT INTO `sys_role_menu` VALUES (2, 5);
INSERT INTO `sys_role_menu` VALUES (1, 6);
INSERT INTO `sys_role_menu` VALUES (2, 6);
INSERT INTO `sys_role_menu` VALUES (3, 6);
INSERT INTO `sys_role_menu` VALUES (1, 7);
INSERT INTO `sys_role_menu` VALUES (2, 7);
INSERT INTO `sys_role_menu` VALUES (1, 8);
INSERT INTO `sys_role_menu` VALUES (3, 8);
INSERT INTO `sys_role_menu` VALUES (1, 9);
INSERT INTO `sys_role_menu` VALUES (3, 9);
INSERT INTO `sys_role_menu` VALUES (1, 10);
INSERT INTO `sys_role_menu` VALUES (3, 10);
INSERT INTO `sys_role_menu` VALUES (1, 11);
INSERT INTO `sys_role_menu` VALUES (2, 11);
INSERT INTO `sys_role_menu` VALUES (1, 12);
INSERT INTO `sys_role_menu` VALUES (2, 12);
INSERT INTO `sys_role_menu` VALUES (1, 13);
INSERT INTO `sys_role_menu` VALUES (2, 13);
INSERT INTO `sys_role_menu` VALUES (1, 14);
INSERT INTO `sys_role_menu` VALUES (2, 14);
INSERT INTO `sys_role_menu` VALUES (1, 15);
INSERT INTO `sys_role_menu` VALUES (2, 15);
INSERT INTO `sys_role_menu` VALUES (1, 16);
INSERT INTO `sys_role_menu` VALUES (2, 16);
INSERT INTO `sys_role_menu` VALUES (1, 17);
INSERT INTO `sys_role_menu` VALUES (2, 17);
INSERT INTO `sys_role_menu` VALUES (1, 18);
INSERT INTO `sys_role_menu` VALUES (2, 18);
INSERT INTO `sys_role_menu` VALUES (1, 19);
INSERT INTO `sys_role_menu` VALUES (2, 19);
INSERT INTO `sys_role_menu` VALUES (1, 20);
INSERT INTO `sys_role_menu` VALUES (2, 20);
INSERT INTO `sys_role_menu` VALUES (1, 21);
INSERT INTO `sys_role_menu` VALUES (3, 21);
INSERT INTO `sys_role_menu` VALUES (1, 22);
INSERT INTO `sys_role_menu` VALUES (3, 22);
INSERT INTO `sys_role_menu` VALUES (1, 23);
INSERT INTO `sys_role_menu` VALUES (3, 23);
INSERT INTO `sys_role_menu` VALUES (1, 24);
INSERT INTO `sys_role_menu` VALUES (3, 24);
INSERT INTO `sys_role_menu` VALUES (1, 25);
INSERT INTO `sys_role_menu` VALUES (3, 25);
INSERT INTO `sys_role_menu` VALUES (1, 26);
INSERT INTO `sys_role_menu` VALUES (2, 26);
INSERT INTO `sys_role_menu` VALUES (1, 27);
INSERT INTO `sys_role_menu` VALUES (2, 27);
INSERT INTO `sys_role_menu` VALUES (1, 28);
INSERT INTO `sys_role_menu` VALUES (2, 28);
INSERT INTO `sys_role_menu` VALUES (1, 30);
INSERT INTO `sys_role_menu` VALUES (2, 30);
INSERT INTO `sys_role_menu` VALUES (1, 31);
INSERT INTO `sys_role_menu` VALUES (2, 31);
INSERT INTO `sys_role_menu` VALUES (1, 125);
INSERT INTO `sys_role_menu` VALUES (2, 125);
INSERT INTO `sys_role_menu` VALUES (1, 136);
INSERT INTO `sys_role_menu` VALUES (3, 136);
INSERT INTO `sys_role_menu` VALUES (1, 137);
INSERT INTO `sys_role_menu` VALUES (3, 137);
INSERT INTO `sys_role_menu` VALUES (1, 138);
INSERT INTO `sys_role_menu` VALUES (3, 138);
INSERT INTO `sys_role_menu` VALUES (1, 139);
INSERT INTO `sys_role_menu` VALUES (3, 139);
INSERT INTO `sys_role_menu` VALUES (1, 140);
INSERT INTO `sys_role_menu` VALUES (3, 140);
INSERT INTO `sys_role_menu` VALUES (1, 146);
INSERT INTO `sys_role_menu` VALUES (2, 146);
INSERT INTO `sys_role_menu` VALUES (1, 147);
INSERT INTO `sys_role_menu` VALUES (1, 148);
INSERT INTO `sys_role_menu` VALUES (1, 149);
INSERT INTO `sys_role_menu` VALUES (1, 150);
INSERT INTO `sys_role_menu` VALUES (1, 151);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户昵称',
  `password` char(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `salt` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码盐',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `sex` tinyint(4) NULL DEFAULT NULL COMMENT '性别（1:男,2:女）',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话号码',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `status` tinyint(4) NULL DEFAULT NULL COMMENT '状态（1:正常,2:冻结,3:删除）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKb3pkx0wbo6o8i8lj0gxr37v1n`(`dept_id`) USING BTREE,
  CONSTRAINT `FKb3pkx0wbo6o8i8lj0gxr37v1n` FOREIGN KEY (`dept_id`) REFERENCES `sys_dept` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', '超级管理员', '5fa04c0758ae596e2a93cd2802640693a5b08bdfacd4307abce323c85e481154', '7rl2t9', 1, NULL, 1, '10086@163.com', '10086', '', '2018-08-09 23:00:03', '2019-11-06 20:09:17', 1);
INSERT INTO `sys_user` VALUES (2, 'linln', '小懒虫', '28bfc4f19b0d4b8a40018faf9aec4ad9db5491082dda439040b1c35ff8c533a7', 'gzNkXt', 2, NULL, 2, '1008612@qq.com', '1008612', '', '2018-09-30 16:25:22', '2019-11-06 20:09:17', 3);
INSERT INTO `sys_user` VALUES (3, 'albert.fang', 'albert', 'e552d96bf8117bf71bf815997edffadeb40b3d8165d14e8fd19472987310fac1', '6TygiV', 2, NULL, 1, 'fxm970829@qq.com', '13979347929', '开发经理', '2021-01-25 14:07:39', '2021-01-25 14:28:01', 3);
INSERT INTO `sys_user` VALUES (4, 'albert.fang', 'albert', '5050108411556052aab4e569f008f9bd8139c65dcee095a0c2d5d66ce7156f8b', 'zbk8l2', 4, NULL, 1, 'fxm970829@qq.com', '13979347929', '开发部主管', '2021-01-27 16:18:43', '2021-01-27 16:18:57', 1);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE,
  INDEX `FKhh52n8vd4ny9ff4x9fb8v65qx`(`role_id`) USING BTREE,
  CONSTRAINT `FKb40xxfch70f5qnyfw8yme1n1s` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKhh52n8vd4ny9ff4x9fb8v65qx` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (4, 1);
INSERT INTO `sys_user_role` VALUES (4, 2);
INSERT INTO `sys_user_role` VALUES (4, 3);

SET FOREIGN_KEY_CHECKS = 1;
