# HTML 编辑器桌面端打包方法

将 HTML 编辑器打包为：

- Windows：`HtmlEditorLauncher.exe`
- macOS：`HtmlEditorLauncher.app`（另附 zip）

> 主源文件为 `editor_en.html`。打包前会同步复制为 `编辑器.html`。

## 1. Windows EXE

### 前置条件

- Windows
- Python 3.10+
- PyInstaller

```powershell
python --version
pip install pyinstaller
```

### 一键打包

```powershell
.\build_exe.bat
```

或：

```powershell
powershell -ExecutionPolicy Bypass -File .\build_exe.ps1
```

### 输出

- `dist/HtmlEditorLauncher.exe`

## 2. macOS App

### 前置条件

- macOS
- Python 3.10+
- PyInstaller

```bash
python3 --version
python3 -m pip install pyinstaller
```

### 一键打包

```bash
chmod +x ./build_mac.sh
./build_mac.sh
```

### 输出

- `dist/HtmlEditorLauncher.app`
- `dist/HtmlEditorLauncher-macOS.zip`（方便分发）

打开方式：

```bash
open ./dist/HtmlEditorLauncher.app
```

首次打开若提示无法验证开发者：右键 App → 打开 → 仍要打开。

## 3. GitHub Actions 云端同时打包

推送代码后，在仓库 Actions 中运行 **Build Desktop Apps**：

1. 打开 [Actions](https://github.com/ddkaiyi/HTML-Visual-Editor/actions)
2. 选择 **Build Desktop Apps** → **Run workflow**
3. 下载两个 Artifact：
   - `HtmlEditorLauncher-Windows` → 内含 `.exe`
   - `HtmlEditorLauncher-macOS` → 内含 `.zip`（解压后得到 `.app`）

## 4. 修改后必须重打包

HTML 或启动脚本变更后，需重新执行对应系统的打包命令，或重新跑 GitHub Actions。

## 5. 常见问题

### 找不到 HTML

- 确认已从 `editor_en.html` 同步到 `编辑器.html`
- Windows：`--add-data "编辑器.html;."`
- macOS：`--add-data "编辑器.html:."`

### EXE / App 打开后不是最新内容

重新打包，并建议用户替换旧文件。

### macOS 提示已损坏 / 无法打开

通常是未签名导致。可执行：

```bash
xattr -dr com.apple.quarantine ./dist/HtmlEditorLauncher.app
open ./dist/HtmlEditorLauncher.app
```
