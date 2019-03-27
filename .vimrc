call plug#begin('~/.vim/plugged')
  " Language syntax for every language
  Plug 'sheerun/vim-polyglot'

  Plug 'Konfekt/FastFold'
  " Amazing fuzzy finder and global search
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/vim-peekaboo'
  " text moving
  Plug 'matze/vim-move'

  " Moving windows in a non-weird way
  Plug 'andymass/vim-tradewinds'

  " better f
  Plug 'rhysd/clever-f.vim'
  " What it says on the tin 
  Plug 'terryma/vim-smooth-scroll'
  " Formatting for Elixir 
  Plug 'mhinz/vim-mix-format'

  " Make delete actually delete instead of cut
  Plug 'svermeulen/vim-cutlass'
  " Substitute text with motions!
  Plug 'svermeulen/vim-subversive'
  " Registers stuff
  Plug 'svermeulen/vim-yoink'

  " Increment text-objects
  Plug 'wellle/targets.vim'
  Plug 'michaeljsmith/vim-indent-object'
  Plug 'andymass/vim-matchup'
  Plug 'kana/vim-textobj-user'
  Plug 'nelstrom/vim-textobj-rubyblock'
  Plug 'michaeljsmith/vim-indent-object'

  " Repeat any command -- even plugins!
  Plug 'tpope/vim-repeat'

  " Some usefull stuff for ruby/rails
  Plug 'tpope/vim-rails'
  Plug 'tpope/vim-bundler'
  Plug 'tpope/vim-rake'
  " Shortcut to comment anything
  Plug 'tpope/vim-commentary'
  " Surround stuff quickly!
  Plug 'tpope/vim-surround'

  " Type end for me :)
  Plug 'tpope/vim-endwise'
  " Close brackets for me :)
  Plug 'rstacruz/vim-closer'

  " Try again after some time
  " Plug 'justinmk/vim-dirvish'
  Plug 'tpope/vim-vinegar'

  " Git Stuff
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'
  Plug 'lambdalisue/gina.vim'
  Plug 'sodapopcan/vim-twiggy'

  " Tmux integration. YAY :D 
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'wellle/tmux-complete.vim'

  " Dispatch tests to tmux
  Plug 'tpope/vim-dispatch'
  Plug 'janko/vim-test'
  " Plug 'thoughtbot/vim-rspec'

  "Linter :D
  Plug 'w0rp/ale'

  " Autocompletion
  Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}

  " Plug 'ervandew/supertab'
  " if has('nvim')
  "   Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh'}
  "   Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  "   Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }
  " else
  "   Plug 'Shougo/deoplete.nvim'
  "   Plug 'roxma/nvim-yarp'
  "   Plug 'roxma/vim-hug-neovim-rpc'
  " endif

  " Snippets :)
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'

  " Visual Stuff
  Plug 'junegunn/rainbow_parentheses.vim'
  Plug 'machakann/vim-highlightedyank'
  Plug 'TaDaa/vimade'
  Plug 'Yggdroot/indentLine'
  Plug 'vim-airline/vim-airline'
  Plug 'google/vim-searchindex'
  Plug 'ryanoasis/vim-devicons' 
  " Themes!
  Plug 'altercation/vim-colors-solarized'
  Plug 'endel/vim-github-colorscheme'
  Plug 'Nequo/vim-allomancer'
  Plug 'nightsense/snow'
  Plug 'hzchirs/vim-material'
  Plug 'dikiaap/minimalist'
  Plug 'dracula/vim', { 'as': 'dracula-vim' }
  Plug 'whatyouhide/vim-gotham'
  Plug 'mhartington/oceanic-next'
call plug#end()
" coc stuff, testing

" use <tab> for trigger completion and navigate to next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()


inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

colorscheme allomancer
let mapleader = " "
let g:tmuxcomplete#trigger = 'omnifunc'

set <F20>=j
set <F21>=k
set background=dark

set termguicolors
set autowrite     " Automatically :write before running commands
set backspace=2   " Backspace deletes like most programs in insert mode
set expandtab " Tab => spaces
set foldmethod=indent
set history=50
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set mouse=a " Mouse works inside vim
set nobackup
set nofoldenable
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287 
set nowritebackup
set regexpengine=1 " Better for ruby syntax
set shiftround
set shiftwidth=2
set showcmd       " display incomplete commands
set splitbelow  "Split horizontal shows up from below 
set splitright  " Split vertical shows up to the right
set tabstop=2   " Tab equals to 2 spaces
set hidden
set ttyfast

" Relative number when on normal mode
" absolute numbers when on insert mode
set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

if exists('&inccommand')
  set inccommand=split
endif

let test#strategy = "dispatch"
" let g:deoplete#enable_at_startup = 1

let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
let g:material_style='palenight'
let g:airline_theme='oceanicnext'

" to make eli-ls work, visit these pages:
" https://github.com/JakeBecker/elixir-ls and 
" https://github.com/autozimu/LanguageClient-neovim/issues/234
" To make it solargraph work, just run gem install solargraph
" See https://github.com/castwide/solargraph
let g:LanguageClient_serverCommands = {
      \ 'ruby': ['solargraph', 'stdio'],
      \ 'rust': ['~/.cargo/bin/rustup', 'run', 'beta', 'rls'],
      \ }
" \ 'elixir': ['eli-ls'] 

let g:yoinkIncludeDeleteOperations=1
let g:indentLine_char = '|'

let g:UltiSnipsExpandTrigger="<c-t>"
let g:UltiSnipsJumpForwardTrigger="<c-f>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"

let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit' }
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {}
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['ex'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['exs'] = ''
let g:SuperTabDefaultCompletionType = "<c-n>"
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
let g:airline_section_z = ''
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
let g:airline#extensions#wordcount#formatter#default#fmt = '%d w'
let g:mix_format_on_save = 1
let g:mix_format_silent_errors = 1
let g:rustfmt_autosave = 1

if executable('ag')
  if !exists(":Ag")
    set grepprg=ag\ --nogroup\ --nocolor
    command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
    nnoremap \ :Ag<SPACE>
  endif
endif

if executable('rg')
  if exists(":Rg")
    nnoremap \ :Rg<SPACE>
  endif
endif


if !exists(":YankCurrentFilePath")
  command YankCurrentFilePath let @+ = expand("%")
endif
if !exists(":Source")
  command Source source ~/config_files/.vimrc 
endif
if !exists(":SourceAndInstall")
  command SourceAndInstall source ~/config_files/.vimrc <bar> :PlugInstall
endif

nmap s <plug>(SubversiveSubstitute)
nmap ss <plug>(SubversiveSubstituteLine)
nmap S <plug>(SubversiveSubstituteToEndOfLine)

vmap <F20> <Plug>MoveBlockDown
vmap <F21> <Plug>MoveBlockUp
nmap <F20> <Plug>MoveLineDown
nmap <F21> <Plug>MoveLineUp

map <Leader>f :FZF<CR>
map <Leader>w :w<CR>
map <Leader>p  o<ESC>"+p
map <Leader>P  O<ESC>"+p
map <Leader>bb :Buffers <CR> 
map <Leader>bf :e# <CR> 
map <Leader>rd :redraw!<CR>
map <Leader>nh :noh <CR>
map <Leader>yh :Yanks <CR>
map <Leader>ss :TestNearest<CR>
map <Leader>lft :call LanguageClient#textDocument_formatting()<CR>
map <Leader>soi :SourceAndInstall<CR>
map <Leader>sor :Source<CR>
nnoremap <Leader>al :TestSuite<CR>
nnoremap <Leader>sh :split <CR> 
nnoremap <Leader>sv :vsplit <CR> 
nnoremap <Leader>qq :q <CR> 
nnoremap <F5> :call LanguageClient_contextMenu()<CR>
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 10)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 10)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 10)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 10)<CR>
nnoremap rcs :TestFile<CR>
nnoremap rls :TestLast<CR>
nnoremap yfp :YankCurrentFilePath<CR>
vnoremap <C-c> "+y

" Use M to cut instead of D
nnoremap m d
xnoremap m d

nnoremap mm dd
nnoremap M D
autocmd StdinReadPre * let s:std_in=1
au InsertLeave * set nopaste

fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd FileType c,cpp,java,php,ruby,elixir,rust,python autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()


if has('nvim')
  tmap <C-i> <C-\><C-n>
  hi Search guibg=none guifg=none gui=underline
else
  " set Vim-specific sequences for RGB colors
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

nmap <c-n> <plug>(YoinkPostPasteSwapBack)
nmap <c-p> <plug>(YoinkPostPasteSwapForward)

nmap p <plug>(YoinkPaste_p)
nmap P <plug>(YoinkPaste_P)

nnoremap <LEFT>   <c-w><
nnoremap <RIGHT>  <c-w>>
nnoremap <UP>     <c-w>+
nnoremap <DOWN>   <c-w>-
" call deoplete#custom#source('tabnine', 'rank', 100)
