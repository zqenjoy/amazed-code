# 第三方模型启动脚本 (PowerShell)
# 配置您的 API 密钥和端点

Write-Host "配置第三方模型环境..." -ForegroundColor Green
Write-Host ""

# 设置 API 密钥和端点
$env:ANTHROPIC_API_KEY = "your-api-key-here"
$env:ANTHROPIC_BASE_URL = "https://your-api-endpoint.com"

# 设置默认模型（根据您的 API 支持的模型）
# 这些模型将作为初始可选模型显示在/model 选择器中
$env:ANTHROPIC_DEFAULT_SONNET_MODEL = "qwen3.5-plus"
$env:ANTHROPIC_DEFAULT_HAIKU_MODEL = "kimi-k2.5"
$env:ANTHROPIC_DEFAULT_OPUS_MODEL = "glm-5"

Write-Host "已设置以下环境变量：" -ForegroundColor Yellow
Write-Host "- ANTHROPIC_API_KEY: [已配置]" -ForegroundColor Yellow
Write-Host "- ANTHROPIC_BASE_URL: $env:ANTHROPIC_BASE_URL" -ForegroundColor Yellow
Write-Host "- ANTHROPIC_DEFAULT_SONNET_MODEL: $env:ANTHROPIC_DEFAULT_SONNET_MODEL" -ForegroundColor Yellow
Write-Host "- ANTHROPIC_DEFAULT_HAIKU_MODEL: $env:ANTHROPIC_DEFAULT_HAIKU_MODEL" -ForegroundColor Yellow
Write-Host "- ANTHROPIC_DEFAULT_OPUS_MODEL: $env:ANTHROPIC_DEFAULT_OPUS_MODEL" -ForegroundColor Yellow
Write-Host ""

Write-Host "可用的第三方模型:" -ForegroundColor Cyan
Write-Host "- qwen3.5-plus (通义千问 3.5 增强版)" -ForegroundColor Cyan
Write-Host "- kimi-k2.5 (月之暗面 Kimi)" -ForegroundColor Cyan
Write-Host "- glm-5 (智谱 GLM-5)" -ForegroundColor Cyan
Write-Host "- MiniMax-M2.5 (MiniMax 2.5)" -ForegroundColor Cyan
Write-Host ""

Write-Host "启动 Claude Code..." -ForegroundColor Green
bun run dev
