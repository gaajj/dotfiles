sudo pacman -Syu
sudo pacman -Syu linux linux-firmware amd-ucode
dmesg | grep microco
sudo dmesg | grep microcod
lscpu
lscpu | less
sudo pacman -Syu less
lscpu | less
sudo pacman -Syu mesa lib32-mesa vulkan-radeon lib32-vulkan-radeon xf86-video-amdgpu
sudo pacman -Syu mesa lib32-mesa vulkan-radeon xf86-video-amdgpu
lspci -k | grep -A3 VGA
vulkaninfo
vkcube
sudo pacman -S vkcube
sudo pacman -S lib32-vulkan
sudo vim /etc/pacman.conf
sudo pacman -Syu
sudo pacman -Syu mesa lib32-mesa vulkan-radeon xf86-video-amdgpu
sudo pacman -Syu vulkan-tools libva-mesa-driver lib32-libva-mesa-driver
vulkaninfo 
vulkaninfo | grep "deviceName"
glxinfo | grep "OpenGL renderer"
glxinfo
sudo pacman -Syu mesa lib32-mesa vulkan-radeon xf86-video-amdgpu lib32-vulkan-radeon
glxinfo
sudo pacman -Syu glxinfo
glxinfo | grep "OpenGL renderer"
glxgears 
sudo pacman -Syu base-devel git wayland wayland-protocols cmake meson ninja pkgconf seatd wlroots xorg-xwayland polkit
sudo pacman -S hyprland
ls
mkdir -p ./config/hypr
cp /usr/share/hypr/hyprland.conf 
mkdir -p /.config.hypr
mkdir -p .config/hypr
cp /usr/share/hypr/hyprland.conf .config/hypr/
Hyprland 
vim .bashrc
source .bashrc
pac
sudo pac kitty
exit
sudo pac kitty
sudo source .bashrc
. ~/.bashrc
pac
sudo pac
vim .bashrc
. ~/.bashrc
pac
pac kitty
vim .config/hypr/hyprland.conf 
Hyprland 
vim .config/hypr/hyprland.conf 
Hyprland 
vim .config/hypr/hyprland.conf 
Hyprland 
kitty
vim .config/hypr/hyprland.conf 
which kitty
pac which
which kitty
bash -l -c Hyprland
bash -l -c Hyprland
pac dmenu
dmenu
vim .config/hypr/hyprland.conf 
Hyprland 
vim .config/hypr/hyprland.conf 
Hyprland 
journalctl --user-unit=hyprland -f
journalctl --user-unit=hyprland
journalctl
vim .config/hypr/hyprland.conf 
hyprctl dispatch exec kitty
Hyprland 
command -v kitty
hyprctl dispatch exec kitty
hyprctl logs
Hyprland
hyprctl logs
kitty --wayland
kitty
pac bspwm
exit
bspwm
vim .xinitrc
exit
rm .xinitrc 
ls
ls -la
ls config/
rm -rf config/
sudo pacman -Rnu bspwm
pac alacritty
vim .config/hypr/hyprland.conf 
Hyprland
hyprctl reload
expor HYPRLAND_INSTANCE_SIGNATURE=...
export HYPRLAND_INSTANCE_SIGNATURE=...
hyprctl reload
SIG="$(basename /run/user/1000/hypr/*)"
ls /run/user/1000/hypr/
rm -f /run/user/1000/hypr/*
rm -fr /run/user/1000/hypr/*
SIG="$(basename /run/user/1000/hypr/*)"
export HYPRLAND_INSTANCE_SIGNATURE="$SIG"
hyprctl -j monitors | head
ls /run/user/1000/hypr/
Hyprland 
echo $HYPRLAND_INSTANCE_SIGNATURE 
echo $HYPRLAND_INSTANCE_SIGNATURE 
cat ly-session.log 
export XDG_RUNTIME_DIR=/run/user/1000
sig="$(find '$XDG_RUNTIME_DIR/hypr' -mindepth 1 -maxdepth 1 -type d -printf '%P\n' | head -n1)"
sig="$(find "$XDG_RUNTIME_DIR/hypr" -mindepth 1 -maxdepth 1 -type d -printf '%P\n' | head -n1)"
export HYPRLAND_INSTANCE_SIGNATURE="$SIG"
hyprctl -j binds | head
sudo pacman -Rnu hyprland
kitty
pac i3-wm
exit
rm -rf .config/hypr/
mkdir -p .config/hypr
cp /usr/share/hypr/hyprland.conf .config/hypr/
Hyprland
vim .config/hypr/hyprland.conf 
pac dmenu
Hyprland
vim .config/hypr/hyprland.conf 
Hyprland
journalctl
pac ly
sudo systemctl enable --now ly
reboot
vim .config/hypr/hyprland.conf 
vim .config/hypr/hyprland.conf 
firefox
sudo pacman -Rnu i3-wm
sudo pacman -Rsu i3-wm
pac firefox
firefox
Hyprland
pac Hyprland
pac hyprland
Hyprland
exit
sudo systemctl restart ly
sudo systemctl restart ly
ly-dm -h
vim /etc/ly/config.ini 
sudo vim /etc/ly/config.ini 
vim /etc/ly/config.ini 
sudo vim /etc/ly/config.ini 
exit
firefox
systemctl restart ly
sudo vim /etc/ly/config.ini 
firefox
sudo systemctl reenable ly
sudo reboot
firefox
vim .config/hypr/hyprland.conf 
hyprctl monitors all
vim .config/hypr/hyprland.conf 
vim .config/hypr/
pac dmenu
dmenu
dmenu -h
dmenu --help
dmenu
sudo pacman -Runs dmenu
pac wofi
wofi
wofi --show
wofi --help
wofi --dmenu
wofi --show
wofi --show a
wofi -d
sudo pacman -Runs wofi
pac walker
pac dmenu
dmenu
firefox
vim .config/hypr/
pac fuzzel
sudo pacman -Runs dmenu
fuzzel
fuzzel -h
pac steam
steam
killall steam
pac btop
btop
pac lunar-client
pac lunarclient
pac lunar
sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
cd ..
yay
yay
l
ls
rm -rf yay
yay
clear
yay -S lunar
yay -S lunar-client
pac discord
vim .config/hypr/
btop
pac rocm-smi
yay rocm-smi
btop
poweroff
btop
ls
mkdir -p downloads
ls Downloads/
rm -r Downloads/
ls
pwd
mkdir -p chrome
cd chrome
vim userChrome.css
vim userChrome.css
sudo vim userChrome.css
whoami
vim userChrome.css
sudo touch userChrome.css
ls
ls ..
cd ..
ls
cd ..
ls
ls
vim
vim
vim chrome/userChrome.css 
cd
clear
ls
ls Downloads/
rm -r Downloads/
rm -r 'Old Firefox Data'/
ls
ls -la
vim .config/
cd dotfiles/
pac stow
sudo pacman -Syu
clear
stow bash
mkdir -p bash 
cd ..
ls
ls -la
mv .bashrc dotfiles/bash/
mv .bash_history dotfiles/bash/
cat .bash_logout
cat .bash_profile
rm .bash_logout 
rm .bash_profile 
ls -la
cd dotfiles/
ls
stow bash
cd ..
ls -la
cd dotfiles/
mkdir -p hypr/.confi
mv ../.config/hypr/* hypr/.config/hypr/
ls hypr/.config/hypr/
ls ~/.config/hypr/
rm -r ../.config/hypr/
stow hypr
btrfs-assistant
pac spotify
pac spotify-launcher
fastfetch
fastfetch
pac fastfetch
fastfetch
fastfetch
cd .config/
vim
hyprctl 
hyprctl reload
vim
vim hypr
cd ../dotfiles/
cat hypr/.config/hypr/themes/Brogrammer.theme.conf 
cat hypr/.config/hypr/themes/Catppuccin-Mocha.theme.conf 
vim hypr/.config/hypr/
cd .config/
mv kitty/Catppuccin-Mocha.conf kitty/themes/
ln -sf kitty/themes/Catppuccin-Mocha.conf kitty/themes/current.conf
kitty +kitten themes
l
ls kitty/
ls kitty/themes/
kitty +kitten themes
cd kitty/
ln -sfn themes/Catppuccin-Mocha.conf current-theme.conf
vim kitty.conf 
kitty +kitten themes
kitty +kitten themes
ls themes/
ls
kitty +kitten themes
mv Catppuccin-* themes/
ls
ls current-theme.conf 
vim current-theme.conf 
rm current-theme.conf 
vim current-theme.conf
ls themes/
vim current-theme.conf
vim current-theme.conf
kitty +kitten themes
mv Brogrammer.conf themes/
vim current-theme.conf 
kitty +kitten themes
ls
vim current-theme.conf 
cd dotfiles/
vim
ln -sf hypr/.config/hypr/themes/catppuccin/mocha.palette.conf hypr/.config/hypr/themes/current.conf
vim
ln -sf hypr/.config/hypr/themes/catppuccin/mocha.palette.conf hypr/.config/hypr/themes/current.conf 
hyprctl reload
vim
vim
kitty +kitten themes
vim ~/.config/kitty/
kitty +kitten themes
vim ~/.config/kitty/
vim ~/.config/kitty/
vim ~/.config/kitty/
vim hypr/.config/hypr/
l
cat ly-session.log 
cat dotfiles/kitty/.config/kitty/kitty.conf 
cat dotfiles/kitty/.config/kitty/kitty.conf 
l
fastfetch
cd dotfiles/
vim hypr/.config/
ls
cd dotfiles/
vim
. ../.bashrc
vim
. ../.bashrc
l
cd ..
ls
ls -la
cd dotfiles/
stow bash
ls ..
ls 
ls  -la ..
l
. ../.bashrc
l
clear
cd
clear
pac nerd-fonts-jetbrains-mono
yay -s nerd-fonts-yay -Ss nerd-fonts
yay -s nerd-fonts-yay -Ss nerd
yay -Ss nerd-fonts
yay -Ss nerd-fonts-jetb
yay -Ss nerd-fonts-jet
yay -Ss jetbrains
clear
yay -Ss jetbrains
yay -Ss jetbrains | less
yay -S jetbrains
yay -S jetbrains | grep font
yay -Ss jetbrains | grep font
yay -S nerd-fonts-jetbrains-mono
yay -S ttf-jetbrains-mono-nerd
fc-list
fc-list | grep nerd
fc-list | grep Nerd
fc-cache -fv
vim dotfiles/kitty/.config/kitty/kitty.conf 
mv .config/kitty/* dotfiles/kitty/.config/kitty/
cd dotfiles/
rm -rf ../.config/kitty/
stow kitty
ls kitty/.config/kitty/
vim kitty/.config/kitty/
