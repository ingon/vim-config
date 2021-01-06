#!/usr/bin/env bash

mkdir -p ~/.config/nvim
cp nvimrc ~/.config/nvim/init.vim

git clone https://github.com/abertsch/Menlo-for-Powerline.git ~/Sources/menlo-powerline

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
