# 第三方模型启动脚本 (PowerShell)
# 配置您的 API 密钥和端点

Write-Host "配置第三方模型环境..." -ForegroundColor Green
Write-Host ""

# 检查 .env 文件是否存在
if (-not (Test-Path ".env")) {
    Write-Host "[错误] 未找到 .env 文件！" -ForegroundColor Red
    Write-Host ""
    Write-Host "请按照以下步骤操作：" -ForegroundColor Yellow
    Write-Host "1. 复制 .env.example 文件为 .env" -ForegroundColor Yellow
    Write-Host "2. 编辑 .env 文件，填入你的 ANTHROPIC_API_KEY 和 ANTHROPIC_BASE_URL" -ForegroundColor Yellow
    Write-Host "3. 重新运行此脚本" -ForegroundColor Yellow
    Write-Host ""
    exit 1
}

# 从 .env 文件加载环境变量
$envContent = Get-Content ".env"
foreach ($line in $envContent) {
    if ($line -match '^(\w+)=(.*)$') {
        $key = $matches[1]
        $value = $matches[2]
        # 移除可能存在的首尾引号
        $value = $value.Trim('"').Trim("'")
        Set-Item -Path "env:$key" -Value $value
    }
}

Write-Host "已从 .env 文件加载配置：" -ForegroundColor Yellow
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
