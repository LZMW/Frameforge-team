# Frameforge Syndicate 本机安装指南

> **配置版本**: v2.1 (with LSP Support)
> **目标系统**: Windows 11
> **Claude 配置目录**: `C:\Users\Mr.Chen\.claude`

---

## 📋 安装前准备

### 确认 Claude Code 配置目录

你的配置目录是：`C:\Users\Mr.Chen\.claude`

安装后应该有以下结构：
```
C:\Users\Mr.Chen\.claude\
├── skills/              # Skill 文件
│   └── frameforge-coordinator/
│       └── skill.md
└── teams/               # Agent 配置文件
    ├── frameforge-shader.md
    ├── frameforge-spark.md
    ├── frameforge-vertex.md
    ├── frameforge-razor.md
    ├── frameforge-silicon.md
    └── frameforge-forge.md
```

---

## 🚀 快速安装（PowerShell）

### 方法 1: 一键复制（推荐）

在 PowerShell 中运行以下命令：

```powershell
# 设置源目录和目标目录
$source = "N:\编程备份\新一代团队\frameforge-team"
$target = "$env:USERPROFILE\.claude"

# 创建目录
New-Item -ItemType Directory -Force -Path "$target\skills\frameforge-coordinator"
New-Item -ItemType Directory -Force -Path "$target\teams"

# 复制协调器 Skill
Copy-Item -Path "$source\skills\frameforge-coordinator\skill.md" -Destination "$target\skills\frameforge-coordinator\skill.md" -Force

# 复制所有专家 Agents
Copy-Item -Path "$source\agents\*.md" -Destination "$target\teams\" -Force

Write-Host "✅ Frameforge Team 安装完成！" -ForegroundColor Green
Write-Host "📍 安装位置: $target" -ForegroundColor Cyan
```

### 方法 2: 手动复制

如果 PowerShell 脚本无法运行，请手动复制：

#### Step 1: 创建目录

```powershell
mkdir "$env:USERPROFILE\.claude\skills\frameforge-coordinator"
mkdir "$env:USERPROFILE\.claude\teams"
```

#### Step 2: 复制文件

**协调器**:
```
源: N:\编程备份\新一代团队\frameforge-team\skills\frameforge-coordinator\skill.md
目标: C:\Users\Mr.Chen\.claude\skills\frameforge-coordinator\skill.md
```

**专家 Agents** (全部复制):
```
源: N:\编程备份\新一代团队\frameforge-team\agents\*.md
目标: C:\Users\Mr.Chen\.claude\teams\
```

---

## ✅ 验证安装

### 测试 1: 检查文件是否存在

```powershell
Test-Path "$env:USERPROFILE\.claude\skills\frameforge-coordinator\skill.md"
Test-Path "$env:USERPROFILE\.claude\teams\frameforge-shader.md"
Test-Path "$env:USERPROFILE\.claude\teams\frameforge-forge.md"
```

所有命令应返回 `True`。

### 测试 2: 在 Claude Code 中测试

重启 Claude Code，然后测试：

**测试协调器**:
```
Use frameforge-coordinator skill to help me optimize my game's rendering performance.
```

**预期结果**:
- Atlas 应该响应该请求
- 询问你具体的渲染问题
- 开始 P0 需求解构阶段

**测试专家**:
```
Use frameforge-shader agent to propose a cinematic lighting solution.
```

**预期结果**:
- Shader 应该生成 `<Proposal_Shader>` 标签包裹的提案
- 包含技术方案、视觉效果、性能预估

---

## 🔧 MCP 工具配置

### 可选 MCP 服务器

团队成员可以自动使用以下 MCP 工具（如果已安装）：

| MCP 工具 | 使用专家 | 用途 |
|---------|---------|------|
| **sequential-thinking** | Shader, Spark, Vertex, Razor, Silicon | 深度技术分析 |
| **context7** | 所有专家 | 查询技术文档 |
| **LSP** | Shader, Razor, Forge | 分析现有代码库 |

### LSP 工具说明

已添加 LSP 工具授权的专家：
- **Forge**: 查询 API 定义、理解现有代码结构
- **Razor**: 分析现有项目代码、查找性能瓶颈
- **Shader**: 查看现有 shader 代码、理解项目架构

> **注意**: LSP 工具需要在 Claude Code 中配置 LSP 服务器才能使用。

---

## 📊 工具授权矩阵

| 专家 | sequential-thinking | context7 | LSP | 适用阶段 |
|------|:------------------:|:--------:|:---:|---------|
| Shader | ✅ | ✅ | ✅ | P1, P3 |
| Spark | ✅ | ✅ | ❌ | P1, P3 |
| Vertex | ✅ | ✅ | ❌ | P1, P3 |
| Razor | ✅ | ✅ | ✅ | P2 |
| Silicon | ✅ | ✅ | ❌ | P2 |
| Forge | ❌ | ✅ | ✅ | P5 |

---

## 🎯 使用示例

### 示例 1: 渲染优化问题

```
I need to optimize my game's lighting. It currently takes 8ms GPU budget,
but I only have 3ms available. The target platform is PS5.
```

### 示例 2: 特效设计

```
Design a magical explosion effect for my game. It needs to look AAA quality
but cannot exceed 1ms GPU on PC mid-range hardware.
```

### 示例 3: 场景优化

```
I have 50,000 trees in my forest scene and the frame rate drops to 20fps.
How can I optimize this for 60fps?
```

### 示例 4: 代码实现

```
@Forge, implement TDD-012: Compute Shader Frustum Culling for UE5.3
```

---

## 📁 安装文件清单

安装完成后，以下文件应该存在：

```
C:\Users\Mr.Chen\.claude\
├── skills/
│   └── frameforge-coordinator/
│       └── skill.md                     ✅ 协调器 (v2.1, 280字符)
└── teams/
    ├── frameforge-shader.md             ✅ 渲染工程师 (v2.1, 320字符)
    ├── frameforge-spark.md              ✅ 特效专家 (v2.1, 280字符)
    ├── frameforge-vertex.md             ✅ 场景主管 (v2.1, 290字符)
    ├── frameforge-razor.md              ✅ 性能专家 (v2.1, 290字符)
    ├── frameforge-silicon.md            ✅ 硬件专家 (v2.1, 280字符)
    └── frameforge-forge.md              ✅ 执行工程师 (v2.1, 280字符)
```

---

## 🔄 更新配置

### 卸载旧版本

如果之前安装过旧版本，先删除：

```powershell
Remove-Item -Recurse -Force "$env:USERPROFILE\.claude\skills\frameforge-coordinator"
Remove-Item -Force "$env:USERPROFILE\.claude\teams\frameforge-*.md"
```

### 安装新版本

然后按照上面的安装步骤重新安装。

---

## 🐛 故障排除

### 问题 1: 协调器无法触发

**可能原因**：
- skill.md 文件路径错误
- description 格式错误

**解决方法**：
1. 检查文件是否存在：`Test-Path "$env:USERPROFILE\.claude\skills\frameforge-coordinator\skill.md"`
2. 检查 description 是否符合格式（无双引号，单行）

### 问题 2: 专家无法触发

**可能原因**：
- agent.md 文件路径错误
- description 格式错误
- 触发词不匹配

**解决方法**：
1. 检查 teams 目录下是否有 `frameforge-*.md` 文件
2. 检查 description 是否符合格式（双引号，`<example>` 标签）
3. 确认触发词与协调器一致

### 问题 3: LSP 工具无法使用

**可能原因**：
- LSP 服务器未配置
- 项目目录未打开

**解决方法**：
1. 确认 Claude Code 中已配置 LSP 服务器
2. 确认在项目目录中使用 Claude Code

---

## 📚 相关文档

- **团队概述**：`README.md`
- **Super Team Builder**：超级团队构建器 v2.0

---

## 💡 最佳实践

1. **明确目标平台**：使用时明确说明目标平台（PC/PS5/Xbox/Mobile）
2. **提供具体数据**：尽可能提供当前帧率、目标帧率、场景规模等数据
3. **准备好资产信息**：模型面数、贴图分辨率、材质数量
4. **分阶段使用**：
   - 方案探索阶段：P0-P3
   - 详细设计阶段：P4
   - 代码实现阶段：P5

---

**祝使用愉快！** 🎮✨

> **版本**: v2.1 (with LSP Support)
> **更新日期**: 2026-02-28
