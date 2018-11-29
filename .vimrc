call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'matze/vim-move'
Plug 'w0rp/ale'
Plug 'vim-airline/vim-airline'
Plug 'sheerun/vim-polyglot'
Plug 'mhinz/vim-mix-format'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-rails'
Plug 'airblade/vim-gitgutter'
Plug 'jreybert/vimagit'
Plug 'ryanoasis/vim-devicons'
Plug 'lifepillar/vim-cheat40'
Plug 'slashmili/alchemist.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-vinegar'
Plug 'terryma/vim-multiple-cursors'
Plug 'vim-scripts/upAndDown'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'ervandew/supertab'
if has('nvim')
  Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh'}
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
" Themes!
Plug 'drewtempelmeyer/palenight.vim'
Plug 'jacoborus/tender.vim'
Plug 'zanglg/nova.vim'
Plug 'vim-airline/vim-airline-themes'
Plug 'dracula/vim'
Plug 'hzchirs/vim-material'
Plug 'rakr/vim-two-firewatch'
Plug 'liuchengxu/space-vim-dark'
Plug 'zeis/vim-kolor'
Plug 'ryanoasis/vim-devicons' " must be the last one
call plug#end()


let g:deoplete#enable_at_startup = 1
let g:dracula_italic=0
colorscheme palenight
let g:airline_theme='dark'
let mapleader = " "

if executable('ag')
  if !exists(":Ag")
    set grepprg=ag\ --nogroup\ --nocolor
    command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
    nnoremap \ :Ag<SPACE>
  endif
endif
set termguicolors
let g:airline_mode_map = {
    \ '__' : '-',
    \ 'n'  : 'N',
    \ 'i'  : 'I',
    \ 'R'  : 'R',
    \ 'c'  : 'C',
    \ 'v'  : 'V',
    \ 'V'  : 'V',
    \ '' : 'V',
    \ 's'  : 'S',
    \ }
let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1
let g:airline_section_b = '%{airline#util#wrap(airline#extensions#branch#get_head(),0)}'
let g:airline_section_z = '%3p%% %3l/%L:%3v'
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
let g:airline#extensions#wordcount#formatter#default#fmt = '%d w'

let g:mix_format_on_save = 1
let g:mix_format_silent_errors = 1
let g:rustfmt_autosave = 1
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

command YankCurrentFilePath let @+ = expand("%")
nnoremap zq :wq<CR>
nnoremap W :w<CR>
nnoremap yfp :YankCurrentFilePath<CR>
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use j"<CR> 
nnoremap <Down> :echoe "Use k" <CR> 
nnoremap fb :e# <CR> 
nnoremap <F5> :call LanguageClient_contextMenu()<CR>
vnoremap <C-c> "+y
autocmd StdinReadPre * let s:std_in=1
map <C-p> :FZF<CR>
au InsertLeave * set nopaste

set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd FileType c,cpp,java,php,ruby,elixir,rust,python autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()


set hidden
" to make eli-ls work, visit these pages:
" https://github.com/JakeBecker/elixir-ls and 
" https://github.com/autozimu/LanguageClient-neovim/issues/234
let g:LanguageClient_serverCommands = {
      \ 'rust': ['~/.cargo/bin/rustup', 'run', 'nightly', 'rls'],
      \ 'elixir': ['eli-ls'] 
      \ }

let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {}
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['ex'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['exs'] = ''
let g:SuperTabDefaultCompletionType = "<c-n>"
nmap <C-S-j> <Plug>upAndDownDown
nmap <C-S-k> <Plug>upAndDownUp
imap <C-S-k> <Plug>upAndDownInsertUp
imap <C-S-j> <Plug>upAndDownInsertDown
vmap <C-S-k> <Plug>upAndDownVisualUp
vmap <C-S-j> <Plug>upAndDownVisualDown
nmap <Leader>hh :noh <CR>
nmap <Leader>== gg=G
