import os
import shutil
import sys
import tempfile
import webbrowser


def get_base_dir() -> str:
    if getattr(sys, "frozen", False):
        return getattr(sys, "_MEIPASS", os.path.dirname(sys.executable))
    return os.path.dirname(os.path.abspath(__file__))


def main() -> int:
    base_dir = get_base_dir()
    html_name = "编辑器.html"
    bundled_html_path = os.path.join(base_dir, html_name)

    if not os.path.exists(bundled_html_path):
        # Fallback for local development filename.
        fallback = os.path.join(base_dir, "editor_en.html")
        if os.path.exists(fallback):
            bundled_html_path = fallback
            html_name = "editor_en.html"
        else:
            print(f"Missing file: {html_name}")
            return 1

    stable_dir = os.path.join(tempfile.gettempdir(), "HtmlEditorLauncher")
    os.makedirs(stable_dir, exist_ok=True)
    html_path = os.path.join(stable_dir, html_name)
    shutil.copy2(bundled_html_path, html_path)

    file_url = "file:///" + html_path.replace("\\", "/")
    webbrowser.open_new(file_url)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
