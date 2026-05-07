#!/bin/bash
#
# Health Skill - 安装配置脚本
# 配置cron定时任务、创建必要目录等
#

set -e

# 技能根目录
SKILL_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
WORKSPACE_DIR="$(dirname "$(dirname "$SKILL_DIR")")"

echo "========================================"
echo "Health Skill - 安装配置"
echo "========================================"

# 步骤1：创建必要目录
echo ""
echo "步骤1：创建必要目录..."

mkdir -p "$WORKSPACE_DIR/health-reports"
mkdir -p "$SKILL_DIR/logs"
echo "  - 健康报告目录：$WORKSPACE_DIR/health-reports"
echo "  - 日志目录：$SKILL_DIR/logs"

# 步骤2：设置脚本可执行权限
echo ""
echo "步骤2：设置脚本可执行权限..."

chmod +x "$SKILL_DIR/daily-review.sh"
chmod +x "$SKILL_DIR/food-lookup.sh"
echo "  - daily-review.sh：已设置可执行"
echo "  - food-lookup.sh：已设置可执行"

# 步骤3：配置cron定时任务
echo ""
echo "步骤3：配置cron定时任务..."

echo ""
echo "请在OpenClaw中执行以下命令添加定时任务："
echo ""
echo "  openclaw cron add --name \"health-daily-review\" \\"
echo "    --schedule \"0 30 23 * * *\" \\"
echo "    --payload \"kind: agentTurn\" \\"
echo "    --message \"执行每日健康复盘，汇总今日饮食运动数据并生成健康日报\" \\"
echo "    --enabled true"
echo ""
echo "（注：每天23:30执行，时区为UTC+8，请根据实际时区调整）"

# 步骤4：验证Bitable连接
echo ""
echo "步骤4：验证Bitable配置..."
echo ""
echo "请确保以下Bitable表已正确创建并可访问："
echo "  - 日记表：xxxx / xxxx"
echo "  - 日程表：xxxx / xxxx"
echo "  - 食物表：xxxx / xxxx"
echo ""

# 步骤5：完成
echo ""
echo "========================================"
echo "Health Skill 安装完成！"
echo "========================================"
echo ""
echo "接下来你可以："
echo "1. 测试食物查询：我今天吃了宫保鸡丁，帮我算一下热量"
echo "2. 测试日报生成：生成今天的健康日报"
echo "3. 查询剩余额度：我今天还可以摄入多少卡路里？"
echo ""
echo "详细使用说明请参考：$SKILL_DIR/SKILL.md"
echo ""

exit 0
