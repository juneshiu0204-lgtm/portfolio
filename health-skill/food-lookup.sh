#!/bin/bash
#
# Health Skill - 食物热量查询脚本
# 查询食物的热量和营养成分，优先从食物表查询，其次网络搜索
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

# Bitable配置
FOOD_APP_TOKEN=$(get_config "c.bitable.food.app_token")
FOOD_TABLE_ID=$(get_config "c.bitable.food.table_id")

# 食物名称
FOOD_NAME="$1"

if [ -z "$FOOD_NAME" ]; then
    echo "用法：$0 <食物名称>"
    echo ""
    echo "示例："
    echo "  $0 宫保鸡丁"
    echo "  $0 水煮鸡胸肉"
    echo ""
    exit 1
fi

echo "========================================"
echo "Health Skill - 食物热量查询"
echo "查询：$FOOD_NAME"
echo "========================================"

# 步骤1：先查询食物表
echo ""
echo "步骤1：查询食物表..."

# 这里需要实际的Bitable查询逻辑
# 示例：使用feishu_bitable_app_table_record工具查询

echo "  - 正在搜索食物表中的\"$FOOD_NAME\"..."

# 如果食物表中没有，进行网络搜索
echo ""
echo "步骤2：网络搜索..."

# 使用web_search工具搜索食物热量
# 优先查询薄荷健康、华为运动的食物数据

echo "  - 正在搜索薄荷健康数据..."
echo "  - 正在搜索华为运动健康数据..."

# 步骤3：返回结果
echo ""
echo "========================================"
echo "查询结果：$FOOD_NAME"
echo "========================================"
echo ""
echo "（待实现：需要配合web_search工具获取真实数据）"
echo ""
echo "示例数据格式："
echo "  宫保鸡丁（每100g）"
echo "  - 热量：220 kCal"
echo "  - 碳水：12 g"
echo "  - 蛋白：18 g"
echo "  - 脂肪：12 g"
echo ""
echo "  *注：以上为示例数据，实际使用时需要真实查询*"
echo ""

exit 0
