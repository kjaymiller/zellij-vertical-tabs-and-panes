# Why vertical tabs?

Horizontal tab bars work well up to a point. Past five or six tabs, names start to truncate, status indicators compete for the same row, and you have to scan a single line for the one you want. The geometry of a terminal — wider than it is tall, but not infinitely so — turns against you.

A vertical tab bar trades a column of horizontal real estate (which most code editing does not need) for a row per tab. That row is yours: a full tab name, indicators, and — in this fork — the panes inside the tab too. Twenty tabs are still legible at a glance because each one occupies its own line.

## What this fork adds over upstream

Upstream `cfal/zellij-vertical-tabs` already provides the vertical sidebar, click-to-switch, scroll-wheel navigation, and tmux-style formatting. This fork layers one more thing on top: when `show_panes` is enabled, the panes of the active tab are listed under it, and clicking one focuses it.

That changes the sidebar from a tab list into something closer to an outline view of your session — you see *where you are* (which pane in which tab) without having to switch focus to find out.

## When a vertical sidebar is *not* the right answer

- If you usually run with one or two tabs and many panes per tab, a horizontal status bar costs you less.
- If your terminal is narrow (mobile SSH, tiled half-screens), giving up a 15–20 column sidebar hurts.
- If you live in fullscreen mode (`Z`), the sidebar is hidden anyway — you may not need it at all.

The plugin is opt-in via your layout, so it is easy to keep around for the sessions where it pays off.

## Design choices worth knowing

- **Plugin pane is non-selectable by default.** Clicks on a tab row switch tabs; they do not move keyboard focus into the sidebar. This is the right default for a tab bar — but it does mean you cannot resize the sidebar with the keyboard until you toggle selectability. See [`set_selectable` / `toggle_selectable`](../reference/plugin-messages.md).
- **Active tab stays visible.** The viewport scrolls automatically when you switch to a tab that is currently outside it. See [How the viewport scrolls](viewport-and-overflow.md).
- **No persistent state.** The plugin renders directly from `TabUpdate` and `PaneUpdate` events — there is no on-disk state to migrate, corrupt, or invalidate.
