# Sway WM

Install dependencies:

```bash
sudo apt install sway swaylock swaybg waybar xwayland xdg-desktop-portal-wlr xdg-desktop-portal-gtk rofi pavucontrol brightnessctl grim slurp swappy wl-clipboard clipman cliphist mako-notifier libnotify-bin lxqt-policykit blueman network-manager-gnome network-manager jq
```

Put theses folder in `~/config/`

- [sway](./sway/)
- [waybar](./waybar/)
- [rofi](./rofi/)
- [swaylock](./swaylock/)
- [swappy](./swappy/)
- [mako](./mako/)

Make the scripts executable:

`sudo chmod +x ~/.config/sway/scripts/power.sh`

`sudo chmod +x ~/.config/sway/scripts/screenshot.sh`

`sudo chmod +x ~/.config/sway/scripts/window-switcher.sh`

`sudo chmod +x ~/.config/waybar/scripts/wittr.sh`
