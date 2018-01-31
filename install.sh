#!/bin/sh

mkdir -p ~/.vim
mkdir -p ~/.vim/bundle
cd ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git
git clone https://github.com/vim-scripts/The-NERD-tree.git
git clone https://github.com/vim-scripts/AutoComplPop.git
git clone https://github.com/tpope/vim-fugitive.git
git clone https://github.com/wesleyche/SrcExpl.git
git clone https://github.com/vim-scripts/CCTree.git
git clone https://github.com/vim-scripts/OmniCppComplete.git
git clone https://github.com/kien/ctrlp.vim.git
git clone https://github.com/vim-airline/vim-airline.git
git clone https://github.com/vim-airline/vim-airline-themes.git
git clone https://github.com/vim-scripts/Conque-GDB.git
git clone https://github.com/majutsushi/tagbar.git
git clone https://github.com/mileszs/ack.vim.git
git clone https://github.com/tpope/vim-surround.git
git clone https://github.com/vim-syntastic/syntastic.git
git clone https://github.com/ternjs/tern_for_vim.git
git clone https://github.com/sjl/gundo.vim.git
git clone https://github.com/Valloric/YouCompleteMe.git
git clone https://github.com/vim-scripts/gsearch.git
git clone https://github.com/airblade/vim-gitgutter.git
git clone https://github.com/godlygeek/tabular.git
git clone https://github.com/vim-scripts/CycleColor.git
git clone https://github.com/jiangmiao/auto-pairs.git
git clone https://github.com/scrooloose/nerdcommenter.git
git clone https://github.com/moll/vim-node.git
git clone https://github.com/pangloss/vim-javascript.git
git clone https://github.com/jelera/vim-javascript-syntax.git
git clone https://github.com/nathanaelkane/vim-indent-guides.git
git clone https://github.com/myhere/vim-nodejs-complete.git
git clone https://github.com/calincru/qml.vim.git

mkdir -p ~/.vim/colors
cd ~/.vim/colors
git clone https://github.com/tomasr/molokai.git
git clone https://github.com/altercation/vim-colors-solarized.git
git clone https://github.com/Lokaltog/vim-distinguished.git

echo -e "\n# alias for vim\nalias v='vim'\n\n# A way to disable CTRL + s from sending XOFF\nstty ixany\nstty ixoff -ixon" >> ~/.bashrc
