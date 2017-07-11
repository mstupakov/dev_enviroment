" General settings
set nocompatible
set number
set expandtab
set autoread
set splitright
set splitbelow

set ignorecase
set hidden

set tabstop=2
set shiftwidth=2
set laststatus=2

set hlsearch
set incsearch
set cursorline
set scrolloff=4
"set colorcolumn=100
set showtabline=2
set lazyredraw

set listchars=tab:..
set list

syntax on

" Leader key
let g:mapleader=','

" Background color
set background=dark

" Clipboard buffer
set clipboard=unnamedplus

" Send more characters for redraws
set ttyfast

" Enable mouse use in all modes
set mouse=a

" Set this to the name of your terminal that supports mouse codes.
" Must be one of: xterm, xtsetlocal foldmethod=syntaxerm2, netterm, dec, jsbterm, pterm
set ttymouse=xterm2

" To make backspace work in Vim 8.0
set backspace=indent,eol,start

" Pop up help menu
set wildchar=<Tab> wildmenu wildmode=full

set backup
set writebackup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

if version >= 700
    set history=64
    set undolevels=128
    set undodir=~/.vim/undodir/
    set undofile
    set undolevels=1000
    set undoreload=10000
endif

" SYNTAX: Folding (ToDo: http://vim.wikia.com/wiki/Folding) 
set foldcolumn=1
"set foldmethod=syntax

" GUI: Appereance 
set guioptions-=e  "remove tab bar
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
set guioptions-=M  "remove left-hand scroll bar

" GUI: Font
silent! set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 9

" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')

" On-demand loading

" SESSION: Session support
Plug 'xolox/vim-session'
Plug 'xolox/vim-misc'

" SESSION: Startup desctop
"Plug 'mhinz/vim-startify'

" NAVIGATE: NerdTree
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" NAVIGATE: Easymotion
Plug 'easymotion/vim-easymotion'

" NAVIGATE: FZF file finder
Plug 'junegunn/fzf'

" NAVIGATE: Shows bookmarks
Plug 'kshenoy/vim-signature'

" NAVIGATE: Grep
Plug 'dkprice/vim-easygrep'

" NAVIGATE: Move acceleration
Plug 'rhysd/accelerated-jk'

" APPEREANCE: Gruvbox colors
Plug 'morhetz/gruvbox'

" APPEREANCE: Vim airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" APPEREANCE: Hides multiple cursorline
Plug 'vim-scripts/CursorLineCurrentWindow'

" APPEREANCE: Improves different icons
Plug 'ryanoasis/vim-devicons'
"Plugin 'ryanoasis/vim-webdevicons'

" AUTOCOMPLITER: Clang YCM-complite
Plug 'Valloric/YouCompleteMe'

" TAGS: Clang YCM-generator
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" TAGS: Clang rtags 
Plug 'lyuts/vim-rtags'

" TAGBAR: Shows symbol information
Plug 'majutsushi/tagbar'

" TAGBAR: Shows symbol information
Plug 'taglist.vim'

" GIT: wrapper under GIT
Plug 'tpope/vim-fugitive'

" GIT: highlights recently made changes
Plug 'airblade/vim-gitgutter'

" GIT: GitV shows log
Plug 'gregsexton/gitv'

" SYNTAX: Auto-pairs
Plug 'jiangmiao/auto-pairs'

" SYNTAX: Easy align
Plug 'junegunn/vim-easy-align'

" SYNTAX: Auto code commenter
"Plug 'scrooloose/nerdcommenter'

" INTERFACE: Window maximizer
Plug 'szw/vim-maximizer'

" SUPPORT: Mouse, Copy-Paste, ...
Plug 'wincent/terminus'

" GDB: Debugging in VIM
" Plug 'vim-scripts/Conque-GDB'

" Initialize plugin system
call plug#end()


" SESSION: Session support
let g:session_autoload = 'yes'
let g:session_autosave = 'yes'
let g:session_autosave_periodic = 5
let g:session_autosave_silent = 1
let g:session_default_to_last = 1
nmap <F12> :OpenTabSession<CR>

" NAVIGATE: NerdTree
let NERDTreeIgnore = ['\.o$', '\.a$', '\.d$', '\.i$', '\.pyc$']
map <C-n> :NERDTreeToggle<CR>

" NAVIGATE: Easymotion
let g:EasyMotion_smartcase = 1
let g:EasyMotion_do_shade = 0
hi link EasyMotionTarget Search
map <Leader> <Plug>(easymotion-prefix)

" NAVIGATE: FZF file finder
nmap <F2> :FZF<CR>

" NAVIGATE: Grep
map <C-g> :Grep<space>
let g:EasyGrepCommand = 1
let g:EasyGrepRecursive = 1
let g:EasyGrepIgnoreCase = 0
let g:EasyGrepFilesToExclude = "
                   \.svn,
                   \.git,
                   \node_modules,
                   \tags,
                   \cscope*,
                   \*compile_commands.json,
                   \*.d
                   \*.so,
                   \*.ko,
                   \*.o,
                   \*.a,
                   \*.i,
                   \"

" NAVIGATE: Move acceleration
"nmap j <Plug>(accelerated_jk_gj)
"nmap k <Plug>(accelerated_jk_gk)

" APPEREANCE: Color scheme
colorscheme gruvbox

" APPEREANCE: Vim airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tagbar#enabled = 1
"let g:airline#extensions#tabline#enabled = 1
"let g:airline_theme='tomorrow'

" AUTOCOMPLITER: Clang YCM-complite
let g:ycm_confirm_extra_conf = 0
let g:ycm_complete_in_comment = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_autoclose_preview_window_after_completion = 0
let g:ycm_autoclose_preview_window_after_insertion = 1

let g:ycm_filetype_blacklist = {
      \ 'tagbar' : 1,
      \ 'qf' : 1,
      \ 'notes' : 1,
      \ 'markdown' : 1,
      \ 'unite' : 1,
      \ 'text' : 1,
      \ 'vimwiki' : 1,
      \ 'pandoc' : 1,
      \ 'infolog' : 1,
      \ 'mail' : 1,
      \ 'fugitiveblame' : 1,
      \ 'fugitive*' : 1
      \}

"let g:ycm_filetype_specific_completion_to_disable = {
"      \   'c': 1,
"      \   'gitcommit': 1,
"      \ }
"
"let g:ycm_filetype_blacklist = {
"      \   'notes': 1,
"      \   'unite': 1,
"      \   'tagbar': 1
"      \ }

let g:ycm_key_detailed_diagnostics = '<leader>d'
let g:ycm_goto_buffer_command = 'vertical-split'

let g:clang_library_path='/usr/lib/llvm-3.7/lib/'

highlight YcmErrorLine guibg = #3f0000

" TAGBAR: Shows symbol information
let g:tagbar_show_linenumbers = -1
let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1
let g:tagbar_sort = 0
let g:tagbar_autopreview = 0
let g:tagbar_previewwin_pos = "rightbelow vertical"
let g:tagbar_silent = 1
nnoremap <silent> <F9> :TagbarToggle<CR>

" BUFFERS: managing buffers
nmap <F10> :buffers<CR>:buffer<Space>

" GIT: wrapper under GIT
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gs :Gstatus<CR>

" GIT: GitV shows log
nnoremap <Leader>gl :Gitv<CR>

" GDB: Debugging in VIM
" let g:ConqueTerm_Color = 2         " 1: strip color after 200 lines, 2: always with color
" let g:ConqueTerm_CloseOnEnd = 1    " close conque when program ends running
" let g:ConqueTerm_StartMessages = 0 " display warning messages if conqueTerm is configured incorrectly  

" GLOBAL: Column color
"highlight ColorColumn ctermbg=darkgray

