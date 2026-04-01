# 启动 Claude Code - 阿里百炼 (DashScope) 模式
# PowerShell 版本

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "启动 Claude Code - 阿里百炼 (DashScope) 模式" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# 检查 .env 文件是否存在
if (-not (Test-Path ".env")) {
    Write-Host "[错误] 未找到 .env 文件！" -ForegroundColor Red
    Write-Host ""
    Write-Host "请按照以下步骤操作：" -ForegroundColor Yellow
    Write-Host "1. 复制 .env.example 文件为 .env" -ForegroundColor Yellow
    Write-Host "2. 编辑 .env 文件，填入你的 ANTHROPIC_API_KEY" -ForegroundColor Yellow
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

# 清除其他云端服务商的环境变量
$env:CLAUDE_CODE_USE_BEDROCK = ""
$env:CLAUDE_CODE_USE_VERTEX = ""
$env:CLAUDE_CODE_USE_FOUNDRY = ""

Write-Host "已从 .env 文件加载配置：" -ForegroundColor Green
Write-Host "- ANTHROPIC_API_KEY: [已配置]" -ForegroundColor Yellow
Write-Host "- ANTHROPIC_BASE_URL: $env:ANTHROPIC_BASE_URL" -ForegroundColor Yellow
Write-Host "- ANTHROPIC_SMALL_FAST_MODEL: $env:ANTHROPIC_SMALL_FAST_MODEL" -ForegroundColor Yellow
Write-Host "- ANTHROPIC_DEFAULT_HAIKU_MODEL: $env:ANTHROPIC_DEFAULT_HAIKU_MODEL" -ForegroundColor Yellow
Write-Host ""

# 启动开发模式
Write-Host "正在启动 Claude Code..." -ForegroundColor Cyan
bun run dev
