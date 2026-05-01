# How the viewport scrolls

The plugin renders into a pane of fixed height. When the number of tabs (plus optional pane rows under the active tab, plus `padding_top`) exceeds that height, something has to give. This page describes what the plugin does and why.

## The shape of the problem

On every render, the plugin knows:

- the height of its pane, in rows;
- the full list of tabs;
- which tab is active;
- if `show_panes` is on, the panes inside the active tab.

It needs to pick a contiguous *window* of tabs to show, plus any pane rows for the active tab, that fits in the available height.

## Two invariants

The renderer aims to satisfy two rules in order of priority:

1. **The active tab is always visible.** Switching to a tab and not seeing it is disorienting. If the current viewport does not contain the active tab, the viewport scrolls to include it.
2. **Don't shift more than necessary.** If the viewport already shows the active tab, leave it alone. Sticky framing makes scroll-wheel navigation feel predictable — the rows you are looking at don't jump under you when only one tab moves.

## Overflow indicators

When tabs exist outside the visible window, the plugin replaces the first row, the last row, or both with indicators:

```
  ^ +3        <- 3 tabs hidden above; click to scroll up
4:current*
5:server
6:logs
  v +2        <- 2 tabs hidden below; click to scroll down
```

The indicator strings are configurable (`overflow_above`, `overflow_below`) and `{count}` substitutes the number of hidden tabs in that direction.

Clicking an indicator switches to the next tab outside the viewport, which causes the viewport to scroll to include it on the following render. There is no "scroll without switching tabs" mode — scrolling only happens as a side effect of activating a different tab.

## Pane rows are part of the budget

When `show_panes` is on, the panes of the active tab take rows from the same budget as tabs. With many panes and a short pane, the listing itself can push other tabs out of view. If you regularly hit this, the usual fix is a taller sidebar pane — pane height is a layout decision, not a plugin one.

## Why no key-driven scrolling?

The plugin is non-selectable by default (so clicks pass through to switch tabs without focusing the sidebar). Adding key-driven scroll would require either making it selectable — which traps focus — or piping through dedicated messages. So far the click-and-scroll-wheel model has been enough; the alternative would add UX cost for limited benefit. See [Plugin messages](../reference/plugin-messages.md) for the messages that *are* exposed.
