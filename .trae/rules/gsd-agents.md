# GSD Agent

| 助手 | 文件 | 用途 |
|------|------|---------|
| `@project-researcher` | `~/.gsd-source/agents/gsd-project-researcher.md` | 研究领域生态系统 |
| `@research-synthesizer` | `~/.gsd-source/agents/gsd-research-synthesizer.md` | 综合研究成果 |
| `@roadmapper` | `~/.gsd-source/agents/gsd-roadmapper.md` | 创建项目路线图 |
| `@planner` | `~/.gsd-source/agents/gsd-planner.md` | 创建阶段计划 |
| `@phase-researcher` | `~/.gsd-source/agents/gsd-phase-researcher.md` | 研究阶段实现方案 |
| `@plan-checker` | `~/.gsd-source/agents/gsd-plan-checker.md` | 验证计划是否达成目标 |
| `@executor` | `~/.gsd-source/agents/gsd-executor.md` | 执行阶段计划 |
| `@verifier` | `~/.gsd-source/agents/gsd-verifier.md` | 验证阶段完成情况 |
| `@debugger` | `~/.gsd-source/agents/gsd-debugger.md` | 系统化调试 |
| `@debug-session-manager` | `~/.gsd-source/agents/gsd-debug-session-manager.md` | 管理多循环 debug 检查点与续接 |
| `@codebase-mapper` | `~/.gsd-source/agents/gsd-codebase-mapper.md` | 映射现有代码库 |
| `@integration-checker` | `~/.gsd-source/agents/gsd-integration-checker.md` | 验证跨阶段集成 |
| `@pattern-mapper` | `~/.gsd-source/agents/gsd-pattern-mapper.md` | 分析代码库现有模式，产出 PATTERNS.md |
| `@intel-updater` | `~/.gsd-source/agents/gsd-intel-updater.md` | 分析代码库并写入 `.planning/intel/` |
| `@assumptions-analyzer` | `~/.gsd-source/agents/gsd-assumptions-analyzer.md` | 深度分析代码库，返回结构化假设与证据 |
| `@advisor-researcher` | `~/.gsd-source/agents/gsd-advisor-researcher.md` | 研究单个灰区决策，返回结构化对比表 |

### 代码审查与质量

| 助手 | 文件 | 用途 |
|------|------|---------|
| `@code-reviewer` | `~/.gsd-source/agents/gsd-code-reviewer.md` | 审查源代码中的 bug、安全与质量问题 |
| `@code-fixer` | `~/.gsd-source/agents/gsd-code-fixer.md` | 根据 REVIEW.md 发现并自动修复代码 |
| `@security-auditor` | `~/.gsd-source/agents/gsd-security-auditor.md` | 验证威胁模型缓解措施是否已落地 |
| `@nyquist-auditor` | `~/.gsd-source/agents/gsd-nyquist-auditor.md` | 填补 Nyquist 验证缺口，生成测试并验证覆盖率 |

### UI 设计

| 助手 | 文件 | 用途 |
|------|------|---------|
| `@ui-researcher` | `~/.gsd-source/agents/gsd-ui-researcher.md` | 为前端阶段生成 UI-SPEC.md 设计契约 |
| `@ui-checker` | `~/.gsd-source/agents/gsd-ui-checker.md` | 验证 UI-SPEC.md 的 6 项质量维度 |
| `@ui-auditor` | `~/.gsd-source/agents/gsd-ui-auditor.md` | 对已实现前端代码进行 6 维视觉审计 |

### 文档

| 助手 | 文件 | 用途 |
|------|------|---------|
| `@doc-writer` | `~/.gsd-source/agents/gsd-doc-writer.md` | 编写和更新项目文档 |
| `@doc-verifier` | `~/.gsd-source/agents/gsd-doc-verifier.md` | 验证文档中的事实声明是否与代码库一致 |

### AI 集成

| 助手 | 文件 | 用途 |
|------|------|---------|
| `@ai-researcher` | `~/.gsd-source/agents/gsd-ai-researcher.md` | 研究 AI 框架文档，产出实现指南 |
| `@domain-researcher` | `~/.gsd-source/agents/gsd-domain-researcher.md` | 研究业务领域上下文与专家评估标准 |
| `@eval-planner` | `~/.gsd-source/agents/gsd-eval-planner.md` | 为 AI 阶段设计结构化评估策略 |
| `@eval-auditor` | `~/.gsd-source/agents/gsd-eval-auditor.md` | 审计已实现的 AI 阶段评估覆盖度 |
| `@framework-selector` | `~/.gsd-source/agents/gsd-framework-selector.md` | 交互式决策矩阵，推荐合适的 AI/LLM 框架 |

### 其他

| 助手 | 文件 | 用途 |
|------|------|---------|
| `@user-profiler` | `~/.gsd-source/agents/gsd-user-profiler.md` | 分析会话消息，生成开发者行为档案 |
