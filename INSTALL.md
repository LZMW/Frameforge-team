# Frameforge Syndicate 安装指南

本文档提供 **Frameforge Syndicate** 团队配置包的完整安装说明。

---

## 系统要求

- Claude Code CLI
- 支持的操作系统：Windows / macOS / Linux

---

## 快速安装

### 步骤1：定位Claude配置目录

根据您的操作系统，Claude配置目录位于：

| 操作系统 | 配置目录 |
|----------|----------|
| **Windows** | `C:\Users\[用户名]\.claude\` |
| **macOS** | `~/.claude/` |
| **Linux** | `~/.claude/` |

### 步骤2：安装协调器 Skill

将协调器配置复制到Claude Skills目录：

```bash
# 创建目标目录（如果不存在）
mkdir -p ~/.claude/skills/frameforge-coordinator

# 复制协调器配置
cp -r "N:/编程备份/4.0团队/frameforge-team/skills/frameforge-coordinator/skill.md" \
      ~/.claude/skills/frameforge-coordinator/skill.md
```

### 步骤3：安装专家 Agents

将专家配置复制到Claude Agents目录：

```bash
# 创建目标目录（如果不存在）
mkdir -p ~/.claude/agents

# 复制所有专家配置
cp "N:/编程备份/4.0团队/frameforge-team/agents/frameforge-shader.md" ~/.claude/agents/
cp "N:/编程备份/4.0团队/frameforge-team/agents/frameforge-spark.md" ~/.claude/agents/
cp "N:/编程备份/4.0团队/frameforge-team/agents/frameforge-vertex.md" ~/.claude/agents/
cp "N:/编程备份/4.0团队/frameforge-team/agents/frameforge-razor.md" ~/.claude/agents/
cp "N:/编程备份/4.0团队/frameforge-team/agents/frameforge-silicon.md" ~/.claude/agents/
cp "N:/编程备份/4.0团队/frameforge-team/agents/frameforge-forge.md" ~/.claude/agents/
```

### 步骤4：验证安装

重启Claude Code后，您可以通过以下方式验证安装：

1. **验证协调器**：
   ```
   /frameforge-coordinator
   ```

2. **验证专家**：在对话中提及相关关键词，例如：
   ```
   "帮我设计一个AAA级渲染方案"
   "我的场景帧率下降了，帮我分析瓶颈"
   "帮我实现这个TDD文档中的代码"
   ```

---

## Windows一键安装脚本

创建并运行以下Powerhell脚本：

```powershell
# Frameforge Syndicate 安装脚本
$claudeDir = "$env:USERPROFILE\.claude"
$sourceDir = "N:\编程备份\4.0团队\frameforge-team"

# 创建目录
Write-Host "创建目录结构..."
New-Item -ItemType Directory -Force -Path "$claudeDir\skills\frameforge-coordinator"
New-Item -ItemType Directory -Force -Path "$claudeDir\agents"

# 安装协调器
Write-Host "安装协调器..."
Copy-Item "$sourceDir\skills\frameforge-coordinator\skill.md" `
          "$claudeDir\skills\frameforge-coordinator\skill.md" -Force

# 安装专家
Write-Host "安装专家代理..."
$agents = @(
    "frameforge-shader",
    "frameforge-spark",
    "frameforge-vertex",
    "frameforge-razor",
    "frameforge-silicon",
    "frameforge-forge"
)

foreach ($agent in $agents) {
    Copy-Item "$sourceDir\agents\$agent.md" "$claudeDir\agents\$agent.md" -Force
    Write-Host "  ✓ $agent"
}

Write-Host ""
Write-Host "✅ 安装完成！请重启Claude Code以生效。"
```

---

## 文件结构

安装后的目录结构：

```
~/.claude/
├── skills/
│   └── frameforge-coordinator/
│       └── skill.md               # 协调器Skill
└── agents/
    ├── frameforge-shader.md       # 渲染专家
    ├── frameforge-spark.md        # 特效专家
    ├── frameforge-vertex.md       # 场景专家
    ├── frameforge-razor.md        # 性能优化专家
    ├── frameforge-silicon.md      # 硬件架构专家
    └── frameforge-forge.md        # 执行工程师
```

---

## 使用方法

### 启动团队

在Claude Code中使用以下命令启动Frameforge团队：

```
/frameforge-coordinator
```

或者直接描述您的渲染优化需求：

```
"我需要在UE5中实现大规模森林场景渲染，目标60FPS，目标平台PS5"
```

### 典型使用场景

1. **渲染优化**：
   ```
   "我的场景在暗处噪点严重，如何优化SSAO？"
   ```

2. **特效设计**：
   ```
   "设计一个魔法爆炸特效，要求电影级画质但GPU耗时不超过2ms"
   ```

3. **性能调试**：
   ```
   "我的场景GPU帧时达到22ms，帮找出瓶颈"
   ```

4. **代码实现**：
   ```
   "帮我实现这个Compute Shader Frustum Culling"
   ```

---

## 故障排除

### 问题1：协调器无法触发

**可能原因**：skill.md文件位置错误

**解决方案**：确保文件位于 `~/.claude/skills/frameforge-coordinator/skill.md`

### 问题2：专家无法触发

**可能原因**：agent配置文件位置错误或格式错误

**解决方案**：
1. 确保文件位于 `~/.claude/agents/` 目录
2. 检查配置文件的YAML frontmatter格式

### 问题3：MCP工具无法使用

**可能原因**：MCP服务器未配置

**解决方案**：在Claude设置中配置相应的MCP服务器

---

## 卸载

如需卸载，删除以下文件：

```bash
# 删除协调器
rm -rf ~/.claude/skills/frameforge-coordinator

# 删除专家
rm ~/.claude/agents/frameforge-*.md
```

---

## 支持与反馈

如有问题或建议，请联系团队维护者。

---

**版本**：4.0
**更新日期**：2026-03-02
