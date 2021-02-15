#!/bin/bash
mkdir ~/downloads
cd ~/downloads

echo 'Установка AUR (yay)'
sudo pacman -Syu
sudo pacman -S wget --noconfirm
wget git.io/yay-install.sh && sh yay-install.sh --noconfirm

#echo 'Создаем нужные директории'
#sudo pacman -S xdg-user-dirs --noconfirm
#xdg-user-dirs-update

echo "Ставим i3"
yay -S ttf-weather-icons ttf-clear-sans

echo 'Установка базовых программ и пакетов'
sudo pacman -S reflector firefox firefox-i18n-ru ufw f2fs-tools dosfstools ntfs-3g alsa-lib alsa-utils file-roller p7zip unrar gvfs aspell-ru pulseaudio pavucontrol youtube-dl rofi ranger pcmanfm jq pacman-contrib sakura speedtest-cli peek --noconfirm

sudo pacman -S chromium flameshot veracrypt vlc freemind filezilla gimp libreoffice libreoffice-fresh-ru neofetch qbittorrent screenfetch telegram-desktop gparted evince keepassxc nano vim neovim featherpad fbreader audacious git ktouch klavaro clamtk mc htop tmux unrar zip ark gnome-disk-utility gedit uget viewnior smplayer xclip smtube --noconfirm

gpg --keyserver keys.gnupg.net --recv-keys FC918B335044912E 

yay -Syy
yay -S sbxkb xflux hunspell-ru pamac-aur conky-lua tusk vscodium-bin figma-linux xorg-xkill etcher-bin dropbox polybar ttf-weather-icons ttf-clear-sans tlp playerctl archtorify-git ttf-symbola ttf-clear-sans --noconfirm

echo 'Качаем и устанавливаем настройки i3'
# Чтобы сделать копию ваших настоек перейдите в домашнюю директорию ~/username
# открйте в этой категории терминал и выполните команду ниже
# Предварительно можно очистить конфиг от всего лишнего
# tar -czf config.tar.gz .config
# Выгрузите архив в интернет и скорректируйте ссылку на свою.
wget https://github.com/Andreyr76/my_arch_i3/raw/main/attach/config.tar.gz
sudo rm -rf ~/.config/i3/*
sudo tar -xzf config.tar.gz -C ~/

echo 'Шрифты'
wget https://github.com/Andreyr76/my_arch_uefi/raw/main/attach/fonts.tar.gz
sudo tar -xzf fonts.tar.gz -C ~/
sudo fc-cache -f -v

echo 'Подключаем zRam'
yay -S zramswap --noconfirm
sudo systemctl enable zramswap.service

echo 'Включаем сетевой экран'
sudo ufw enable

echo 'Добавляем в автозагрузку:'
sudo systemctl enable ufw

echo 'Очистка'
rm -rf ~/downloads/

echo 'Установка завершена!'
