# Frameforge Syndicate 安装指南

本指南将帮助你安装和配置 Frameforge Syndicate（铸帧先锋）专家团队。

---

## 📋 系统要求

- Claude Code 2.0+
- Windows / macOS / Linux
- 可选 MCP 工具：
  - `mcp__sequential-thinking__sequentialThinking`
  - `mcp__context7__resolve-library-id`
  - `mcp__context7__query-docs`

---

## 🚀 安装步骤

### Step 1: 复制文件到 Claude 配置目录

#### Windows
```bash
# 复制协调器
xcopy /E /I "N:\编程备份\3.0团队\frameforge-team\skills\frameforge-coordinator" "%USERPROFILE%\.claude\skills\frameforge-coordinator\"

# 复制专家配置
xcopy /E /I "N:\编程备份\3.0团队\frameforge-team\agents\*.md" "%USERPROFILE%\.claude\agents\"
```

#### macOS / Linux
```bash
# 复制协调器
cp -r "N:/编程备份/3.0团队/frameforge-team/skills/frameforge-coordinator" ~/.claude/skills/

# 复制专家配置
cp "N:/编程备份/3.0团队/frameforge-team/agents/"*.md ~/.claude/agents/
```

### Step 2: 验证安装

启动 Claude Code，使用以下命令验证：

```
我需要优化一个森林场景的渲染性能
```yaml
tools:
  - Read
  - Glob
  - Grep
  - Write
  - Edit
  - Bash
  - AskUserQuestion
  - Task
  - TaskCreate
  - TaskUpdate
  - TaskGet
  - TaskList
```

专家成员的 MCP 工具需在各自的 `agents/*.md` 中声明：

```yaml
tools: Read, Glob, Grep, Write, Edit, Bash, mcp__sequential-thinking__sequentialThinking, mcp__context7__resolve-library-id, mcp__context7__query-docs
```

### 自定义模型（可选）

如果你希望特定专家使用更强的模型，可以在对应专家的 `*.md` 文件中修改：

```yaml
model: opus  # 默认是 sonnet
```

---

## 📂 文件位置说明

### Windows
```
C:\Users\<用户名>\.claude\
├── skills\
│   └── frameforge-coordinator\
│       └── skill.md
└── agents\
    ├── frameforge-shader.md
    ├── frameforge-spark.md
    ├── frameforge-vertex.md
    ├── frameforge-razor.md
    ├── frameforge-silicon.md
    └── frameforge-forge.md
```

### macOS / Linux
```
~/.claude/
├── skills/
│   └── frameforge-coordinator/
│       └── skill.md
└── agents/
    ├── frameforge-shader.md
    ├── frameforge-spark.md
    ├── frameforge-vertex.md
    ├── frameforge-razor.md
    ├── frameforge-silicon.md
    └── frameforge-forge.md
```

---

## 🧪 测试安装

### 测试1：完整流程
```
我需要为PS5设计一个电影级的光照洞穴场景，目标60fps
```

**预期行为**：
1. Atlas 分析需求并询问性能目标
2. P1: Shader 提出光照方案
3. P2: Razor + Silicon 并行评估
4. P3: 提出优化方案（如需要）
5. P4: 生成 TDD
6. P5: Forge 生成代码

### 测试2：单专家调用
```
分析这个shader的性能瓶颈
```

**预期行为**：
- Atlas 识别为性能分析任务
- 直接调用 Razor（或 Razor + Silicon）

---

## ⚠️ 常见问题

### Q1: 专家没有被触发？

**A**: 检查以下几点：
1. 文件是否放置在正确的目录
2. skill.md 和 agent.md 文件格式是否正确
3. Claude Code 是否已重启

### Q2: MCP 工具无法使用？

**A**:
1. 确认 MCP 工具已正确配置
2. 等待协调器明确授权后才使用
3. 检查 tools 字段中是否声明了 MCP 工具

### Q3: 代码生成失败？

**A**:
1. 确认 P4 阶段已生成 TDD
2. Forge 需要 TDD 作为输入
3. 检查 TDD 格式是否正确

---

## 🔍 卸载

### Windows
```bash
# 删除协调器
rmdir /S /Q "%USERPROFILE%\.claude\skills\frameforge-coordinator"

# 删除专家配置
del "%USERPROFILE%\.claude\agents\frameforge-*.md"
```

### macOS / Linux
```bash
# 删除协调器
rm -rf ~/.claude/skills/frameforge-coordinator

# 删除专家配置
rm ~/.claude/agents/frameforge-*.md
```

---

## 📞 支持

如有问题，请检查：
1. [README.md](README.md) - 团队概述
2. [技能文档](skills/frameforge-coordinator/skill.md) - 协调器详细说明
3. [专家文档](agents/) - 各专家详细说明

---

**安装完成后，你就可以开始使用 Frameforge Syndicate 优化你的游戏渲染了！**
