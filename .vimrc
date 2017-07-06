set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'              " https://github.com/VundleVim/Vundle.vim.git

" The followings are my own
Plugin 'The-NERD-tree'                  " https://github.com/vim-scripts/The-NERD-tree.git
Plugin 'AutoComplPop'                   " https://github.com/vim-scripts/AutoComplPop.git
Plugin 'fugitive.vim'                   " https://github.com/tpope/vim-fugitive.git
Plugin 'SrcExpl'                        " https://github.com/wesleyche/SrcExpl.git
Plugin 'CCTree'                         " https://github.com/vim-scripts/CCTree.git
Plugin 'OmniCppComplete'                " https://github.com/vim-scripts/OmniCppComplete.git
Plugin 'ctrlp.vim'                      " https://github.com/kien/ctrlp.vim.git
Plugin 'vim-airline'                    " https://github.com/vim-airline/vim-airline.git
Plugin 'vim-airline-themes'             " https://github.com/vim-airline/vim-airline-themes.git
Plugin 'Conque'                         " https://github.com/vim-scripts/Conque-GDB.git
Plugin 'tagbar'                         " https://github.com/majutsushi/tagbar.git
Plugin 'ack.vim'                        " https://github.com/mileszs/ack.vim.git
Plugin 'vim-surround'                   " https://github.com/tpope/vim-surround.git
"Plugin 'syntastic'                      " https://github.com/vim-syntastic/syntastic.git
Plugin 'tern-for-vim'                   " https://github.com/ternjs/tern_for_vim.git
Plugin 'gundo.vim'                      " https://github.com/sjl/gundo.vim.git
"Plugin 'YouCompleteMe'                  " https://github.com/Valloric/YouCompleteMe.git
Plugin 'gsearch'                        " https://github.com/vim-scripts/gsearch.git
Plugin 'vim-gitgutter'                  " https://github.com/airblade/vim-gitgutter.git
Plugin 'tabular'                        " https://github.com/godlygeek/tabular.git
Plugin 'CycleColor'                     " https://github.com/vim-scripts/CycleColor.git
Plugin 'auto-pairs'                     " https://github.com/jiangmiao/auto-pairs.git
Plugin 'nerdcommenter'                  " https://github.com/scrooloose/nerdcommenter.git

" javascript
Plugin 'vim-node'                       " https://github.com/moll/vim-node.git
Plugin 'vim-javascript'                 " https://github.com/pangloss/vim-javascript.git
Plugin 'vim-javascript-syntax'          " https://github.com/jelera/vim-javascript-syntax.git
Plugin 'vim-indent-guides'              " https://github.com/nathanaelkane/vim-indent-guides.git
Plugin 'vim-nodejs-complete'            " https://github.com/myhere/vim-nodejs-complete.git

" qml
"Plugin 'qml.vim'                        " https://github.com/calincru/qml.vim.git

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
set cindent
set autoindent
"set smartindent
set mouse=a
set showmatch
set expandtab
set nobackup
set laststatus=2
set ttimeoutlen=50
set encoding=utf-8
set fileencodings=utf-8,euckr
set path=.,./
set hlsearch
set backspace=indent,eol,start

" Declare mapleader
let mapleader = ";"

" Syntax Highlighting
if has("syntax")
	syntax on
endif

" Add highlighting for function definition in C++
function! EnhanceCppSyntax()
  syn match cppFuncDef "::\~\?\zs\h\w*\ze([^)]*\()\s*\(const\)\?\)\?$"
  hi def link cppFuncDef Special
endfunction
autocmd Syntax cpp call EnhanceCppSyntax()

" ctags setting
set tags=./tags,tags,./TAGS,TAGS,/home/work/eunsik0.lee/webos/luna-service2/tags,/home/work/eunsik0.lee/webos/libpbnjson/tags,/home/work/eunsik0.lee/webos/cjson/tags,/home/work/eunsik0.lee/include/cpp
"set tags=/home/work/eunsik0.lee/work/linux/tags
map <Leader>ac <ESC>:!ctags -R -I --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q --language-force=c++ .<CR><CR>
"map <Leader>aj <ESC>:!find . -type f -iregex ".*\.js$" -not -path "./node_modules/*" -exec jsctags {} -f \; | sed '/^$/d' | sort > tags<CR>

" Settings for OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCppShowAccess = 1
let OmniCpp_ShowPrototypeInabbr = 1
let OmniCpp_MayCompleteDot = 1
let OmniCpp_MayCompleteArrow = 1
let OmniCpp_MayCompleteScore = 1
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]

" cscope basic setting
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

" cscope short cut
nnoremap <Leader>cs <ESC>:cs find s <cword><CR>  " Find this C symbol
nnoremap <Leader>cg <ESC>:cs find g <cword><CR>  " Find this definition
nnoremap <Leader>cd <ESC>:cs find d <cword><CR>  " Find functions called by this function
nnoremap <Leader>cc <ESC>:cs find c <cword><CR>  " Find functions calling this function
nnoremap <Leader>ct <ESC>:cs find t <cword><CR>  " Find assigntments to
nnoremap <Leader>ce <ESC>:cs find e <cword><CR>  " Find this egrep pattern
nnoremap <Leader>cf <ESC>:cs find f <cword><CR>  " Find this file
nnoremap <Leader>ci <ESC>:cs find i <cword><CR>  " Find files #including this file

" Find white space
match ErrorMsg '\s\+$'

" Fix : Do not make slow vim due to scanning function by tagbar
let g:airline#extensions#tagbar#enabled = 0

" Auto Complete for Ctrl i
inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
            \ "\<lt>C-n>" :
            \ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
            \ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
            \ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>

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
nnoremap <C-j> :grep -I <cword> * -r --exclude={tags,cscope.out,cscope.files}<CR>:copen<CR><CR>
" Ack
"nnoremap <C-j> :Ack --ignore-file=is:tags <cword><CR>

" easier moving of code blocks
vnoremap < <gv
vnoremap > >gv

" Control vim tab
map <Leader>to <ESC>:tabedit<CR>
map <Leader>tc <ESC>:tabclose<CR>
map <Leader>tl <ESC>:tabs<CR>

" Make makefile
map <Leader>m <ESC>:make<CR>:copen<CR><CR><C-w>w

" Quit
inoremap <C-q> <ESC>:q<CR>
nnoremap <C-q> :q<CR>

" Settings for gsearch
map <Leader>g <ESC>:Wiki <cword><CR>

" Settings for vim-airline
let g:airline#extensions#tabline#enabled = 1

" Settings for ctrlp
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_max_height = 10
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

" Settings for SrcExpl
let g:SrcExpl_winHeight = 8 " // Set the height of Source Explorer window
let g:SrcExpl_refreshTime = 100 " // Set 100 ms for refreshing the Source Explorer

" syntastic
"function! SyntasticChecker()
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*
    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 0
    let g:syntastic_check_on_wq = 0
    let g:syntastic_check_on_w = 0
    let g:syntastic_javascript_checkers = ['jshint']
"endfunction
"autocmd Syntax javascript call SyntasticChecker()


syntax on
let g:solarized_termcolors=256
se t_Co=256
set background=light
"colorscheme molokai " https://github.com/tomasr/molokai.git
"colorscheme solarized " https://github.com/altercation/vim-colors-solarized.git
colorscheme distinguished " https://github.com/Lokaltog/vim-distinguished.git
