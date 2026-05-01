# Configuration reference

All options are set inside the `plugin { ... }` block in your zellij layout. Values are KDL strings (or numbers); booleans accept `"true"`, `"1"`, `"yes"` (anything else is false).

```kdl
plugin location="file:~/.config/zellij/plugins/zellij-vertical-tabs-and-panes.wasm" {
    format "{index}:{name}"
    format_active "#[fg=accent]{index}:{name} {indicators}"
    show_panes "true"
}
```

## Tab format

| Option | Type | Default | Description |
|--------|------|---------|-------------|
| `format` | string | `{index}:{name}` | Format used for inactive tab rows. See [Format variables](format-variables.md). |
| `format_active` | string | `{index}:{name} {indicators}` | Format used for the active tab row. |

## Pane listings (fork addition)

| Option | Type | Default | Description |
|--------|------|---------|-------------|
| `show_panes` | bool | `true` | If true, list the panes of the active tab beneath it. |
| `show_plugin_panes` | bool | `false` | If true, plugin panes are included in the listing alongside terminal panes. |
| `pane_format` | string | `  └ {title}` | Format used for inactive pane rows. |
| `pane_format_active` | string | `  └ {title} *` | Format used for the focused pane row. |

## Indicators

| Option | Type | Default | Description |
|--------|------|---------|-------------|
| `indicator_active` | string | `*` | Substituted for `{active}` and inside `{indicators}` when the tab is current. |
| `indicator_fullscreen` | string | `Z` | Substituted for `{fullscreen}` when the tab is in fullscreen. |
| `indicator_sync` | string | `S` | Substituted for `{sync}` when the tab has sync-panes mode. |

## Layout

| Option | Type | Default | Description |
|--------|------|---------|-------------|
| `max_name_length` | int | `20` | Truncate tab names longer than this; suffixed with `...`. |
| `padding_top` | int | `0` | Empty rows above the tab list. |
| `start_index` | int | `1` | First tab number (set to `0` for tmux-like indexing). |
| `border` | string | *(empty)* | Right-edge border drawn on every row. Accepts inline color syntax — e.g. `#[fg=dim]│`. Alias: `border_char`. |

## Overflow

When more tabs exist than rows available, the plugin renders one of these strings on the first/last row of the viewport. `{count}` is the number of hidden tabs.

| Option | Type | Default |
|--------|------|---------|
| `overflow_above` | string | `  ^ +{count}` |
| `overflow_below` | string | `  v +{count}` |

See [How the viewport scrolls](../explanation/viewport-and-overflow.md) for the algorithm.

## Where defaults live

Defaults are defined on `StyleConfig` in [`src/main.rs`](../../src/main.rs).
