#!/bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
clear
echo
echo "#############################################################"
echo "# One click Install cfddns                                  #"
echo "# Author: garhing                                           #"
echo "#############################################################"
echo "请输入 CFKEY > " ;read cfkey
echo "请输入 CFUSER > " ;read cfuser
echo "请输入 CFZONE_NAME > " ;read cfname
echo "请输入 CFRECORD_NAME > " ;read record
echo Starting.....
cd /root
wget  -N --no-check-certificate https://raw.githubusercontent.com/garhing/cfddns/master/cfddns.sh >/dev/null 2>&1
echo 正在配置cfddns
sed 's/CFKEY=.*/& $cfkey/g' cfddns.sh
sed 's/CFUSER=.*/& $cfuser/g' cfddns.sh
sed 's/CFZONE_NAME=.*/& $cfname/g' cfddns.sh
sed 's/CFRECORD_NAME=.*/& $record/g' cfddns.sh
chmod +x cfddns.sh 
echo '*/2 * * * * /root/cfddns.sh >> /var/log/cfddns.log 2>&1' >> crontab 
./cfddns.sh
echo 配置完成
