/**
 * 第三方模型配置
 * 为使用非 Claude 模型的第三方 API 提供配置
 */

export interface ThirdPartyModel {
  id: string
  name: string
  description: string
  category: 'fast' | 'balanced' | 'advanced'
}

/**
 * 获取配置的第三方模型列表
 * 从环境变量读取，如果未配置则返回默认列表
 */
export function getThirdPartyModels(): ThirdPartyModel[] {
  // 从环境变量读取自定义模型配置
  const customModels = process.env.ANTHROPIC_THIRD_PARTY_MODELS
  
  if (customModels) {
    try {
      // 支持从环境变量读取自定义配置
      return JSON.parse(customModels) as ThirdPartyModel[]
    } catch {
      // 解析失败时使用默认配置
    }
  }

  // 默认第三方模型配置
  return [
    {
      id: 'qwen3.5-plus',
      name: 'Qwen 3.5 Plus',
      description: '通义千问 3.5 增强版 - 适合大多数复杂任务',
      category: 'balanced',
    },
    {
      id: 'kimi-k2.5',
      name: 'Kimi K2.5',
      description: '月之暗面 Kimi - 快速响应，适合简单任务',
      category: 'fast',
    },
    {
      id: 'glm-5',
      name: 'GLM-5',
      description: '智谱 GLM-5 - 高性能模型，适合复杂任务',
      category: 'advanced',
    },
    {
      id: 'MiniMax-M2.5',
      name: 'MiniMax M2.5',
      description: 'MiniMax 2.5 - 最强能力，适合高难度任务',
      category: 'advanced',
    },
  ]
}

/**
 * 检查是否为第三方模型
 */
export function isThirdPartyModel(modelId: string): boolean {
  const models = getThirdPartyModels()
  return models.some(m => m.id === modelId)
}

/**
 * 获取第三方模型的显示名称
 */
export function getThirdPartyModelName(modelId: string): string | null {
  const models = getThirdPartyModels()
  const model = models.find(m => m.id === modelId)
  return model?.name || null
}

/**
 * 获取第三方模型的描述
 */
export function getThirdPartyModelDescription(modelId: string): string | null {
  const models = getThirdPartyModels()
  const model = models.find(m => m.id === modelId)
  return model?.description || null
}
