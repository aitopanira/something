# 3 个主机 1c1g
# 172.31.255.241~243
# c7-241-n1~c7-243-n3

vagrant status

export "dstr=`date +'%Y%m%d%H%M%S'`"
echo $dstr
alias dstr="echo \`date +'%Y%m%d%H%M%S'\`"
export -p
# 创建快照
vagrant snapshot save c7-241-n1 c7-241-n1-init
vagrant snapshot save c7-242-n2 c7-242-n2-init
vagrant snapshot save c7-243-n3 c7-243-n3-init
vagrant snapshot list
#恢复快照
vagrant snapshot restore c7-241-n1-init c7-241-n1
vagrant snapshot restore c7-242-n2-init c7-242-n2
vagrant snapshot restore c7-243-n3-init c7-243-n3
