#!/usr/bin/env bash
echo '请进行登录相关操作：'
vsce login xiaoxintongxue # 登陆
vsce package # 打包
echo "-------publishing-------"
vsce publish # 发布
echo "发布结束"
exit