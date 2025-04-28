# My Arch Linux Dotfiles

Welcome to my personal dotfiles repository.

This setup is designed for a clean, minimal, and dynamic Arch Linux environment using:

- Hyprland (wayland compositor)
- Fuzzel (launcher)
- Kitty (terminal emulator)
- Mako (notification daemon)
- Custom systemd user services
- SSH configuration
- Bash shell customization

## Installation

Clone the repository and run the install script:

```bash
git clone git@github.com:yourusername/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
bash install.sh
```

The script will:

- Backup existing dotfiles automatically
- Symlink the new configuration files into place
- Offer to enable custom systemd user services

## Notes
- Backups of old dotfiles are stored in .dotfiles/backup/

**This repo is mainly for my own setups but feel free to explore and adapt it.**
