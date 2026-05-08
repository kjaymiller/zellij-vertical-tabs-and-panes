PLUGIN_NAME      := zellij-vertical-tabs-and-panes
WASM             := target/wasm32-wasip1/release/$(PLUGIN_NAME).wasm

ZELLIJ_CONFIG    ?= $(HOME)/.config/zellij
PLUGIN_DIR       := $(ZELLIJ_CONFIG)/plugins
LAYOUT_DIR       := $(ZELLIJ_CONFIG)/layouts
INSTALLED_WASM   := $(PLUGIN_DIR)/$(PLUGIN_NAME).wasm
LEGACY_WASM      := $(PLUGIN_DIR)/zellij-vertical-tabs.wasm
LAYOUT_NAME      ?= vertical-tabs-left
INSTALLED_LAYOUT := $(LAYOUT_DIR)/$(LAYOUT_NAME).kdl
LAYOUT_SRC       := examples/$(LAYOUT_NAME).kdl

PLUGIN_URL       := file:$(INSTALLED_WASM)
LEGACY_URL       := file:$(LEGACY_WASM)

.PHONY: all build install install-layout update reload clean uninstall help

all: build

build:
	cargo build --release

$(WASM): build

install: $(WASM) install-layout
	@mkdir -p $(PLUGIN_DIR)
	cp $(WASM) $(INSTALLED_WASM)
	@echo "Installed: $(INSTALLED_WASM)"
	@# Also install under the legacy filename so older layouts keep working
	@cp $(WASM) $(LEGACY_WASM)
	@echo "Installed (legacy alias): $(LEGACY_WASM)"

install-layout:
	@mkdir -p $(LAYOUT_DIR)
	@if [ ! -f $(INSTALLED_LAYOUT) ]; then \
		cp $(LAYOUT_SRC) $(INSTALLED_LAYOUT); \
		echo "Installed layout: $(INSTALLED_LAYOUT)"; \
		echo "Set 'default_layout \"$(LAYOUT_NAME)\"' in $(ZELLIJ_CONFIG)/config.kdl to use it by default."; \
	else \
		echo "Layout already present: $(INSTALLED_LAYOUT) (not overwritten)"; \
	fi

reload:
	@if [ -z "$$ZELLIJ_SESSION_NAME" ]; then \
		echo "Not inside a zellij session. Run from a zellij pane, or:"; \
		echo "  zellij --session <name> action start-or-reload-plugin <url>"; \
		exit 1; \
	fi
	@# Reload every URL the plugin might be running under in this session.
	@# start-or-reload-plugin only matches an existing instance if the URL is identical
	@# to the one in the layout — so if your layout uses the legacy name, we need to
	@# reload that URL, not the canonical one.
	@for url in $(PLUGIN_URL) $(LEGACY_URL); do \
		wasm=$${url#file:}; \
		if [ -f "$$wasm" ]; then \
			echo "Reloading $$url"; \
			zellij --session "$$ZELLIJ_SESSION_NAME" action start-or-reload-plugin "$$url" >/dev/null; \
		fi; \
	done

update: install reload

uninstall:
	rm -f $(INSTALLED_WASM) $(LEGACY_WASM)
	@echo "Removed: $(INSTALLED_WASM)"
	@echo "Removed: $(LEGACY_WASM)"
	@echo "Layout at $(INSTALLED_LAYOUT) left in place; remove manually if desired."

clean:
	cargo clean

help:
	@echo "Targets:"
	@echo "  build           Build the wasm plugin (release)"
	@echo "  install         Build, copy wasm to $(PLUGIN_DIR), install layout if missing"
	@echo "  install-layout  Copy $(LAYOUT_SRC) to $(INSTALLED_LAYOUT) (no overwrite)"
	@echo "  reload          Reload plugin in current zellij session"
	@echo "  update          install + reload (use after editing source)"
	@echo "  uninstall       Remove installed wasm"
	@echo "  clean           cargo clean"
	@echo ""
	@echo "Variables: ZELLIJ_CONFIG (=$(ZELLIJ_CONFIG)), LAYOUT_NAME (=$(LAYOUT_NAME))"
