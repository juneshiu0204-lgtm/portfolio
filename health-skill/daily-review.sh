#!/bin/bash
#
# Health Skill - 每日复盘脚本
# 每日23:30自动执行，汇总当日饮食与运动数据，生成健康日报
#

set -e

# 技能根目录
SKILL_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
WORKSPACE_DIR="$(dirname "$(dirname "$SKILL_DIR")")"

# 加载配置
CONFIG_FILE="$SKILL_DIR/config.json"
if [ ! -f "$CONFIG_FILE" ]; then
    echo "错误：配置文件不存在：$CONFIG_FILE"
    exit 1
fi

# 获取配置值
get_config() {
    local key="$1"
    node -pe "const c = require('$CONFIG_FILE'); $key" 2>/dev/null || echo ""
}

# 日期相关
TODAY=$(date +%Y-%m-%d)
TODAY_CN=$(date +%Y/%m/%d)
REPORT_DIR="$WORKSPACE_DIR/health-reports"
REPORT_FILE="$REPORT_DIR/$TODAY.md"

# 创建报告目录
mkdir -p "$REPORT_DIR"

# 获取Bitable配置
DIARY_APP_TOKEN=$(get_config "c.bitable.diary.app_token")
DIARY_TABLE_ID=$(get_config "c.bitable.diary.table_id")
SCHEDULE_APP_TOKEN=$(get_config "c.bitable.schedule.app_token")
SCHEDULE_TABLE_ID=$(get_config "c.bitable.schedule.table_id")

# 用户信息
USER_OPEN_ID=$(get_config "c.user_profile.open_id")
PUSH_TARGET=$(get_config "c.workflow.push_target")

echo "========================================"
echo "Health Skill - 每日复盘"
echo "日期：$TODAY_CN"
echo "========================================"

# 步骤1：读取当日日程表数据
echo ""
echo "步骤1：读取当日日程数据..."

# 使用openclaw feishu工具查询日程表（这里需要实际的feishu bitable查询）
# 示例逻辑：查询今日的饮食和运动记录

echo "  - 饮食记录查询中..."
echo "  - 运动记录查询中..."

# 步骤2：计算当日营养素摄入
echo ""
echo "步骤2：计算当日营养素摄入..."

# 这里需要实际的食物热量计算逻辑
# 示例：从日程表提取饮食条目，逐个计算热量

# 步骤3：计算当日运动消耗
echo ""
echo "步骤3：计算当日运动消耗..."

# 从日程表提取运动记录，计算消耗

# 步骤4：生成分数和建议
echo ""
echo "步骤4：生成分数和建议..."

# 步骤5：生成Markdown日报
echo ""
echo "步骤5：生成健康日报..."

cat > "$REPORT_FILE" << EOF
## 健康总结报告（$TODAY_CN）

### 概要：计算中...
> 数据正在汇总，请稍候...

### 运动情况：待统计
> 正在分析运动数据...

### 饮食汇总：待统计
> 正在分析饮食数据...

---
*生成时间：$(date '+%Y-%m-%d %H:%M:%S')*
*Health Skill v1.0.0*
EOF

echo "  - 日报已生成：$REPORT_FILE"

# 步骤6：发送消息给用户，询问是否需要补充
echo ""
echo "步骤6：发送消息给用户..."

MESSAGE="🐱 健康每日复盘已启动

我已经读取了今天的日程记录，正在汇总你的饮食和运动数据。

在生成最终报告前，请问：
✅ 是否还有未记录的饮食？
✅ 是否还有未记录的运动？

如果有补充内容，请直接告诉我，我会更新到报告中～

如果没有补充，回复\"生成报告\"，我将为你生成完整的健康日报。"

echo "  - 消息内容已准备好"
echo ""

# 步骤7：等待用户确认后生成最终报告
echo "========================================"
echo "等待用户确认..."
echo "========================================"

# 输出脚本执行信息供日志使用
echo ""
echo "脚本执行完成信息："
echo "  - 报告目录：$REPORT_DIR"
echo "  - 用户ID：$USER_OPEN_ID"
echo "  - 推送目标：$PUSH_TARGET"
echo ""
echo "注意：此脚本为框架，需要配合OpenClaw的cron定时任务和飞书工具使用"
echo ""

exit 0
