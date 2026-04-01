# API Key 配置说明

## 📌 为什么使用 .env 文件？

为了安全地管理 API Key，本项目使用 `.env` 文件来存储敏感的环境变量，而不是将它们硬编码在启动脚本中。这样做的好处：

- ✅ **安全性**: `.env` 文件已被添加到 `.gitignore`，不会被提交到版本控制
- ✅ **灵活性**: 可以轻松切换不同的 API Key 或配置
- ✅ **便捷性**: 启动脚本会自动读取 `.env` 文件中的配置

## 🚀 快速开始

### 步骤 1: 复制示例配置文件

在项目根目录下，复制示例配置文件：

**Windows CMD:**
```cmd
copy .env.example .env
```

**Windows PowerShell:**
```powershell
Copy-Item .env.example .env
```

**Linux/macOS:**
```bash
cp .env.example .env
```

### 步骤 2: 编辑 .env 文件

使用文本编辑器打开 `.env` 文件，填入你的实际 API Key：

```bash
# 阿里百炼 (DashScope) API 配置
ANTHROPIC_API_KEY=你的实际_API_KEY
ANTHROPIC_BASE_URL=https://coding.dashscope.aliyuncs.com/apps/anthropic

# 模型配置（可选）
ANTHROPIC_SMALL_FAST_MODEL=claude-3-5-haiku-20241022
ANTHROPIC_DEFAULT_HAIKU_MODEL=claude-3-5-haiku-20241022
```

### 步骤 3: 运行启动脚本

**使用阿里百炼 DashScope:**
- Windows CMD: `start-with-dashscope.bat`
- Windows PowerShell: `.\start-with-dashscope.ps1`

**使用第三方 API:**
- Windows CMD: `start-with-third-party.bat`
- Windows PowerShell: `.\start-with-third-party.ps1`

## 📝 .env 文件配置项说明

### 必填配置

- `ANTHROPIC_API_KEY`: 你的 API Key
  - 阿里云 DashScope: 格式类似 `sk-sp-xxxxxxxx`
  - 其他第三方 API: 请咨询你的服务提供商

### 可选配置

- `ANTHROPIC_BASE_URL`: API 端点地址
  - 阿里云 DashScope: `https://coding.dashscope.aliyuncs.com/apps/anthropic`
  - 其他第三方 API: 根据服务商提供填写

- `ANTHROPIC_DEFAULT_SONNET_MODEL`: 默认 Sonnet 模型
  - 示例：`qwen3.5-plus`, `claude-3-5-sonnet-20241022`

- `ANTHROPIC_DEFAULT_HAIKU_MODEL`: 默认 Haiku 模型
  - 示例：`kimi-k2.5`, `claude-3-5-haiku-20241022`

- `ANTHROPIC_DEFAULT_OPUS_MODEL`: 默认 Opus 模型
  - 示例：`glm-5`, `claude-3-opus-20240229`

## 🔒 安全提醒

1. **不要分享你的 `.env` 文件** - 它包含敏感的 API Key
2. **不要将 `.env` 文件提交到 Git** - 已配置在 `.gitignore` 中
3. **定期更换 API Key** - 如果怀疑泄露，请立即更换
4. **使用环境变量管理工具** - 在生产环境中使用更安全的密钥管理服务

## 🐛 故障排除

### 启动脚本提示"未找到 .env 文件"

1. 确认 `.env` 文件在项目根目录下
2. 检查文件名是否正确（包括前面的点）
3. 运行 `copy .env.example .env` 创建文件

### API Key 无效错误

1. 检查 `.env` 文件中的 API Key 是否正确
2. 确认 API Key 没有多余的空格或引号
3. 验证 API Key 是否仍然有效（可能已过期）

### 环境变量未生效

1. 重启终端或 PowerShell
2. 检查 `.env` 文件格式是否正确（`KEY=VALUE`，无空格）
3. 确保启动脚本成功加载了环境变量

## 📚 相关文档

- [DASHSCOPE-SETUP.md](./DASHSCOPE-SETUP.md) - 阿里云 DashScope 详细配置
- [QUICK_SETUP.md](./QUICK_SETUP.md) - 快速启动指南
- [README.md](./README.md) - 项目总览
