# 1 个主机 1c1g
# 172.31.255.251 
# ansible-251-c7


### 问题原因
Anolis OS 8.x 使用 NetworkManager 管理网络，Vagrant 的 private_network 无法自动配置 IP 地址。

### 修改内容
1. 禁用自动配置 ： auto_config: false
2. 添加 provision 脚本 ：使用 nmcli 手动配置网络
3. run: "always" ：每次启动都执行，确保网络配置生效
### 使用方法
### 验证
启动后在虚拟机内执行：

```
ip addr show enp0s8
# 应该看到 172.31.255.241/24
```
### 手动配置（如果 provision 失败）
```
# 在虚拟机内执行
sudo nmcli con add type ethernet con-name enp0s8 
ifname enp0s8 ip4 172.31.255.241/24
sudo nmcli con up enp0s8
```


provision 脚本没有生效，可能是因为需要 root 权限执行。让我修改 Vagrantfile，添加 privileged: true ：
