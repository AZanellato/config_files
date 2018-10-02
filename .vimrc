call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'matze/vim-move'
Plug 'cloudhead/neovim-fuzzy'
Plug 'w0rp/ale'
Plug 'vim-airline/vim-airline'
Plug 'elixir-lang/vim-elixir'
Plug 'mhinz/vim-mix-format'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'airblade/vim-gitgutter'
Plug 'ryanoasis/vim-devicons'
Plug 'lifepillar/vim-cheat40'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'terryma/vim-multiple-cursors'
Plug 'vim-scripts/upAndDown'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'ervandew/supertab'
" Themes!
Plug 'drewtempelmeyer/palenight.vim'
Plug 'rakr/vim-one'
Plug 'arcticicestudio/nord-vim'
Plug 'mhartington/oceanic-next'
Plug 'jacoborus/tender.vim'
Plug 'kaicataldo/material.vim'
Plug 'srcery-colors/srcery-vim'
Plug 'zanglg/nova.vim'
Plug 'vim-airline/vim-airline-themes'
Plug 'dracula/vim'
call plug#end()
"
let g:dracula_italic=0
colorscheme dracula
let g:airline_theme='violet'

let mapleader = " "

if executable('ag')
  if !exists(":Ag")
    set grepprg=ag\ --nogroup\ --nocolor
    command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
    nnoremap \ :Ag<SPACE>
  endif
endif

let g:airline_powerline_fonts = 1

let NERDTreeShowHidden=1
let g:mix_format_on_save = 1
let g:mix_format_silent_errors = 1
set foldmethod=indent
set nofoldenable
set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab
set splitbelow
set splitright
set number
set numberwidth=5

set splitbelow
set splitright
set mouse=a

nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use j"<CR> 
nnoremap <Down> :echoe "Use k" <CR> 
vnoremap <C-c> "+y

autocmd StdinReadPre * let s:std_in=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q! | endif

map <C-t> :NERDTreeToggle<CR>
map <C-p> :FZF<CR>
" set termguicolors
command CurrentFilePath let @+ = expand("%")
