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

set rtp+=~/.vim/bundle/vundle
call vundle#begin()

" let Vundle manage Vundle
" required! 
Plugin 'gmarik/vundle'

Plugin 'scrooloose/nerdcommenter'

Plugin 'kien/ctrlp.vim'
nnoremap <Leader>j :CtrlPBuffer<CR>
nnoremap <Leader>o :CtrlP<CR>
let g:ctrlp_user_command = 'ag -l --nocolor -g "" %s'
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_open_multiple_files = 'jri'

Plugin 'terryma/vim-expand-region'
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

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

Plugin 'jmcantrell/vim-virtualenv'

" ============================================================================
" Python IDE Setup
" ============================================================================

Plugin 'klen/python-mode'
" Python-mode
" Keys:
" K             Show python docs
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)
let g:pymode_rope = 0
let g:pymode_python = 'python'
" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 1
let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'pep257', 'pylint']
" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'
let g:pymode_breakpoint_cmd = 'import pdb; pdb.set_trace()  # XXX BREAKPOINT'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0


Plugin 'davidhalter/jedi-vim'
" Settings for jedi-vim
" cd ~/.vim/bundle
" git clone git://github.com/davidhalter/jedi-vim.git
let g:jedi#usages_command = "<leader>z"
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0

" Better navigating through omnicomplete option list
" See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
set completeopt=longest,menuone
function! OmniPopup(action)
    if pumvisible()
        if a:action == 'j'
            return "\<C-N>"
        elseif a:action == 'k'
            return "\<C-P>"
        endif
    endif
    return a:action
endfunction

inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>

" And let's use htmldjango for html files
au BufNewFile,BufRead *.html set filetype=htmldjango

Plugin 'jeffkreeftmeijer/vim-numbertoggle'

Plugin 'rking/ag.vim'
let g:ag_working_path_mode="r"
let g:ackprg = 'ag --vimgrep'

Plugin 'tmhedberg/SimpylFold'
" fold everything except where the cursor is
nnoremap zh zMzv

Plugin 'mattn/emmet-vim'

"This is last
call vundle#end()
filetype plugin indent on

" Local config
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif