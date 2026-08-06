# HTML Visual Editor Pro

> 中文版：[README.md](./README.md)

A single-file visual HTML editor. Open it in a browser to import pages, edit by dragging, adjust styles, and export the result.

## Quick Start

1. Open `editor_en.html` in a browser
2. Click **Import HTML File**, or **Import HTML Code** to paste a full HTML document
3. Switch to **Edit Mode** and click elements to start editing
4. Click **Export** at the top when you are done

No dependencies and no local server required.

## Features

| Area | Capabilities |
| --- | --- |
| Left sidebar | Import / reset, Edit / Live modes, multi-select align, sync stack, undo / redo |
| Center canvas | Page preview, zoom, canvas ratio (Default / 16:9 / 4:3) |
| Right properties panel | Text, image, position & size, typography, background & border, spacing, transform |

### Editing

- Drag to move elements; use the bottom-right handle to resize
- Double-click text for quick editing
- Multi-select alignment (Left / H-Center / Right / Top / V-Center / Bottom)
- Group Move: drag multiple selected elements together
- Replace images locally or update image URLs
- Sync stack: move same-type elements together
- Chinese / English UI toggle

### Sidebar Width

- Drag the vertical bar between a sidebar and the canvas to resize
- Double-click the bar to reset to the default width
- Widths are remembered across page reloads

## Shortcuts

| Shortcut | Action |
| --- | --- |
| `W` / `S` | Select parent / child node |
| `A` / `D` | Switch sibling nodes |
| `Esc` | Select parent node |
| `Tab` / `Shift+Tab` | Previous / next sibling |
| `Ctrl/Cmd + Z` | Undo |
| `Ctrl/Cmd + Y` | Redo |
| `Ctrl/Cmd + C` | Duplicate selected elements |
| `Ctrl/Cmd + D` | Delete selected elements |
| `Ctrl/Cmd + Enter` | Apply text box content |
| `Alt + ↑` | Select parent node (properties panel action) |

Hold `Ctrl/Cmd` and scroll the mouse wheel to zoom the canvas.

## Usage Notes

### Import Requirements

When pasting code, provide a complete HTML document (including `html`, `body`, and their closing tags).

### Edit Mode vs Live View

- **Edit Mode**: Select, drag, and style elements without triggering original page interactions
- **Live View**: Preview the page with real interactions

### Sync Stack

1. Select an element, then click **Add to Sync Stack**
2. Select another element of the same type (e.g. both `img` or both `div`) and add it
3. When the stack has at least 2 elements, drag, arrow keys, and X/Y inputs move them in sync

### Properties Panel

After importing a file, click **Show Properties** to open the right panel. You can edit:

- Text content and image URL
- Position (X / Y) and size
- Font, font size, color, line height
- Background, border, padding, and margin
- Rotate and scale

## File Structure

```text
html编辑器/
├── editor_en.html   # Full editor (HTML + CSS + JS)
├── README.md        # Chinese documentation
└── README_EN.md     # English documentation
```

## Browser Support

Use a recent Chrome, Edge, Safari, or Firefox. Desktop width is recommended; on narrow screens the layout stacks vertically and sidebar resizing is hidden.
