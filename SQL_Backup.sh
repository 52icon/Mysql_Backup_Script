#!/bin/bash

#信息收集
function cfg() {
clear   
  echo  -n -e "Please enter the database account:"
read user
 echo
if [[ -z $user ]]
then
echo -e '\033[31mDatabase account can not be empty, please re-enter ...\033[0m';
else
 echo -e "Database account is：\033[32m $user \033[0m"
fi
echo
echo  -n -e "Please enter the database password："
read passwd
 echo
if [[ -z $passwd ]]
then
 echo -e '\033[31mDatabase password can not be blank, please re-enter ...\033[0m';
else
 echo -e "Database password is：\033[32m $passwd \033[0m"
fi
echo
echo  -n -e "Please enter the name of the database to be backed up:"
read mc
 echo
if [[ -z $mc ]]
then
 echo -e '\033[31mDatabase name can not be empty, please re-enter ...\033[0m';
else
 echo -e "Database file name is:\033[32m $mc \033[0m"
fi
  }
  
 #主程序
clear
echo -e "\033[34m===========================================================\033[0m"
echo
echo -e "\033[36m        Mysql convenient backup script\033[0m"
echo
echo
echo -e "\033[36m    1.Back up the data, (export the sql file)\033[0m"
echo
echo -e "\033[36m    2.Backup data, import sql file (please first name Backup_evec.sql into the /root folder)\033[0m"
echo
echo -e "\033[36m                                  Http://EVEC.CC \033[0m"
echo -e "\033[34m=========================================================\033[0m"
echo -e -n "Please select a service(1 Or 2)："
read mode
if [[ $mode == "1" ]]     
then     
	echo -e "Type：\033[32m Back up the data \033[0m"; 
	sleep 1
cfg
mysqldump -u$user -p$passwd $mc > Backup_evec.sql
echo
clear
echo -e "=================================================="
echo
echo -e "Export successfully, you export the sql file Backup_evec.sql in the /root folder"
echo
echo -e "                                  Http://EVEC.CC"
echo -e "=================================================="
fi

if [[ $mode == "2" ]]     
then     
	echo -e "Type：\033[32m Import sql file \033[0m"; 
	sleep 1
cfg
mysql -u$user -p$passwd $mc < Backup_evec.sql
clear
echo -e "=================================================="
echo
echo -e "Import successful, please restart the server to take effect ..."
echo
echo -e "                                  Http://EVEC.CC"
echo -e "=================================================="
echo
echo -e "Enter we will help you restart the server ...（Ctrl + C end the script）"
read
reboot
fi
exit 0
