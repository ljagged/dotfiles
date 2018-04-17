" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" keep windows sized reasonably and split naturally
set winheight=35
set winminheight=5
set splitbelow
set splitright

" Rebind <Leader> key
let mapleader = "\<Space>"

" Avoid escape
inoremap jk <esc>

" Bind nohl
" Removes highlight of your last search
" ``<C>`` stands for ``CTRL`` and therefore ``<C-n>`` stands for ``CTRL+n``
noremap <Leader><Leader>n :nohl<CR>
vnoremap <Leader><Leader>n :nohl<CR>



" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
" Every unnecessary keystroke that can be saved is good for your health :)
map <c-h> <c-w>h
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l



" map sort function to a key
vnoremap <Leader>s :sort<CR>


" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation


" Enable syntax highlighting
" You need to reload this file for the change to apply
filetype off
filetype plugin indent on
syntax on


" Showing line numbers and length
set number  " show line numbers
set tw=79   " width of document (used by gd)
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/


" easier formatting of paragraphs
vmap Q gq
nmap Q gqap


" Useful settings
set history=700
set undolevels=700


" Real programmers don't use TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

" very magic mode
nnoremap / /\v

" better command line moving
cnoremap <C-a> <Home>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-d> <Delete>
cnoremap <M-b> <S-Left>
cnoremap <M-f> <S-Right>
cnoremap <M-d> <S-right><Delete>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>
cnoremap <Esc>d <S-right><Delete>
cnoremap <C-g> <C-c>

" better backspacing
set backspace=2

" Buffer movement
nmap <C-e> :e#<CR>

" Fast save
nnoremap <Leader>w :w<CR>

" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile

" Use <leader>l to toggle display of whitespace
nmap <leader>l :set list!<CR>
" automatically change window's cwd to file's dir
set autochdir

" Exclude VC directories
set wildignore+=*/.hg/*,*/.svn/*

" Plugins go here

set nocompatible

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required! 
Plugin 'gmarik/vundle'

Plugin 'tpope/vim-fugitive'

Plugin 'tpope/vim-unimpaired'

Plugin 'tpope/vim-vinegar'

Plugin 'tpope/vim-ragtag'

Plugin 'tpope/vim-surround'

Plugin 'tpope/vim-repeat'

Plugin 'tpope/vim-jdaddy'

Plugin 'tpope/vim-flagship'
set laststatus=2
set showtabline=2
set guioptions-=e

Plugin 'jeffkreeftmeijer/vim-numbertoggle'

Plugin 'rking/ag.vim'
let g:ag_working_path_mode="r"
let g:ackprg = 'ag --vimgrep'

Plugin 'tmhedberg/SimpylFold'
" fold everything except where the cursor is
nnoremap zh zMzv

Plugin 'w0rp/ale'
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0

Plugin 'vim-airline/vim-airline'

"This is last
call vundle#end()
filetype plugin indent on

" Local config
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif
