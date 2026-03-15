# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [1.1.0] - 2026-03-16

### Added
- 新增 `uninstall.sh` 卸载脚本，支持完整清理 GSD 安装
- CLI 支持 `uninstall` / `--uninstall` / `-u` 命令
- 安装时自动创建 `~/.gsdc` 符号链接，统一命令访问路径，减少 token 消耗
- 安装时自动备份已存在的 `project_rules.md`（带时间戳）
- 添加端到端测试（vitest），覆盖安装/卸载完整流程
- 新增 `gsd-agents.md` 和 `gsd-references.md` 文档

### Changed
- `project_rules.md` 改为渐进式披露结构，核心指令优先展示
- 改进 `install.sh` 目录处理，使用子 shell 避免副作用
- 修复 CLI 工作目录问题，确保在正确目录执行脚本
- `uninstall.sh` 包含在 npm 包中

### Fixed
- 修复 `cli.js` 未正确传递 `cwd` 导致安装到错误目录的问题

## [1.0.2] - 2026-02-26

### Changed
- 添加 `files` 字段到 `package.json`，排除 `refs/` 目录，大幅减小 npm 包体积 (5.6MB → ~34KB)
- 压缩 `assets/screenshot.png` (106KB → 26KB)

## [1.0.1] - 2026-02-26

### Added
- `install.sh` 现在会检测已存在的 `project_rules.md` 并报错提示
- 重新设计了安装流程，使用仓库内的 `project_rules.md` 模板

### Fixed
- 修复 `project_rules.md` 链接指向 `~/.gsd-source` 的问题
- 修正 `project_rules.md` 的安装位置为 `.trae/rules/`

### Changed
- `install.sh` 重构：使用仓库内的模板文件替代手写模板
- 格式化 `README.md`，添加截图和 lint 脚本
- 精简 README 格式并添加 Trae 适配说明
- 将 README 截图移至本地 `assets` 目录
- 更新 README 以包含项目的别名

### Removed
- 删除不再使用的项目规则文档

## [1.0.0] - 2025-02-26

### Added
- 初始版本发布
- GSD (Get Shit Done) framework adapter for Trae IDE
- CLI 安装脚本
- 项目规则模板
