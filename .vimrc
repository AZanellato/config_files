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
  Plug 'AndrewRadev/sideways.vim'

  " Moving windows in a non-weird way
  Plug 'andymass/vim-tradewinds'

  " Change one liners to multiple and vice-versa
  Plug 'AndrewRadev/splitjoin.vim'
  " Visualize the undotree
  Plug 'mbbill/undotree'
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

  " Add a exchange movement
  Plug 'tommcdo/vim-exchange'

  " Increment text-objects
  Plug 'wellle/targets.vim'
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
  Plug 'zivyangll/git-blame.vim'
  Plug 'tpope/vim-fugitive'

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
  Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

  " Snippets :)
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'

  " Visual Stuff
  Plug 'junegunn/rainbow_parentheses.vim'
  Plug 'machakann/vim-highlightedyank'
  Plug 'TaDaa/vimade'
  Plug 'nathanaelkane/vim-indent-guides'
  Plug 'vim-airline/vim-airline'
  Plug 'google/vim-searchindex'
  Plug 'RRethy/vim-illuminate'
  Plug 'ryanoasis/vim-devicons' 
  " Themes!
  Plug 'Nequo/vim-allomancer'
  Plug 'aonemd/kuroi.vim'
  Plug 'bluz71/vim-moonfly-colors'
  Plug 'dracula/vim', { 'as': 'dracula-vim' }
  Plug 'endel/vim-github-colorscheme'
  Plug 'flrnprz/plastic.vim'
  Plug 'kristijanhusak/vim-hybrid-material'
  Plug 'liuchengxu/space-vim-theme'
  Plug 'mhartington/oceanic-next'
  Plug 'whatyouhide/vim-gotham'
  Plug 'yuttie/hydrangea-vim'
  Plug 'ntk148v/vim-horizon'
call plug#end()

colorscheme allomancer
"different one for Rust
"it is interfering with indent_lines right now

" augroup colorscheme_for_filetypes
"   au!
"   autocmd BufEnter * color allomancer
"   autocmd BufEnter *.rs,*.toml color space_vim_theme
" augroup END
let mapleader = " "
let g:tmuxcomplete#trigger = 'omnifunc'
set nomodeline
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
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#2c323c
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#3e4452
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

map <Leader>* :Rg <C-r><C-w><CR>
map <Leader>e :e#<CR>
map <Leader>f :FZF<CR>
map <Leader>w :w<CR>
map <Leader>p  o<ESC>"+p
map <Leader>P  O<ESC>"+p
map <Leader>ah :SidewaysLeft<CR>
map <Leader>al :SidewaysRight<CR>
map <Leader>bb :Buffers <CR> 
map <Leader>bf :e# <CR> 
map <Leader>rd :redraw!<CR>
map <Leader>nh :noh <CR>
map <Leader>yh :Yanks <CR>
map <Leader>ss :TestNearest<CR>
map <Leader>lft :call LanguageClient#textDocument_formatting()<CR>
map <Leader>soi :SourceAndInstall<CR>
map <Leader>sor :Source<CR>
map gD <C-]>
nnoremap <Leader>al :TestSuite<CR>
nnoremap <Leader>sh :split <CR> 
nnoremap <Leader>sv :vsplit <CR> 
nnoremap <Leader>qq :q <CR> 
nnoremap <Leader>bl :<C-u>call gitblame#echo()<CR>
nnoremap <F5> :call LanguageClient_contextMenu()<CR>
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 10)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 10)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 10)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 10)<CR>
nnoremap rcs :TestFile<CR>
nnoremap rls :TestLast<CR>
nnoremap yfp :YankCurrentFilePath<CR>
" Jump to tag
nnoremap <Leader>d :call fzf#vim#tags('^' . expand('<cword>'), {'options': '--exact --select-1 --exit-0 +i'})<CR>
nnoremap <Leader>D :call fzf#vim#tags('^' . expand('<cword>'))<CR>
vnoremap <C-c> "+y

" Use M to cut instead of D
nnoremap m d
xnoremap m d

nnoremap mm dd
nnoremap M D
autocmd StdinReadPre * let s:std_in=1
au InsertLeave * set nopaste

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>CheckBackSpace() ? "\<TAB>" :
      \ coc#refresh()

fun! <SID>CheckBackSpace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfun

fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

augroup kill_trailing_whitespace
  autocmd FileType c,cpp,java,php,ruby,elixir,rust,python autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
augroup END

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
set tags=./tags;,tags;
hi illuminatedWord cterm=italic gui=italic

tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l

tnoremap <C-i> <C-\><C-n>

nnoremap <Leader>hh :SidewaysLeft<cr>
nnoremap <Leader>ll :SidewaysRight<cr>
nnoremap <Leader>u :UndotreeToggle<cr>
