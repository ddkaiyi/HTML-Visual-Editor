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
- Multi-select alignment: left / right / top / bottom, plus horizontal and vertical center
- Group Move: drag multiple selected elements together
- Local image replace: converts the file to Base64 and embeds it in the page
- Sync stack: edit same-type elements from different page areas together
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

### Multi-Select & Alignment

1. Select multiple elements
2. Use **Align Left / Right / Top / Bottom** (and H-Center / V-Center) to line them up
3. Turn on **Group Move** to drag the selected group together

### Sync Stack

The sync stack is for editing **same-type elements that appear in different areas of the page** together. For example, repeated titles, icons, or cards across multi-page reports: add them to the sync stack, move one, and the others move with it. Combine this with alignment to keep left / right / top / bottom layout consistent.

How to use:

1. Select an element, then click **Add to Sync Stack**
2. Select another element of the same type elsewhere on the page (e.g. both `img`, or both `div`) and add it
3. When the stack has at least 2 elements:
   - Drag, arrow keys, and X/Y inputs move them in sync
   - You can also multi-select and align them left / right / top / bottom
4. **Remove Current** removes one element; **Clear Sync Stack** clears the whole stack

Note: the sync stack only allows one element type at a time.

### Local Image Replace (Base64)

1. Select an `img` element
2. In the right panel, click **Local Image**
3. Choose a local image file; the editor converts it to **Base64** (`data:image/...;base64,...`) and writes it into `src`
4. After export, the image is embedded in the HTML, so the file works offline without external image paths

You can also edit the image URL directly in the properties panel.

### Properties Panel

After importing a file, click **Show Properties** to open the right panel. You can edit:

- Text content, image URL / local Base64 replace
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
