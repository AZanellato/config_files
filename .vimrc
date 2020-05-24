let vimplug_exists=expand('~/.vim/autoload/plug.vim')

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

call plug#begin('~/.vim/plugged')
  "" Language stuff
    " Language syntax for every language
    Plug 'sheerun/vim-polyglot'
    " Additional highlight for rust
    " Plug 'arzg/vim-rust-syntax-ext'
    Plug 'tarekbecker/vim-yaml-formatter'
    " Formatting for Elixir 
    Plug 'mhinz/vim-mix-format'
    Plug 'CraneStation/cranelift.vim'
    " Close brackets for me :)
    Plug 'rstacruz/vim-closer'
    " Type end for me :)
    Plug 'tpope/vim-endwise'
    " Some usefull stuff for ruby/rails
    Plug 'tpope/vim-rails'
    Plug 'tpope/vim-bundler'
    Plug 'tpope/vim-rake'
    " Shortcut to comment anything
    Plug 'tpope/vim-commentary'
    " Surround stuff quickly!
    Plug 'tpope/vim-surround'
    " REPL quickly
    Plug 'rhysd/reply.vim'
  ""
  "" SQL Stuff
    Plug 'tpope/vim-dadbod'
    " Uppercase SQL keywords
    Plug 'alcesleo/vim-uppercase-sql'
  ""
  "" Project explorer
    " Amazing fuzzy finder and global search
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'yuki-ycino/fzf-preview.vim'
    " competitor to fzf
    Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }
    Plug 'tpope/vim-vinegar'
    " Jump to definitions
    Plug 'pechorin/any-jump.vim'
    Plug 'renderedtext/vim-elixir-alternative-files'
  ""
  "" Use env vars in vim :)
    Plug 'tpope/vim-dotenv' " Didn't know where else to put it haha
  ""
  "" Window movements/resizing
    " Moving windows in a non-weird way
    Plug 'andymass/vim-tradewinds'
    " Resize window automatically
    Plug 'roman/golden-ratio'
    " Undo the closing of a window
    Plug 'AndrewRadev/undoquit.vim'
    " Zoom!
    Plug 'dhruvasagar/vim-zoom'
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
    Plug 'rhysd/clever-f.vim'
    " What it says on the tin 
    Plug 'terryma/vim-smooth-scroll'
    " Repeat any command with . -- even plugins!
    Plug 'tpope/vim-repeat'
    " Command to show leader commands
    Plug 'derekprior/vim-leaders'
    " Interact with output of commands
    Plug 'AndrewRadev/bufferize.vim'
  ""
  "" Copy/Move/Paste changes
    " Make delete actually delete instead of cut
    Plug 'svermeulen/vim-cutlass'
    " Substitute text with motions!
    Plug 'svermeulen/vim-subversive'
    " Exchange words with motions!
    Plug 'tommcdo/vim-exchange'
    " Registers stuff
    Plug 'svermeulen/vim-yoink'
  ""
  "" Text manipulation
    " Change arguments position
    Plug 'AndrewRadev/sideways.vim'
    " Change one liners to multiple and vice-versa
    Plug 'AndrewRadev/splitjoin.vim'
    " text moving
    Plug 'matze/vim-move'
    " Increment text-objects
    Plug 'wellle/targets.vim'
    " Continous increment on visual block using C-A
    Plug 'triglav/vim-visual-increment'
    " Enhanced % to recognize language specific bracket open (e.g. if-end) 
    Plug 'andymass/vim-matchup'
    Plug 'kana/vim-textobj-user'
    Plug 'nelstrom/vim-textobj-rubyblock'
    Plug 'michaeljsmith/vim-indent-object'
  ""
  "" Git stuff
    Plug 'airblade/vim-gitgutter'
    Plug 'rhysd/git-messenger.vim'
    Plug 'tpope/vim-fugitive'
    Plug 'christoomey/vim-conflicted'
  ""
  "" Test stuff 
    " Dispatch tests to tmux
    Plug 'tpope/vim-dispatch'
    " All the tests frameworks/languages :D
    Plug 'janko/vim-test'
  ""
  "" Autocompletion/linting
    " autocompletion engine
    Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
    " Autocompletion source
    Plug 'wellle/tmux-complete.vim'
    "Linter :D
    Plug 'w0rp/ale'
  ""
  "" Visual Stuff
    " UI for Dadbod
    Plug 'kristijanhusak/vim-dadbod-ui'
    " Make folding faster :)
    " Plug 'Konfekt/FastFold'
    " Enhanced terminal integration
    Plug 'wincent/terminus'
    " Start screen
    Plug 'mhinz/vim-startify'
    Plug 'junegunn/rainbow_parentheses.vim'
    Plug 'machakann/vim-highlightedyank'
    Plug 'TaDaa/vimade'
    Plug 'Yggdroot/indentLine'
    Plug 'vim-airline/vim-airline'
    Plug 'google/vim-searchindex'
    Plug 'RRethy/vim-illuminate'
    Plug 'ryanoasis/vim-devicons' 
    " Themes!
    Plug 'reedes/vim-thematic' " Theme manager. 
    Plug 'arzg/vim-colors-xcode' 
    Plug 'Nequo/vim-allomancer'
    Plug 'dracula/vim', { 'as': 'dracula-vim' }
    Plug 'endel/vim-github-colorscheme'
    Plug 'jordwalke/vim-taste'
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
    Plug 'NLKNguyen/papercolor-theme'
    Plug 'sjl/badwolf'
    Plug 'drewtempelmeyer/palenight.vim'
    Plug 'rakr/vim-one'
    Plug 'arzg/vim-corvine'
    Plug 'kjssad/quantum.vim'
    Plug 'toupeira/vim-desertink'
    Plug 'neutaaaaan/iosvkem'
    Plug 'lifepillar/vim-colortemplate'
  ""
call plug#end()

set conceallevel=2
let g:polyglot_disabled = ['reason', 'yaml']
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

" This works on neovim only. It shows what
" will be replaced when doing %s//
if exists('&inccommand')
  set inccommand=split
endif

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

let g:tmuxcomplete#trigger = 'omnifunc'

let g:yoinkIncludeDeleteOperations=1

let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit' }
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
let g:airline_section_b = '%{airline#util#wrap(airline#extensions#branch#get_head(),0)}'
let g:airline_section_z = ''
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
let g:airline#extensions#wordcount#formatter#default#fmt = '%d w'

let g:mix_format_on_save = 1
let g:mix_format_silent_errors = 1

let g:rustfmt_autosave = 1
let g:golden_ratio_wrap_ignored = 1

let g:indentLine_char_list = ['|', '¦', '┆', '┊']

nnoremap \ :Rg<SPACE>

command! Config :e ~/.vimrc
command! YankCurrentFilePath let @+ = expand("%")
command! PrettifyJson %!jq '.'
command! Source source ~/config_files/.vimrc 
command! AddDatabase :call AddDatabase()
command! -nargs=0 Format :call CocAction('format')
command! SourceAndInstall source ~/config_files/.vimrc <bar> :PlugInstall

noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 10)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 10)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 10)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 10)<CR>

imap <C-l> <C-o>dw
vmap <F20> <Plug>MoveBlockDown
vmap <F21> <Plug>MoveBlockUp
nmap <F20> <Plug>MoveLineDown
nmap <F21> <Plug>MoveLineUp

" Move between linting errors
nnoremap <M-n> :ALENextWrap<CR>
nnoremap <M-p> :ALEPreviousWrap<CR>
nnoremap <Leader><CR> o<ESC>
nnoremap <Leader>/ :Rg 
nnoremap <Leader>* :Rg <C-r><C-w><CR>
vnoremap <Leader>* :<C-u>call VisualStarSearchSet('/', 'raw')<CR>:call fzf#vim#grep('rg --column --line-number --no-heading --color=always --smart-case '.shellescape(@/), 1,)<CR>
nnoremap <Leader>- :split <CR>
nnoremap <Leader>_ :vsplit <CR> 
nnoremap <Leader>d :call fzf#vim#tags('^' . expand('<cword>'), {'options': '--exact --select-1 --exit-0 +i'})<CR>
nnoremap <Leader>D :call fzf#vim#tags('^' . expand('<cword>'))<CR>
nnoremap <Leader>e :e#<CR>
nnoremap <Leader>p  "+p
nnoremap <Leader>u :UndotreeToggle<cr>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>z :call zoom#toggle() <CR>
nnoremap <Leader>Op  O<ESC>"+p
nnoremap <Leader>op o<ESC>"+p
nnoremap <Leader>bb :Buffers <CR> 
nnoremap <Leader>bl :GBlame<CR>
nnoremap <Leader>cc :Clap<CR>
nnoremap <Leader>ff :FZF<CR>
nnoremap <Leader>fp :FzfPreviewGitFiles<CR>
nnoremap <Leader>gl :GitMessenger<CR>
nnoremap <Leader>fb :FzfPreviewBuffers<CR>
nnoremap <Leader>hh :SidewaysLeft<cr>
nnoremap <Leader>ll :SidewaysRight<cr>
nnoremap <Leader>nh :noh <CR>
nnoremap <Leader>ss :TestNearest<CR>
nnoremap <Leader>yh :Yanks <CR>
nnoremap <Leader>alf :ALEFix <CR>
nnoremap <Leader>aln :ALENextWrap <CR>
nnoremap <Leader>alp :ALEPreviousWrap <CR>
nnoremap <Leader>gdd :Gdiff!<CR>
nnoremap <Leader>gdh :diffget //2<CR>
nnoremap <Leader>gdl :diffget //3<CR>
nnoremap <Leader>lft :Format <CR>
nnoremap <Leader>ral :TestSuite<CR>
nnoremap <Leader>soi :SourceAndInstall<CR>
nnoremap <Leader>sor :Source<CR>

nnoremap rcs :TestFile<CR>
nnoremap rss :TestNearest<CR>
nnoremap rls :TestLast<CR>
nnoremap rsw :GoldenRatioResize<CR>
nnoremap yfp :YankCurrentFilePath<CR>
vnoremap <C-c> "+y

" Use M to cut instead of D
nnoremap m d
xnoremap m d
nnoremap mm dd

" SubversiveSubstitute is a motion from a plugin that makes
" such things as sw substitute a word.
nmap s <plug>(SubversiveSubstitute)
nmap ss <plug>(SubversiveSubstituteLine)
nmap S <plug>(SubversiveSubstituteToEndOfLine)
nmap scm <Plug>(coc-diagnostic-info)
nmap sam <Plug>(ale_detail)

" Scrolling through yank history with c-n and c-p
" It needs the p to paste with the plugin first
nmap p <plug>(YoinkPaste_p)
nmap P <plug>(YoinkPaste_P)
nmap <c-n> <plug>(YoinkPostPasteSwapBack)
nmap <c-p> <plug>(YoinkPostPasteSwapForward)

" Coc stuff to increment vim native commands
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Tab is the same as <C-i>. Yep, really.
inoremap <silent><expr> <C-i> pumvisible() ? coc#_select_confirm() : "<Tab>"

" Use K to show documentation in preview window
nmap <silent> K :call <SID>show_documentation()<CR>
nnoremap <expr>K coc#util#has_float() ? "<C-w>w" : "\K"
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

nnoremap <LEFT>   <c-w><
nnoremap <RIGHT>  <c-w>>
nnoremap <UP>     <c-w>+
nnoremap <DOWN>   <c-w>-
nnoremap <M-Left> :bp<CR>
nnoremap <M-Right> :bn<CR>
nnoremap <M-Down> :bd<CR>

autocmd StdinReadPre * let s:std_in=1
au InsertLeave * set nopaste

set tags=./tags;,tags;

tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
tnoremap <C-t> <C-\><C-n>

function! s:change_color(name)
  execute 'colorscheme '.a:name
  execute 'hi Search guibg=none guifg=none gui=underline'
  execute 'hi illuminatedWord cterm=italic gui=italic'
endfunction
set background=dark
call s:change_color("focuspoint")

if has('nvim')
  hi Search guibg=none guifg=none gui=underline
else
  " set Vim-specific sequences for RGB colors
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif



let g:ale_fixers = {
      \ 'ruby': [ 'rubocop' ],
      \ 'python': ['add_blank_lines_for_python_control_statements', 'autopep8', 'black', 'isort', 'reorder-python-imports', 'yapf'],
      \ }
let g:ale_rust_cargo_use_clippy = 1

au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

autocmd BufWritePost *.rs normal! zv

let g:ale_linters = {
      \  'javascript': ['eslint'],
      \  'rust': ['analyzer'],
      \}
let g:ale_sign_error = '>>'
let g:ale_sign_info = '--'

augroup FiletypeGroup
    autocmd!
    au BufNewFile,BufRead *.jsx set filetype=javascript.jsx
augroup END
augroup FILETYPES
  autocmd FileType markdown let b:indentLine_enabled = 0
augroup END
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } } 
let g:clap_theme = 'material_design_dark'
let g:golden_ratio_autocommand = 0
let g:any_jump_search_prefered_engine = 'ag'

let g:postgres = 'postgres://postgres:password@localhost:5432/'
let g:database = ''
function! AddDatabase()
  let db_name = input('Enter database name: ')
  call inputrestore()
  let g:database = g:postgres . db_name
  redraw
  echom 'Database URL:' . g:database
endfun

let g:dbs = {
\  'dev': g:database
\ }
