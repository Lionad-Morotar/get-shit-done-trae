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
    (cd "$GSD_SOURCE" && git pull >/dev/null 2>&1)
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
    BACKUP_FILE=".trae/rules/project_rules.md.backup.$(date +%Y%m%d%H%M%S)"
    echo "⚠️  检测到已存在 .trae/rules/project_rules.md"
    echo "📝 自动备份到: $BACKUP_FILE"
    cp ".trae/rules/project_rules.md" "$BACKUP_FILE"
fi

# 4. 创建 .trae/rules 目录
if [ ! -d ".trae/rules" ]; then
    echo "📁 创建 .trae/rules 目录..."
    mkdir -p ".trae/rules"
fi

# 5. 复制项目规则文档
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
RULES_SOURCE_DIR=""

# 优先从脚本所在目录查找
if [ -d "$SCRIPT_DIR/.trae/rules" ]; then
    RULES_SOURCE_DIR="$SCRIPT_DIR/.trae/rules"
elif [ -d "$SCRIPT_DIR/.trae" ]; then
    RULES_SOURCE_DIR="$SCRIPT_DIR/.trae"
fi

# 定义需要复制的文件
RULES_FILES=("project_rules.md" "gsd-agents.md" "gsd-references.md")

if [ -n "$RULES_SOURCE_DIR" ]; then
    # 从本地目录复制
    for file in "${RULES_FILES[@]}"; do
        if [ -f "$RULES_SOURCE_DIR/$file" ]; then
            echo "📝 复制 $file..."
            cp "$RULES_SOURCE_DIR/$file" ".trae/rules/$file"
        fi
    done
else
    # 从远程仓库下载
    echo "📥 从远程仓库下载文档..."
    for file in "${RULES_FILES[@]}"; do
        curl -fsSL "$REPO_URL/raw/main/.trae/rules/$file" -o ".trae/rules/$file" 2>/dev/null && \
            echo "   ✅ $file 下载成功" || \
            echo "   ⚠️  $file 下载失败"
    done
fi

echo ""
echo "✅ 安装完成！"
echo ""
echo "📍 文件位置:"
echo "   GSD 源文件: $GSD_SOURCE"
echo "   命令目录: ~/.gsdc (符号链接)"
echo "   项目规则: $(pwd)/.trae/rules/"
echo "     - project_rules.md"
echo "     - gsd-agents.md"
echo "     - gsd-references.md"
echo ""
echo "🚀 开始使用:"
echo "   在 Trae 中输入 /gsd:new-project"
