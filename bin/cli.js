#!/usr/bin/env node

const { execSync } = require('child_process');
const path = require('path');

const args = process.argv.slice(2);
const command = args[0];

const scriptDir = path.join(__dirname, '..');

if (command === 'uninstall' || command === '--uninstall' || command === '-u') {
  const uninstallScript = path.join(scriptDir, 'uninstall.sh');
  try {
    execSync(`bash "${uninstallScript}"`, { stdio: 'inherit' });
  } catch (error) {
    console.error('卸载失败:', error.message);
    process.exit(1);
  }
} else {
  const installScript = path.join(scriptDir, 'install.sh');
  try {
    execSync(`bash "${installScript}"`, { stdio: 'inherit' });
  } catch (error) {
    console.error('安装失败:', error.message);
    process.exit(1);
  }
}
