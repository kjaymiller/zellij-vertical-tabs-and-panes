# Plugin messages

The plugin handles a small set of pipe messages, which you can dispatch from a keybinding via `MessagePlugin`.

## `set_selectable`

Set the plugin pane's selectability explicitly. This controls whether zellij's pane navigation will land focus inside the sidebar.

- **Payload:** `"true"` or `"false"` (other values are ignored).

```kdl
keybinds {
    shared {
        bind "Alt S" {
            MessagePlugin "file:~/.config/zellij/plugins/zellij-vertical-tabs-and-panes.wasm" {
                name "set_selectable"
                payload "true"
            }
        }
    }
}
```

## `toggle_selectable`

Flip the plugin pane's selectability. Useful as a single-key toggle for resizing the sidebar pane (zellij's resize commands require the pane to be selectable).

- **Payload:** ignored.

```kdl
keybinds {
    shared {
        bind "Alt s" {
            MessagePlugin "file:~/.config/zellij/plugins/zellij-vertical-tabs-and-panes.wasm" {
                name "toggle_selectable"
            }
        }
    }
}
```

The plugin starts non-selectable so clicks pass through to switch tabs without stealing focus.
