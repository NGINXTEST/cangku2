#!/bin/bash
cpuheshu=`cat /proc/cpuinfo | grep "cpu cores" |awk '{print $4}' |head -n 1`
cpugeshu=`cat /proc/cpuinfo | grep "cpu cores" |wc -l`
echo "###########################"
echo  "CPU核数: $cpugeshu*$cpuheshu"
echo "###########################"
echo  "CPU使用率: `top -n 1|grep "Cpu"|awk '{printf "%.2f%\n",(100%-$5)}'`"
echo "###########################"
echo  "内存: `free -m |grep Mem |awk '{print $2,$3}{printf"%.2f%\n", ($3/$2)*100}'`"
echo "###########################"
echo "磁盘: "
echo "`lsblk |grep "vd[abcde]\>"|awk '{print $1,$4}'`" 
echo "###########################"
echo "`df -h | awk 'NR==1{print}'`"
echo "`df -h |awk '/\/home/{print}'`"
echo "`df -h |awk '/\/mnt/{print}'`"

