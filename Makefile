DOTFILES_DIR := $(HOME)/dotfiles
CONFIG_DIR   := $(HOME)/.config

# ── Add or remove tools here ──────────────────────────────────────────────────
CONFIG_DIRS := fastfetch fcitx fcitx5 fish kitty nvim yazi
HOME_DIRS   :=
# ─────────────────────────────────────────────────────────────────────────────

# ── AUR helper ────────────────────────────────────────────────────────────────
AUR_HELPER  := paru
# ─────────────────────────────────────────────────────────────────────────────

.PHONY: all bootstrap link packages-save packages-install clean \
        $(CONFIG_DIRS) $(HOME_DIRS)

# Full fresh-install target: packages first, then symlinks
all: bootstrap packages-install link

# Just symlinks (day-to-day use on an existing system)
link: $(CONFIG_DIRS) $(HOME_DIRS)

# ── Symlinking ────────────────────────────────────────────────────────────────

$(CONFIG_DIRS):
	@if [ -e $(CONFIG_DIR)/$@ ] && [ ! -L $(CONFIG_DIR)/$@ ]; then \
		echo "SKIP: $(CONFIG_DIR)/$@ exists and is not a symlink. Back it up first."; \
	else \
		ln -sfn $(DOTFILES_DIR)/$@ $(CONFIG_DIR)/$@; \
		echo "LINK: $(CONFIG_DIR)/$@ -> $(DOTFILES_DIR)/$@"; \
	fi

$(HOME_DIRS):
	@if [ -e $(HOME)/$@ ] && [ ! -L $(HOME)/$@ ]; then \
		echo "SKIP: $(HOME)/$@ exists and is not a symlink. Back it up first."; \
	else \
		ln -sfn $(DOTFILES_DIR)/$@ $(HOME)/$@; \
		echo "LINK: $(HOME)/$@ -> $(DOTFILES_DIR)/$@"; \
	fi

# ── Packages ──────────────────────────────────────────────────────────────────

# Bootstrap: install git + base-devel, then build the AUR helper from source
bootstrap:
	@echo "==> Installing base dependencies..."
	sudo pacman -S --needed git base-devel
	@if ! command -v $(AUR_HELPER) > /dev/null 2>&1; then \
		echo "==> $(AUR_HELPER) not found, building from AUR..."; \
		git clone https://aur.archlinux.org/$(AUR_HELPER).git /tmp/$(AUR_HELPER); \
		cd /tmp/$(AUR_HELPER) && makepkg -si --noconfirm; \
		rm -rf /tmp/$(AUR_HELPER); \
	else \
		echo "==> $(AUR_HELPER) already installed, skipping."; \
	fi

# Install official and AUR packages using the AUR helper
# paru/yay can handle both repos transparently
packages-install: bootstrap
	@echo "==> Installing official packages..."
	$(AUR_HELPER) -S --needed - < $(DOTFILES_DIR)/packages/pkglist.txt
	@echo "==> Installing AUR packages..."
	$(AUR_HELPER) -S --needed - < $(DOTFILES_DIR)/packages/aur-pkglist.txt

# Save current package state
packages-save:
	pacman -Qqen > $(DOTFILES_DIR)/packages/pkglist.txt
	pacman -Qqem > $(DOTFILES_DIR)/packages/aur-pkglist.txt

# ── Cleanup ───────────────────────────────────────────────────────────────────

clean:
	@for d in $(CONFIG_DIRS); do \
		rm -vf $(CONFIG_DIR)/$$d; \
	done
	@for d in $(HOME_DIRS); do \
		rm -vf $(HOME)/$$d; \
	done
