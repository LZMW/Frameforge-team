# Frameforge Syndicate 安装指南

> **配置版本**: v2.1 (Optimized per Super Team Builder v2.0)
>
> 按照本指南完成团队配置的安装和部署

---

## 📋 前置要求

### 必需工具
- Claude Code CLI（最新版）
- Claude Access（Sonnet 4.6 或更高版本）

### 可选MCP服务器
- **sequential-thinking**：深度技术推导
- **context7**：查询渲染技术文档

---

## 📦 安装步骤

### Step 1: 复制文件

将整个 `frameforge-team` 目录复制到你的Claude配置目录：

**Windows**:
```
%USERPROFILE%\.claude\skills\frameforge-coordinator\
%USERPROFILE%\.claude\teams\frameforge-shader\
%USERPROFILE%\.claude\teams\frameforge-spark\
%USERPROFILE%\.claude\teams\frameforge-vertex\
%USERPROFILE%\.claude\teams\frameforge-razor\
%USERPROFILE%\.claude\teams\frameforge-silicon\
%USERPROFILE%\.claude\teams\frameforge-forge\
```

**macOS/Linux**:
```
~/.claude/skills/frameforge-coordinator/
~/.claude/teams/frameforge-shader/
~/.claude/teams/frameforge-spark/
~/.claude/teams/frameforge-vertex/
~/.claude/teams/frameforge-razor/
~/.claude/teams/frameforge-silicon/
~/.claude/teams/frameforge-forge/
```

### Step 2: 文件放置

**协调器Skill**:
```
skills/frameforge-coordinator/
└── skill.md
```

**专家Agents**:
```
teams/
├── frameforge-shader.md
├── frameforge-spark.md
├── frameforge-vertex.md
├── frameforge-razor.md
├── frameforge-silicon.md
└── frameforge-forge.md
```

### Step 3: MCP配置（可选）

如果你的系统已安装以下MCP服务器，无需额外配置：

- `mcp__sequential-thinking__*`
- `mcp__context7__*`

专家会根据需要自动调用这些工具。

---

## ✅ 验证安装

### 测试协调器

在Claude Code中运行：

```
Use frameforge-coordinator skill to analyze my game's rendering performance.
```

**预期结果**：
- Atlas 应该响应该请求
- 询问你具体的渲染问题
- 开始P0需求解构阶段

### 测试专家

单独测试专家是否正常工作：

```
Use frameforge-shader agent to propose a subsurface scattering solution.
```

**预期结果**：
- Shader 应该生成 `<Proposal_Shader>` 标签包裹的提案
- 包含技术方案、视觉效果、性能预估

---

## 🎯 快速开始

### 示例1: 渲染优化

```
I need to optimize my game's lighting. It currently takes 8ms GPU budget,
but I only have 3ms available. The target platform is PS5.
```

### 示例2: 特效设计

```
Design a magical explosion effect for my game. It needs to look AAA quality
but cannot exceed 1ms GPU on PC mid-range hardware.
```

### 示例3: 场景优化

```
I have 50,000 trees in my forest scene and the frame rate drops to 20fps.
How can I optimize this for 60fps?
```

### 示例4: 代码实现

```
@Forge, implement TDD-012: Compute Shader Frustum Culling for UE5.3
```

---

## 🔧 故障排除

### 问题1: 协调器无法触发

**可能原因**：
- skill.md 文件路径错误
- description 格式错误

**解决方法**：
1. 检查文件是否在 `skills/frameforge-coordinator/` 目录
2. 检查 description 是否符合格式（无双引号，单行）

### 问题2: 专家无法触发

**可能原因**：
- agent.md 文件路径错误
- description 格式错误
- 触发词不匹配

**解决方法**：
1. 检查文件是否在 `teams/` 目录
2. 检查 description 是否符合格式（双引号，`<example>`标签）
3. 检查触发词是否与协调器一致

### 问题3: MCP工具无法调用

**可能原因**：
- MCP服务器未安装
- tools字段配置错误

**解决方法**：
1. 检查MCP服务器是否已安装
2. 检查 agent.md 中的 tools 字段格式
3. 查看协调器的MCP授权声明

---

## 📚 进阶配置

### 自定义性能预算

编辑各专家的agent.md，修改性能预算数值：

**Razor** (`frameforge-razor.md`):
```markdown
## 性能预算标准
**PC（中配）**：
- 总帧时：16.67ms
- GPU预算：10ms
```

### 添加新的目标平台

编辑 **Silicon** (`frameforge-silicon.md`)，添加新平台的架构信息：

```markdown
### 主机架构
**Nintendo Switch**：
- GPU架构：Tegra X1
- 带宽：25.6GB/s
- ...
```

---

## 📖 相关文档

- **团队概述**：`README.md`
- **超级团队构建器**：`super-team-builder` 技能文档
- **检查清单**：`super-checklist.md`

---

## 💡 最佳实践

### 1. 明确目标平台

使用时明确说明目标平台（PC/PS5/Xbox/Mobile），以便专家进行准确的性能评估。

### 2. 提供具体数据

尽可能提供具体数据：
- 当前帧率/帧时
- 目标帧率/帧时
- 场景规模（物体数量、三角形数）
- GPU型号

### 3. 准备好资产信息

如果涉及资产优化，准备好：
- 模型面数
- 贴图分辨率
- 材质数量

### 4. 分阶段使用

- **方案探索阶段**：P0-P3，探索可行方案
- **详细设计阶段**：P4，生成TDD
- **代码实现阶段**：P5，生成代码

---

## 🆘 获取帮助

遇到问题时：
1. 检查 `README.md` 了解团队概述
2. 检查 `super-checklist.md` 验证配置
3. 查看各专家的 `agent.md` 了解详细职责

---

**祝使用愉快！** 🎮✨
