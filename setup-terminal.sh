#!/bin/sh
cd
curl -O http://web.iiit.ac.in/~hemanth.veeranki/setup-terminal.tar.gz
tar -xvfz setup-terminal.tgz
#Arrange for Monaco font
mkdir -p .fonts
cp .setup/Monaco.ttf .fonts
fc-cache
gconftool-2 --set "/apps/gnome-terminal/profiles/Default/use_system_font" --type bool  false
gconftool-2 --set "/apps/gnome-terminal/profiles/Default/background_type" --type string  "transparent"
gconftool-2 --set "/apps/gnome-terminal/profiles/Default/background_darkness" --type float 0.95
gconftool-2 --set "/apps/gnome-terminal/profiles/Default/font" --type string  "Monaco 12"
gconftool-2 -s /apps/metacity/general/compositing_manager --type bool true
wget --no-check-certificate https://raw.github.com/seebi/dircolors-solarized/master/dircolors.ansi-dark
mv dircolors.ansi-dark .dircolors
eval `dircolors ~/.dircolors`
cd .setup
unzip gnome-terminal-colors-solarized-master.zip
cd gnome-terminal-colors-solarized-master
./set_dark.sh
cd
mkdir -p $HOME/.vim/colors
cp .setup/solarized.vim .vim/colors
cat >> .vimrc <<_END
set nu
set autoindent
autocmd FileType python set softtabstop=4|set shiftwidth=4|set expandtab
set t_co=256
colorscheme default
_END
