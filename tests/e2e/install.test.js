import { describe, it, expect, beforeAll, afterAll } from 'vitest';
import { execSync } from 'child_process';
import { existsSync, readFileSync } from 'fs';
import { homedir } from 'os';
import { join } from 'path';

const TEST_DIR = '/tmp/gsd-trae-e2e';
const EXPANDED_TEST_DIR = '/tmp/gsd-trae-e2e';
const GSD_SOURCE = join(homedir(), '.gsd-source');
const GSDC = join(homedir(), '.gsdc');
const INSTALL_SCRIPT = join(process.cwd(), 'install.sh');
const UNINSTALL_SCRIPT = join(process.cwd(), 'uninstall.sh');

describe('GSD for Trae E2E Tests', () => {
  beforeAll(() => {
    // 确保测试目录存在且为空
    execSync(`rm -rf ${TEST_DIR} && mkdir -p ${TEST_DIR}`);
  });

  afterAll(() => {
    // 清理测试目录
    execSync(`rm -rf ${TEST_DIR}`);
  });

  describe('Installation', () => {
    it('should clone GSD source to ~/.gsd-source', () => {
      // 先删除已存在的源文件以确保测试从头开始
      if (existsSync(GSD_SOURCE)) {
        execSync(`rm -rf ${GSD_SOURCE}`);
      }

      // 执行安装
      execSync(`bash ${INSTALL_SCRIPT}`, { cwd: EXPANDED_TEST_DIR });

      // 验证源文件存在
      expect(existsSync(GSD_SOURCE)).toBe(true);
      expect(existsSync(join(GSD_SOURCE, 'commands', 'gsd', 'new-project.md'))).toBe(true);
    });

    it('should create symbolic link ~/.gsdc', () => {
      // 验证符号链接存在
      expect(existsSync(GSDC)).toBe(true);

      // 验证符号链接指向正确
      const linkTarget = execSync(`readlink ${GSDC}`).toString().trim();
      expect(linkTarget).toBe(join(GSD_SOURCE, 'commands', 'gsd'));
    });

    it('should create .trae/rules directory in test directory', () => {
      const rulesDir = join(EXPANDED_TEST_DIR, '.trae', 'rules');
      expect(existsSync(rulesDir)).toBe(true);
    });

    it('should copy all rule files to .trae/rules/', () => {
      const rulesDir = join(EXPANDED_TEST_DIR, '.trae', 'rules');
      const requiredFiles = [
        'project_rules.md',
        'gsd-agents.md',
        'gsd-references.md'
      ];

      for (const file of requiredFiles) {
        const filePath = join(rulesDir, file);
        expect(existsSync(filePath), `Expected ${file} to exist`).toBe(true);
      }
    });

    it('should have correct content in project_rules.md', () => {
      const projectRulesPath = join(EXPANDED_TEST_DIR, '.trae', 'rules', 'project_rules.md');
      const content = readFileSync(projectRulesPath, 'utf-8');

      // 验证包含核心指令
      expect(content).toContain('/gsd:new-project');
      expect(content).toContain('/gsd:plan-phase');
      expect(content).toContain('/gsd:execute-phase');
      expect(content).toContain('~/.gsdc/');
    });

    it('should auto-backup existing project_rules.md when reinstalling', () => {
      const rulesDir = join(EXPANDED_TEST_DIR, '.trae', 'rules');
      const projectRulesPath = join(rulesDir, 'project_rules.md');

      // 修改现有文件以标记它
      const originalContent = readFileSync(projectRulesPath, 'utf-8');
      execSync(`echo "# TEST MARKER" > ${projectRulesPath}`);

      // 重新执行安装
      execSync(`bash ${INSTALL_SCRIPT}`, { cwd: EXPANDED_TEST_DIR });

      // 验证备份文件存在
      const files = execSync(`ls ${rulesDir}`).toString();
      expect(files).toMatch(/project_rules\.md\.backup\.\d+/);

      // 验证新文件被创建
      const newContent = readFileSync(projectRulesPath, 'utf-8');
      expect(newContent).not.toContain('TEST MARKER');
      expect(newContent).toContain('/gsd:new-project');
    });
  });

  describe('Uninstallation', () => {
    it('should remove GSD source files', () => {
      // 执行卸载
      execSync(`bash ${UNINSTALL_SCRIPT}`, { cwd: EXPANDED_TEST_DIR, input: 'n\nn\n' });

      // 验证源文件被删除
      expect(existsSync(GSD_SOURCE)).toBe(false);
    });

    it('should remove symbolic link ~/.gsdc', () => {
      expect(existsSync(GSDC)).toBe(false);
    });

    it('should remove rule files from project', () => {
      const rulesDir = join(EXPANDED_TEST_DIR, '.trae', 'rules');
      expect(existsSync(join(rulesDir, 'project_rules.md'))).toBe(false);
      expect(existsSync(join(rulesDir, 'gsd-agents.md'))).toBe(false);
      expect(existsSync(join(rulesDir, 'gsd-references.md'))).toBe(false);
    });
  });
});
