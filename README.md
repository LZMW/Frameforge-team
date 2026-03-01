# Frameforge Syndicate (铸帧先锋)

**AAA游戏渲染优化专家团队** - 通过视觉-性能博弈协议（P1-P5），提供极致功效比的渲染解决方案。

---

## 📋 团队概述

Frameforge Syndicate 是一个专注于AAA游戏渲染优化的混合型专家团队。我们通过独特的「视觉-性能博弈」协议，在视觉质量和性能消耗之间找到最佳平衡点。

### 核心理念

> **极致功效比** = 最高画质表现 / 最低性能消耗

我们相信，最好的渲染方案不是最真实的，而是**在性能约束下看起来最真实**的方案。

---

## 👥 团队成员

| 代号 | 角色 | 层级 | 核心能力 |
|------|------|------|----------|
| **Atlas** | 技术总监（协调器） | 统筹层 | 需求分析、博弈调度、TDD生成 |
| **Shader** | 首席渲染工程师 | 视觉组 | 光照、材质、PBR、RayTracing |
| **Spark** | 特效技术专家 | 视觉组 | 粒子、爆炸、流体、VFX |
| **Vertex** | 场景美术主管 | 视觉组 | LOD、Culling、地形、植被 |
| **Razor** | 性能优化暴君 | 性能组 | 帧时、Draw Call、内存 |
| **Silicon** | 硬件架构专家 | 性能组 | GPU架构、Cache、带宽、跨平台 |
| **Forge** | 执行工程师 | 执行层 | HLSL/C++实现、引擎配置 |

---

## 🔄 工作流程：P1-P5 博弈协议

```
用户请求
    │
    ▼
┌─────────────┐
│ P0: 需求解构 │  ← Atlas分析需求、识别领域、设定目标
└──────┬──────┘
       │
   ┌───┴────────────────────┐
   │                        │
   ▼                        ▼
┌─────────┐          ┌─────────┐
│ Shader  │          │  Spark  │  ← P1: 视觉提案（并行）
└────┬────┘          └────┬────┘
     │                    │
     └────────┬───────────┘
              │
              ▼
       ┌──────────────┐
       │ 汇总提案标签  │
       └──────┬───────┘
              │
       ┌──────┴───────┐
       │              │
       ▼              ▼
┌─────────┐    ┌─────────┐
│  Razor  │    │ Silicon │  ← P2: 性能驳斥（并行）
└────┬────┘    └────┬────┘
     │             │
     └──────┬──────┘
            │
            ▼
     ┌──────────────┐
     │ P3: Trick优化 │  ← 视觉组提供"作弊"方案
     └──────┬───────┘
            │
            ▼
     ┌──────────────┐
     │  P4: TDD生成  │  ← Atlas汇总并生成技术设计文档
     └──────┬───────┘
            │
            ▼
     ┌──────────────┐
     │  P5: 代码实现 │  ← Forge执行TDD生成HLSL/C++代码
     └──────────────┘
```

---

## 🎯 适用场景

### ✅ 使用 Frameforge 当你需要：

1. **渲染优化**：光照、材质、PBR、RayTracing 方案设计
2. **特效设计**：粒子、爆炸、流体、VFX 实现
3. **场景优化**：LOD、Culling、地形、植被 优化
4. **性能调试**：帧率分析、瓶颈定位
5. **硬件适配**：跨平台兼容性、GPU架构优化
6. **代码实现**：HLSL/C++ 渲染代码生成

### ❌ 不使用 Frameforge 当你：

1. 需要游戏逻辑代码（使用 Code Vanguard）
2. 需要数据采集（使用 Data Harvester）
3. 需要代码分析（使用 Deconstructors）
4. 需要代码清理（使用 DeepBlue Bastion）
5. 需要文档生成（使用 Sterilizer）

---

## 📦 文件结构

```
frameforge-team/
├── README.md                           # 本文件
├── INSTALL.md                          # 安装指南
├── agents/                             # 专家配置
│   ├── frameforge-shader.md            # Shader专家
│   ├── frameforge-spark.md             # Spark专家
│   ├── frameforge-vertex.md            # Vertex专家
│   ├── frameforge-razor.md             # Razor专家
│   ├── frameforge-silicon.md           # Silicon专家
│   └── frameforge-forge.md             # Forge专家
└── skills/                             # 协调器配置
    └── frameforge-coordinator/
        └── skill.md                    # Atlas协调器
```

---

## 🚀 快速开始

### 1. 安装团队

详见 [INSTALL.md](INSTALL.md)

### 2. 使用团队

```
用户: 我需要为PS5优化一个森林场景的渲染性能

Atlas: [分析需求，识别需要场景优化和性能调试]
      === P1: 视觉提案阶段 ===
      同时触发 Shader 和 Vertex 专家...

[执行完整的P1-P5流程]
```

---

## 🔧 技术栈

### 渲染技术
- **光照系统**：Lumen, Ray Tracing, Lightmass, SDF GI
- **材质系统**：PBR, Layered Materials, Virtual Texturing
- **着色器**：HLSL, GLSL, Compute Shaders, Mesh Shaders
- **后处理**：Bloom, DOF, Motion Blur, Temporal AA

### 引擎支持
- **Unreal Engine 5**：Nanite, Lumen, World Partition
- **Unity 2022+**：DOTS, HDRP, URP
- **自定义引擎**：跨平台渲染架构

### 目标平台
- **PC**：NVIDIA (RTX Series), AMD (RX Series)
- **Console**：PS5, Xbox Series X/S
- **Mobile**（未来扩展）

---

## 📊 质量标准

- ✅ 技术细节具体到毫秒、Draw Call数量
- ✅ 视觉质量评估量化（1-10分）
- ✅ 性能红线硬性约束
- ✅ 跨平台兼容性完整评估
- ✅ 代码完整可编译

---

## 🤝 协作原则

1. **技术深度优先** - 拒绝泛泛而谈
2. **硬件明确性** - 指出消耗的资源类型
3. **真实性保证** - 不捏造不存在的引擎功能
4. **用户沟通** - 同步博弈进度和关键决策
5. **执行分离** - Atlas只设计，Forge只实现

---

## 📝 版本信息

- **团队版本**：3.0（基于 super-team-builder v3.0）
- **最后更新**：2026-03-01
- **团队类型**：混合型（串行+并行）
- **通信协议**：标准化触发指令（📂📋🔓）
- **MCP授权**：三级授权机制（🔴🟡🟢）

---

## 📄 许可证

本团队配置包遵循 Claude Code 技能使用协议。

---

**Frameforge Syndicate** - 让每一帧都值得！
