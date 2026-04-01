@echo off
chcp 65001 >nul
echo ========================================
echo 启动 Claude Code - 阿里百炼 (DashScope) 模式
echo ========================================
echo.

:: 设置阿里百炼 API 密钥
set ANTHROPIC_API_KEY=sk-sp-f0677fbb2c74461fad851e34f89a0880

:: 设置阿里百炼 API 端点（可选，如果已修改 oauth.ts 则不需要）
set ANTHROPIC_BASE_URL=https://coding.dashscope.aliyuncs.com/apps/anthropic

:: 设置阿里云兼容的模型版本（阿里云不支持最新的 Haiku 4.5）
set ANTHROPIC_SMALL_FAST_MODEL=claude-3-5-haiku-20241022
set ANTHROPIC_DEFAULT_HAIKU_MODEL=claude-3-5-haiku-20241022

:: 设置使用第一方 API 模式（兼容阿里云）
set CLAUDE_CODE_USE_BEDROCK=
set CLAUDE_CODE_USE_VERTEX=
set CLAUDE_CODE_USE_FOUNDRY=

echo 已配置环境变量：
echo - ANTHROPIC_API_KEY: sk-sp-****88a0880
echo - ANTHROPIC_BASE_URL: https://coding.dashscope.aliyuncs.com/apps/anthropic
echo - ANTHROPIC_SMALL_FAST_MODEL: claude-3-5-haiku-20241022
echo - ANTHROPIC_DEFAULT_HAIKU_MODEL: claude-3-5-haiku-20241022
echo.

:: 启动开发模式
echo 正在启动 Claude Code...
bun run dev

pause
