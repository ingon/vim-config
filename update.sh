#!/usr/bin/env bash

pushd ~/.vim/colors/molokai/ && git pull && popd
cp ~/.vim/colors/molokai/colors/molokai.vim ~/.vim/colors/

pushd ~/.vim/colors/terminal/ && git pull && popd

pushd ~/.vim/fonts/menlo-powerline/ && git pull && popd

curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

pushd ~/.vim/bundle/vim-airline/ && git pull && popd
pushd ~/.vim/bundle/vim-airline-themes && git pull && popd

pushd ~/.vim/bundle/ctrlp/ && git pull && popd

pushd ~/.vim/bundle/nerdtree/ && git pull && popd
pushd ~/.vim/bundle/nerdtree-tabs/ && git pull && popd

pushd ~/.vim/bundle/syntastic/ && git pull && popd

pushd ~/.vim/bundle/vim-misc/ && git pull && popd
pushd ~/.vim/bundle/vim-easytags/ && git pull && popd
pushd ~/.vim/bundle/tagbar/ && git pull && popd

pushd ~/.vim/bundle/vim-fugitive/ && git pull && popd
pushd ~/.vim/bundle/vim-gitgutter/ && git pull && popd

pushd ~/.vim/bundle/vim-commentary/ && git pull && popd

pushd ~/.vim/bundle/vim-go/ && git pull && popd
pushd ~/.vim/bundle/typescript-vim/ && git pull && popd
pushd ~/.vim/bundle/nim.vim/ && git pull && popd

echo "done"
