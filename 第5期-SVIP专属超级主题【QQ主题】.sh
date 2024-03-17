#!/bin/bash

# 打印作者信息
echo "思路和资源 by 欲归来南枝 @https://space.bilibili.com/1495315743"
echo "脚本制作 by zmal/梦断忆- @https://space.bilibili.com/554419861"
echo "root用户请保证mt管理器有root权限，非root用户请保证开启QQ目录（储存器）api调用的权限"
sleep 5

# 创建临时缓存目录
mkdir -p 0

# 使用curl下载文件
curl -O https://github.com/uchzmal/QQ-theme-replacement/raw/main/%E7%AC%AC5%E6%9C%9F-SVIP%E4%B8%93%E5%B1%9E%E8%B6%85%E7%BA%A7%E4%B8%BB%E9%A2%98%E3%80%90QQ%E4%B8%BB%E9%A2%98%E3%80%91.zip theme.zip

# 检查curl是否成功执行，如果成功则执行解压命令和删除压缩文件的命令
if [ $? -eq 0 ]; then
    unzip "theme.zip" -d 0 && rm -rf "theme.zip"
else
    echo "下载文件失败"
    exit 1
fi

# 检查解压是否成功
if [ $? -ne 0 ]; then
    echo "解压文件失败"
    exit 1
fi

# 移动解压后的文件并重命名，确保命令间没有不可见的特殊字符
mv "./0/2028656/theme.2028656/ab4099a947e80fac9fc3f33952ac3680" "./0/1" &&
mv "./0/2028656/theme.2028656.zip" "./0/2.zip" 

# 输出信息，告知用户操作已经完成
echo "初始化完成"

# 检查当前用户是否为root
if [ $(id -u) -eq 0 ]; then
    # 如果是root用户，则执行root.sh
    curl -sL https://github.com/uchzmal/QQ-theme-replacement/raw/main/root.sh | bash
   
else
    # 如果不是root用户，则执行user.sh
    curl -O https://github.com/uchzmal/QQ-theme-replacement/raw/main/user.sh && 
    bash user.sh &&
    rm -f user.sh 
fi
echo "重启QQ后生效"
