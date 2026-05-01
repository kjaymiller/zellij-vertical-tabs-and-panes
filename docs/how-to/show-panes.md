# Show panes under the active tab

This is the feature that distinguishes this fork from upstream `cfal/zellij-vertical-tabs`. With `show_panes` on, the panes of the currently active tab are listed beneath it; clicking a pane focuses it.

## Minimal configuration

```kdl
plugin location="file:~/.config/zellij/plugins/zellij-vertical-tabs-and-panes.wasm" {
    show_panes "true"
}
```

That alone uses the default pane formats:

```
  └ {title}        # inactive panes
  └ {title} *      # focused pane
```

## Customizing the look

Override `pane_format` and `pane_format_active`. They accept the same [inline color syntax](../reference/inline-color-syntax.md) as `format`:

```kdl
show_panes "true"
pane_format         "#[fg=muted]  └ {title}"
pane_format_active  "#[fg=accent]  └ {title}"
```

## Including plugin panes

By default the listing skips plugin panes (so the sidebar does not list itself). To include them:

```kdl
show_plugin_panes "true"
```

## Available variables

In pane formats: `{index}`, `{title}` (alias `{name}`, `{t}`, `{n}`, `{pane_title}`). See [Format variables](../reference/format-variables.md).

## Disabling

```kdl
show_panes "false"
```

The plugin then behaves identically to upstream regarding pane listings.
