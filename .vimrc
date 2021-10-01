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

let g:polyglot_disabled = ['reason', 'yaml']
call plug#begin('~/.vim/plugged')
Plug 'tweekmonster/startuptime.vim'
  "" Language stuff
    " Language syntax for every language
    Plug 'sheerun/vim-polyglot'
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
    " Some usetull stuff for php/laravel
    Plug 'noahfrederick/vim-composer'
    Plug 'noahfrederick/vim-laravel'
    " Shortcut to comment anything
    Plug 'tpope/vim-commentary'
    " Surround stuff quickly!
    Plug 'tpope/vim-surround'
    " REPL quickly
    Plug 'rhysd/reply.vim'
    " Check versions of packages from crates.io
    Plug 'mhinz/vim-crates'
    " Disable stuff for giant files
    Plug 'mhinz/vim-hugefile'
    " Try out treesitter and some modules
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  
    Plug 'folke/twilight.nvim'
    Plug 'nvim-treesitter/playground' 
    Plug 'SmiteshP/nvim-gps' 
    Plug 'nvim-treesitter/nvim-treesitter-textobjects'
    Plug 'nvim-treesitter/nvim-treesitter-refactor'
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
    " competitor to fzf
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
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
    Plug 'beauwilliams/focus.nvim'
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
    " Plug 'rhysd/clever-f.vim'
    Plug 'justinmk/vim-sneak'
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
    " Extract variable
    Plug 'da-x/name-assign.vim'
    " Change arguments position
    Plug 'AndrewRadev/sideways.vim'
    " Change one liners to multiple and vice-versa
    Plug 'AndrewRadev/splitjoin.vim'
    " text moving
    Plug 'matze/vim-move'
    " Change case types
    Plug 'arthurxavierx/vim-caser'
    " Increment text-objects
    Plug 'wellle/targets.vim'
    " Continous increment on visual block using C-A
    Plug 'triglav/vim-visual-increment'
    " Enhanced % to recognize language specific bracket open (e.g. if-end) 
    Plug 'andymass/vim-matchup'
    Plug 'kana/vim-textobj-user'
    Plug 'nelstrom/vim-textobj-rubyblock'
    Plug 'michaeljsmith/vim-indent-object'
    Plug 'junegunn/vim-easy-align'
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
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " Autocompletion source
    Plug 'wellle/tmux-complete.vim'
    "Linter :D
    Plug 'w0rp/ale'
  ""
  "" Visual Stuff
    " UI for Dadbod
    Plug 'kristijanhusak/vim-dadbod-ui'
    " Enhanced terminal integration
    Plug 'wincent/terminus'
    " Start screen
    Plug 'mhinz/vim-startify'
    Plug 'junegunn/rainbow_parentheses.vim'
    Plug 'machakann/vim-highlightedyank'
    Plug 'sunjon/shade.nvim'
    Plug 'lukas-reineke/indent-blankline.nvim'
    " Plug 'vim-airline/vim-airline'
    Plug 'windwp/windline.nvim'
    Plug 'google/vim-searchindex'
    Plug 'RRethy/vim-illuminate'
    Plug 'ryanoasis/vim-devicons' 
    Plug 'kyazdani42/nvim-web-devicons'
    "" Themes!
      Plug 'Rigellute/rigel'
      Plug 'bluz71/vim-nightfly-guicolors'
      Plug 'chase/focuspoint-vim'
      Plug 'danilo-augusto/vim-afterglow'
      Plug 'drewtempelmeyer/palenight.vim'
      Plug 'endel/vim-github-colorscheme'
      Plug 'kristijanhusak/vim-hybrid-material'
      Plug 'neutaaaaan/iosvkem'
      Plug 'rakr/vim-one'
      Plug 'rakr/vim-two-firewatch'
      Plug 'EdenEast/nightfox.nvim'
      Plug 'sts10/vim-pink-moon'
      Plug 'folke/tokyonight.nvim'
      Plug 'sjl/badwolf'
      Plug 'toupeira/vim-desertink'
    ""
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

let g:sneak#s_next = 1
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
let g:airline_section_b = '%{airline#util#wrap(airline#extensions#branch#get_head(),0)[0:40]}'
let g:airline_section_x= '%{NvimGps()}'
let g:airline_section_z = ''
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
let g:airline#extensions#wordcount#formatter#default#fmt = '%d w'

let g:mix_format_on_save = 1
let g:mix_format_silent_errors = 1

let g:rustfmt_autosave = 1

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

map f <Plug>Sneak_s
map F <Plug>Sneak_S

" Move between linting errors
nnoremap <M-n> :ALENextWrap<CR>
nnoremap <M-p> :ALEPreviousWrap<CR>
nnoremap <Leader><CR> o<ESC>
nnoremap <Leader>/ :Rg 
" nnoremap <Leader>* :Rg <C-r><C-w><CR>
nnoremap <Leader>* :Telescope grep_string<CR>
vnoremap <Leader>* :<C-u>call VisualStarSearchSet('/', 'raw')<CR>:call fzf#vim#grep('rg --column --line-number --no-heading --color=always --smart-case '.shellescape(@/), 1,)<CR>
nnoremap <Leader>- :split <CR>
nnoremap <Leader>_ :vsplit <CR> 
nnoremap <Leader>d :call fzf#vim#tags('^' . expand('<cword>'), {'options': '--exact --select-1 --exit-0 +i'})<CR>
nnoremap <Leader>D :call fzf#vim#tags('^' . expand('<cword>'))<CR>
nnoremap <Leader>e :e#<CR>
nnoremap <Leader>p  "+p
nnoremap <Leader>u :UndotreeToggle<cr>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>z :FocusMaximise <CR>
nnoremap <Leader>} :call GitGutterNextHunkCycle() <CR>
nnoremap <Leader>{ :GitGutterPrevHunk <CR>
" nnoremap <Leader>bb :Buffers <CR> 
nnoremap <Leader>bb :Telescope buffers<CR>
nnoremap <Leader>bl :Gblame<CR>
nnoremap <Leader>bp obinding.pry<ESC>
nnoremap <Leader>cb :make build<CR>
nnoremap <Leader>cc :Clap<CR>
nnoremap <Leader>cf :Clap files<CR>
nnoremap <Leader>cr :Dispatch cargo run<CR>
nnoremap <Leader>cu :call crates#up() <CR>
" nnoremap <Leader>ff :Files<CR>
nnoremap <Leader>ff :Telescope find_files<CR>
nnoremap <Leader>gg :Git<CR>
nnoremap <Leader>hh :SidewaysLeft<cr>
nnoremap <Leader>ll :SidewaysRight<cr>
nnoremap <Leader>nh :noh <CR>
nnoremap <Leader>op o<ESC>"+p
nnoremap <Leader>Op  O<ESC>"+p
nnoremap <Leader>ss :TestNearest<CR>
nnoremap <Leader>uh :GitGutterUndoHunk <CR>
nnoremap <Leader>yh :Yanks <CR>
nnoremap <Leader>alf :ALEFix <CR>
nnoremap <Leader>aln :ALENextWrap <CR>
nnoremap <Leader>alp :ALEPreviousWrap <CR>
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

" Use C-n to trigger autocompletion for coc
inoremap <silent><expr> <c-n> coc#refresh()

" Use gp and gn to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> gp <Plug>(coc-diagnostic-prev)
nmap <silent> gn <Plug>(coc-diagnostic-next)

" Use K to show documentation in preview window
" This isn't working - will have to debug
nmap <silent> K :call <SID>show_documentation()<CR>
nnoremap <expr>K coc#util#has_float() ? "<C-w>w" : "\K"

function! NvimGps() abort
	if luaeval("require'nvim-gps'.is_available()") 
    return  luaeval("require'nvim-gps'.get_location()") 
  endif
endfunction

function! GitGutterNextHunkCycle()
  let line = line('.')
  silent! GitGutterNextHunk
  if line('.') == line
    1
    GitGutterNextHunk
  endif
endfunction

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
call s:change_color("nightfox")

if has('nvim')
  hi Search guibg=none guifg=none gui=underline
  autocmd BufRead Cargo.toml call crates#toggle()
else
  " set Vim-specific sequences for RGB colors
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

let g:git_messenger_floating_win_opts = { 'border': 'single' }
let g:ale_fixers = {
      \ 'python': ['add_blank_lines_for_python_control_statements', 'autopep8', 'black', 'isort', 'reorder-python-imports', 'yapf'],
      \ }
let g:ale_ruby_rubocop_executable  = 'bundle' " use this to call rubocop with bundle exec
let g:ale_rust_cargo_use_clippy = 1

au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

autocmd BufWritePost *.rs normal! zv

let g:ale_linters = {
      \  'javascript': ['eslint'],
      \  'rust': ['analyzer'],
      \  'ruby': ['brakeman', 'reek', 'rubocop', 'solargraph', 'standardrb'],
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
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } } 
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

let g:coc_global_extensions = ['coc-json', 'coc-syntax', 'coc-omni', 'coc-rust-analyzer', 'coc-solargraph', 'coc-prettier']

lua << EOF
  require('telescope').setup({
    defaults = {
      layout_config = {
        horizontal = { width = 0.85 }
        },
      },
  })
  require('telescope').load_extension('fzf')

  require('twilight').setup({})

  require("nvim-gps").setup({})

  require("focus").setup({})

  require("indent_blankline").setup {
    buftype_exclude = {"terminal"}
    }

  require('shade').setup({
    overlay_opacity = 50,
    opacity_step = 1,
  })

  require('wlsample.airline')
  require('wlfloatline').setup()

  require('nvim-treesitter.configs').setup({
    textobjects = {
      select = {
        enable = true,

        -- Automatically jump forward to textobj, similar to targets.vim 
        lookahead = true,

        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",
        },
      },
      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_next_start = {
          ["]]"] = "@function.outer",
          ["gb"] = "@block.outer",
        },
        goto_next_end = {
          ["]e"] = "@function.outer",
        },
        goto_previous_start = {
          ["[["] = "@function.outer",
          ["gB"] = "@block.outer",
        },
        goto_previous_end = {
          ["[e"] = "@function.outer",
        },
      },
    },
  })

  require('nvim-treesitter.configs').setup({
    refactor = {
      smart_rename = {
        enable = true,
        keymaps = {
          smart_rename = "grr",
        },
      },
    },
  })
EOF
