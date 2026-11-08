# Omarchy Dotfiles

My personal dotfiles and customizations for [Omarchy](https://omarchy.org/), managed with Git and GNU Stow.

This repository contains my development environment, Hyprland configuration, shell setup, Neovim configuration, VS Code preferences, helper scripts, and a custom Omarchy plugin.

## What's Included

### Desktop Environment

- **Hyprland** — window manager, keybindings, input, startup applications, and visual settings.
- **Omarchy** — native desktop features and a custom screen recording widget.
- **Monitor configuration** — local Hyprland monitor settings.

### Development Tools

- **Neovim** — LazyVim-based configuration, LSP settings, plugins, and snippets.
- **VS Code** — editor settings, keybindings, and a custom theme.
- **Zsh** — shell configuration and plugin management.
- **Git** — personal Git configuration and aliases.

### Custom Scripts

Helper scripts for tasks such as:

- Audio profile configuration.
- Hybrid graphics setup.
- VS Code setup.

### Custom Omarchy Plugin

The repository includes one custom plugin:

- **`tiago.screen-recording`** — recording status indicator in the bar, with an action to stop screen recording.

Clock, weather, notifications, and language support use Omarchy's native features instead of custom implementations.

## Repository Structure

```text
.
├── bin/                  # Helper scripts
├── git/                  # Git configuration
├── hypr/                 # Hyprland configuration
├── hypr-local/           # Local monitor settings
├── nvim/                 # Neovim configuration
├── omarchy/
│   └── plugins/
│       └── tiago.screen-recording/
├── vscode/               # VS Code settings and theme
├── zsh/                  # Zsh configuration
└── restore.sh            # Setup and restore script
```

## Requirements

This setup is intended for Omarchy 4.5 or later on Arch Linux.

The restoration workflow uses GNU Stow and also relies on tools such as Git, Zsh, and `jq`. VS Code setup and some helper scripts require their respective applications or utilities to be available.

## Installation

**Warning:** Review the scripts and configuration files before running them. Back up existing configurations before applying this setup.

Clone the repository into a local directory named `dotfiles`:

```bash
git clone https://github.com/tiagoliveira555/dotfiles-omarchy.git ~/dotfiles
cd ~/dotfiles
```

Run the restoration script:

```bash
./restore.sh
```

The repository is named `dotfiles-omarchy` on GitHub, but the local directory must be named `dotfiles` because the restoration workflow expects that path.

## Notes

- These are my personal configurations, tailored to my workflow and hardware.
- `hypr-local/monitors.lua` contains machine-specific monitor settings.
- Omarchy's native language configuration is used for Portuguese (Brazil).
- Some scripts and settings may require adjustments on other systems.
- Changes to the repository should be reviewed and tested before applying them to an existing installation.

## License

Unless a license is added to this repository, all rights are reserved by default. Feel free to explore the configurations, but check with me before redistributing the repository or its contents.
