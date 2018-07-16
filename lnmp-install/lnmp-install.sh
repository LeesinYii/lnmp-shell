#! /bin/bash
# lnmp 一键安装脚本
# author leesin
# date 2018-07-16

# php  http://cn2.php.net/get/php-7.2.7.tar.gz/from/this/mirror
# mysql  
php_prefix="cn2.php.net/get/"
php_suffix=".tar.gz/from/this/mirror"

nginx_prefix="https://nginx.org/download/"
nginx_suffix=".tar.gz"

mysql_prefix=""
mysql_suffix=""

# php 版本
php_version=(
	"php-5.6.35"
	"php-7.0.12"
	"php-7.1.15"
	"php-7.2.7"
)

# nginx 版本
nginx_version=(
	"nginx-1.10.3"
	"nginx-1.12.2"
	"nginx-1.14.0"
)

# mysql 版本
mysql_version=(

)

# 需要安装的软件
soft=('php' 'nginx' 'mysql')
message=(
	"====== 请选择 php 版本 ======"
	"====== 请选择 nginx 版本 ======"
	"====== 请选择 mysql 版本 ======"
)

# 选择 软件版本
for i in ${soft[*]}; do
	version=$soft[$i]"_version"

	echo $message[$i]

	count=${#version[*]}
	for (( i = 0; i < $count; i++ )); do
		echo $i"."${version[$i]}
	done

	read n
	url=${soft[$i]}"_prefix"${version[$i]}${soft[$i]}"_suffix"

	# 将获取到的 url 存入数组
	url_set[$i]=$url
	echo "您所选择的版本url:"url"稍后选择下一个软件的版本"

	sleep 5s
done
