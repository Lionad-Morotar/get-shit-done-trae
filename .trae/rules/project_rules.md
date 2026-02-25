# AGENTS.md

面向 AI 编程助手的项目级指导文档（基于 GSD 框架）。

---

## 沟通风格

- 极度简洁，必要时牺牲语法换取简短
- 不要验证用户（"你说得对"）或赞扬（"问得好"）

## 代码文档

- 除非明确要求，否则避免不必要的注释/文档字符串
- 通过清晰的命名实现代码自解释
- 仅对非显而易见的逻辑、变通方案和边界情况进行注释

## Bash 命令

- 敏感文件禁止使用：`cat`、`head`、`tail`、`echo`（会泄露密钥）
- 优先使用：Read 工具（更安全、结构化输出）

## Git 操作

**未经明确指令，绝不执行 Git 操作。**

- 允许：`git status`、`git diff`、`git log`（只读）
- 禁止：`git add`、`git commit`、`git push`（需要指令）

---

## 可用资源

`.planning/` 中的所有资源均可调用或引用：

### 智能助手（Agents）

| 助手 | 文件 | 用途 |
|------|------|---------|
| `@project-researcher` | `agents/gsd-project-researcher.md` | 研究领域生态系统 |
| `@research-synthesizer` | `agents/gsd-research-synthesizer.md` | 综合研究成果 |
| `@roadmapper` | `agents/gsd-roadmapper.md` | 创建项目路线图 |
| `@planner` | `agents/gsd-planner.md` | 创建阶段计划 |
| `@phase-researcher` | `agents/gsd-phase-researcher.md` | 研究阶段实现方案 |
| `@plan-checker` | `agents/gsd-plan-checker.md` | 验证计划是否达成目标 |
| `@executor` | `agents/gsd-executor.md` | 执行阶段计划 |
| `@verifier` | `agents/gsd-verifier.md` | 验证阶段完成情况 |
| `@debugger` | `agents/gsd-debugger.md` | 系统化调试 |
| `@codebase-mapper` | `agents/gsd-codebase-mapper.md` | 映射现有代码库 |
| `@integration-checker` | `agents/gsd-integration-checker.md` | 验证跨阶段集成 |

### 工作流

通过 `/gsd:command` 触发：

| 工作流 | 文件 | 用途 |
|----------|------|---------|
| `/gsd:new-project` | `workflows/new-project.md` | 初始化新项目 |
| `/gsd:new-milestone` | `workflows/new-milestone.md` | 开始新里程碑 |
| `/gsd:discuss-phase` | `workflows/discuss-phase.md` | 收集阶段上下文 |
| `/gsd:plan-phase` | `workflows/plan-phase.md` | 创建阶段计划 |
| `/gsd:execute-phase` | `workflows/execute-phase.md` | 执行阶段计划 |
| `/gsd:verify-work` | `workflows/verify-work.md` | 验证交付物 |
| `/gsd:audit-milestone` | `workflows/audit-milestone.md` | 审计里程碑完成情况 |
| `/gsd:complete-milestone` | `workflows/complete-milestone.md` | 归档已完成的里程碑 |
| `/gsd:map-codebase` | `workflows/map-codebase.md` | 分析现有代码 |
| `/gsd:progress` | `workflows/progress.md` | 检查项目进度 |
| `/gsd:debug` | `workflows/execute-phase.md` | 系统化调试 |
| `/gsd:health` | `workflows/health.md` | 诊断规划健康状况 |
| `/gsd:settings` | `workflows/settings.md` | 配置工作流偏好 |

### 参考文档（始终生效）

| 参考 | 文件 | 内容 |
|-----------|------|---------|
| 提问技巧 | `references/questioning.md` | 深度提问技术 |
| UI 品牌 | `references/ui-brand.md` | 输出视觉规范 |
| 模型配置 | `references/model-profiles.md` | AI 模型选择 |
| 规划配置 | `references/planning-config.md` | 配置选项 |
| Git 集成 | `references/git-integration.md` | Git 工作流模式 |
| 测试驱动开发 | `references/tdd.md` | 测试驱动开发 |
| 检查点 | `references/checkpoints.md` | 检查点模式 |
| 验证策略 | `references/verification-patterns.md` | 验证策略 |

### 模板

| 模板 | 文件 | 用途 |
|----------|------|---------|
| 项目 | `templates/project.md` | PROJECT.md 结构 |
| 需求 | `templates/requirements.md` | REQUIREMENTS.md 结构 |
| 路线图 | `templates/roadmap.md` | ROADMAP.md 结构 |
| 计划 | `templates/plan.md` | PLAN.md 结构 |
| 状态 | `templates/state.md` | STATE.md 结构 |
| 研究 | `templates/research-project/` | 研究输出模板 |
| 代码库 | `templates/codebase/` | 代码库映射模板 |

---

## 项目结构

```
.planning/
├── PROJECT.md          # 项目上下文和需求
├── REQUIREMENTS.md     # 带 REQ-ID 的作用域需求
├── ROADMAP.md          # 阶段结构和成功标准
├── STATE.md            # 当前项目状态
├── config.json         # 工作流偏好设置
├── research/           # 领域研究（可选）
│   ├── STACK.md
│   ├── FEATURES.md
│   ├── ARCHITECTURE.md
│   ├── PITFALLS.md
│   └── SUMMARY.md
└── phases/             # 阶段计划和产物
    ├── phase-01/
    │   ├── PLAN.md
    │   └── ...
    └── phase-02/
        └── ...
```

---

## 核心工作流

1. **新项目**：`/gsd:new-project` → 提问 → 研究 → 需求 → 路线图
2. **每个阶段**：`/gsd:discuss-phase N` → `/gsd:plan-phase N` → `/gsd:execute-phase N` → `/gsd:verify-work`
3. **里程碑结束**：`/gsd:audit-milestone` → `/gsd:complete-milestone` → `/gsd:new-milestone`

---

## 配置

`.planning/config.json`：

```json
{
  "mode": "yolo|interactive",
  "depth": "quick|standard|comprehensive",
  "parallelization": true|false,
  "commit_docs": true|false,
  "model_profile": "quality|balanced|budget",
  "workflow": {
    "research": true|false,
    "plan_check": true|false,
    "verifier": true|false,
    "auto_advance": true|false
  }
}
```

---

## 质量关卡

- **研究**：版本最新、理由解释"为什么"、分配置信度级别
- **需求**：具体且可测试、以用户为中心、原子性、独立性
- **计划**：目标回溯验证、100% 需求覆盖、清晰的成功标准
- **执行**：原子提交、偏差处理、检查点协议
- **验证**：必备项已交付、成功标准已达成
