# Format variables

Format strings (`format`, `format_active`, `pane_format`, `pane_format_active`, `overflow_above`, `overflow_below`) substitute the variables below. Unknown variables render as the literal text `{name}`.

## Tab variables

| Variable | Aliases | Description |
|----------|---------|-------------|
| `{index}` | `{i}` | Tab number (offset by `start_index`). |
| `{name}` | `{n}` | Tab name (truncated to `max_name_length` with `...`). |
| `{title}` | `{t}`, `{pane_title}` | Title of the focused pane in that tab. |
| `{indicators}` | | Concatenation of any active status indicators (`active`, `fullscreen`, `sync`). |
| `{active}` | | `indicator_active` if the tab is current, else empty. |
| `{fullscreen}` | | `indicator_fullscreen` if the tab is in fullscreen, else empty. |
| `{sync}` | | `indicator_sync` if sync-panes is on, else empty. |

## Pane variables (used by `pane_format` / `pane_format_active`)

| Variable | Aliases | Description |
|----------|---------|-------------|
| `{index}` | `{i}` | Pane index within the tab. |
| `{title}` | `{t}`, `{name}`, `{n}`, `{pane_title}` | Pane terminal title. |

## Overflow variables (used by `overflow_above` / `overflow_below`)

| Variable | Description |
|----------|-------------|
| `{count}` | Number of hidden tabs in that direction. |

## Truncation modifier

Prefix any variable with `=N:` to truncate to width `N`:

```kdl
format "{index}:{=12:title}"   // Truncate title to 12 chars, add … if longer
```

## Inline color and attribute markers

Format strings may contain `#[...]` markers. These are not variables — they set the active style for the rest of the row. See [Inline color syntax](inline-color-syntax.md).

## A note on new-tab titles

Newly created tabs may show `...` as the title until the shell sets it via the standard ANSI title escape. This is a zellij/event-ordering quirk, not a plugin bug.
