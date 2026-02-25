# GSD for Trae

项目级 AI 助手规则。

---

## 沟通风格

- 极度简洁，必要时牺牲语法换取简短
- 不验证用户或赞扬用户

## 代码规范

- 避免不必要的注释，代码自解释
- 敏感文件禁用 cat/head/tail/echo，改用 Read 工具
- Git 操作需用户明确指令

---

## 可用资源

### Agents

| 名称 | 路径 | 用途 |
|------|------|------|
| @project-researcher | ~/.gsd-source/agents/gsd-project-researcher.md | 研究生态 |
| @research-synthesizer | ~/.gsd-source/agents/gsd-research-synthesizer.md | 综合研究 |
| @roadmapper | ~/.gsd-source/agents/gsd-roadmapper.md | 创建路线图 |
| @planner | ~/.gsd-source/agents/gsd-planner.md | 创建计划 |
| @executor | ~/.gsd-source/agents/gsd-executor.md | 执行计划 |
| @verifier | ~/.gsd-source/agents/gsd-verifier.md | 验证完成 |
| @debugger | ~/.gsd-source/agents/gsd-debugger.md | 调试 |

### 命令

| 命令 | 路径 |
|------|------|
| /gsd:new-project | ~/.gsd-source/commands/gsd/new-project.md |
| /gsd:plan-phase | ~/.gsd-source/commands/gsd/plan-phase.md |
| /gsd:execute-phase | ~/.gsd-source/commands/gsd/execute-phase.md |
| /gsd:verify-work | ~/.gsd-source/commands/gsd/verify-work.md |

---

## 核心工作流

1. **新项目**: `/gsd:new-project` → 提问 → 研究 → 需求 → 路线图
2. **阶段循环**: `/gsd:discuss-phase N` → `/gsd:plan-phase N` → `/gsd:execute-phase N` → `/gsd:verify-work`

## 配置

`~/.gsd-source/references/planning-config.md`
