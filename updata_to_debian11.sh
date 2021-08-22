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
|******请选择机器网络环境所在地******|
----------------------------------------
`echo -e "\033[35m 1)其他地区\033[0m"`
`echo -e "\033[35m 2)中国大陆\033[0m"`
EOF
read -p "请输入对应地区数字：" num1
case $num1 in
 1)
  echo "你选择了其它地区"
  echo -e "----------更新当前系统版本软件包----------" && apt update && apt upgrade -y && echo -e "----------删除未使用的依赖项----------" && apt --purge autoremove && cp -i /etc/apt/sources.list /etc/apt/sources.list.original && rm /etc/apt/sources.list && touch /etc/apt/sources.list && echo -e "deb http://deb.debian.org/debian bullseye main contrib non-free\ndeb-src http://deb.debian.org/debian bullseye main contrib non-free\ndeb http://deb.debian.org/debian-security/ bullseye-security main contrib non-free\ndeb-src http://deb.debian.org/debian-security/ bullseye-security main contrib non-free\ndeb http://deb.debian.org/debian bullseye-updates main contrib non-free\ndeb-src http://deb.debian.org/debian bullseye-updates main contrib non-free">/etc/apt/sources.list && echo -e "----------更新到 Debian 11----------" && apt update && apt full-upgrade && echo -e "----------脚本执行完毕，请自行重启系统应用新版本（以防万一，建议备份重要文件）----------"
  ;;
 2)
  echo "你选择了中国大陆"
  echo -e "----------更新当前系统版本软件包----------" && apt update && apt upgrade -y && echo -e "----------删除未使用的依赖项----------" && apt --purge autoremove && cp -i /etc/apt/sources.list /etc/apt/sources.list.original && rm /etc/apt/sources.list && touch /etc/apt/sources.list && echo -e "deb http://mirrors.ustc.edu.cn/debian bullseye main contrib non-free\ndeb-src http://mirrors.ustc.edu.cn/debian bullseye main contrib non-free\ndeb http://mirrors.ustc.edu.cn/debian-security/ bullseye-security main contrib non-free\ndeb-src http://mirrors.ustc.edu.cn/debian-security/ bullseye-security main contrib non-free\ndeb http://mirrors.ustc.edu.cn/debian bullseye-updates main contrib non-free\ndeb-src http://mirrors.ustc.edu.cn/debian bullseye-updates main contrib non-free">/etc/apt/sources.list && echo -e "----------更新到 Debian 11----------" && apt update && apt full-upgrade && echo -e "----------脚本执行完毕，请自行重启系统应用新版本（以防万一，建议备份重要文件）----------"
  ;;
esac
}
menu
