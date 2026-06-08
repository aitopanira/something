#!/bin/bash
# 配置 enp0s8 网卡 IP 地址
# Anolis OS 8.x 需要使用 nmcli 配置网络

# 获取 IP 地址参数，默认 172.31.255.241
IP_ADDR="${1:-172.31.255.241}"

echo "配置网卡 enp0s8 IP: $IP_ADDR"

# 检查网卡是否存在
if ! ip link show enp0s8 &> /dev/null; then
    echo "错误: 网卡 enp0s8 不存在"
    exit 1
fi

# 删除可能存在的旧连接
nmcli con delete enp0s8 2>/dev/null

# 添加新的以太网连接
nmcli con add type ethernet con-name enp0s8 ifname enp0s8 ip4 "${IP_ADDR}/24"

# 启用连接
nmcli con up enp0s8

# 验证配置
echo ""
echo "网络配置结果:"
ip addr show enp0s8

echo ""
echo "当前连接状态:"
nmcli con show
