# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

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
