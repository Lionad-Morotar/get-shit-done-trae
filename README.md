# GSD for Trae

为 [Trae](https://www.trae.ai/) 适配的 GSD（Get Shit Done）框架版本。

GSD 是一个轻量级、强大的元提示（Meta-prompting）、上下文工程（Context Engineering）和规格驱动开发（Spec-driven Development）系统。

---

## 什么是 GSD

GSD 通过流程约束解决了**上下文衰减（Context Rot）**问题——当 Claude 的上下文窗口被填满时，代码质量会逐渐下降的现象。

它通过以下方式实现：
- **上下文工程**：在 `.planning/` 目录中持久化项目上下文
- **智能体编排（Subagent Orchestration）**：并行调度多个专业 Agent 完成复杂任务
- **状态管理**：跟踪项目进度，支持断点续传
- **目标回溯验证（Goal-backward Verification）**：确保每个阶段真正达成目标

---

## 本项目

这是 GSD 的 **Trae 适配版本**，将 GSD 的强大工作流引入 Trae IDE：

| 特性 | 说明 |
|------|------|
| `.trae/project_rules.md` | Trae 项目级规则，替代 `.claude/` 目录 |
| 完整工作流支持 | `/gsd:new-project`、`/gsd:plan-phase`、`/gsd:execute-phase` 等 |
| 中文优化 | 针对中文开发者优化的提示和文档 |

---

## 快速开始

### 1. 克隆项目

```bash
git clone <this-repo>
cd get-shit-done-trae
```

### 2. 配置 Trae

将 `.trae/` 目录复制到你的项目根目录：

```bash
cp -r .trae /path/to/your/project/
```

或者手动创建 `.trae/project_rules.md` 并复制本项目的规则内容。

### 3. 开始工作

在 Trae 的 AI 对话中输入：

```
/gsd:new-project
```

---

## 核心命令

| 命令 | 用途 |
|------|------|
| `/gsd:new-project` | 初始化新项目：提问 → 研究 → 需求 → 路线图 |
| `/gsd:discuss-phase N` | 收集第 N 阶段的上下文 |
| `/gsd:plan-phase N` | 为第 N 阶段创建详细计划 |
| `/gsd:execute-phase N` | 执行第 N 阶段的所有计划 |
| `/gsd:verify-work` | 验证交付物是否符合要求 |
| `/gsd:progress` | 检查项目进度 |
| `/gsd:map-codebase` | 分析现有代码库 |

---

## 项目结构

运行 `/gsd:new-project` 后将创建：

```
.planning/
├── PROJECT.md          # 项目上下文、核心价值和需求
├── REQUIREMENTS.md     # 带 REQ-ID 的详细需求
├── ROADMAP.md          # 分阶段路线图
├── STATE.md            # 当前项目状态
├── config.json         # 工作流配置
├── research/           # 领域研究（可选）
│   ├── STACK.md
│   ├── FEATURES.md
│   ├── ARCHITECTURE.md
│   ├── PITFALLS.md
│   └── SUMMARY.md
└── phases/             # 各阶段计划和产物
    ├── phase-01/
    │   ├── PLAN.md
    │   └── ...
    └── phase-02/
        └── ...
```

---

## 工作流程

### 新项目（Greenfield）

```
/gsd:new-project
   ↓
深度提问 → 研究（可选）→ 定义需求 → 创建路线图
   ↓
/gsd:discuss-phase 1 → /gsd:plan-phase 1 → /gsd:execute-phase 1
   ↓
/gsd:verify-work
   ↓
进入 Phase 2...
```

### 已有代码（Brownfield）

```
/gsd:map-codebase      # 先分析现有代码
   ↓
/gsd:new-project       # 基于现有上下文规划新功能
```

---

## 配置

`.planning/config.json`：

```json
{
  "mode": "yolo",
  "depth": "standard",
  "parallelization": true,
  "commit_docs": true,
  "model_profile": "balanced",
  "workflow": {
    "research": true,
    "plan_check": true,
    "verifier": true,
    "auto_advance": false
  }
}
```

| 配置项 | 选项 | 说明 |
|--------|------|------|
| `mode` | `yolo` / `interactive` | YOLO 模式自动批准，交互模式逐步确认 |
| `depth` | `quick` / `standard` / `comprehensive` | 规划深度 |
| `parallelization` | `true` / `false` | 是否并行执行独立计划 |
| `commit_docs` | `true` / `false` | 是否将规划文档提交到 Git |
| `model_profile` | `quality` / `balanced` / `budget` | AI 模型选择策略 |

### 多项目共享配置

如果你希望在多个项目中使用同一套 GSD 配置，可以通过**符号链接**（Symbolic Link）实现：

```bash
# 1. 将本仓库克隆到一个固定位置（如 ~/.config/gsd-trae）
git clone <this-repo> ~/.config/gsd-trae

# 2. 在其他项目中创建符号链接
ln -s ~/.config/gsd-trae/.trae /path/to/your/project/.trae

# Windows (PowerShell 管理员)
# New-Item -ItemType SymbolicLink -Path ".trae" -Target "C:\Users\<username>\.config\gsd-trae\.trae"
```

**优点：**
- 一处修改，所有项目同步更新
- 避免重复复制配置文件
- 易于维护统一的团队规范

**注意事项：**
- 符号链接是只读引用，不要在项目中直接修改 `.trae/` 内容
- 如需项目特定配置，可创建 `.trae/local/` 目录存放覆盖配置

---

## 参考

- [GSD 原项目](https://github.com/glittercowboy/get-shit-done) - 官方仓库

---

## 许可证

MIT License
