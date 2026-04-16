# GSD Assets

GSD 是一套用于管理上下文的开发流程框架（或元提示词框架）。

有以下核心指令，当用户输入包含这些指令名时，你应当调用对应的技能文档。

| 指令（技能名） | 调用路径 | 用途 |
|----------|------|---------|
| `/gsd:new-project` | `~/.gsdc/new-project.md` | 初始化新项目 |
| `/gsd:plan-phase` | `~/.gsdc/plan-phase.md` | 创建阶段计划 |
| `/gsd:execute-phase` | `~/.gsdc/execute-phase.md` | 执行阶段计划 |
| `/gsd:verify-work` | `~/.gsdc/verify-work.md` | 验证阶段完成情况 |
| `/gsd:discuss-phase` | `~/.gsdc/discuss-phase.md` | 在规划前收集实现决策 |
| `/gsd:map-codebase` | `~/.gsdc/map-codebase.md` | 分析现有代码库 |
| `/gsd:quick` | `~/.gsdc/quick.md` | 以 GSD 保障执行临时任务 |
| `/gsd:fast` | `~/.gsdc/fast.md` | 内联处理琐碎任务，跳过规划 |
| `/gsd:ship` | `~/.gsdc/ship.md` | 从已验证的工作创建 PR |
| `/gsd:debug` | `~/.gsdc/debug.md` | 系统化调试 |
| `/gsd:progress` | `~/.gsdc/progress.md` | 检查项目进度 |
| `/gsd:next` | `~/.gsdc/next.md` | 自动检测并执行下一步 |
| `/gsd:ui-phase` | `~/.gsdc/ui-phase.md` | 为前端阶段生成 UI 设计合约 |
| `/gsd:ui-review` | `~/.gsdc/ui-review.md` | 对已实现前端代码进行视觉审计 |

更多指令请参考 `~/.gsdc/*`，完整指令列表：

### 核心工作流

```
new-project
new-milestone
discuss-phase
plan-phase
execute-phase
verify-work
ship
fast
next
audit-milestone
complete-milestone
milestone-summary
forensics
```

### 快速模式与工具

```
quick
do
note
explore
autonomous
```

### 阶段管理

```
add-phase
insert-phase
remove-phase
list-phase-assumptions
plan-milestone-gaps
research-phase
reapply-patches
```

### 代码质量

```
review
code-review
code-review-fix
pr-branch
audit-uat
add-tests
validate-phase
secure-phase
```

### UI 设计

```
ui-phase
ui-review
```

### 工作流（Workstreams）

```
workstreams
add-backlog
```

### 多项目工作区

```
new-workspace
list-workspaces
remove-workspace
```

### 会话与状态

```
pause-work
resume-work
session-report
health
stats
```

### 任务与想法

```
plant-seed
add-todo
check-todos
```

### 配置与个性化

```
settings
set-profile
profile-user
update
help
```

### 其他工具

```
map-codebase
import
inbox
intel
manager
scan
thread
undo
graphify
extract_learnings
docs-update
eval-review
ai-integration-phase
analyze-dependencies
audit-fix
cleanup
from-gsd2
join-discord
```

此外，在执行技能时，你可能需要参考以下文档中的其他资源：

* [GSD Agent](./gsd-agents.md)
* [提问技巧、Git、TDD、配置等可参考](./gsd-references.md)
