# Build from source

Use this when you want to track `master`, hack on the plugin, or build for an architecture without a published artifact.

## Prerequisites

- [Rust toolchain](https://rustup.rs/)
- The `wasm32-wasip1` target:

  ```bash
  rustup target add wasm32-wasip1
  ```

## Steps

```bash
git clone https://github.com/kjaymiller/zellij-vertical-tabs-and-panes.git
cd zellij-vertical-tabs-and-panes
cargo build --release --target wasm32-wasip1
```

The output is at:

```
target/wasm32-wasip1/release/zellij-vertical-tabs-and-panes.wasm
```

Install it into your zellij plugins directory:

```bash
mkdir -p ~/.config/zellij/plugins
cp target/wasm32-wasip1/release/zellij-vertical-tabs-and-panes.wasm ~/.config/zellij/plugins/
```

## Iterating during development

Zellij caches plugins by path. After rebuilding, replace the file in the plugins directory and either restart zellij or reload the layout pane.

## Why a git dependency on `zellij-tile`?

`Cargo.toml` pulls `zellij-tile` from `zellij-org/zellij` `main` rather than crates.io because the plugin uses `unbold_all()`, which is only on `main` at the time of writing. If you pin to a published `zellij-tile` version, you will need to remove that call. See [Cargo.toml](../../Cargo.toml).
