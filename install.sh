#!/bin/bash

# GSD for Trae - 安装脚本
# 用法: bash <(curl -s https://raw.githubusercontent.com/Lionad-Morotar/get-shit-done-trae/main/install.sh)

set -e

GSD_SOURCE="$HOME/.gsd-source"
GSD_REPO="https://github.com/glittercowboy/get-shit-done.git"
REPO_URL="https://github.com/Lionad-Morotar/get-shit-done-trae"

echo "🔧 安装 GSD for Trae..."

# 1. 下载 GSD 源文件到 ~/.gsd-source
if [ ! -d "$GSD_SOURCE/.git" ]; then
    echo "📥 下载 GSD 源文件到 $GSD_SOURCE..."
    rm -rf "$GSD_SOURCE"
    git clone --depth 1 "$GSD_REPO" "$GSD_SOURCE" >/dev/null 2>&1
else
    echo "📥 更新 GSD 源文件..."
    cd "$GSD_SOURCE" && git pull >/dev/null 2>&1
fi

# 2. 创建 ~/.gsdc 符号链接（指向 ~/.gsd-source/commands/gsd）
GSDC_PATH="$HOME/.gsdc"
if [ -L "$GSDC_PATH" ]; then
    rm "$GSDC_PATH"
elif [ -e "$GSDC_PATH" ]; then
    rm -rf "$GSDC_PATH"
fi
ln -s "$GSD_SOURCE/commands/gsd" "$GSDC_PATH"
echo "🔗 创建符号链接: ~/.gsdc → $GSD_SOURCE/commands/gsd"

# 3. 检查是否已存在 project_rules.md
if [ -f ".trae/rules/project_rules.md" ]; then
    echo "❌ 错误: .trae/rules/project_rules.md 已存在"
    echo ""
    echo "如需重新安装，请先删除现有文件："
    echo "   rm .trae/rules/project_rules.md"
    echo ""
    echo "或手动备份后重命名："
    echo "   mv .trae/rules/project_rules.md .trae/rules/project_rules.md.backup"
    exit 1
fi

# 4. 创建 .trae/rules 目录
if [ ! -d ".trae/rules" ]; then
    echo "📁 创建 .trae/rules 目录..."
    mkdir -p ".trae/rules"
fi

# 5. 复制 project_rules.md
PROJECT_RULES_SOURCE=""

# 优先从脚本所在目录查找
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
if [ -f "$SCRIPT_DIR/.trae/rules/project_rules.md" ]; then
    PROJECT_RULES_SOURCE="$SCRIPT_DIR/.trae/rules/project_rules.md"
elif [ -f "$SCRIPT_DIR/project_rules.md" ]; then
    PROJECT_RULES_SOURCE="$SCRIPT_DIR/project_rules.md"
fi

# 如果没找到，从远程仓库下载
if [ -z "$PROJECT_RULES_SOURCE" ]; then
    echo "📥 从远程仓库下载 project_rules.md..."
    curl -fsSL "$REPO_URL/raw/main/.trae/rules/project_rules.md" -o ".trae/rules/project_rules.md" 2>/dev/null || \
    curl -fsSL "$REPO_URL/raw/main/.trae/project_rules.md" -o ".trae/rules/project_rules.md" 2>/dev/null
    if [ $? -eq 0 ]; then
        echo "✅ project_rules.md 下载成功"
    else
        echo "❌ 无法下载 project_rules.md，请检查网络连接"
        exit 1
    fi
else
    echo "📝 复制 project_rules.md..."
    cp "$PROJECT_RULES_SOURCE" ".trae/rules/project_rules.md"
fi

echo ""
echo "✅ 安装完成！"
echo ""
echo "📍 文件位置:"
echo "   GSD 源文件: $GSD_SOURCE"
echo "   命令目录: ~/.gsdc (符号链接)"
echo "   项目规则: $(pwd)/.trae/rules/project_rules.md"
echo ""
echo "🚀 开始使用:"
echo "   在 Trae 中输入 /gsd:new-project"
