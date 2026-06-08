# 1 个主机 1c1g
# 172.31.255.251 
# ansible-251-c7


yum install -y epel-release 

yum install -y ansible git 

ssh-keygen -t rsa

cat /root/.ssh/id_rsa.pub 

cd ~

git clone git@github.com:husxwy/ansible.git

vagrant status

export "dstr=`date +'%Y%m%d%H%M%S'`"
echo $dstr
alias dstr="echo `date +'%Y%m%d%H%M%S'`"
export -p
# 创建快照
vagrant snapshot save ansible-251-c7 ansible-251-c7-20220811061243

vagrant snapshot list
#恢复快照
vagrant snapshot restore redis4-i240-n1-c7 redis4-i240-n1-c7-20220811061243


vagrant snapshot save ansible-251-c79 ansible-251-c79-20240106