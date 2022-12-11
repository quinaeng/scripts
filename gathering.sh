#!/bin/bash

TODAY=`date +%Y%m%d`
#INTERVAL="3"

command_list(){
        ps aux
        sysctl -a
        rpm -qa
        systemctl list-unit-files --type service | cat
        uname -a
        cat /etc/redhat-release
        systemctl get-default
        cat /etc/passwd
        cat /etc/group
        cat /etc/shadow
        ls -al /home/
        ls -al /var/spool/mail/
        date
        timedatectl show
        chronyc sources
        cat /etc/chrony.conf
        ps aux
        cat /etc/nsswitch.conf
        env
        cat /etc/environment
        getenforce
        systemctl status firewalld
        ls -al /etc/skel/
        ip addr
        cat /etc/resolv.conf
        cat /etc/hosts
        netstat -tupnl
        ss -tunl
        ping -c 3 8.8.8.8
        nslookup google.com
        cat /etc/fstab
        mount
        df -h
        lsblk
        blkid
        fdisk -l
        du -hc /home/
        du -hc /var/
        du -hc /etc/
        kill -9 $$
}

while true;
do
        command_list 1>> result_${TODAY}.log 2>> error_${TODAY}.log
#       sleep ${INTERVAL}
done
