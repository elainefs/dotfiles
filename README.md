# Elaine's dotfiles

My dotfiles for customizing my system.

## dotfiles for

- [.bash_aliases](./.bash_aliases)
- [.bashrc](./.bashrc)
- [.vimrc](./.vimrc)
- [neovim](./.config/nvim/README.md)
- [superfile](./.config/superfile/config.toml)
- [kitty](./.config/kitty/kitty.conf)
- [tmux](./.tmux.conf)
- [sway](./.config/sway/config)
- [rofi](./.config/rofi/config.rasi)
- [swappy](./.config/swappy/config)
- [swaylock](./.config/swaylock/config)
- [swaync](./.config/swaync/config.json)
- [mako](./.config/mako/config)
- [waybar](./.config/waybar/config.jsonc)

Create symbolic links:

```bash
curl -o- https://raw.githubusercontent.com/elainefs/dotfiles/main/install.sh | bash
```

## SwayWM

Install dependencies:

```bash
sudo apt install sway swaylock swaybg waybar xwayland xdg-desktop-portal-wlr xdg-desktop-portal-gtk rofi pavucontrol brightnessctl grim slurp swappy wl-clipboard clipman cliphist sway-notification-center lxqt-policykit blueman network-manager-gnome network-manager jq
```

Put folders in `~/config/`

- [sway](./.config/sway/)
- [waybar](./.config/waybar/)
- [rofi](./.config/rofi/)
- [swaylock](./.config/swaylock/)
- [swappy](./.config/swappy/)
- [swaync](./.config/swaync/) or [mako](./.config/mako/)

Make the scripts executable:

`sudo chmod +x ~/.config/sway/scripts/power.sh`

`sudo chmod +x ~/.config/sway/scripts/screenshot.sh`

`sudo chmod +x ~/.config/sway/scripts/wallpaper.sh`

`sudo chmod +x ~/.config/sway/scripts/window-switcher.sh`
