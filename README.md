# My Arch Linux Dotfiles

Welcome to my personal dotfiles repository.

This setup is designed for a clean, minimal, secure,
and dynamic Arch Linux environment, centered around:

> ⚠️ **Disclaimer**: These dotfiles are tailored to my personal setup and preferences.  
> Use them at your own risk. Make sure to review and adjust any scripts or configs before applying them to your system.

- **Hyprland** (Wayland compositor)
- **Fuzzel** (application and clipboard launcher)
- **Kitty** (GPU-accelerated terminal emulator)
- **Mako** (notification daemon)
- **Fastfetch** (system info display)
- **Neovim** (as primary editor, configured with LSP, formatter, and linters)
- **Custom Hyprland autostart & scripting setup**
- **Themed consistently with Tokyo Night Storm**

## Features

- Modular, maintainable configs (e.g. `vars.conf`, `keybinds.conf`, `styling.conf`)
- Fuzzel launchers for apps and clipboard history
- Screenshot scripts with auto-copy and editing
- Fastfetch autostarts in a floating terminal
- Dynamic wallpapers and 3-monitor layout with Hyprland
- Kitty & Mako themed with Tokyo Night Storm
- Neovim with full LSP, formatting, linting, and plugin support

## Installation

Clone the repository and run the install script:

```bash
git clone git@github.com:gaajj/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
bash install.sh
```

The script will:

- Backup existing dotfiles automatically
- Symlink the new configuration files into place
- Offer to enable custom systemd user services

## Directory Overview

```bash
.config/
├── fastfetch/       # System info display config
├── fuzzel/          # Application and clipboard launcher configs
├── hypr/            # Hyprland configs (split by function)
├── kitty/           # Terminal color theme and font settings
├── mako/            # Notification appearance and behavior
├── nvim/            # Neovim full setup (LSP, plugins, theming)
├── themes/          # Global color palette (Tokyo Night Storm)
```
