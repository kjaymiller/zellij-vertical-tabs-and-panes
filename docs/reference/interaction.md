# Mouse and keyboard interaction

| Action | Effect |
|--------|--------|
| **Left click** on a tab row | Switch to that tab. |
| **Left click** on a pane row (under the active tab) | Focus that pane. |
| **Left click** on `^ +N` | Switch to the tab immediately above the viewport. |
| **Left click** on `v +N` | Switch to the tab immediately below the viewport. |
| **Scroll wheel up** | Switch to the previous tab. |
| **Scroll wheel down** | Switch to the next tab. |

Zellij's standard tab keybindings still work — `Ctrl+t n` to create a tab, `Ctrl+t r` to rename, etc.

## Permissions

The plugin requests the following on first run:

- `ReadApplicationState` — receive `TabUpdate`, `PaneUpdate`, `ModeUpdate` events.
- `ChangeApplicationState` — switch tabs, focus panes.

If the prompt is unresponsive, edit your permissions file directly. On Linux: `~/.cache/zellij/permissions.kdl`:

```kdl
"/absolute/path/to/zellij-vertical-tabs-and-panes.wasm" {
    ReadApplicationState
    ChangeApplicationState
}
```
