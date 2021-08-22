#!/bin/bash
if [ $(whoami) != "root" ];then
	echo "----------请使用root权限执行本脚本！----------"
	exit 1;
fi

if [ `grep -c "Debian" /etc/issue` -eq '0' ];then
        echo "----------此脚本不支持此系统！----------"
	exit 1;
fi

function menu ()
{
 cat << EOF
----------------------------------------
|*********请选择机器当前版本*********|
----------------------------------------
`echo -e "\033[35m 1)Debian 7\033[0m"`
`echo -e "\033[35m 2)Debian 8\033[0m"`
`echo -e "\033[35m 3)Debian 9\033[0m"`
`echo -e "\033[35m 4)Debian 10\033[0m"`
`echo -e "\033[35m 5)查看当前系统版本\033[0m"`
EOF
read -p "请输入对应版本菜单数字：" num1
case $num1 in
 1)
  echo "你选择了Debian 7"
  echo -e "----------更新当前系统版本软件包----------" && apt-get update && apt-get upgrade -y && apt-get dist-upgrade && echo -e "----------删除未使用的依赖项----------" && apt --purge autoremove && cp -i /etc/apt/sources.list /etc/apt/sources.list.original && sed -i 's/wheezy/bullseye/g' /etc/apt/sources.list && echo -e "----------更新到 Debian 11----------" && apt-get update && apt-get upgrade -y && apt-get dist-upgrade && echo -e "----------脚本执行完毕，请自行重启系统应用新版本（以防万一，建议备份重要文件）----------"
  ;;
 2)
  echo "你选择了Debian 8"
  echo -e "----------更新当前系统版本软件包----------" && apt-get update && apt-get upgrade -y && apt-get dist-upgrade && echo -e "----------删除未使用的依赖项----------" && apt --purge autoremove && cp -i /etc/apt/sources.list /etc/apt/sources.list.original && sed -i 's/jessie/bullseye/g' /etc/apt/sources.list && echo -e "----------更新到 Debian 11----------" && apt-get update && apt-get upgrade -y && apt-get dist-upgrade && echo -e "----------脚本执行完毕，请自行重启系统应用新版本（以防万一，建议备份重要文件）----------"
  ;;
 3)
  echo "你选择了Debian 9"
  echo -e "----------更新当前系统版本软件包----------" && apt-get update && apt-get upgrade -y && apt-get dist-upgrade && echo -e "----------删除未使用的依赖项----------" && apt --purge autoremove && cp -i /etc/apt/sources.list /etc/apt/sources.list.original && sed -i 's/stretch/bullseye/g' /etc/apt/sources.list && echo -e "----------更新到 Debian 11----------" && apt-get update && apt-get upgrade -y && apt-get dist-upgrade && echo -e "----------脚本执行完毕，请自行重启系统应用新版本（以防万一，建议备份重要文件）----------"
  ;;
 4)
  echo "你选择了Debian 10"
  echo -e "----------更新当前系统版本软件包----------" && apt-get update && apt-get upgrade -y && apt-get dist-upgrade && echo -e "----------删除未使用的依赖项----------" && apt --purge autoremove && cp -i /etc/apt/sources.list /etc/apt/sources.list.original && sed -i 's/buster/bullseye/g' /etc/apt/sources.list && echo -e "----------更新到 Debian 11----------" && apt-get update && apt-get upgrade -y && apt-get dist-upgrade && echo -e "----------脚本执行完毕，请自行重启系统应用新版本（以防万一，建议备份重要文件）----------"
  ;;
 5)
  echo -e "----------当前系统版本如下----------" && cat /etc/issue
  menu
  ;;  
esac
}
