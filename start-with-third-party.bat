@echo off
REM 第三方模型启动脚本
REM 配置您的 API 密钥和端点

echo 配置第三方模型环境...
echo.

REM 设置 API 密钥和端点
set ANTHROPIC_API_KEY=your-api-key-here
set ANTHROPIC_BASE_URL=https://your-api-endpoint.com

REM 设置默认模型（根据您的 API 支持的模型）
REM 这些模型将作为初始可选模型显示在/model 选择器中
set ANTHROPIC_DEFAULT_SONNET_MODEL=qwen3.5-plus
set ANTHROPIC_DEFAULT_HAIKU_MODEL=kimi-k2.5
set ANTHROPIC_DEFAULT_OPUS_MODEL=glm-5

echo 已设置以下环境变量：
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
