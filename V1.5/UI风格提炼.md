# UI 风格提炼

## 一、整体布局结构

### 1.1 三栏布局架构
- **顶部 Header**（高度 64px/h-16）：白色背景，展示 Logo、顶部主导航、用户信息
- **左侧 Sidebar**（宽度 276px）：深灰黑色背景 `#2f363e`，展示二级菜单/目录树
- **右侧 Main**：浅灰色背景 `#f1f4f9`，内容区域，可滚动

### 1.2 响应式约束
- 最小宽度 `min-width: 1200px`，针对 1920 大屏优化
- 固定布局，不响应移动端，专为桌面端设计

---

## 二、色彩系统

### 2.1 主色调
- **主色**：`#1890ff`（Ant Design 蓝色）- 用于主按钮、选中状态、链接、强调元素
- **侧边栏背景**：`#001529`（深蓝黑色）
- **顶部栏背景**：`#ffffff`（白色）
- **主背景**：`#f0f2f5`（浅灰色）
- **边框色**：`#e8e8e8` / `#d9d9d9`

### 2.2 文字颜色
- **标题**：`#8080`（深灰）
- **正文**：`gray-700` / `text-gray-700`
- **辅助文字**：`gray-500` / `text-gray-500`
- **侧边栏文字**：`gray-300` / `text-gray-300`

### 2.3 状态色
- **成功/绿色**：`green-600` + `green-50` 背景
- **信息/蓝色**：`blue-600` + `blue-50` 背景
- **警告/橙色**：`orange-600` + `orange-50` 背景
- **错误/红色**：`red-600` + `red-50` 背景
- **紫色**：`purple-600` + `purple-50` 背景（用于发布状态）

---

## 三、排版规范

### 3.1 字体层级
| 元素 | 字号 | 字重 | 说明 |
|------|------|------|------|
| Logo主标题 | 17px | font-black | 四维云行业通用软件 |
| Logo副标题 | 11px | font-bold | tracking-[0.25em] 字间距加宽 |
| 顶部导航 | 16px | font-medium | 数据汇聚、数据管理等 |
| 侧边栏一级菜单 | 16px | normal | tracking-wide |
| 侧边栏二级菜单 | 14px | normal | |
| 页面标题 | 20px (xl) | font-bold | h1 |
| 卡片标题 | 15-16px | font-bold | section 标题 |
| 表头等标签 | 13px | medium | 表格头部、标签文字 |
| 表格内容 | 13px | normal | 表格单元格 |
| 正文内容 | 14px | normal | 表单标签、输入框 |
| 辅助文字 | 12px | normal | 分页、提示信息 |

### 3.2 字体族
- 使用系统无衬线字体 `font-sans`（Tailwind 默认）

---

## 四、组件风格

### 4.1 卡片
- **背景**：白色 `bg-white`
- **边框**：`border border-gray-200`
- **圆角**：`rounded-sm` 或 `rounded-md`（小圆角）
- **阴影**：`shadow-sm`（轻微阴影）
- **卡片标题左侧**：蓝色竖条标识 `w-1 h-4 bg-primary rounded-full`

### 4.2 按钮
- **主按钮**：`bg-primary hover:bg-blue-600 text-white`，圆角 2px
- **次按钮**：`bg-white hover:bg-gray-50 text-gray-600 border border-gray-300`
- **尺寸**：`px-4 py-1.5` ~ `px-8 py-2.5`，适应不同场景

### 4.3 输入框/选择框
- **边框**：`border border-gray-300` / `border #d9d9d9`
- **圆角**：`rounded-md` 或 `rounded-[2px]`
- **聚焦状态**：`border-primary` + `ring-1 ring-primary`，蓝边高亮
- **高度**：一般使用 `h-8` 或自适应

### 4.4 表格
- **表头**：`bg-gray-50`，边框底部分隔
- **行**：`border-b border-gray-100`， hover 行背景 `hover:bg-gray-50`
- **文字**：小号字体 `text-xs` ~ `text-[13px]`

### 4.5 弹出框/模态框
- **遮罩**：`bg-black/45` 半透明黑色
- **内容区域**：白色背景，圆角 `rounded-md`，阴影 `shadow-xl`
- **顶部标题栏**：分隔线 `border-b border-gray-200`
- **底部按钮栏**：分隔线 `border-t border-gray-100`

### 4.6 侧边栏菜单
- **宽度**：`w-[276px]`
- **背景**：`bg-[#2f363e]` 深灰黑色
- **文字颜色**：`text-white`
- **悬停效果**：`hover:bg-[#262b31]`
- **选中状态**：`bg-[#262b31] text-white`，右侧蓝色指示竖条 `width: 8px height: 48px bg-[#0365fa]`
- **嵌套菜单**：子菜单背景比父级更深
- **折叠展开**：使用 `fa-angle-down` / `fa-angle-up` 图标指示

---

## 五、间距规范

### 5.1 页面级间距
- Header 左右内边距：`px-6`
- Sidebar 宽度固定：`w-64`
- Main 内容区内边距：`p-6`
- 卡片之间间距：`mb-6`（约 24px）

### 5.2 卡片内间距
- 卡片标题区：`px-6 py-4`
- 卡片内容区：`p-6`
- 表单项间距：`gap-4` / `gap-6`（网格布局）
- 网格系统：使用 `grid-cols-2` / `grid-cols-3` 进行多列布局

---

## 六、技术栈

- **CSS 框架**：Tailwind CSS v3（CDN 引入）
- **图标库**：Font Awesome 6.4.0（CDN 引入）
- **布局方式**：Flexbox + CSS Grid
- **交互**：原生 JavaScript（无框架依赖）
- **Tailwind 配置**：
  ```javascript
  tailwind.config = {
    theme: {
      extend: {
        colors: {
          primary: '#1890ff',
          header: '#ffffff',
          sidebar: '#001529',
          main: '#f0f2f5',
          border: '#e8e8e8'
        }
      }
    }
  }
  ```

---

## 七、设计风格总结

> **企业级中后台风格** - 借鉴 Ant Design 设计语言

- **风格特点**：专业、简洁、清晰、易用
- **视觉层次**：深蓝色侧边栏 + 白色顶栏 + 浅灰内容区，层次感清晰
- **交互反馈**：悬停变色、聚焦高亮、选中状态明确
- **圆角**：小圆角设计（2px ~ 6px），不过分圆润
- **阴影**：轻微阴影，营造层级感但不过度
- **对齐**：标签左对齐，内容左对齐，信息展示清晰规整

---

## 八、自定义样式补充

### 8.1 滚动条
```css
::-webkit-scrollbar { width: 6px; height: 6px; }
::-webkit-scrollbar-track { background: transparent; }
::-webkit-scrollbar-thumb { background: #cbd5e1; border-radius: 3px; }
::-webkit-scrollbar-thumb:hover { background: #94a3b8; }
```

### 8.2 自定义输入框焦点
```css
.custom-input:focus {
  border-color: #40a9ff;
  box-shadow: 0 0 0 2px rgba(24, 144, 255, 0.2);
  outline: none;
}
```
