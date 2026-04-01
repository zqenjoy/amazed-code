# 启动 Claude Code - 阿里百炼 (DashScope) 模式
# PowerShell 版本

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "启动 Claude Code - 阿里百炼 (DashScope) 模式" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# 设置阿里百炼 API 密钥
$env:ANTHROPIC_API_KEY = "sk-sp-f0677fbb2c74461fad851e34f89a0880"

# 设置阿里百炼 API 端点（可选，如果已修改 oauth.ts 则不需要）
$env:ANTHROPIC_BASE_URL = "https://coding.dashscope.aliyuncs.com/apps/anthropic"

# 设置阿里云兼容的模型版本（阿里云不支持最新的 Haiku 4.5）
$env:ANTHROPIC_SMALL_FAST_MODEL = "claude-3-5-haiku-20241022"
$env:ANTHROPIC_DEFAULT_HAIKU_MODEL = "claude-3-5-haiku-20241022"

# 清除其他云端服务商的环境变量
$env:CLAUDE_CODE_USE_BEDROCK = ""
$env:CLAUDE_CODE_USE_VERTEX = ""
$env:CLAUDE_CODE_USE_FOUNDRY = ""

Write-Host "已配置环境变量：" -ForegroundColor Green
Write-Host "- ANTHROPIC_API_KEY: sk-sp-****88a0880" -ForegroundColor Yellow
Write-Host "- ANTHROPIC_BASE_URL: https://coding.dashscope.aliyuncs.com/apps/anthropic" -ForegroundColor Yellow
Write-Host "- ANTHROPIC_SMALL_FAST_MODEL: claude-3-5-haiku-20241022" -ForegroundColor Yellow
Write-Host "- ANTHROPIC_DEFAULT_HAIKU_MODEL: claude-3-5-haiku-20241022" -ForegroundColor Yellow
Write-Host ""

# 启动开发模式
Write-Host "正在启动 Claude Code..." -ForegroundColor Cyan
bun run dev
