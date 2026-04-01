@echo off
chcp 65001 >nul
echo ========================================
echo 启动 Claude Code - 阿里百炼 (DashScope) 模式
echo ========================================
echo.

:: 检查 .env 文件是否存在
if not exist ".env" (
    echo [错误] 未找到 .env 文件！
    echo.
    echo 请按照以下步骤操作：
    echo 1. 复制 .env.example 文件为 .env
    echo 2. 编辑 .env 文件，填入你的 ANTHROPIC_API_KEY
    echo 3. 重新运行此脚本
    echo.
    pause
    exit /b 1
)

:: 从 .env 文件加载环境变量
for /f "delims=" %%a in ('findstr /r "^ANTHROPIC_API_KEY=" .env') do set "%%a"
for /f "delims=" %%a in ('findstr /r "^ANTHROPIC_BASE_URL=" .env') do set "%%a"
for /f "delims=" %%a in ('findstr /r "^ANTHROPIC_SMALL_FAST_MODEL=" .env') do set "%%a"
for /f "delims=" %%a in ('findstr /r "^ANTHROPIC_DEFAULT_HAIKU_MODEL=" .env') do set "%%a"

:: 设置使用第一方 API 模式（兼容阿里云）
set CLAUDE_CODE_USE_BEDROCK=
set CLAUDE_CODE_USE_VERTEX=
set CLAUDE_CODE_USE_FOUNDRY=

echo 已从 .env 文件加载配置：
echo - ANTHROPIC_API_KEY: [已配置]
echo - ANTHROPIC_BASE_URL: %ANTHROPIC_BASE_URL%
echo - ANTHROPIC_SMALL_FAST_MODEL: %ANTHROPIC_SMALL_FAST_MODEL%
echo - ANTHROPIC_DEFAULT_HAIKU_MODEL: %ANTHROPIC_DEFAULT_HAIKU_MODEL%
echo.

:: 启动开发模式
echo 正在启动 Claude Code...
bun run dev

pause
