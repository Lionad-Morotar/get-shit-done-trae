#!/usr/bin/env node

const { execSync } = require('child_process');
const path = require('path');

const installScript = path.join(__dirname, '..', 'install.sh');

try {
  execSync(`bash "${installScript}"`, { stdio: 'inherit' });
} catch (error) {
  console.error('安装失败:', error.message);
  process.exit(1);
}
