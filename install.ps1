# Frameforge Syndicate 安装脚本
# 版本: v2.1 (with LSP Support)

Write-Host "====================================" -ForegroundColor Cyan
Write-Host "  Frameforge Syndicate 安装脚本" -ForegroundColor Cyan
Write-Host "  版本: v2.1 (with LSP Support)" -ForegroundColor Cyan
Write-Host "====================================" -ForegroundColor Cyan
Write-Host ""

# 设置路径
$sourceDir = "N:\编程备份\新一代团队\frameforge-team"
$targetDir = "$env:USERPROFILE\.claude"

Write-Host "📂 源目录: $sourceDir" -ForegroundColor Yellow
Write-Host "📂 目标目录: $targetDir" -ForegroundColor Yellow
Write-Host ""

# 检查源目录是否存在
if (-not (Test-Path $sourceDir)) {
    Write-Host "❌ 错误: 源目录不存在: $sourceDir" -ForegroundColor Red
    Write-Host "请确认源目录路径正确。" -ForegroundColor Red
    exit 1
}

# 创建目录
Write-Host "📁 创建目录..." -ForegroundColor Green
New-Item -ItemType Directory -Force -Path "$targetDir\skills\frameforge-coordinator" | Out-Null
New-Item -ItemType Directory -Force -Path "$targetDir\teams" | Out-Null
Write-Host "✅ 目录创建完成" -ForegroundColor Green
Write-Host ""

# 复制协调器 Skill
Write-Host "📋 复制协调器 Skill..." -ForegroundColor Green
$skillSource = "$sourceDir\skills\frameforge-coordinator\skill.md"
$skillTarget = "$targetDir\skills\frameforge-coordinator\skill.md"
if (Test-Path $skillSource) {
    Copy-Item -Path $skillSource -Destination $skillTarget -Force
    Write-Host "✅ frameforge-coordinator/skill.md" -ForegroundColor Green
} else {
    Write-Host "⚠️  警告: 协调器 Skill 文件不存在" -ForegroundColor Yellow
}
Write-Host ""

# 复制专家 Agents
Write-Host "👥 复制专家 Agents..." -ForegroundColor Green
$agentsSource = "$sourceDir\agents\*.md"
$agentsTarget = "$targetDir\teams"

if (Test-Path "$sourceDir\agents") {
    $agentFiles = Get-ChildItem -Path "$sourceDir\agents" -Filter "*.md"
    foreach ($agent in $agentFiles) {
        Copy-Item -Path $agent.FullName -Destination $agentsTarget -Force
        Write-Host "✅ $($agent.Name)" -ForegroundColor Green
    }
} else {
    Write-Host "⚠️  警告: agents 目录不存在" -ForegroundColor Yellow
}
Write-Host ""

# 验证安装
Write-Host "🔍 验证安装..." -ForegroundColor Cyan
Write-Host ""

$filesToCheck = @(
    "$targetDir\skills\frameforge-coordinator\skill.md",
    "$targetDir\teams\frameforge-shader.md",
    "$targetDir\teams\frameforge-spark.md",
    "$targetDir\teams\frameforge-vertex.md",
    "$targetDir\teams\frameforge-razor.md",
    "$targetDir\teams\frameforge-silicon.md",
    "$targetDir\teams\frameforge-forge.md"
)

$allExists = $true
foreach ($file in $filesToCheck) {
    $exists = Test-Path $file
    $fileName = Split-Path $file -Leaf
    if ($exists) {
        Write-Host "✅ $fileName" -ForegroundColor Green
    } else {
        Write-Host "❌ $fileName - 文件不存在" -ForegroundColor Red
        $allExists = $false
    }
}

Write-Host ""
Write-Host "====================================" -ForegroundColor Cyan
if ($allExists) {
    Write-Host "✅ 安装成功！" -ForegroundColor Green
    Write-Host "" -ForegroundColor Cyan
    Write-Host "📍 安装位置: $targetDir" -ForegroundColor Cyan
    Write-Host "" -ForegroundColor Cyan
    Write-Host "📝 下一步:" -ForegroundColor Yellow
    Write-Host "1. 重启 Claude Code" -ForegroundColor White
    Write-Host "2. 测试协调器: 'Use frameforge-coordinator skill to help me optimize rendering'" -ForegroundColor White
    Write-Host "3. 测试专家: 'Use frameforge-shader agent to propose a lighting solution'" -ForegroundColor White
} else {
    Write-Host "❌ 安装失败！请检查错误信息。" -ForegroundColor Red
    Write-Host "" -ForegroundColor Red
    Write-Host "💡 可能的原因:" -ForegroundColor Yellow
    Write-Host "1. 源目录路径不正确" -ForegroundColor White
    Write-Host "2. 源文件不完整" -ForegroundColor White
    Write-Host "3. 目标目录权限不足" -ForegroundColor White
}
Write-Host "====================================" -ForegroundColor Cyan
