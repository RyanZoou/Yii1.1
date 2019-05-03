<div align="center" style="background:#1e6887;height: 70px;">
    <div style="width:60%;float:left;height: 60px;">
        <img src="https://www.yiiframework.com/image/logo.svg" style="float:right;height:50px;margin: 10px 10px 10px auto">
    </div>
    <div style="width:40%;float:left;">
        <span style="color: white;float: left;font-size: 28px;line-height: 70px">1.1 学习与使用</span>
    </div>
</div>

# 目录

- [Yii 介绍](#Yii 介绍)
  - [简介](#简介)
  - [安装](#安装)
  - [伪静态配置](#伪静态配置)
  - [Yii的MVC](#Yii的MVC)
  - [目录基本结构](#目录基本结构)

- [框架加载及流程分析](#框架加载及流程分析)
  - [入口文件](#入口文件)
  - [框架加载](#框架加载)
  - [运行流程](#运行流程)
- [组件化与模块化](#组件化与模块化)
  - [Yiibase静态类](#Yiibase静态类)
  - [组件](#组件)
  - [模块](#模块)
  - [App应用](#App应用)
  - [WebApp应用](#WebApp应用)
- [MVC分层应用介绍](#MVC分层应用介绍)
  - [模型层](#模型层)
  - [控制器层](#控制器层)
  - [视图层](#视图层)
- [常用组件应用介绍](#常用组件应用介绍)
  - [URL管理组件](#URL管理组件)
  - [角色控制访问组件](#角色控制访问组件)
  - [日志路由组件](#日志路由组件)
  - [错误处理组件](#错误处理组件)
  - [缓存组件](#缓存组件)
  - [全局状态组件](#全局状态组件)









------

## Yii 介绍

1. ### 简介

   ​		Yii 是一个基于组件的高性能 PHP 框架，用于快速开发大型 Web 应用。Yii的起始Yii1.0 版本由美籍华人 薛强 发布了于 2008 年 12 月 3 日，Yii 是目前比较优秀的 PHP 框架之一，它的支持的特性包括:MVC、DAO/ActiveRecord、caching、AJAX 支持、用户认证和基于角色的访问控制、脚手架、输入验证、部件、事件、主题化以及 Web 服务等。

2. ### 安装

   - [最新版源代码](https://github.com/yiisoft/yii/releases/download/1.1.21/yii-1.1.21.733ac5.tar.gz)下载

   - Git克隆

     ```
     git clone git@github.com:yiisoft/yii.git yii
     ```

   - SVN下拉

     ```
     svn checkout https://github.com/yiisoft/yii/trunk/ yii
     ```

3. ### 伪静态配置

   - 配置web服务器根目录为应用根目录 (以 apache为例)

     ```.conf
     DocumentRoot "path/to/yii/web"
     <Directory "path/to/yii/web">
      ...
     </Directory>
     ```

   - 开启web服务器URL重写

     ```
     #LoadModule rewrite_module libexec/apache2/mod_rewrite.so  //删除行头'#'后保存
     ```

   - 设置统一入口文件为应用根目录下的index.php，在应用根目录下添加.htaccess文件，内容如下：

     ```.htaccess
     Options +FollowSymLinks
     IndexIgnore */*
     RewriteEngine on
     # if a directory or a file exists, use it directly
     RewriteCond %{REQUEST_FILENAME} !-f
     RewriteCond %{REQUEST_FILENAME} !-d
     # otherwise forward it to index.php
     RewriteRule . index.php
     ```

   - 禁止访问应用根目录下的protected文件夹内容，在path/to/yii/web/protected目录下添加 .htaccess 文件,内容如下：

     ```
     deny from all
     ```

4. ### Yii的MVC

   ​		Yii使用了 Web 开发中广泛采用的模型-视图-控制器（MVC）设计模式。 MVC的目标是将业务逻辑从用户界面的考虑中分离，这样开发者就可以更容易地改变每一部分而不会影响其他。
   ​		在 MVC中，模型代表信息（数据）和业务规则；视图包含了用户界面元素，例如文本，表单等； 控制器则管理模型和视图中的通信。下面的示意图展示了 Yii 的MVC的静态结构：

   <div align="center" style="height: 333px;">
      <img src="https://www.yiiframework.com/doc/guide/1.1/zh_cn/images/structure.png">
     <p>Yii中MVC模型原理图</p>
   </div>

5. ### 目录基本结构





------

## 框架加载及流程分析

1. ### 入口文件

   ​		Yii框架与大多数MVC框架一样是个单一入口框架，所谓单一入口是指，Yii框架对外开放的http访问入口只能是一个，也即应用根目录下的 index.php 脚本(path/to/yii/web.index.php)。入口脚本的内容如下：

   ```php
   // change the following paths if necessary
   $yii=dirname(__FILE__).'/../framework/yii.php';   				//获取核心库文件位置
   $config=dirname(__FILE__).'/protected/config/main.php';		//获取配置数据到config
   
   // remove the following lines when in production mode
   defined('YII_DEBUG') or define('YII_DEBUG',true);			//开启调试模式，生产环境一定要删除
   // specify how many levels of call stack should be shown in each log message
   defined('YII_TRACE_LEVEL') or define('YII_TRACE_LEVEL',3); //定义日志级别
   
   require_once($yii);																		  //导入框架核心库文件
   Yii::createWebApplication($config)->run();							 //创建应用并初始化后运行
   ```

2. ### 框架加载

    

3. ### 运行流程



