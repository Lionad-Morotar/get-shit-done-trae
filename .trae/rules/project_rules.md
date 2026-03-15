# GSD Assets

GSD 是一套用于管理上下文的开发流程框架（或元提示词框架）。

有以下核心指令，当用户输入包含这些指令名时，你应当调用对应的技能文档。

| 指令（技能名） | 调用路径 | 用途 |
|----------|------|---------|
| `/gsd:new-project` | `~/.gsdc/new-project.md` | 初始化新项目 |
| `/gsd:plan-phase` | `~/.gsdc/plan-phase.md` | 创建阶段计划 |
| `/gsd:execute-phase` | `~/.gsdc/execute-phase.md` | 执行阶段计划 |
| `/gsd:map-codebase` | `~/.gsdc/map-codebase.md` | 分析现有代码 |
| `/gsd:progress` | `~/.gsdc/progress.md` | 检查项目进度 |
| `/gsd:debug` | `~/.gsdc/debug.md` | 系统化调试 |

更多指令请参考 `~/.gsdc/*`，完整指令列表：

```
add-phase
add-tests
add-todo
audit-milestone
check-todos
cleanup
complete-milestone
debug
discuss-phase
execute-phase
health
help
insert-phase
list-phase-assumptions
map-codebase
new-milestone
new-project
new-project.bak
pause-work
plan-milestone-gaps
plan-phase
progress
quick
reapply-patches
remove-phase
research-phase
resume-work
set-profile
settings
update
verify-work
```

此外，在执行技能时，你可能需要参考以下文档中的其他资源：

* [GSD Agent](./gsd-agents.md)
* [提问技巧、Git、TDD、配置等可参考](./gsd-references.md)
