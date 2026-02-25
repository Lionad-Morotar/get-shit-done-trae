# AGENTS.md

面向 AI 编程助手的项目级指导文档（基于 GSD 框架）。

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

### 参考文档

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
