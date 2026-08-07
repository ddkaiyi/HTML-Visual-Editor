# HTML 编辑器打包 EXE 方法

本文档记录将 HTML 编辑器打包为 Windows 可执行文件（.exe）的完整流程。

> 当前主编辑器源文件为 `editor_en.html`。打包前会同步复制为 `编辑器.html`（与启动脚本文件名一致）。

## 1. 前置条件

- 操作系统: Windows
- 已安装 Python（建议 3.10+）
- 已安装 PyInstaller

检查版本:

```powershell
python --version
pyinstaller --version
```

如未安装 PyInstaller:

```powershell
pip install pyinstaller
```

## 2. 准备启动脚本

项目目录已包含 `launch_editor.py`，用于启动后自动打开本地 HTML。

若需手动创建，可参考仓库中的 `launch_editor.py`。

## 3. 执行打包（推荐一键脚本）

在项目根目录双击或运行:

```powershell
.\build_exe.bat
```

或:

```powershell
powershell -ExecutionPolicy Bypass -File .\build_exe.ps1
```

等价手动命令:

```powershell
Copy-Item .\editor_en.html .\编辑器.html -Force
pyinstaller --noconfirm --clean --onefile --windowed --name HtmlEditorLauncher --add-data "编辑器.html;." launch_editor.py
```

参数说明:

- `--onefile`: 生成单文件 EXE
- `--windowed`: 不弹出控制台黑窗
- `--add-data`: 把 HTML 一起打进 EXE
- `--clean`: 清理缓存，避免旧资源残留

## 4. 输出位置

打包完成后 EXE 在:

- `dist/HtmlEditorLauncher.exe`

## 5. 快速验证

```powershell
.\dist\HtmlEditorLauncher.exe
```

可选验证文件时间和大小:

```powershell
$f = Get-Item .\dist\HtmlEditorLauncher.exe
$f.LastWriteTime
$f.Length
```

## 6. 用 GitHub Actions 云端打包（macOS 可用）

若当前不在 Windows，可推送代码后到 GitHub Actions 生成 EXE：

1. 打开仓库 Actions 页面
2. 选择 **Build Windows EXE**
3. 点击 **Run workflow**
4. 完成后下载 Artifact：`HtmlEditorLauncher.exe`

## 7. Logo 内嵌（推荐）

如果页面中有本地图片（如 logo），建议改成 base64 data URL，避免用户机器缺图。

示例思路:

1. 读取 PNG 二进制
2. 转 base64
3. 将 `<img src="...">` 替换为 `src="data:image/png;base64,..."`
4. 再重新打包 EXE

这样发给用户时只要一个 EXE 即可，不依赖额外图片文件。

## 8. 修改后必须重打包

只要 HTML 或资源有变更，都需要重新执行第 3 步命令，否则用户拿到的仍是旧内容。

## 9. 常见问题

### 问题 1: 用户打开后不是最新页面

原因: 用户运行的是旧 EXE。

处理:

- 重新打包
- 给新文件加版本号（例如 `HtmlEditorLauncher_v2.exe`）
- 让用户删除旧 EXE 后再运行

### 问题 2: 打开后 logo 丢失

原因: HTML 仍引用本地图片路径。

处理:

- 将图片改为 base64 内嵌
- 重新打包

### 问题 3: 提示找不到 HTML

原因: `--add-data` 或启动脚本文件名不匹配。

处理:

- 检查 `--add-data "编辑器.html;."`
- 检查 `launch_editor.py` 里 `html_name` 与真实文件名一致
- 确认已从 `editor_en.html` 同步到 `编辑器.html`

### 问题 4: EXE 打开后提示文件已删除

one-file EXE 会先解压到 `_MEI...` 临时目录；启动器现会将内嵌的 `编辑器.html` 复制到稳定临时目录后再交给浏览器打开：

```text
%TEMP%\HtmlEditorLauncher\编辑器.html
```
