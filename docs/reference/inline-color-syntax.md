# Inline color syntax

The plugin parses tmux-flavored markers of the form `#[key=value,key=value,...]` inside any format string. Markers do not consume horizontal space — they only change the style of subsequent characters.

## Keys

| Key | Values | Description |
|-----|--------|-------------|
| `fg` | color | Foreground color. |
| `bg` | color | Background color. |
| `bold` | *(flag)* | Bold attribute. |
| `dim` | *(flag)* | Dim attribute. |
| `fill` | *(flag)* | Fill the entire row width with the current background color. Useful for highlighting the active row edge-to-edge. |

Reset everything with `#[fg=none]`, `#[bg=none]`, `#[fg=default]`, or `#[fg=reset]`.

## Color value formats

| Format | Example | Description |
|--------|---------|-------------|
| Named | `fg=accent` | Predefined names (see below). |
| 256-color | `fg=238` | 256-color palette index, 0–255. |
| Hex RGB | `fg=#444444` | Six-digit hex. |
| Short hex | `fg=#444` | Three-digit hex (each digit doubled). |
| RGB function | `fg=rgb(68,68,68)` | Decimal triple. |

Anything unrecognized falls back to the terminal default.

## Named colors

| Name | Aliases | 256-color |
|------|---------|-----------|
| `accent` | `primary` | 39 |
| `secondary` | | 75 |
| `tertiary` | | 141 |
| `muted` | `quaternary` | 245 |
| `dim` | `dimmed` | 240 |
| `red` | `error`, `warning` | 196 |
| `green` | `success`, `ok` | 82 |
| `yellow` | | 226 |
| `blue` | | 33 |
| `magenta` | | 201 |
| `cyan` | | 51 |
| `orange` | | 208 |
| `gray` / `grey` | | 244 |
| `pink` | | 213 |
| `purple` | | 135 |
| `black` | | 0 |
| `white` | | 15 |
| `none` | `default`, `reset` | terminal default |

## Examples

```kdl
// Active row highlighted edge-to-edge with a dark background
format_active "#[bg=236,fill]{index}:{title}*"

// Background only on text
format_active "#[bg=236]{index}:{title}*"

// Just colored text, no fill
format_active "#[fg=green]{index}:{title}*"

// Reset back to default mid-string
format "#[fg=muted]{index}#[fg=none]:{name}"
```
