#!/usr/bin/env bash

cp vimrc ~/.vimrc

mkdir -p ~/.vim/dotfiles/undo ~/.vim/dotfiles/backup ~/.vim/dotfiles/swp

git clone https://github.com/tomasr/molokai.git molokai
git clone https://github.com/abertsch/Menlo-for-Powerline.git menlo-for-powerline
git clone https://github.com/mbadolato/iTerm2-Color-Schemes.git iTerm2-color-schemes

mkdir -p ~/.vim/colors
cp molokai/colors/molokai.vim ~/.vim/colors/

mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

git clone https://github.com/vim-airline/vim-airline ~/.vim/bundle/vim-airline
git clone https://github.com/vim-airline/vim-airline-themes ~/.vim/bundle/vim-airline-themes

git clone https://github.com/ctrlpvim/ctrlp.vim.git ~/.vim/bundle/ctrlp

git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
git clone https://github.com/jistr/vim-nerdtree-tabs.git ~/.vim/bundle/nerdtree-tabs

git clone --depth=1 https://github.com/vim-syntastic/syntastic.git ~/.vim/bundle/syntastic

git clone https://github.com/xolox/vim-misc.git ~/.vim/bundle/vim-misc
git clone https://github.com/xolox/vim-easytags.git ~/.vim/bundle/vim-easytags
git clone https://github.com/majutsushi/tagbar.git ~/.vim/bundle/tagbar

# ctags

git clone https://github.com/tpope/vim-fugitive.git ~/.vim/bundle/vim-fugitive
git clone git://github.com/airblade/vim-gitgutter.git ~/.vim/bundle/vim-gitgutter

git clone https://github.com/tpope/vim-commentary.git ~/.vim/bundle/vim-commentary

read -p "Install vim-go? " -n 1 -r
echo
if [[ $REPLY =~ [Yy]$ ]]
then
    git clone https://github.com/fatih/vim-go.git ~/.vim/bundle/vim-go
else
    echo "  Skipping vim-go"
fi

echo "done"
