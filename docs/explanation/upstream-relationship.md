# Relationship to upstream `cfal/zellij-vertical-tabs`

This project is a fork of [cfal/zellij-vertical-tabs](https://github.com/cfal/zellij-vertical-tabs). It exists because there is one feature — listing the panes of the active tab beneath it — that does not (yet) belong upstream as a default behavior.

## What is the same

- The sidebar layout, scroll/click behavior, and overflow rendering.
- The configuration option names for tab styling: `format`, `format_active`, `indicator_*`, `max_name_length`, `border`, `start_index`, `padding_top`, `overflow_above`, `overflow_below`.
- The inline color syntax (`#[fg=...]`, `fill`, named colors, 256-color, hex, rgb).
- The pipe messages `set_selectable` and `toggle_selectable`.

If you copy a layout from the upstream README and only change the `.wasm` filename, it will work here.

## What is different

- **Package and binary name.** The crate is `zellij-vertical-tabs-and-panes`, and the build artifact is `zellij-vertical-tabs-and-panes.wasm`. This avoids conflicting installs in `~/.config/zellij/plugins/`.
- **`show_panes`** (default `true` here) — list panes under the active tab.
- **`show_plugin_panes`** (default `false`) — include plugin panes in that list.
- **`pane_format` / `pane_format_active`** — formats for the pane rows.

## Compatibility goals

The fork tries to stay configuration-compatible with upstream:

- New options are additive. If you do not set `show_panes`, `pane_format`, or `pane_format_active`, the plugin still works as a vertical tab bar — albeit with `show_panes` defaulting to `true`. Set `show_panes "false"` to match upstream exactly.
- Existing options keep their upstream names and meanings.

If upstream renames or changes the semantics of an existing option, this fork will follow rather than diverge — interoperability matters more than novelty.

## Why a fork instead of a PR?

`show_panes` changes the visual identity of the plugin. Upstream may reasonably prefer to remain "vertical tabs, period." Maintaining this as a fork lets that decision stay open while users who want the panes view get it today.
