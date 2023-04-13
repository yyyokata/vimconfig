#!/bin/sh
set -e
cd $(dirname ${BASH_SOURCE[0]})
CURRENT_PATH=$(pwd)

cd ./vim/bundle/YouCompleteMe
python install.py --clang-completer --clangd-completer --force-sudo
cd -

if [[ -f ~/.vimrc || -L ~/.vimrc ]]; then
  rm ~/.vimrc
fi
ln -s ${CURRENT_PATH}/vimrc ~/.vimrc

if [[ -d ~/.vim || -L ~/.vim ]]; then
  rm -rf ~/.vim
fi

ln -s ${CURRENT_PATH}/vim ~/.vim
cd -
