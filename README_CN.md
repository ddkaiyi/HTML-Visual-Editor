# HTML Visual Editor Pro

> **下载安装包（点击前往）**：[Releases 下载页](https://github.com/ddkaiyi/HTML-Visual-Editor/releases/tag/v1.0.0)  
> - Windows：[`HtmlEditorLauncher.exe`](https://github.com/ddkaiyi/HTML-Visual-Editor/releases/download/v1.0.0/HtmlEditorLauncher.exe)  
> - macOS：[`HtmlEditorLauncher-macOS.zip`](https://github.com/ddkaiyi/HTML-Visual-Editor/releases/download/v1.0.0/HtmlEditorLauncher-macOS.zip)

> English version: [README_EN.md](./README_EN.md)

本工具原始形态为 HTML 可视化编辑器；为保护源码，已封装为可执行程序（Windows `.exe` / macOS `.app`）对外分发。请通过上方链接下载安装包使用，不提供 HTML 源文件。

## 快速开始

1. 打开 [Releases 下载页](https://github.com/ddkaiyi/HTML-Visual-Editor/releases/tag/v1.0.0)，下载对应系统的安装包
2. Windows：双击 `HtmlEditorLauncher.exe`；macOS：解压 zip 后打开 `HtmlEditorLauncher.app`
3. 在编辑器中点击 **Import HTML File** 导入文件，或 **Import HTML Code** 粘贴完整 HTML
4. 在 **Edit Mode** 下点击元素开始编辑，完成后点击顶部 **Export** 导出结果

## 功能概览

| 区域 | 能力 |
| --- | --- |
| 左侧栏 | 导入/重置、编辑/预览模式、多选对齐、同步栈、撤销重做 |
| 中间画布 | 页面预览、缩放、画布比例（默认 / 16:9 / 4:3） |
| 右侧属性栏 | 文本、图片、位置尺寸、字体颜色、背景边框、间距、变形 |

### 编辑能力

- 拖拽移动元素，右下角手柄调整尺寸
- 双击文本快速编辑
- 多选后左右上下对齐（左 / 水平居中 / 右 / 顶 / 垂直居中 / 底）
- 组移动：多选后统一拖动
- 本地替换图片：自动转为 Base64 写入页面，导出后可离线显示
- 同步栈：把页面不同区域的同类型元素联动修改
- 中英文界面切换

### 侧栏宽度

- 拖动左右侧栏与画布之间的竖条，可调节侧栏宽度
- 双击竖条恢复默认宽度
- 宽度会自动记住，刷新后保留

## 快捷键

| 快捷键 | 作用 |
| --- | --- |
| `W` / `S` | 选中父节点 / 子节点 |
| `A` / `D` | 切换兄弟节点 |
| `Esc` | 选中父节点 |
| `Tab` / `Shift+Tab` | 上一个 / 下一个兄弟节点 |
| `Ctrl/Cmd + Z` | 撤销 |
| `Ctrl/Cmd + Y` | 重做 |
| `Ctrl/Cmd + C` | 复制选中元素 |
| `Ctrl/Cmd + D` | 删除选中元素 |
| `Ctrl/Cmd + Enter` | 应用文本框内容 |
| `Alt + ↑` | 选择父节点（属性栏按钮） |

按住 `Ctrl/Cmd` + 滚轮可在画布上缩放。

## 使用说明

### 导入要求

粘贴代码导入时，请提供完整 HTML 文档（包含 `html`、`body` 及对应结束标签）。

### 编辑模式 vs 预览模式

- **Edit Mode**：可选择、拖拽、改样式，不会触发原页面交互
- **Live View**：按页面真实交互预览

### 多选与对齐

1. 按住多选相关操作选中多个元素（或逐个加入选择）
2. 使用左侧 **Align Left / Right / Top / Bottom** 等按钮做左右上下对齐
3. 也可使用水平居中、垂直居中，让多个元素整齐排布
4. 开启 **Group Move** 后，可把已选元素一起拖动

### 同步栈

同步栈用于把**页面中不同位置、不同区块里的同类型元素**放到一起联动修改。例如多页报告里重复出现的标题、图标、卡片，加入同步栈后，移动其中一个时，其余元素会同步位移，再配合对齐功能，更容易统一排版。

使用步骤：

1. 选中一个元素，点击 **Add to Sync Stack**
2. 再到页面其他位置选中同类型元素并加入（如都是 `img`，或都是 `div`）
3. 栈内至少 2 个元素后：
   - 拖拽、方向键、属性栏 X/Y 输入会同步移动
   - 可再配合多选对齐，统一左右上下位置
4. **Remove Current** 可移除当前元素；**Clear Sync Stack** 清空整个同步栈

说明：同步栈同一时间只允许一种元素类型。

### 本地图片替换（Base64）

1. 选中 `img` 元素
2. 在右侧属性栏点击 **Local Image**（本地替换图片）
3. 选择本地图片文件后，编辑器会把图片转为 **Base64（`data:image/...;base64,...`）** 写入 `src`
4. 导出 HTML 后，图片已内嵌在文件中，不依赖外部路径，便于单文件分享与离线打开

也可以直接在属性栏修改图片 URL（外链或已有地址）。

### 属性面板

导入文件后，点击顶部 **Show Properties** 显示右侧属性栏，可编辑：

- 文本内容、图片地址 / 本地 Base64 替换
- 位置（X / Y）、宽高
- 字体、字号、颜色、行高
- 背景、边框、内外边距
- 旋转、缩放

## 文件说明

| 文件 | 说明 |
| --- | --- |
| [README_CN.md](./README_CN.md) | 中文说明 |
| [README_EN.md](./README_EN.md) | English documentation |
| [HTML_Editor_Introduction.pdf](./HTML_Editor_Introduction.pdf) | 介绍文档 PDF |
| [Releases](https://github.com/ddkaiyi/HTML-Visual-Editor/releases/tag/v1.0.0) | Windows / macOS 安装包下载 |

## 浏览器建议

推荐使用较新的 Chrome、Edge、Safari 或 Firefox。建议在桌面宽度下使用；窄屏会切换为上下布局，侧栏拖拽调节会隐藏。

### macOS 打开提示

若提示无法打开，可在终端执行：

```bash
xattr -dr com.apple.quarantine ./HtmlEditorLauncher.app
open ./HtmlEditorLauncher.app
```
