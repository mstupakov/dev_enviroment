set directory=~/.vim/tmp

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
set softtabstop=2

set smarttab
set expandtab
set autoindent
set smartindent

set hlsearch
set incsearch
set cursorline
set scrolloff=4
"set colorcolumn=100
set showtabline=2
set lazyredraw

set listchars=tab:..
set list

set encoding=UTF-8

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

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
" set ttymouse=xterm2

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

" Return to last edit position when opening files
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

" Automatically clean trailing whitespaces on save
fun! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun

autocmd BufWritePre *.* :call <SID>StripTrailingWhitespaces()

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
"Plug 'junegunn/fzf'

" NAVIGATE: Navigate through files
Plug 'ctrlpvim/ctrlp.vim'

" NAVIGATE: Navigate through files telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" NAVIGATE: Shows bookmarks
Plug 'kshenoy/vim-signature'

" NAVIGATE: Grep
Plug 'dkprice/vim-easygrep'

" NAVIGATE: Grep-analog
"Plug 'mileszs/ack.vim'

" NAVIGATE: Move acceleration
Plug 'rhysd/accelerated-jk'

" APPEREANCE: Colors schemes
Plug 'rafi/awesome-vim-colorschemes'

" APPEREANCE: Vim airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" APPEREANCE: Hides multiple cursorline
Plug 'vim-scripts/CursorLineCurrentWindow'

" APPEREANCE: Improves different icons
Plug 'ryanoasis/vim-devicons'
"Plug 'ryanoasis/vim-webdevicons'

" APPEREANCE: Converts color id to color
Plug 'ap/vim-css-color'

" AUTOCOMPLITER: Coc
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}

" TAGS: Clang rtags
" Plug 'lyuts/vim-rtags'

" TAGBAR: Shows symbol information
Plug 'majutsushi/tagbar'
" Plug 'preservim/tagbar'

" TAGBAR: Shows symbol information
" Plug 'taglist.vim'

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

" SYNTAX: Highlights whitespaces
Plug 'ntpeters/vim-better-whitespace'

" SYNTAX: Auto code commenter
"Plug 'scrooloose/nerdcommenter'

" INTERFACE: Window maximizer
Plug 'szw/vim-maximizer'

" SUPPORT: Mouse, Copy-Paste, ...
Plug 'wincent/terminus'

" GDB: Debugging in VIM
" Plug 'vim-scripts/Conque-GDB'

" NAVIGATE: Go to line, file.txt:3
Plug 'bogado/file-line'

" NAVIGATE: Ctrl+hjkl
Plug 'christoomey/vim-tmux-navigator'

" SYNTAX: Snippets
Plug 'honza/vim-snippets'

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
function! ToggleNERDTree()
  NERDTreeToggle
  silent NERDTreeMirror
endfunction

let NERDTreeIgnore = ['\.o$', '\.a$', '\.d$', '\.i$', '\.pyc$']
map <C-n> :call ToggleNERDTree()<CR>

" NAVIGATE: Easymotion
let g:EasyMotion_smartcase = 1
let g:EasyMotion_do_shade = 0
hi link EasyMotionTarget Search
map <Leader> <Plug>(easymotion-prefix)

" NAVIGATE: FZF file finder
nmap <F2> :FZF<CR>

" NAVIGATE: Navigate through files
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.tar,*.tar.gz  " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.exe                          " Windows
set wildignore+=*.d,*.o.cmd,*.o,*.a                      " Development

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

"let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux
"let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" NAVIGATE: Navigate through files telescope
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

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
let g:airline#extensions#tabline#enabled = 1
"let g:airline_theme='tomorrow'

" TAGBAR: Shows symbol information
" let g:tagbar_show_linenumbers = -1
" let g:tagbar_autoclose = 1
" let g:tagbar_autofocus = 1
" let g:tagbar_sort = 0
" let g:tagbar_autopreview = 0
" let g:tagbar_previewwin_pos = "rightbelow vertical"
" let g:tagbar_silent = 1
nnoremap <silent> <F9> :TagbarToggle<CR>

" BUFFERS: managing buffers
nmap <F10> :buffers<CR>:buffer<Space>

" BUFFERS: paste mode
set pastetoggle=<F5>

" TABS: navigating
nnoremap tn :tabnext<CR>
nnoremap tp :tabprev<CR>
nnoremap tt :tabnew<CR>
nnoremap tj :tabfirst<CR>
nnoremap tk :tablast<CR>
nnoremap te :tabedit<Space>
nnoremap tm :tabm<Space>
nnoremap t% :tabclose<CR>

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

" AUTOCOMPLITER: Coc
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
