# Set vertical tabs as your default layout

Once you are happy with a layout, make zellij use it for every new session.

## Steps

1. Pick or write a layout file. The repository's [`examples/`](../../examples/) is a good starting point.

2. Copy it into your zellij layouts directory under a memorable name:

   ```bash
   mkdir -p ~/.config/zellij/layouts
   cp examples/vertical-tabs-left.kdl ~/.config/zellij/layouts/
   ```

3. Reference the file (without the `.kdl` extension) in your zellij config — `~/.config/zellij/config.kdl`:

   ```kdl
   default_layout "vertical-tabs-left"
   ```

4. Start zellij with no arguments. The sidebar appears automatically.

## Per-session override

You can still launch a one-off session with a different layout:

```bash
zellij --layout examples/tmux-style.kdl
```

This does not change `default_layout`.

## Multiple named layouts

Drop several files into `~/.config/zellij/layouts/` and pick at startup:

```bash
zellij --layout vertical-tabs-right    # uses ~/.config/zellij/layouts/vertical-tabs-right.kdl
```
