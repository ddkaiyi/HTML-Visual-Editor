# HTML Visual Editor - Windows EXE build script
# Run in PowerShell from the project root on Windows.

$ErrorActionPreference = "Stop"

Write-Host "==> Checking Python..."
python --version
if ($LASTEXITCODE -ne 0) {
  throw "Python is required. Please install Python 3.10+ and retry."
}

Write-Host "==> Ensuring PyInstaller..."
python -m pip install --upgrade pip pyinstaller
if ($LASTEXITCODE -ne 0) {
  throw "Failed to install PyInstaller."
}

# Keep packaged HTML in sync with the latest editor source.
if (Test-Path ".\editor_en.html") {
  Copy-Item ".\editor_en.html" ".\编辑器.html" -Force
}

if (-not (Test-Path ".\编辑器.html")) {
  throw "Missing 编辑器.html"
}
if (-not (Test-Path ".\launch_editor.py")) {
  throw "Missing launch_editor.py"
}

Write-Host "==> Building HtmlEditorLauncher.exe ..."
python -m PyInstaller --noconfirm --clean --onefile --windowed `
  --name HtmlEditorLauncher `
  --add-data "编辑器.html;." `
  launch_editor.py

if ($LASTEXITCODE -ne 0) {
  throw "PyInstaller build failed."
}

$exe = Get-Item ".\dist\HtmlEditorLauncher.exe"
Write-Host ""
Write-Host "Build succeeded:"
Write-Host ("  Path: " + $exe.FullName)
Write-Host ("  Size: {0:N0} bytes" -f $exe.Length)
Write-Host ("  Time: " + $exe.LastWriteTime)
Write-Host ""
Write-Host "Run with: .\dist\HtmlEditorLauncher.exe"
