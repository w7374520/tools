#!/bin/bash
#拷贝系统安装所需的软件包
#author:itnihao
#mail:admin@itnihao.com
#date:2013-06-28

SYSTEM_DIR=/home/centos
SYSTEM_NAME=itnihaoOS
ISO_MOUNT_POIONT1=/mnt/cd1
ISO_MOUNT_POIONT2=/mnt/cd2

mount_ISO (){
    mkdir ${ISO_MOUNT_POIONT1}
    mkdir ${ISO_MOUNT_POIONT2}
    mkdir ${SYSTEM_DIR}/Packages  -p
    mkdir /home/source
echo "请确保光驱里面有ISO文件，且可以被挂载"
echo "请输入Y/y继续,任意键则退出运行"
read ret
[ ${ret} != "Y" -a ${ret} != "y" ] && exit 1
echo  "echo 默认情况，挂载的是/dev/cdrom到${ISO_MOUNT_POIONT1}"
     ls ${ISO_MOUNT_POIONT1} |grep Packages
if [ "$?" == 0 ] 
then
    echo "光驱已经挂载"
else
    echo "正在尝试挂载本地光驱到/mnt/cd1,请稍等片刻"
    mount /dev/cdrom  ${ISO_MOUNT_POIONT1}
    ls ${ISO_MOUNT_POIONT1} |grep Packages
    if [ "$?" != 0 ]
    then
        echo "光盘挂载不成功，请手动重新挂载，或者尝试本地ISO挂载"
        echo "请输入本地ISO的路径:"
        read ret
        ls ${ret}
        [ "$?" != 0 ] && echo "本地ISO不存在或者路径错误，退出运行" && exit 1
        [ "$?" == 0 ] && mount -o loop ${ret}  ${ISO_MOUNT_POIONT1}
    fi
fi
}


copy_ISO_file (){
awk  '{print $2}' install.log |sed -e '/^$/d' -e 's/^ //g'|grep -v FINISHED|grep -v ":"  >/home/source/packges.list
for packges in $(cat /home/source/packges.list)
do
    cp ${ISO_MOUNT_POIONT1}/Packages/$packges*  ${SYSTEM_DIR}/Packages
    [ $? != 0 ] && echo "copy  $packges is faied!"&& cp ${ISO_MOUNT_POIONT2}/Packages/$packges*    ${SYSTEM_DIR}/Packages
    [ $? != 0 ] && echo "$packges is not exist in ${ISO_MOUNT_POIONT2}/Packages/"
done
    rsync -a --exclude=Packages ${ISO_MOUNT_POIONT1}/  ${SYSTEM_DIR}
}


rebuild_repo_xml (){
    yum -y install createrepo mkisofs
    cd  ${SYSTEM_DIR}
    declare -x discinfo=$(head -1 .discinfo)
    ##########################centos6.3_X64###############################
    #mv   ${SYSTEM_DIR}/repodata/*x86_64-comps.xml       ${SYSTEM_DIR}/repodata/comps.xml
    #createrepo   -g   ${SYSTEM_DIR}/repodata/comps.xml  ${SYSTEM_DIR}
    #createrepo -u "media://$discinfo" -g  ${SYSTEM_DIR}/repodata/comps.xml   ${SYSTEM_DIR}
    ######################################################################


    ##########################centos6.4_X64###############################
    mv   ${SYSTEM_DIR}/repodata/*x86_64-comps.xml       ${SYSTEM_DIR}/repodata/c6-x86_64-comps.xml 
    createrepo   -g   ${SYSTEM_DIR}/repodata/c6-x86_64-comps.xml  ${SYSTEM_DIR}
    createrepo -u "media://$discinfo" -g  ${SYSTEM_DIR}/repodata/c6-x86_64-comps.xml   ${SYSTEM_DIR}
   
    #mkisofs -o ${SYSTEM_NAME}.iso -b isolinux/isolinux.bin -c isolinux/boot.cat    -no-emul-boot  -boot-load-size 4  -boot-info-table  -R  -J  -v  -V  itnihao  -T ${SYSTEM_DIR}  
}

isolinux_cfg (){
    cat > ${SYSTEM_DIR}/isolinux/isolinux.cfg <<EOF
default auto
timeout 600

#default vesamenu.c32
#prompt 1

display boot.msg

menu background splash.jpg
menu title Welcome to CentOS 6.4!
menu color border 0 #ffffffff #00000000
menu color sel 7 #ffffffff #ff000000
menu color title 0 #ffffffff #00000000
menu color tabmsg 0 #ffffffff #00000000
menu color unsel 0 #ffffffff #00000000
menu color hotsel 0 #ff000000 #ffffffff
menu color hotkey 7 #ffffffff #ff000000
menu color scrollbar 0 #ffffffff #00000000

label auto
  menu label ^Auto Install system
  menu default
  kernel vmlinuz
  append ks=cdrom:/isolinux/ks.cfg initrd=initrd.img 

label linux
  menu label ^Install or upgrade an existing system
  kernel vmlinuz
  append initrd=initrd.img
label vesa
  menu label Install system with ^basic video driver
  kernel vmlinuz
  append initrd=initrd.img xdriver=vesa nomodeset
label rescue
  menu label ^Rescue installed system
  kernel vmlinuz
  append initrd=initrd.img rescue
label local
  menu label Boot from ^local drive
  localboot 0xffff
label memtest86
  menu label ^Memory test
  kernel memtest
  append -
EOF
}
ks_file(){
cat > ${SYSTEM_DIR}/isolinux/ks.cfg <<EOF
# Kickstart file automatically generated by anaconda.
#Itnihao OS
#date 2012-04-24
#date 2013-06-28
#version=V1.1
install               
text      
cdrom
lang en_US.UTF-8
keyboard us
skipx
network --onboot yes --device eth0 --bootproto static --ip 192.168.122.20 --netmask 255.255.255.0 --gateway 192.168.122.1 --noipv6 --nameserver 114.114.114.114
rootpw  itnihao
firewall --service=ssh --port=80:tcp
authconfig --enableshadow --passalgo=sha512
selinux --enforcing
timezone --utc Asia/Chongqing
bootloader --location=mbr --driveorder=sda --append=" rhgb crashkernel=auto quiet"
# The following is the partition information you requested
# Note that any partitions you deleted are not expressed
# here so unless you clear all partitions first, this is
# not guaranteed to work
#clearpart --none
clearpart --all --initlabel 
zerombr
part /boot --fstype=ext4 --size=2000
part swap --size=5000
part / --fstype=ext4 --grow --size=200

reboot
#repo --name="CentOS"  --baseurl=cdrom:sr0 --cost=100

%packages  --nobase
@base
%packages
@chinese-support
@core
@server-policy
EOF
}
build_new_ISO (){
    cd ${SYSTEM_DIR}
    mkisofs -o ${SYSTEM_NAME}.iso -input-charset utf-8 -b isolinux/isolinux.bin -c isolinux/boot.cat    -no-emul-boot  -boot-load-size 4  -boot-info-table  -R  -J  -v  -V  itnihao  -T ${SYSTEM_DIR}
}
main (){
    mount_ISO
    copy_ISO_file
    isolinux_cfg
    ks_file
    rebuild_repo_xml
    build_new_ISO
}
main
