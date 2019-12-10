imap jk <Esc>

set nocompatible
filetype plugin indent on
set wildmenu
set showcmd
set hlsearch
set ignorecase
set smartcase
set mouse=a
set ttyfast
set ttymouse=xterm2

" Line number
set number
highlight LineNr ctermfg=grey
map <C-l> :set relativenumber!<CR>

set backspace=indent,eol,start
set visualbell
set t_vb=
set laststatus=2
set t_Co=256
set encoding=utf-8
set pastetoggle=<F11>

" Tab
set autoindent
set cindent
set shiftwidth=4
set tabstop=4
set expandtab

" ctrl-s saving
nmap <c-s> :w<cr>
imap <c-s> <esc>:w<cr>a

" Vundle
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-surround'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'altercation/vim-colors-solarized'

call vundle#end()            " required
filetype plugin indent on    " required

" NerdCommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1

" NerdTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Solarized
let g:solarized_termcolors=256
syntax on
set background=dark
colorscheme solarized

" Syntastic
let g:syntastic_cpp_checkers=[]

" Clang-format
map <C-K> :pyf /usr/local/Cellar/clang-format/2019-05-14/share/clang/clang-format.py<cr>
imap <C-K> <c-o>:pyf /usr/local/Cellar/clang-format/2019-05-14/share/clang/clang-format.py<cr>

function! Formatonsave()
  let l:formatdiff = 1
    pyf /usr/local/Cellar/clang-format/2019-05-14/share/clang/clang-format.py
endfunction
autocmd BufWritePre *.h,*.cc,*.cpp call Formatonsave()
