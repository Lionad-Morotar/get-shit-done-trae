#!/bin/bash

# GSD for Trae - 卸载脚本
# 用法: bash uninstall.sh

set -e

GSD_SOURCE="$HOME/.gsd-source"
GSDC_PATH="$HOME/.gsdc"

echo "🗑️  卸载 GSD for Trae..."
echo ""

# 1. 删除 GSD 源文件
if [ -d "$GSD_SOURCE" ]; then
    echo "📁 删除 GSD 源文件: $GSD_SOURCE"
    rm -rf "$GSD_SOURCE"
    echo "   ✅ 已删除"
else
    echo "   ℹ️  GSD 源文件不存在，跳过"
fi

# 2. 删除符号链接
if [ -L "$GSDC_PATH" ]; then
    echo "🔗 删除符号链接: ~/.gsdc"
    rm "$GSDC_PATH"
    echo "   ✅ 已删除"
else
    echo "   ℹ️  符号链接不存在，跳过"
fi

# 3. 删除当前项目的 project_rules.md
if [ -f ".trae/rules/project_rules.md" ]; then
    echo "📝 删除项目规则: .trae/rules/project_rules.md"
    rm ".trae/rules/project_rules.md"
    echo "   ✅ 已删除"

    # 如果目录为空，询问是否删除
    if [ -d ".trae/rules" ] && [ -z "$(ls -A .trae/rules 2>/dev/null)" ]; then
        echo ""
        read -p "🤔 .trae/rules 目录为空，是否删除？(y/N) " -n 1 -r
        echo ""
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            rmdir ".trae/rules"
            echo "   ✅ 已删除 .trae/rules"

            # 检查 .trae 是否为空
            if [ -d ".trae" ] && [ -z "$(ls -A .trae 2>/dev/null)" ]; then
                read -p "🤔 .trae 目录为空，是否删除？(y/N) " -n 1 -r
                echo ""
                if [[ $REPLY =~ ^[Yy]$ ]]; then
                    rmdir ".trae"
                    echo "   ✅ 已删除 .trae"
                fi
            fi
        fi
    fi
else
    echo "   ℹ️  项目规则文件不存在，跳过"
fi

# 4. 检查是否有 .planning 目录
if [ -d ".planning" ]; then
    echo ""
    echo "⚠️  检测到项目规划目录: .planning/"
    echo "   包含项目计划和历史记录，建议保留或手动备份后删除"
fi

echo ""
echo "✅ 卸载完成！"
echo ""
echo "如需重新安装，请运行:"
echo "   npx gsd-trae"
echo ""
echo "感谢使用 GSD for Trae 👋"
