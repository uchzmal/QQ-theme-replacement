#!/bin/bash

# 打印作者信息
echo "思路和资源 by 欲归来南枝 @https://space.bilibili.com/1495315743"
echo "脚本制作 by zmal/梦断忆- @https://space.bilibili.com/554419861"

# 创建目录
mkdir -p 0

# 使用curl下载文件
curl -O https://github.com/uchzmal/QQ-theme-replacement/raw/main/%E7%AC%AC5%E6%9C%9F-SVIP%E4%B8%93%E5%B1%9E%E8%B6%85%E7%BA%A7%E4%B8%BB%E9%A2%98%E3%80%90QQ%E4%B8%BB%E9%A2%98%E3%80%91.zip

# 检查curl是否成功执行
if [ $? -ne 0 ]; then
    echo "下载文件失败"
    exit 1
fi

# 解压文件到指定目录并重命名为 "0"
unzip "第5期-SVIP专属超级主题【QQ主题】.zip" -d 0

# 检查解压是否成功
if [ $? -ne 0 ]; then
    echo "解压文件失败"
    exit 1
fi

# 移动解压后的文件并重命名
mv "./0/2028656/theme.2028656" "./0/1"
mv "./0/2028656/theme.2028656.zip" "./0/2.zip"

# 删除下载的压缩文件
rm -rf "第5期-SVIP专属超级主题【QQ主题】.zip"

# 检查当前用户是否为root
if [ $(id -u) -eq 0 ]; then
    # 如果是root用户，则执行root.sh
    curl -O https://github.com/uchzmal/QQ-theme-replacement/raw/main/root.sh
    bash root.sh
else
    # 如果不是root用户，则执行user.sh
    bash user.sh
fi

echo "重启QQ生效"
