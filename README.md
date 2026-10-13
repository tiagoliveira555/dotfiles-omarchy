# Omarchy Dotfiles

My personal dotfiles and customizations for [Omarchy](https://omarchy.org/), managed with Git and GNU Stow.

This repository contains my development environment, Hyprland configuration, shell setup, Neovim configuration, VS Code preferences, helper scripts, and custom Omarchy plugins.

## What's Included

### Desktop Environment

- **Hyprland** — window manager, keybindings, input, startup applications, and visual settings.
- **Omarchy** — custom shell configuration and additional bar widgets.
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
- Opening files with Vim in a floating terminal.
- VS Code setup.

### Custom Omarchy Plugins

The repository includes four custom plugins:

- **`tiago.clock`** — custom clock widget.
- **`tiago.weather`** — weather widget.
- **`tiago.notifications`** — custom notification components and logic.
- **`tiago.screen-recording`** — recording status indicator in the bar, with an action to stop screen recording.

## Repository Structure

```text
.
├── bin/                 # Helper scripts
├── git/                 # Git configuration
├── hypr/                # Hyprland configuration
├── hypr-local/          # Local monitor settings
├── nvim/                # Neovim configuration
├── omarchy/              # Omarchy configuration and plugins
├── vscode/               # VS Code settings and theme
├── zsh/                  # Zsh configuration
└── restore.sh            # Setup and restore script
```

## Requirements

This setup is intended for Omarchy on Arch Linux.

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
- Some scripts and settings may require adjustments on other systems.
- Changes to the repository should be reviewed and tested before applying them to an existing installation.

## License

Unless a license is added to this repository, all rights are reserved by default. Feel free to explore the configurations, but check with me before redistributing the repository or its contents.

