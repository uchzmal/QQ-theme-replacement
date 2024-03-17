#!/bin/bash

# 打印作者信息
echo "思路和资源 by 欲归来南枝 @https://space.bilibili.com/1495315743"
echo "脚本制作 by zmal/梦断忆- @https://space.bilibili.com/554419861"
sleep 5

# 全局搜索data/app_theme_810目录
theme_dir=$(find / -type d -name "app_theme_810" 2>/dev/null | grep -v "1001")

if [ -z "$theme_dir" ]; then
    echo "未找到目录data/app_theme_810，请确保开启QQ目录（储存器）的api访问权限"
    exit 1
fi

# 列出目录中的文件夹，排除名称为1001的文件夹，获取非1001的数字文件夹数量
files=$(ls -l "$theme_dir" | grep -E '^d' | grep -v '1001' | wc -l)

# 循环遍历非1001的数字文件夹
for ((i=1; i<=$files; i++)); do
    # 获取第i个非1001的数字文件夹的绝对路径
    folder=$(ls -d "$theme_dir"/* | grep -v '1001' | sed -n ${i}p)
    # 获取第i个非1001的数字文件夹的名称
    folder_name=$(basename "$folder")
    # 获取第i个非1001的数字文件夹内文件夹theme.${folder_name}内文件夹名称
    subfolder_name=$(find "$folder/theme.${folder_name}" -mindepth 1 -maxdepth 1 -type d -printf "%f\n")
    # 替换资源文件
    cp -r "./zmal.theme.temp/1" "$folder/theme.${folder_name}/$subfolder_name"
    # 拷贝压缩文件到文件夹中，并重命名
    cp "./zmal.theme.temp/2.zip" "$folder/theme.${folder_name}.zip"
    # 修改文件夹权限
    chmod -R 555 "$theme_dir"
done

# 删除缓存，假设要删除的文件夹在脚本执行的当前目录下
rm -rf "./zmal.theme.temp"
