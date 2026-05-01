# Style tabs with tmux-like inline colors

Mix colors and attributes inside any format string using `#[...]` markers. The plugin ships with sensible defaults, but a few targeted styles go a long way.

## Highlight the active row edge-to-edge

```kdl
format         "{index}:{name}"
format_active  "#[bg=236,fill]{index}:{name} {indicators}"
```

The `fill` attribute pads the background to the full pane width — a clear visual marker even when names are short.

## Subtle inactive numbering, bright active

```kdl
format         "#[fg=muted]{index}#[fg=none]:{name}"
format_active  "#[fg=accent]{index}#[fg=none]:{name} #[fg=success]{indicators}"
```

`#[fg=none]` resets the foreground so the rest of the row uses the terminal default.

## Colored status indicators

The indicator strings themselves can contain markers — they are inserted into the format and parsed at render time:

```kdl
indicator_fullscreen "#[fg=error]F"
indicator_sync       "#[fg=tertiary]S"
```

## A vertical separator

```kdl
border "#[fg=dim]│"
```

## See also

- [Inline color syntax reference](../reference/inline-color-syntax.md) — every key, color name, and value form.
- [`examples/tmux-colored.kdl`](../../examples/tmux-colored.kdl) — a full layout that combines these techniques.
