# Getting started: your first vertical tab bar

This tutorial walks you through installing the plugin, loading a layout, and seeing your tabs displayed vertically with their panes listed underneath the active tab. By the end you will have a working sidebar you can click through.

You do not need any prior knowledge of zellij plugins.

## Prerequisites

- [Zellij](https://zellij.dev/) v0.40.0 or later, installed and on your `PATH`
- A [Rust](https://rustup.rs/) toolchain (only required if you build from source)

## Step 1 — Get the plugin binary

You have two options. Either is fine for this tutorial.

**Option A: download a pre-built release.**

```bash
mkdir -p ~/.config/zellij/plugins
# Download the latest zellij-vertical-tabs-and-panes.wasm from
# https://github.com/kjaymiller/zellij-vertical-tabs-and-panes/releases/latest
# then move it into the plugins directory:
mv ~/Downloads/zellij-vertical-tabs-and-panes.wasm ~/.config/zellij/plugins/
```

**Option B: build it yourself.**

```bash
rustup target add wasm32-wasip1
git clone https://github.com/kjaymiller/zellij-vertical-tabs-and-panes.git
cd zellij-vertical-tabs-and-panes
cargo build --release --target wasm32-wasip1
mkdir -p ~/.config/zellij/plugins
cp target/wasm32-wasip1/release/zellij-vertical-tabs-and-panes.wasm ~/.config/zellij/plugins/
```

## Step 2 — Launch zellij with a sample layout

The repository ships with example layouts. Start zellij using the left-side example:

```bash
zellij --layout examples/vertical-tabs-left.kdl
```

You should see a narrow sidebar on the left listing the current tab. The main area is on the right.

## Step 3 — Grant permissions

The first time the plugin runs, zellij prompts for permissions. The sidebar will look empty until you grant them.

1. Focus the plugin pane (click on the sidebar, or use zellij's pane navigation).
2. Press `y` to grant permissions.

The tab list appears.

## Step 4 — Create a few tabs and panes

Create extra tabs so the sidebar has something to show:

- `Ctrl+t` then `n` — new tab
- `Ctrl+t` then `r` — rename the tab
- `Ctrl+p` then `n` — new pane within the active tab

As you create tabs, each one appears as its own row in the sidebar. The active tab is highlighted, and its panes are listed beneath it (this is the feature this fork adds via `show_panes`).

## Step 5 — Click around

- **Click a tab row** — switch to that tab.
- **Click a pane row** under the active tab — focus that pane.
- **Scroll the wheel** over the sidebar — move between tabs.

That is the whole loop. You now have working vertical tabs.

## Where to go next

- Want a different visual style? See [Style tabs with tmux-like inline colors](../how-to/style-with-inline-colors.md).
- Want this to be the default every time you start zellij? See [Set vertical tabs as your default layout](../how-to/set-default-layout.md).
- Want to know every option you can set? See [Configuration reference](../reference/configuration.md).
