#! /bin/bash
# 一键部署安装 walle 系统
# author leesin
# date 2018-07-13
# version 1.0

# 检测 lnmp 环境，不存在则给出 安装 shell
# 检测 lnmp 服务是否开启，没有开启则开启
# 检测 git / svn，不存在则 安装 git/svn
# 更换国内镜像，可以先询问，测试是否已经安装 composer
# 未安装则安装 composer 
# 如果安装 composer 已经安装，则 更换国内镜像
# 建议升级 composer self-update
# 设置 下载路径 和 安装路径 , 给默认值
# git clone 或者 composer 安装
# 切换工作目录
# 配置 mysql 连接文件
# 配置 nginx server

# curl -sS https://getcomposer.org/installer | php
# mv composer.phar /usr/local/bin/composer                # PATH目录
# git clone https://github.com/LeesinYii/walle-web.git walle-web
# composer create-project meolu/walle-web walle-web
cd walle

vi config/web.php # 设置mysql连接, 换成交互模式

composer config -g repo.packagist composer https://packagist.phpcomposer.com 
composer install  # 如果缺少bower-asset的话， 先安装：composer global require "fxp/composer-asset-plugin:*"
./yii walle/setup   # 初始化项目
配置nginx/apache的webroot指向walle-web/web
