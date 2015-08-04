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
" NERDTree plugin
Plugin 'The-NERD-Tree'
" Taglist plugin
Plugin 'taglist.vim'
" AutoComplPop
Plugin 'AutoComplPop'
" fugitive
Plugin 'fugitive.vim'
" OmniCppComplete
Plugin 'OmniCppComplete'
" Clang-complete
Plugin 'clang-complete'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
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
"set expandtab

" Syntax Highlighting
if has("syntax")
	syntax on
endif

" ctags setting
set tags=./tags,tags,./TAGS,TAGS,/home/webos/lib/glib-2.40.0/tags,/home/webos/lib/include/tags,/home/webos/lib/src/tags,/home/webos/lib/luna-service2/tags

" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview

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

" Brackets Auto Complete
inoremap ( ()<ESC>i
inoremap < <><ESC>i
inoremap [ []<ESC>i
inoremap { {}<ESC>i
inoremap {<CR> {<CR>}<ESC>ko

" Change mode
inoremap '' <ESC>

" mapping
map <F5> :w <CR> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q cpp ./* <CR> <CR>
map <F6> :q <CR>
map <F7> :w <CR> :make <CR> :cw <CR> <S-g>
"map <F7> :w <CR> :!cd BUILD-m14tv/ && make <CR> :cw <CR> <S-g>
map <F8> :make <CR> !gdb ./a.out <CR>
map <F9> :NERDTree <CR>
map <F10>:Tlist <CR>
map <F11> <C-t>
map <F12> <C-]>
