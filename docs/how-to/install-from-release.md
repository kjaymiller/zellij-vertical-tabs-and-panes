# Install from a release

Use this when you want a pre-built `.wasm` and do not want to set up a Rust toolchain.

## Steps

1. Open the [latest release](https://github.com/kjaymiller/zellij-vertical-tabs-and-panes/releases/latest).
2. Download `zellij-vertical-tabs-and-panes.wasm`.
3. Move it into your zellij plugins directory:

   ```bash
   mkdir -p ~/.config/zellij/plugins
   mv ~/Downloads/zellij-vertical-tabs-and-panes.wasm ~/.config/zellij/plugins/
   ```

4. Reference it from a layout:

   ```kdl
   plugin location="file:~/.config/zellij/plugins/zellij-vertical-tabs-and-panes.wasm"
   ```

## Migrating from upstream `zellij-vertical-tabs`

If you previously installed the upstream plugin, you will have a `zellij-vertical-tabs.wasm` in `~/.config/zellij/plugins/`. The two binaries are independent — keep both, or delete the old one once your layouts point at the new filename:

```bash
rm ~/.config/zellij/plugins/zellij-vertical-tabs.wasm
```

Update any layout files in `~/.config/zellij/layouts/` to use the new filename.
