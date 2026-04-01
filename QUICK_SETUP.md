# 快速配置指南

## 第一步：编辑启动脚本

打开 `start-with-third-party.bat` (CMD) 或 `start-with-third-party.ps1` (PowerShell)，修改以下内容：

### 需要修改的地方：

1. **API 密钥** (第 9 行)
   ```batch
   set ANTHROPIC_API_KEY=your-api-key-here
   ```
   改为：
   ```batch
   set ANTHROPIC_API_KEY=你的实际 API 密钥
   ```

2. **API 端点** (第 10 行)
   ```batch
   set ANTHROPIC_BASE_URL=https://your-api-endpoint.com
   ```
   改为：
   ```batch
   set ANTHROPIC_BASE_URL=你的 API 端点地址
   ```

## 第二步：运行启动脚本

**Windows CMD:**
```batch
start-with-third-party.bat
```

**Windows PowerShell:**
```powershell
.\start-with-third-party.ps1
```

## 第三步：验证配置

启动后，您会看到以下输出：

```
配置第三方模型环境...

已设置以下环境变量：
- ANTHROPIC_API_KEY: [已配置]
- ANTHROPIC_BASE_URL: https://your-api-endpoint.com
- ANTHROPIC_DEFAULT_SONNET_MODEL: qwen3.5-plus
- ANTHROPIC_DEFAULT_HAIKU_MODEL: kimi-k2.5
- ANTHROPIC_DEFAULT_OPUS_MODEL: glm-5

可用的第三方模型:
- qwen3.5-plus (通义千问 3.5 增强版)
- kimi-k2.5 (月之暗面 Kimi)
- glm-5 (智谱 GLM-5)
- MiniMax-M2.5 (MiniMax 2.5)

启动 Claude Code...
```

## 第四步：使用模型

启动成功后，您可以：

1. **使用默认模型** - 直接开始对话，默认使用 qwen3.5-plus

2. **切换模型** - 输入命令：
   ```
   /model
   ```
   然后从列表中选择：
   - qwen3.5-plus
   - kimi-k2.5
   - glm-5
   - MiniMax-M2.5

3. **快速切换** - 直接使用：
   ```
   /model kimi-k2.5
   ```

## 常见问题

### Q: 如何修改默认模型？
A: 编辑启动脚本中的 `ANTHROPIC_DEFAULT_SONNET_MODEL` 值

### Q: 如何添加更多模型？
A: 修改 `src/utils/model/thirdPartyModels.ts` 文件中的模型列表

### Q: 模型顺序可以调整吗？
A: 可以，在 `thirdPartyModels.ts` 中调整模型数组的顺序即可

## 高级配置

### 自定义模型列表

如果您想完全自定义模型列表，可以设置环境变量：

**Windows CMD:**
```batch
set ANTHROPIC_THIRD_PARTY_MODELS=[{"id":"your-model-1","name":"Model 1","description":"Description 1","category":"balanced"},{"id":"your-model-2","name":"Model 2","description":"Description 2","category":"fast"}]
```

**PowerShell:**
```powershell
$env:ANTHROPIC_THIRD_PARTY_MODELS='[{"id":"your-model-1","name":"Model 1","description":"Description 1","category":"balanced"},{"id":"your-model-2","name":"Model 2","description":"Description 2","category":"fast"}]'
```

## 需要帮助？

如果遇到问题：
1. 检查 API 密钥是否正确
2. 确认 API 端点可以访问
3. 查看错误日志
4. 参考 `THIRD_PARTY_MODELS.md` 获取更多信息
