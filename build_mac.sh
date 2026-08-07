#!/usr/bin/env bash
# Build macOS app for HTML Visual Editor.
# Run from project root on macOS.

set -euo pipefail
cd "$(dirname "$0")"

echo "==> Checking Python..."
python3 --version

echo "==> Ensuring PyInstaller..."
python3 -m pip install --upgrade pip pyinstaller

echo "==> Syncing HTML..."
cp -f "editor_en.html" "编辑器.html"

if [[ ! -f "编辑器.html" ]]; then
  echo "Missing 编辑器.html"
  exit 1
fi
if [[ ! -f "launch_editor.py" ]]; then
  echo "Missing launch_editor.py"
  exit 1
fi

echo "==> Building HtmlEditorLauncher.app ..."
python3 -m PyInstaller --noconfirm --clean --windowed \
  --name HtmlEditorLauncher \
  --add-data "编辑器.html:." \
  launch_editor.py

APP_PATH="dist/HtmlEditorLauncher.app"
if [[ ! -d "$APP_PATH" ]]; then
  echo "Build failed: $APP_PATH not found"
  exit 1
fi

ZIP_PATH="dist/HtmlEditorLauncher-macOS.zip"
rm -f "$ZIP_PATH"
ditto -c -k --sequesterRsrc --keepParent "$APP_PATH" "$ZIP_PATH"

echo ""
echo "Build succeeded:"
echo "  App: $APP_PATH"
echo "  Zip: $ZIP_PATH"
echo ""
echo "Open with: open \"$APP_PATH\""
