#!/bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
clear
echo
echo "#############################################################"
echo "# One click Install cfddns                                  #"
echo "# Author: garhing                                           #"
echo "#############################################################"
echo "请输入您的APIKEY： " ;read cfkey
echo "请输入您的邮箱： " ;read cfuser
echo "请输入您的主域名： " ;read cfname
echo "请输入域名记录：" ;read record
echo Starting.....
cd /root
wget  -N --no-check-certificate https://raw.githubusercontent.com/garhing/cfddns/master/cfddns.sh >/dev/null 2>&1
echo 正在配置cfddns
sed -i -e "s/CFKEY=/CFKEY=$cfkey/g" cfddns.sh
sed -i -e "s/CFUSER=/CFUSER=$cfuser/g" cfddns.sh
sed -i -e "s/CFZONE_NAME=/CFZONE_NAME=$cfname/g" cfddns.sh
sed -i -e "s/CFRECORD_NAME=/CFRECORD_NAME=$record/g" cfddns.sh
echo 'ddns配置完成'
chmod +x cfddns.sh && ./cfddns.sh
echo '设置定时任务'
echo "*/2 * * * * /root/cfddns.sh >> /var/log/cfddns.log 2>&1" >> /etc/crontab
echo 配置完成
