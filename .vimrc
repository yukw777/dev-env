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

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
syntax on
set number
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

" Highlight column 80
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['jshint', 'eslint']

" Allow jsx syntax in js files
let g:jsx_ext_required = 0

" Explore mode
let g:netrw_liststyle=3

" Start NERDTree when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Map NERDTree to Ctrl+o
map <C-o> :NERDTreeToggle<CR>

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
let g:ycm_path_to_python_interpreter = '/usr/bin/python'

" Install flake8 and eslint
" apt-get install python-flake8
" npm install -g eslint
" npm install -g babel-eslint
" npm install -g eslint-plugin-react
" npm install -g jshint