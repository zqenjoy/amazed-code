@echo off
REM 第三方模型启动脚本
REM 配置您的 API 密钥和端点

echo 配置第三方模型环境...
echo.

REM 检查 .env 文件是否存在
if not exist ".env" (
    echo [错误] 未找到 .env 文件！
    echo.
    echo 请按照以下步骤操作：
    echo 1. 复制 .env.example 文件为 .env
    echo 2. 编辑 .env 文件，填入你的 ANTHROPIC_API_KEY 和 ANTHROPIC_BASE_URL
    echo 3. 重新运行此脚本
    echo.
    pause
    exit /b 1
)

REM 从 .env 文件加载环境变量
for /f "delims=" %%a in ('findstr /r "^ANTHROPIC_API_KEY=" .env') do set "%%a"
for /f "delims=" %%a in ('findstr /r "^ANTHROPIC_BASE_URL=" .env') do set "%%a"
for /f "delims=" %%a in ('findstr /r "^ANTHROPIC_DEFAULT_SONNET_MODEL=" .env') do set "%%a"
for /f "delims=" %%a in ('findstr /r "^ANTHROPIC_DEFAULT_HAIKU_MODEL=" .env') do set "%%a"
for /f "delims=" %%a in ('findstr /r "^ANTHROPIC_DEFAULT_OPUS_MODEL=" .env') do set "%%a"

echo 已从 .env 文件加载配置：
echo - ANTHROPIC_API_KEY: [已配置]
echo - ANTHROPIC_BASE_URL: %ANTHROPIC_BASE_URL%
echo - ANTHROPIC_DEFAULT_SONNET_MODEL: %ANTHROPIC_DEFAULT_SONNET_MODEL%
echo - ANTHROPIC_DEFAULT_HAIKU_MODEL: %ANTHROPIC_DEFAULT_HAIKU_MODEL%
echo - ANTHROPIC_DEFAULT_OPUS_MODEL: %ANTHROPIC_DEFAULT_OPUS_MODEL%
echo.
echo 可用的第三方模型:
echo - qwen3.5-plus (通义千问 3.5 增强版)
echo - kimi-k2.5 (月之暗面 Kimi)
echo - glm-5 (智谱 GLM-5)
echo - MiniMax-M2.5 (MiniMax 2.5)
echo.

echo 启动 Claude Code...
bun run dev
