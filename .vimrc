set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'

" The followings are my own
Plugin 'The-NERD-tree'
Plugin 'AutoComplPop'
Plugin 'fugitive.vim'
Plugin 'Source-Explorer-srcexpl.vim'    " https://github.com/wesleyche/SrcExpl.git
Plugin 'CCTree'                         " https://github.com/vim-scripts/CCTree.git
Plugin 'OmniCppComplete'                " https://github.com/vim-scripts/OmniCppComplete.git
Plugin 'ctrlp.vim'                      " https://github.com/kien/ctrlp.vim.git
Plugin 'vim-airline'                    " https://github.com/vim-airline/vim-airline.git
Plugin 'vim-airline-themes'             " https://github.com/vim-airline/vim-airline-themes.git
Plugin 'Conque'                         " https://github.com/vim-scripts/Conque-GDB.git
Plugin 'tagbar'                         " https://github.com/majutsushi/tagbar.git

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" default setting
set title
set nu
set vb
set ts=4
set sw=4
set bg=dark
set cindent
set autoindent
"set smartindent
set mouse=a
set showmatch
set expandtab
set nobackup
set t_Co=256
set laststatus=2
set ttimeoutlen=50
set encoding=utf-8
set fileencodings=utf-8,euckr
set path=.,./

" Declare mapleader
let mapleader = ";"

" Syntax Highlighting
if has("syntax")
	syntax on
endif

" ctags setting
set tags=./tags,tags,./TAGS,TAGS,/home/work/eunsik0.lee/webos/luna-service2/tags,/home/work/eunsik0.lee/webos/libpbnjson/tags,/home/work/eunsik0.lee/webos/cjson/tags,/home/work/eunsik0.lee/include/cpp
map <Leader>ac <ESC>:!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q --language-force=c++ .<CR><CR>
map <Leader>aa <ESC>:!ctags -R<CR><CR>

" Settings for OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCppShowAccess = 1
let OmniCpp_ShowPrototypeInabbr = 1
let OmniCpp_MayCompleteDot = 1
let OmniCpp_MayCompleteArrow = 1
let OmniCpp_MayCompleteScore = 1
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]

" cscope setting
set csprg=/usr/bin/cscope
set csto=0
set cst
set nocsverb

if filereadable("./cscope.out")
    cs add cscope.out
else
    cs add /usr/include/cscope.out
endif
set csverb

" Find white space
match ErrorMsg '\s\+$'

" Taglist setting
let Tlist_Use_Right_Window = 1

" Tab key Auto Complete
function InsertTabWrapper()
	let col = col('.') - 1
	if !col || getline('.')[col - 1] !~ '\k'
		return "\<tab>"
	else
		return "\<c-p>"
	endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>

" Auto Complete for Ctrl i
inoremap <C-i> <C-x><C-o>

" Brackets Auto Complete
inoremap ( ()<ESC>i
inoremap { {}<ESC>i
inoremap {<CR> {<CR>}<ESC>ko

" Save file and change <x> mode to normal mode if insert mode
" Pre-Condition: Add below 2 lines to ~/.bashrc
" stty ixany
" stty ixoff -ixon
inoremap <C-k> <ESC>
vnoremap <C-k> <ESC>
inoremap <C-s> <ESC>:w<CR>
nnoremap <C-s> :w<CR>
vnoremap <C-s> <ESC>:w<CR>

" grep
nnoremap <C-l> :grep -I <cword> * -r<CR>:copen<CR>

" easier moving of code blocks
vnoremap < <gv
vnoremap > >gv

" Control vim tab
map <Leader>to <ESC>:tabedit<CR>
map <Leader>tc <ESC>:tabclose<CR>
map <Leader>tl <ESC>:tabs<CR>

" Quit
inoremap <C-q> <ESC>:q<CR>
nnoremap <C-q> :q<CR>

" Settings for vim-airline
let g:airline#extensions#tabline#enabled = 1

" Settings for ctrlp
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_max_height = 10
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

" Settings for SrcExpl
let g:SrcExpl_winHeight = 8 " // Set the height of Source Explorer window
let g:SrcExpl_refreshTime = 100 " // Set 100 ms for refreshing the Source Explorer

