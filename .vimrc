set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Automatic closing of quotes, parentheses, brackets...
Plugin 'raimondi/delimitmate'

" Autocomplete
Plugin 'Valloric/YouCompleteMe'

" Syntax chcker
Plugin 'scrooloose/syntastic'

" Javascript
Plugin 'pangloss/vim-javascript'

" JSX stuff
Plugin 'mxw/vim-jsx'

" Easy commenting
Plugin 'scrooloose/nerdcommenter'

" Easy file navigation
Plugin 'scrooloose/nerdtree'

" File navigation with git stuff
Plugin 'Xuyuanp/nerdtree-git-plugin'

" Colorful parentheses
Plugin 'junegunn/rainbow_parentheses.vim'

" Scala syntax highlighting
Plugin 'derekwyatt/vim-scala'

" Git diff in the 'gutter'
Plugin 'airblade/vim-gitgutter'

" Status line
Plugin 'vim-airline/vim-airline'

" PHP Debugger
Plugin 'joonty/vdebug'

" Fuzzy matching
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

" Git wrapper
Plugin 'tpope/vim-fugitive'

" Go
Plugin 'fatih/vim-go'

" TypeScript Syntax Highlighting
Plugin 'leafgarland/typescript-vim'

" TypeScript IDE
Plugin 'Quramy/tsuquyomi'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
syntax on
set number
set hlsearch

" Indentation soft tab 2
set expandtab
set shiftwidth=4
set softtabstop=4

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

" Automatically trim trailing whitespaces on save
autocmd BufWritePre * :%s/\s\+$//e

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_php_checkers = ['php', 'phpmd']
let g:syntastic_go_checkers = ['go', 'golint', 'errcheck']

" Allow jsx syntax in js files
let g:jsx_ext_required = 0

" Explore mode
let g:netrw_liststyle=3

" Map NERDTree to Ctrl+i
map <C-i> :NERDTreeToggle<CR>

" Map file fuzzy matching to Ctrl+o
map <C-o> :Files<CR>

" Map git commit fuzzy matching to Ctrl+p
map <C-p> :Commits<CR>

" fzf complete line
imap <c-l> <plug>(fzf-complete-line)

" NERDCommenter Post Installation setting
filetype plugin on

" Map Leader key to ,
let mapleader=","

" Activate rainbow parentheses based on filetype
augroup rainbow
  autocmd!
  autocmd FileType scala,lisp,clojure,scheme RainbowParentheses
augroup END

" Use the system python for ycm
" Only necessary for Ubuntu
"let g:ycm_path_to_python_interpreter = '/usr/local/bin/python'

" vim-airline doesn't appear until I create a new split
set laststatus=2

" Enable 256 colors for Ubuntu
if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif

" Vdebug settings
let g:vdebug_options = {
\   "break_on_open" : 0,
\   "path_maps" : {
\       "/var/etsy/current" : "/home/kyu/development/Etsyweb",
\   },
\}

" Can't delete auto indents
set backspace=indent,eol,start

" Install flake8 and eslint
" apt-get install python-flake8
" npm install -g eslint
" npm install -g babel-eslint
" npm install -g eslint-plugin-react
