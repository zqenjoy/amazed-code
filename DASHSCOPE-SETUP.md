# 阿里百炼 (DashScope) Coding Plan 配置指南

## 📋 配置概述

本项目已配置为使用阿里百炼（DashScope）的 Coding Plan API 服务。

- **API 端点**: `https://coding.dashscope.aliyuncs.com/apps/anthropic`
- **认证方式**: 通过 `.env` 文件配置 API Key（安全方式，不会提交到版本控制）
- **接口协议**: Anthropic 兼容接口

## ✅ 已完成的修改

### 1. 修改了 `src/constants/oauth.ts`
- ✅ 将 `BASE_API_URL` 改为阿里云端点
- ✅ 将阿里云域名添加到白名单 `ALLOWED_OAUTH_BASE_URLS`

### 2. 修改了 `src/utils/model/providers.ts`
- ✅ 将 `coding.dashscope.aliyuncs.com` 添加到允许的主机列表

## 🚀 启动方式

### 方式一：使用启动脚本（推荐）

**首次使用前，需要先配置 `.env` 文件：**

1. 复制示例配置文件：
   ```bash
   copy .env.example .env
   ```

2. 编辑 `.env` 文件，填入你的 API Key：
   ```bash
   ANTHROPIC_API_KEY=你的实际 API 密钥
   ```

3. 运行启动脚本：

**Windows CMD:**
```batch
start-with-dashscope.bat
```

**Windows PowerShell:**
```powershell
.\start-with-dashscope.ps1
```

### 方式二：手动设置环境变量

**Windows CMD:**
```batch
set ANTHROPIC_API_KEY=你的 API_KEY
set ANTHROPIC_BASE_URL=https://coding.dashscope.aliyuncs.com/apps/anthropic
bun run dev
```

**Windows PowerShell:**
```powershell
$env:ANTHROPIC_API_KEY="你的 API_KEY"
$env:ANTHROPIC_BASE_URL="https://coding.dashscope.aliyuncs.com/apps/anthropic"
bun run dev
```

**Linux/macOS:**
```bash
export ANTHROPIC_API_KEY=你的 API_KEY
export ANTHROPIC_BASE_URL=https://coding.dashscope.aliyuncs.com/apps/anthropic
bun run dev
```

## 🔧 验证步骤

1. **测试版本输出**:
   ```bash
   bun run version
   ```

2. **启动交互式 CLI**:
   ```bash
   bun run dev
   ```

3. **发送测试消息**:
   启动后，尝试发送一个简单的消息（如 "你好"）来验证 API 连接是否正常。

## ⚠️ 已知限制

1. **OAuth 功能**: 阿里云的接口可能不支持完整的 OAuth 授权流程。项目会使用 API Key 直接认证。

2. **部分功能可能不可用**:
   - Claude.ai 网页功能（这是正常的，因为使用的是阿里云）
   - MCP 代理功能（可能需要额外配置）
   - 某些高级 Claude 特定功能

3. **模型可用性**: 
   - 阿里云 DashScope 支持的模型可能与原生 Claude API 不同
   - 如果您使用的是其他第三方 API（支持 qwen、kimi、glm、MiniMax 等模型），请参考 `THIRD_PARTY_MODELS.md` 文档
   - 可以通过设置 `ANTHROPIC_DEFAULT_*_MODEL` 环境变量来指定默认模型

## 🐛 故障排除

### 如果遇到 API 连接错误

1. 检查网络连接是否能访问阿里云
   ```bash
   curl https://coding.dashscope.aliyuncs.com/apps/anthropic
   ```

2. 确认 API Key 是否正确设置
   ```bash
   echo $ANTHROPIC_API_KEY  # Linux/macOS
   echo %ANTHROPIC_API_KEY% # Windows CMD
   ```

3. 查看调试日志
   ```bash
   set CLAUDE_CODE_DEBUG=1  # Windows
   export CLAUDE_CODE_DEBUG=1  # Linux/macOS
   bun run dev
   ```

### 如果遇到认证错误

确保以下环境变量已正确设置：
- `ANTHROPIC_API_KEY`: 你的阿里云 API Key
- `ANTHROPIC_BASE_URL`: `https://coding.dashscope.aliyuncs.com/apps/anthropic`

## 📚 参考文档

- [阿里百炼 Coding Plan 文档](https://help.aliyun.com/zh/dashscope/)
- [Anthropic API 兼容接口](https://coding.dashscope.aliyuncs.com/apps/anthropic)

## 🔄 切换回原生 Claude API

如果要切换回使用原生的 Anthropic API，只需：

1. 恢复 `src/constants/oauth.ts` 中的 `BASE_API_URL`:
   ```typescript
   BASE_API_URL: 'https://api.anthropic.com'
   ```

2. 删除或注释掉 `ALLOWED_OAUTH_BASE_URLS` 中的阿里云地址

3. 删除或重置环境变量:
   ```bash
   unset ANTHROPIC_API_KEY
   unset ANTHROPIC_BASE_URL
   ```

4. 使用 `claude /login` 命令重新登录
