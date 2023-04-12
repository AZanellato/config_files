let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')
if !filereadable(vimplug_exists)
  if !executable("curl")
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent exec "!\curl -fLo " . vimplug_exists . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  let g:not_finish_vimplug = "yes"
  autocmd VimEnter * PlugInstall
endif

function! UpdateRemotePlugins(...)
    " Needed to refresh runtime files
    let &rtp=&rtp
    UpdateRemotePlugins
  endfunction

let g:polyglot_disabled = ['reason', 'yaml']
call plug#begin(stdpath('config') . '/plugged')
  "" Language stuff
    " Language syntax for every language
    Plug 'sheerun/vim-polyglot'
    Plug 'Pocco81/AbbrevMan.nvim'
    " Formatting for Elixir 
    Plug 'mhinz/vim-mix-format'
    Plug 'CraneStation/cranelift.vim'
    " Close brackets for me :)
    Plug 'KermitPurple/vim-closer'
    " Type end for me :)
    Plug 'RRethy/nvim-treesitter-endwise'
    " Some usefull stuff for ruby/rails
    Plug 'tpope/vim-rails'
    Plug 'tpope/vim-bundler'
    Plug 'tpope/vim-rake'
    " Shortcut to comment anything
    Plug 'numToStr/Comment.nvim'
    " Set comment string with treesitter
    Plug 'JoosepAlviste/nvim-ts-context-commentstring'
    " Surround stuff quickly
    Plug 'tpope/vim-surround'
    " Expand/shrink visual selection
    Plug 'terryma/vim-expand-region'
    " Check versions of packages from crates.io
    Plug 'mhinz/vim-crates'
    " Try out treesitter and some modules
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  
    Plug 'nvim-treesitter/playground' 
    Plug 'nvim-treesitter/nvim-treesitter-textobjects'
    Plug 'nvim-treesitter/nvim-treesitter-refactor'
    Plug 'rmagatti/goto-preview'

    Plug 'johann2357/nvim-smartbufs'
  "" SQL Stuff
    " Uppercase SQL keywords
    Plug 'alcesleo/vim-uppercase-sql'

  "" Project explorer
    " Amazing fuzzy finder and global search
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
    Plug 'romgrk/fzy-lua-native'
    " Project Search & Replace
    Plug 'nvim-pack/nvim-spectre'
    Plug 'ton/vim-bufsurf'
    Plug 'matbme/JABS.nvim'
    Plug 'gelguy/wilder.nvim',  { 'do': function('UpdateRemotePlugins') }
    " Used by other neovim Plugins
    Plug 'nvim-lua/plenary.nvim'
    " Directory explorer
    Plug 'stevearc/oil.nvim'
    " Jump to definitions
    Plug 'pechorin/any-jump.vim'
  ""
  "" Window movements/resizing
    " Resize window automatically
    Plug 'beauwilliams/focus.nvim'
    " Undo the closing of a window
    Plug 'AndrewRadev/undoquit.vim'
    " Tmux integration. YAY :D 
    Plug 'christoomey/vim-tmux-navigator'
  ""
  "" Enhance vim commands
    " Take a look at the registers
    Plug 'junegunn/vim-peekaboo'
    " Search on visual mode with *
    Plug 'bronson/vim-visual-star-search'
    " Visualize the undotree
    Plug 'mbbill/undotree'
    " better f
    Plug 'ggandor/lightspeed.nvim'
    " What it says on the tin 
    Plug 'karb94/neoscroll.nvim'
    " Repeat any command with . 
    Plug 'tpope/vim-repeat'
    " Command to show leader commands
    Plug 'derekprior/vim-leaders'
    " Interact with output of commands
    Plug 'AndrewRadev/bufferize.vim'
    " Move between ident levels 
    Plug 'jeetsukumaran/vim-indentwise'
  ""
  "" Copy/Move/Paste changes
    " Make delete actually delete instead of cut
    Plug 'svermeulen/vim-cutlass'
    " Substitute text with motions!
    Plug 'svermeulen/vim-subversive'
    " Cycle through words (like true/false, if/unless, etc)
    Plug 'zef/vim-cycle'
    " Exchange words with motions!
    Plug 'tommcdo/vim-exchange'
    " Cycle through paste history
    Plug 'svermeulen/vim-yoink'
  ""
  "" Text manipulation
    " Change sibilings position
    Plug 'Wansmer/sibling-swap.nvim'
    " Change one liners to multiple and vice-versa
    Plug 'AndrewRadev/splitjoin.vim'
    " text moving
    Plug 'echasnovski/mini.move'
    " Change case types
    Plug 'arthurxavierx/vim-caser'
    " Increment text-objects
    Plug 'wellle/targets.vim'
    " Continous increment on visual block using C-A
    Plug 'triglav/vim-visual-increment'
    " Enhanced % to recognize language specific bracket open (e.g. if-end) 
    Plug 'andymass/vim-matchup'
    " Text objects in general
    Plug 'kana/vim-textobj-user'
    Plug 'kana/vim-textobj-entire'
    Plug 'nelstrom/vim-textobj-rubyblock'
    Plug 'michaeljsmith/vim-indent-object'
    "
    " Exactly what it says
    Plug 'fvictorio/vim-extract-variable'
  ""
  "" Git stuff
    Plug 'lewis6991/gitsigns.nvim'
    Plug 'rhysd/git-messenger.vim'
    Plug 'tpope/vim-fugitive'
    Plug 'sindrets/diffview.nvim'
    Plug 'akinsho/git-conflict.nvim'
    Plug 'ToruIwashita/git-switcher.vim'
  
  "" Test stuff 
    " All the tests frameworks/languages :D
    Plug 'janko/vim-test'
 
  "" Autocompletion/linting
    " autocompletion engine
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " Autocompletion source
    Plug 'wellle/tmux-complete.vim'
    "Linter
    Plug 'w0rp/ale'

  "" Visual Stuff
    Plug 'folke/twilight.nvim'
    Plug 'junegunn/rainbow_parentheses.vim'
    Plug 'machakann/vim-highlightedyank'
    Plug 'lukas-reineke/indent-blankline.nvim'
    Plug 'vim-airline/vim-airline'
    Plug 'echasnovski/mini.cursorword', { 'branch': 'main' }
    Plug 'ryanoasis/vim-devicons' 
    Plug 'kyazdani42/nvim-web-devicons'
    "" Themes!
      Plug 'rebelot/kanagawa.nvim'
    ""
    "" Zen modes!
    Plug 'Pocco81/true-zen.nvim'
    " For writing :)
    Plug 'rhysd/vim-grammarous'
  ""
call plug#end()

set conceallevel=2
let mapleader = " "
set nomodeline
set <F20>=j
set <F21>=k

set diffopt=vertical
set termguicolors
set updatetime=500 " 500 ms to update signs
set autowrite     " Automatically :write before running commands
set backspace=2   " Backspace deletes like most programs in insert mode
set expandtab " Tab => spaces
set foldmethod=syntax 
set history=50
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set mouse=a " Mouse works inside vim
set nobackup
set nofoldenable
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287 
set nowritebackup
set regexpengine=2 
set shiftround
set shiftwidth=2
set showcmd       " display incomplete commands
set splitbelow  "Split horizontal shows up from below 
set splitright  " Split vertical shows up to the right
set tabstop=2   " Tab equals to 2 spaces
set cmdheight=2 " Better display error messages
set scrolloff=5 " Don't let the cursor get to the bottom of the scren
set hidden
set ttyfast

set inccommand=split

" Relative number when on normal mode
" absolute numbers when on insert mode
set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" Remove trailing whitespace on save for these extensions
augroup kill_trailing_whitespace
  autocmd FileType c,cpp,java,php,ruby,elixir,rust,python,ocaml,reason autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
augroup END

function! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

" Here starts the configuration of plugins and a bunch
" of shortcuts that I developed 

let test#strategy = "neovim"

let g:matchup_matchparen_offscreen = {'method': 'popup'}
let g:test#neovim#start_normal = 1
let g:sneak#s_next = 1
let g:surround_no_insert_mappings = 1
let g:tmuxcomplete#trigger = 'omnifunc'

let g:yoinkIncludeDeleteOperations=1

" let g:fzf_action = {
"       \ 'ctrl-t': 'tab split',
"       \ 'ctrl-s': 'split',
"       \ 'ctrl-v': 'vsplit' }
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {}
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['ex'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['exs'] = ''

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
let g:airline_section_b = '%{airline#util#wrap(airline#extensions#branch#get_head(),0)[0:45]}'
let g:airline_section_z = ''
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
let g:airline#extensions#wordcount#formatter#default#fmt = '%d w'

let g:mix_format_on_save = 1
let g:mix_format_silent_errors = 1

let g:rustfmt_autosave = 1

let g:indentLine_char_list = ['|', '¦', '┆', '┊']

let g:git_messenger_floating_win_opts = { 'border': 'single' }
let g:ale_fixers = {
      \ 'python': ['add_blank_lines_for_python_control_statements', 'autopep8', 'black', 'isort', 'reorder-python-imports', 'yapf'],
      \ }
let g:ale_ruby_rubocop_executable  = 'bundle' " use this to call rubocop with bundle exec
let g:ale_rust_cargo_use_clippy = 1
let g:ale_linters = {
      \  'javascript': ['eslint'],
      \  'rust': ['analyzer'],
      \  'ruby': ['reek', 'rubocop', 'solargraph'],
      \}
let g:ale_sign_error = '>>'
let g:ale_sign_info = '--'

augroup FiletypeGroup
    autocmd!
    au BufNewFile,BufRead *.jsx set filetype=javascript.jsx
  autocmd BufRead,BufNewFile *.blade.php set filetype=blade
augroup END
augroup FILETYPES
  autocmd FileType markdown let b:indentLine_enabled = 0
augroup END
" let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } } 
let g:any_jump_search_prefered_engine = 'ag'
let g:coc_global_extensions = ['coc-json', 'coc-syntax', 'coc-omni', 'coc-rust-analyzer', 'coc-solargraph', 'coc-prettier']

" Maps

command! Config :e ~/.vimrc
command! YankCurrentFilePath let @+ = expand("%")
command! PrettifyJson %!jq '.'
command! Source source ~/config_files/init.vim
command! -nargs=0 Format :call CocAction('format')
command! SourceAndInstall source ~/config_files/init.vim <bar> :PlugInstall

imap <C-l> <C-o>dw
vmap <F20> <Plug>MoveBlockDown
vmap <F21> <Plug>MoveBlockUp
nmap <F20> <Plug>MoveLineDown
nmap <F21> <Plug>MoveLineUp

let g:splitjoin_split_mapping = ''
let g:splitjoin_join_mapping = ''

" Move between linting errors
nnoremap <M-n> :ALENextWrap<CR>
nnoremap <M-p> :ALEPreviousWrap<CR>
nnoremap <Leader><CR> o<ESC>
nnoremap <Leader>/ :Telescope current_buffer_fuzzy_find <CR>
nnoremap <Leader>m m 
nnoremap <Leader>? :Telescope live_grep<CR>
nnoremap <Leader>* :Telescope grep_string<CR>
vnoremap <Leader>* :<C-u>call VisualStarSearchSet('/', 'raw')<CR>:call fzf#vim#grep('rg --column --line-number --no-heading --color=always --smart-case '.shellescape(@/), 1,)<CR>
nnoremap <Leader>- :split <CR>
nnoremap <Leader>_ :vsplit <CR> 
nmap <M-Left> <plug>(tradewinds-h)
nmap <M-Down> <plug>(tradewinds-j)
nmap <M-Up> <plug>(tradewinds-k)
nmap <M-Right> <plug>(tradewinds-l)
nnoremap <Leader>e :e#<CR>
nnoremap <Leader>a :lua require("nvim-smartbufs").goto_next_buffer()<CR>
nnoremap <Leader>d :lua require("nvim-smartbufs").goto_prev_buffer()<CR>
nnoremap <Leader>p  "+p==
nnoremap <Leader>u :UndotreeToggle<cr>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>z :TZFocus <CR>
nnoremap <Leader>} :Gitsigns next_hunk <CR>
nnoremap <Leader>{ :Gitsigns prev_hunk <CR>
nnoremap <Leader>bb :JABSOpen<CR>
nnoremap <Leader>bl :Git blame<CR>
nnoremap <Leader>bp obinding.pry<ESC>
nnoremap <Leader>bo :Telescope buffers <CR>
nnoremap <Leader>cb :make build<CR>
nnoremap <Leader>ce :call CopyError()<CR>
nnoremap <Leader>cr :Dispatch cargo run<CR>
nnoremap <Leader>cu :call crates#up() <CR>
nnoremap <Leader>ff :Telescope git_files<CR>
nnoremap <Leader>fo :TZFocus<CRCRCopyErrConfig>
nnoremap <Leader>fl :Telescope find_files<CR>
nnoremap <Leader>gg :Git<CR>
nnoremap <Leader>gt :Telescope git_status<CR>
nnoremap <Leader>gm :GitMessenger<CR>
" nnoremap <Leader>hh :SidewaysLeft<cr>
nnoremap <Leader>lj :SplitjoinJoin<cr>
" nnoremap <Leader>ll :SidewaysRight<cr>
nnoremap <Leader>ls :SplitjoinSplit<cr>
nnoremap <Leader>nh :noh <CR>
nnoremap <Leader>of :Telescope oldfiles<CR>
nnoremap <Leader>op o<ESC>"+p
nnoremap <Leader>Op  O<ESC>"+p
nnoremap <Leader>yh :Yanks <CR>
nnoremap <Leader>alf :ALEFix <CR>
nnoremap <Leader>aln :ALENextWrap <CR>
nnoremap <Leader>alp :ALEPreviousWrap <CR>
nnoremap <Leader>lft :Format <CR>
nnoremap <Leader>ral :TestSuite<CR>
nnoremap <Leader>soi :SourceAndInstall<CR>
nnoremap <Leader>sor :Source<CR>
nnoremap <Leader>im :IndentWise

map [p <Plug>(IndentWisePreviousLesserIndent)
map [= <Plug>(IndentWisePreviousEqualIndent)
map [n <Plug>(IndentWisePreviousGreaterIndent)
map ]p <Plug>(IndentWiseNextLesserIndent)
map ]= <Plug>(IndentWiseNextEqualIndent)
map ]n <Plug>(IndentWiseNextGreaterIndent)
map [_ <Plug>(IndentWisePreviousAbsoluteIndent)
map ]_ <Plug>(IndentWiseNextAbsoluteIndent)
map [b <Plug>(IndentWiseBlockScopeBoundaryBegin)
map ]e <Plug>(IndentWiseBlockScopeBoundaryEnd)

nnoremap <Leader>rc :TestFile<CR>
nnoremap <Leader>rs :TestNearest<CR>
nnoremap <Leader>rl :TestLast<CR>
nnoremap yfp :YankCurrentFilePath<CR>
vnoremap <C-c> "+y


" Use M to cut instead of D
nnoremap m d
xnoremap m d
nnoremap mm dd

" SubversiveSubstitute is a motion from a plugin that makes
" such things as sw substitute a word.
nmap s <Plug>(SubversiveSubstitute)
nmap ss <Plug>(SubversiveSubstituteLine)
nmap S <Plug>(SubversiveSubstituteToEndOfLine)

map <Leader>s <Plug>Lightspeed_s
map <Leader>S <Plug>Lightspeed_S


nmap scm <Plug>(coc-diagnostic-info)
nmap sam <Plug>(ale_detail)

" Scrolling through yank history with c-n and c-p
" It needs the p to paste with the plugin first
nmap p <plug>(YoinkPaste_p)
nmap P <plug>(YoinkPaste_P)
nmap <c-n> <plug>(YoinkPostPasteSwapBack)
nmap <c-p> <plug>(YoinkPostPasteSwapForward)
nmap [y <plug>(YoinkRotateBack)
nmap ]y <plug>(YoinkRotateForward)

" Coc stuff to increment vim native commands
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

imap <silent><expr> <C-n>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ coc#refresh()
inoremap <expr><C-p> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"


function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use gp and gn to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> gp <Plug>(coc-diagnostic-prev)
nmap <silent> gn <Plug>(coc-diagnostic-next)

nmap <Leader>V <Plug>(expand_region_expand)
nmap <Leader>v <Plug>(expand_region_shrink)
vmap V <Plug>(expand_region_expand)
vmap v <Plug>(expand_region_shrink)


function! CopyError()
  let @+ = v:errmsg
endfunction


autocmd StdinReadPre * let s:std_in=1
au InsertLeave * set nopaste

set tags=./tags;,tags;

tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
tnoremap <C-t> <C-\><C-n>

autocmd BufRead Cargo.toml call crates#toggle()
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd BufWritePost *.rs normal! zv
lua << EOF
  require('nvim_config')
EOF
" Set colorscheme stuff last, after loading lua plugins
set background=dark
set laststatus=3
colorscheme kanagawa
execute 'hi Search guibg=none guifg=none gui=underline'
execute 'hi illuminatedWord cterm=italic gui=italic'
execute 'hi DiffDelete guifg=#f43753 ctermfg=203 guibg=#79313c ctermbg=237 gui=NONE cterm=NONE'
