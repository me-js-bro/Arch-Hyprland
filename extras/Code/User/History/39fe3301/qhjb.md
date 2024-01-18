<br>
<h1 align = "center"> Arch Linux + Simple Hyprland Dotfiles</h1>
<h2 align="center">Md. Mahin Islam Mahi</h2>
</br>


<div align="center">

![GitHub last commit](https://img.shields.io/github/last-commit/me-js-bro/Arch-HyprV1?style=for-the-badge&color=b4befe) </br>
![GitHub repo size](https://img.shields.io/github/repo-size/me-js-bro/Arch-HyprV1?style=for-the-badge&color=aba6f7)

</br>
</div>

## Screenshots

![App Screenshot](Screenshots/1.png)

![App Screenshot](Screenshots/2.png)

![App Screenshot](Screenshots/3.png)

![App Screenshot](Screenshots/4.png)

![App Screenshot](Screenshots/5.png)

### Main Components:

- WM:[`Hyprland`](https://hyprland.org/) - install it while installing arch linux with `archinstall` script.
 
- Terminal-1:[`Alacritty`](https://alacritty.org/)

- Terminal-2:[`Kitty`](https://sw.kovidgoyal.net/kitty/)
 
- Status bar:[`Waybar`](https://github.com/Alexays/Waybar)
 
- Menu-1:[`Wofi`](https://hg.sr.ht/~scoopta/wofi)

- Menu-2:[`Wofi`](https://hg.sr.ht/~scoopta/wofi)

- File Manager 2:[`Dolphin`](https://github.com/KDE/dolphin)

### [Note] This is the first time I am sharing my dotfiles. This one may be not the best config, but I personally love it.</br>

## [ Must Read ]
As I use only a Desktop Pc, I don't have any laptop. That's why I could not test some features like Bletooth and Brightness Controller. Also this script is not supported for Nvidia GPU Drivers and Asus ROG laptops. I will fix this very soon...

## Clone the repository and every necessary packages will be installed in your system.

### Packages I have used for this configuration:
- (all of the above components) plus
- `swwww` - for wallpaper and wallpaper animation
- `swaylock` - for lockscreen
- `swaylock-effects` - for swaylock effects
- `dunst` - for notifications
- `swappy` - for screenshot
- `brightnessctl`  - for monitor and keyboard brightness - not needed for desktop
- `swayimg` - for image viewer 
- `pamixer` - for volume control notification.
- `fonts` - required awesome fonts. AUR and official repo have
- `pipewire` - needed pipewire pipewire-pulse pipewire-alsa
- `lxappearence` - for gtk themes
- `kvantum` - for gtk themes
 </br>

### Themes (Optional):
- I have used Nordic theme as the dark theme and Snow-v40 as the light theme `(For GTk Themes)` You can change themes using `lxappearance`.

### Clone and Copy my dotfiles (inside your `/home` directory)
After you have installed all the tools, now clone my dotfiles.

```
git clone https://github.com/me-js-bro/Arch-HyprV1.git
```
Now run these commands

```
cd Arch-HyprV1
chmod +x install.sh
./install.sh
```

</br>
<h1 align="center">Some of the key-bindings..</h1>
</br>

## The window button is the `Mod` button here
## To open and close a window
- `Mod + k:` Open Terminal (Alacritty)
- `Mod + Shift + k:` Open Terminal (Kitty)
- `Mod + b:` Open Browser (Firefox)
- `Mod + Shift + b:` Open Browser (Brave) - If have installed
- `Mod + e:` Open File Manager (Dolphin) - If have installed
- `Mod + d:` Launch Wofi drun
- `Mod + Shift + d:` Launch Wofi Emofi
- `Mod + CTRL + d:` Launch Rofi drun
- `Mod + CTRL + f:` Launch Rofi filebrowser
- `Mod + x:` Launch Wlogout
- `Mod + c:` Open Visuel Studio Code
- `Mod + q:` Kill Active Window
- `Mod + Shift + l`:Lock
- `Mod + Shift + m:` Exit Hyprland
</br>

## Clipboard Manager
- `Mod + ALT + c:` Clipboard History
- `Mod + ALT + w:` Delete All Clipboard History
</br>

## Wallpaper changing and Taking Screenshot
- `Mod + w:` Change wallpaper
- `Mod + Shift + w:` Launch wofi to select wallpaper
- `Print Screen:` Take Screenshot
- `Mod + Print Screen:` Select Area For Screenshot
</br>

## Toggle window behaviour
- `Mod + f:` Full Screen
- `Mod + Shift + j:` Toggle Split
- `Mod + v:` Toggle Float
</br>

## Move Window Focus
- `Mod + l:` Move Focus to right
- `Mod + j:` Move Focus to left
- `Mod + u:` Move Focus to up
- `Mod + m:` Move Focus to down
</br>

## Move Window
- `Mod + CTRL + l:` Move Window to right
- `Mod + CTRL + j:` Move Window to left
- `Mod + CTRL + u:` Move Window to up
- `Mod + CTRL + m:` Move Window to down
</br>

## Waybar click events...
- `Ctrl + Exc:` Reload Waybar
- `Click on the Arch Linux logo:` Open Wofi
- `Click on updates:` Launch kitty && Update system
- `Click on the circle icon:` toggle between dark and light theme
- `Click right on volume controller:` Launch pavucontrol
- `Hover on clock:` it shows the full calendar of the year
- `Click on the power icon:` Lainch wlogout
- `Click on the Clipboard icon:` Shows Clipboard History
- `Right Click on the Clipboard icon:` Delets Clipboard History
</br>

## After you have installed successfully, press ` Mod(Windows Button) + Shift + H ` to see the key bindings.

<br>
 
