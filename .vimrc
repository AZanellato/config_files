call plug#begin('~/.vim/plugged')
  " Language syntax for every language
  Plug 'sheerun/vim-polyglot'
  Plug 'CraneStation/cranelift.vim'

  Plug 'Konfekt/FastFold'
  " Amazing fuzzy finder and global search
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/vim-peekaboo'
  " Search on visual mode with *
  Plug 'bronson/vim-visual-star-search'
  " text moving
  Plug 'matze/vim-move'
  Plug 'AndrewRadev/sideways.vim'

  " Moving windows in a non-weird way
  Plug 'andymass/vim-tradewinds'
  " Resize window automatically
  Plug 'roman/golden-ratio'

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

  " Exchange words with motions!
  Plug 'tommcdo/vim-exchange'
  " Registers stuff
  Plug 'svermeulen/vim-yoink'

  " Add a exchange movement
  Plug 'tommcdo/vim-exchange'

  Plug 'triglav/vim-visual-increment'

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
  " Enhanced terminal integration
  Plug 'wincent/terminus'

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

  " Start screen
  Plug 'mhinz/vim-startify'

  " Visual Stuff
  Plug 'junegunn/rainbow_parentheses.vim'
  Plug 'machakann/vim-highlightedyank'
  Plug 'TaDaa/vimade'
  Plug 'Yggdroot/indentLine'
  Plug 'vim-airline/vim-airline'
  Plug 'google/vim-searchindex'
  Plug 'RRethy/vim-illuminate'
  Plug 'ryanoasis/vim-devicons' 
  " Themes!
  Plug 'Nequo/vim-allomancer'
  Plug 'dracula/vim', { 'as': 'dracula-vim' }
  Plug 'endel/vim-github-colorscheme'
  Plug 'kristijanhusak/vim-hybrid-material'
  Plug 'mhartington/oceanic-next'
  Plug 'whatyouhide/vim-gotham'
  Plug 'danilo-augusto/vim-afterglow'
  Plug 'AlessandroYorba/Alduin' 
  Plug 'tlhr/anderson.vim'
  Plug 'zacanger/angr.vim'
  Plug 'chase/focuspoint-vim'
  Plug 'rakr/vim-two-firewatch'
  Plug 'liuchengxu/space-vim-theme'
  Plug 'ajmwagar/vim-deus'
  Plug 'sjl/badwolf'
  Plug 'ayu-theme/ayu-vim'
  Plug 'drewtempelmeyer/palenight.vim'
  Plug 'rakr/vim-one'
call plug#end()

colorscheme two-firewatch
autocmd FileType rust,toml colorscheme badwolf
let g:two_firewatch_italics=1
let g:airline_theme='twofirewatch'

let mapleader = " "
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

let test#strategy = "neovim"

let g:tmuxcomplete#trigger = 'omnifunc'

let g:yoinkIncludeDeleteOperations=1

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
let g:golden_ratio_wrap_ignored = 1

let g:indentLine_char_list = ['|', '¦', '┆', '┊']

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

vmap <F20> <Plug>MoveBlockDown
vmap <F21> <Plug>MoveBlockUp
nmap <F20> <Plug>MoveLineDown
nmap <F21> <Plug>MoveLineUp

map gD <C-]>
" Move between linting errors
nnoremap <M-n> :ALENextWrap<CR>
nnoremap <M-p> :ALEPreviousWrap<CR>
nnoremap <Leader>* :Rg <C-r><C-w><CR>
vnoremap <leader>* :<C-u>call VisualStarSearchSet('/', 'raw')<CR>:call fzf#vim#grep('rg --column --line-number --no-heading --color=always --smart-case '.shellescape(@/), 1,)<CR>
nnoremap <Leader>d :call fzf#vim#tags('^' . expand('<cword>'), {'options': '--exact --select-1 --exit-0 +i'})<CR>
nnoremap <Leader>D :call fzf#vim#tags('^' . expand('<cword>'))<CR>
nnoremap <Leader>e :e#<CR>
nnoremap <Leader>f :FZF<CR>
nnoremap <Leader>p  o<ESC>"+p
nnoremap <Leader>P  O<ESC>"+p
nnoremap <Leader>u :UndotreeToggle<cr>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>al :TestSuite<CR>
nnoremap <Leader>bb :Buffers <CR> 
nnoremap <Leader>bl :GitBlame<CR>
nnoremap <Leader>hh :SidewaysLeft<cr>
nnoremap <Leader>ll :SidewaysRight<cr>
nnoremap <Leader>nh :noh <CR>
nnoremap <Leader>rd :redraw!<CR>
nnoremap <Leader>sh :split <CR> 
nnoremap <Leader>ss :TestNearest<CR>
nnoremap <Leader>sv :vsplit <CR> 
nnoremap <Leader>yh :Yanks <CR>
nnoremap <Leader>lft :call LanguageClient#textDocument_formatting()<CR>
nnoremap <Leader>soi :SourceAndInstall<CR>
nnoremap <Leader>sor :Source<CR>

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

nmap s <plug>(SubversiveSubstitute)
nmap ss <plug>(SubversiveSubstituteLine)
nmap S <plug>(SubversiveSubstituteToEndOfLine)

nmap <c-n> <plug>(YoinkPostPasteSwapBack)
nmap <c-p> <plug>(YoinkPostPasteSwapForward)

nmap p <plug>(YoinkPaste_p)
nmap P <plug>(YoinkPaste_P)

nnoremap <LEFT>   <c-w><
nnoremap <RIGHT>  <c-w>>
nnoremap <UP>     <c-w>+
nnoremap <DOWN>   <c-w>-
nnoremap <M-Left> :bp<CR>
nnoremap <M-Right> :bn<CR>
nnoremap <M-Down> :bd<CR>
" nnoremap <M-Up> 
" nnoremap <M-c> :compile<CR>

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
set tags=./tags;,tags;
hi illuminatedWord cterm=italic gui=italic

tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
tnoremap <C-i> <C-\><C-n>
