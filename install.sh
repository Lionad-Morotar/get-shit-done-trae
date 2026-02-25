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

# 2. 在当前项目创建 .trae/rules 目录
if [ ! -d ".trae/rules" ]; then
    echo "📁 创建 .trae/rules 目录..."
    mkdir -p ".trae/rules"
fi

# 3. 生成 project_rules.md，链接指向 ~/.gsd-source
echo "📝 生成 project_rules.md..."

cat > ".trae/rules/project_rules.md" << 'EOF'
# GSD for Trae

项目级 AI 助手规则（基于 GSD 框架）。

---

## 沟通风格

- 极度简洁，必要时牺牲语法换取简短
- 不验证用户或赞扬用户

## 代码规范

- 避免不必要的注释，代码自解释
- 敏感文件禁止用 cat/head/tail/echo，改用 Read 工具
- Git 操作需用户明确指令

---

## 可用资源

资源位于 ~/.gsd-source/，通过以下路径引用：

### Agents

| 名称 | 路径 | 用途 |
|------|------|------|
EOF

# 添加 agents
for f in "$GSD_SOURCE"/agents/gsd-*.md; do
    [ -f "$f" ] || continue
    name=$(basename "$f" .md | sed 's/gsd-//')
    desc=""
    case "$name" in
        project-researcher) desc="研究领域生态" ;;
        research-synthesizer) desc="综合研究成果" ;;
        roadmapper) desc="创建路线图" ;;
        planner) desc="创建阶段计划" ;;
        phase-researcher) desc="研究阶段实现" ;;
        plan-checker) desc="验证计划目标" ;;
        executor) desc="执行阶段计划" ;;
        verifier) desc="验证阶段完成" ;;
        debugger) desc="系统化调试" ;;
        codebase-mapper) desc="映射代码库" ;;
        integration-checker) desc="验证跨阶段集成" ;;
    esac
    echo "| @$name | ~/.gsd-source/agents/gsd-$name.md | $desc |" >> ".trae/rules/project_rules.md"
done

cat >> ".trae/rules/project_rules.md" << 'EOF'

### 命令

| 命令 | 路径 | 用途 |
|------|------|------|
EOF

# 添加 commands
for f in "$GSD_SOURCE"/commands/gsd/*.md; do
    [ -f "$f" ] || continue
    name=$(basename "$f" .md)
    # 跳过非命令文件
    [[ "$name" == *.bak ]] && continue
    desc=""
    case "$name" in
        new-project) desc="初始化新项目" ;;
        new-milestone) desc="开始新里程碑" ;;
        discuss-phase) desc="收集阶段上下文" ;;
        plan-phase) desc="创建阶段计划" ;;
        execute-phase) desc="执行阶段计划" ;;
        verify-work) desc="验证交付物" ;;
        audit-milestone) desc="审计里程碑" ;;
        complete-milestone) desc="归档里程碑" ;;
        map-codebase) desc="分析现有代码" ;;
        progress) desc="检查项目进度" ;;
        debug) desc="系统化调试" ;;
        health) desc="诊断规划健康" ;;
        settings) desc="配置工作流" ;;
        *) desc="GSD 命令" ;;
    esac
    echo "| /gsd:$name | ~/.gsd-source/commands/gsd/$name.md | $desc |" >> ".trae/rules/project_rules.md"
done

cat >> ".trae/rules/project_rules.md" << 'EOF'

---

## 项目结构

```
.planning/
├── PROJECT.md      # 项目上下文和需求
├── REQUIREMENTS.md # 带 REQ-ID 的需求
├── ROADMAP.md      # 阶段结构
├── STATE.md        # 当前状态
├── config.json     # 工作流配置
└── phases/         # 阶段计划
    └── phase-01/
        └── PLAN.md
```

## 核心工作流

1. **新项目**: `/gsd:new-project` → 提问 → 研究 → 需求 → 路线图
2. **阶段循环**: `/gsd:discuss-phase N` → `/gsd:plan-phase N` → `/gsd:execute-phase N` → `/gsd:verify-work`
3. **里程碑**: `/gsd:audit-milestone` → `/gsd:complete-milestone` → `/gsd:new-milestone`

## 配置

`~/.gsd-source/references/planning-config.md`
EOF

echo ""
echo "✅ 安装完成！"
echo ""
echo "📍 文件位置:"
echo "   GSD 源文件: $GSD_SOURCE"
echo "   项目规则: $(pwd)/.trae/rules/project_rules.md"
echo ""
echo "🚀 开始使用:"
echo "   在 Trae 中输入 /gsd:new-project"
