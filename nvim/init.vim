" GENERAL {{{1
set nocompatible            " be iMproved
set encoding=utf-8          " use unicode everywhere
set timeout ttimeoutlen=50  " timeout 50 milliseconds on key codes
set hidden                  " allow unsaved buffers
set ttyfast                 " indicates fast terminal connection
set tildeop                 " use '~' (case changing) as operator
set mouse=a                 " use mouse in all modes
set clipboard+=unnamed      " yanks go to clipboard instead
set autowrite               " writes on make/shell commands
set autoread                " reads on make/shell commands
set ignorecase              " ignore case completely
set smartcase               " be case sensitive when input has a capital letter
set path=**
let g:is_posix = 1          " use modern version of builtin shell

" BACKUPS {{{1
" Save your backups to a less annoying place than the current directory.
" If you have .vim-backup in the current directory, it'll use that.
" Otherwise it saves it to ~/.vim/backup or . if all else fails.
if isdirectory($HOME . '/.vim/backup') == 0
  :silent !mkdir -p ~/.vim/backup >/dev/null 2>&1
endif
set backupdir-=.
set backupdir+=.
set backupdir-=~/
set backupdir^=~/.vim/backup/
set backupdir^=./.vim-backup/
set backup

" Save your swp files to a less annoying place than the current directory.
" If you have .vim-swap in the current directory, it'll use that.
" Otherwise it saves it to ~/.vim/swap, ~/tmp or .
if isdirectory($HOME . '/.vim/swap') == 0
  :silent !mkdir -p ~/.vim/swap >/dev/null 2>&1
endif
set directory=./.vim-swap//
set directory+=~/.vim/swap//
set directory+=~/tmp//
set directory+=.

" viminfo stores the the state of your previous editing session
set viminfo+=n~/.vim/viminfo

if exists("+undofile")
  " undofile - This allows you to use undos after exiting and restarting
  " This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
  " :help undo-persistence
  " This is only present in 7.3+
  if isdirectory($HOME . '/.vim/undo') == 0
    :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
  endif
  set undodir=./.vim-undo//
  set undodir+=~/.vim/undo//
  set undofile
endif

" VISUAL {{{1
syntax on                   " enable syntax highlighting
set showmatch               " show matching brackets
set matchtime=2             " bracket blinking
set visualbell              " use visualbell instead of beeping
set colorcolumn=81          " use color column
"set number                  " show line numbers
"set relativenumber          " use relative line numbering
set title                   " set title of terminal window to filename
set showcmd                 " always show current command
set foldenable              " turn on folding
set foldmethod=marker       " fold on the marker
set foldlevel=100           " don't autofold anything
set scrolloff=5             " keep 5 lines below and above the cursor
set hlsearch                " highlight search
set incsearch               " show matches while typing
set laststatus=2            " always show status line
set wildmenu                " enhanced command-line completion
set wildmode=full           " at command line, complete longest string
set wildignorecase          " ignore case in file name completion
"set t_Co=256                " terminal has 256 colors
"set t_ut=

"if (has("nvim"))
"  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"endif

"if (has("termguicolors"))
"  set termguicolors
"endif

" show tabs as '  ', trailing spaces as '.', and carrots for extended lines
set listchars=""
set listchars=tab:\ \ 
set listchars+=trail:.
set listchars+=extends:>
set listchars+=precedes:<

" FORMATTING {{{1
set nowrap                  " don't wrap text by default
set textwidth=0             " don't break lines while inserting
set tabstop=2               " tab size equals 2 spaces
set softtabstop=2           " 2 spaces that <Tab> use while editing
set shiftwidth=2            " default shift width for indents
set expandtab               " replace tabs with 'tabstop' spaces
set smarttab                " <Tab> inserts 'shiftwidth' spaces
set shiftround              " round indent to multiple of 'shiftwidth'
set autoindent              " copy indent from previous line
set smartindent             " use smart indenting
set cindent                 " use smart indenting for C-like languages

" KEYBINDINGS {{{1
let mapleader="\<Space>"           " set leader key to 'space'
set pastetoggle=<F4>               " toggle between paste and normal

" type 'jj' in insert mode to go to command mode
inoremap jj <ESC>

" L-h to clear highlighting after search
nnoremap <leader>h :noh<cr>

" L-l to make new vertical split and jump to it
noremap <leader>l <C-w>v<C-w>l

" L-j to make new vertical split and jump to it
noremap <leader>j <C-w>s<C-w>j

" TAB and Shift-TAB for tab switching in normal mode
nnoremap <TAB> gt
nnoremap <S-TAB> gT

nmap <silent> <leader>d <Plug>DashSearch

nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>

map <Leader>bg :let &background = ( &background == "dark"? "light" : "dark" )<CR>

vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" VIM-PLUG INITIALIZATION {{{1
call plug#begin('~/.local/share/nvim/plugged')

" PLUGINS: COLORSCHEMES {{{1
Plug 'altercation/vim-colors-solarized'
Plug 'oguzbilgic/sexy-railscasts-theme'
Plug 'atelierbram/vim-colors_duotones'
Plug 'hukl/Smyck-Color-Scheme/'
Plug 'telamon/vim-color-github'
Plug 'tpope/vim-vividchalk'
Plug 'morhetz/gruvbox/'
Plug 'dracula/vim'
Plug 'dylanaraps/wal.vim'
Plug 'TechnoGate/janus-colors'
Plug 'junegunn/seoul256.vim'
Plug 'whatyouhide/vim-gotham'
Plug 'eddsteel/vim-vimbrant'
Plug 'larssmit/vim-getafe'
"Plug 'Color-Sampler-Pack'
Plug 'jnurmine/Zenburn'
Plug 'sjl/badwolf'
" Plug 'Mustang2'
" Plug 'Guardian'
" Plug 'molokai'
" Plug 'Wombat'
Plug 'ayu-theme/ayu-vim'
Plug 'rakr/vim-one'
Plug 'joshdick/onedark.vim'
Plug 'jacoborus/tender.vim'
" Plug 'vim-colors-pencil'
Plug 'AlessandroYorba/Alduin'
Plug 'AlessandroYorba/Despacio'
Plug 'AlessandroYorba/Sierra'
Plug 'rakr/vim-two-firewatch'
Plug 'nightsense/seabird'
Plug 'w0ng/vim-hybrid'

" PLUGINS: GENERAL {{{1
"Plug 'Shougo/vimproc.vim', { 'do': './make' }
"Plug 'terryma/vim-expand-region'
"Plug 'Shougo/denite.nvim'
"Plug 'tpope/vim-fireplace'
"Plug 'blindFS/vim-taskwarrior'
Plug 'bronson/vim-trailing-whitespace'
Plug 'easymotion/vim-easymotion'
"Plug 'tpope/vim-unimpaired'
"Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
Plug 'tpope/vim-commentary'
Plug 'junegunn/vim-easy-align'
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" " Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
"Plug 'freitass/todo.txt-vim'
"Plug 'reedes/vim-pencil'
"Plug 'tpope/vim-surround'
"Plug 'jlanzarotta/bufexplorer'
"Plug 'xolox/vim-easytags'
"Plug 'tpope/vim-fugitive'
"Plug 'tpope/vim-repeat'

"Plug 'AndrewRadev/splitjoin.vim'
"Plug 'AndrewRadev/sideways.vim'
"Plug 'mattn/webapi-vim'
"Plug 'neilagabriel/vim-geeknote'
"Plug 'xolox/vim-notes'
"Plug 'xolox/vim-misc'
"Plug 'wakatime/vim-wakatime'
"Plug 'spolu/dwm.vim'
" Plug 'workflowish'
" Plug 'vimwiki'
"Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --gocode-completer --tern-completer' }
"let g:ycm_semantic_triggers = {
      \  'tex'  : ['{'],
      \ }
"let g:ycm_python_binary_path = 'python3'

"Plug 'rizzatti/funcoo.vim'
"Plug 'rizzatti/dash.vim'
"Plug 'lervag/vimtex'
"Plug 'LaTeX-Box-Team/LaTeX-Box'

"Plug 'fatih/vim-go'

"Plug 'tpope/vim-obsession'
"
" Plug 'morhetz/gruvbox'
Plug 'dylanaraps/wal.vim'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" Plug 'scrooloose/nerdtree'
" Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'jistr/vim-nerdtree-tabs'
Plug 'junegunn/vim-github-dashboard'

Plug 'majutsushi/tagbar'
nmap <Leader>t :TagbarToggle<CR>

"Plug 'scrooloose/syntastic'
"let g:syntastic_enable_signs=1
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0


"Plug 'kien/ctrlp.vim'
"let g:ctrlp_map='<c-t>'
"let g:ctrlp_cmd='CtrlP'
"let g:ctrlp_extensions = ['tag']

"Plug 'MarcWeber/vim-addon-mw-utils'
"Plug 'tomtom/tlib_vim'
"Plug 'honza/vim-snippets'
"Plug 'garbas/vim-snipmate'
"Plug 'mhinz/vim-startify'

"Plug 'lyokha/vim-xkbswitch'
"let g:XkbSwitchEnabled = 0
"let g:XkbSwitchLib = '/Users/arthur/dotfiles/vim/libxkbswitch.dylib'

Plug 'mbbill/undotree'
nnoremap <F5> :UndotreeToggle<CR>

" Plug 'YankRing.vim'
" let g:yankring_history_file='.yankring_history'

"Plug 'christoomey/vim-tmux-navigator'

"Plug 'benmills/vimux'
"let VimuxUseNearestPane = 1

" Prompt for a command to run
"noremap <Leader>vp :VimuxPromptCommand<CR>
" Run last command executed by Vimux
"noremap <Leader>vl :VimuxRunLastCommand<CR>
" Inspect runner pane
"noremap <Leader>vi :VimuxInspectRunner<CR>
" Close all other tmux panes in current window
"noremap <Leader>vx :VimuxCloseRunner<CR>
" Interrupt any command running in the runner pane
"noremap <Leader>vs :VimuxInterruptRunner<CR>
" Zoom on runner pane
"noremap <Leader>vz :VimuxZoomRunner<CR>

"Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'

" PLUGINS: VISUAL {{{1
Plug 'junegunn/goyo.vim'
Plug 'miyakogi/seiya.vim'
let g:seiya_auto_enable=1
let g:seiya_target_groups = has('nvim') ? ['guibg'] : ['ctermbg']
"Plug 'myusuf3/numbers.vim'
Plug 'junegunn/limelight.vim'
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
" Plugin 'CSApprox'
" Plug 'ScrollColors'
Plug 'airblade/vim-gitgutter'
let g:gitgutter_sign_added='┃'
let g:gitgutter_sign_modified='┃'
let g:gitgutter_sign_removed='◢'
let g:gitgutter_sign_removed_first_line='◥'
let g:gitgutter_sign_modified_removed='◢'

Plug 'junegunn/rainbow_parentheses.vim'
au VimEnter * RainbowParentheses

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tmuxline#enabled = 0

"Plug 'edkolev/tmuxline.vim'
"Plug 'weihanglo/tmuxline.vim'
"let g:tmuxline_theme = 'vim_statusline_3'
"let g:tmuxline_powerline_separators = 1
"let g:tmuxline_preset = 'minimal'

"Plug 'edkolev/promptline.vim'

"Plug 'nathanaelkane/vim-indent-guides'
" let g:indent_guides_enable_on_vim_startup=1
"let g:indent_guides_guide_size=1
"Plug 'Yggdroot/indentLine'
"Plug 'kshenoy/vim-signature'

" Plug 'jeaye/color_coded'



" PLUGINS: SYNTAXES {{{1
Plug 'sheerun/vim-polyglot'
" Plug 'VimClojure'
" Plug 'csv.vim'

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-github-dashboard'
Plug 'mhinz/vim-startify'
Plug 'mhinz/vim-janah'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'

Plug 'ryanoasis/vim-devicons'
Plug 'vimwiki/vimwiki'
let g:vimwiki_list = [{'path':'~/Dropbox/wiki', 'path_html':'~/Dropbox/export/html/'}]
nmap <Leader>tt <Plug>VimwikiToggleListItem

Plug 'w0rp/ale'
let g:airline#extensions#ale#enabled = 1
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'sheerun/vim-polyglot'

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'jistr/vim-nerdtree-tabs'
map <Leader>n <plug>NERDTreeTabsToggle<CR>
"Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

call plug#end()

" PLUGINS: CONFIGURATION {{{1
"let g:sierra_Pitch=1
"let g:gruvbox_italic=1
"let g:two_firewatch_italics=1
"let g:airline_theme='one'
"let g:one_allow_italics = 1
"let g:onedark_terminal_italics = 1

"let g:airline_theme='twofirewatch'
"let iterm_profile = $ITERM_PROFILE
"if iterm_profile == "dark"
"    set background=dark
"else
"    set background=light
"endif

" let ayucolor="light"  " for light version of theme
"let ayucolor="mirage" " for mirage version of theme
"let ayucolor="dark"   " for dark version of theme
colorscheme wal


if (has("gui"))
  set guifont=Fira\ Code:h16
  set guioptions=gmac
  set fullscreen
  set macligatures
  set macthinstrokes
endif

" set rtp+=/usr/local/opt/fzf

" configures CtrlP to use git or silver searcher for autocompletion
" https://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
"let g:ctrlp_use_caching = 0
"if executable('ag')
"    set grepprg=ag\ --nogroup\ --nocolor
"    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
"else
"  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
"  let g:ctrlp_prompt_mappings = {
"    \ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
"    \ }
"endif

" Different cursor for insert mode in iTerm2, with tmux workaround.
" https://gist.github.com/1195581
if exists('$ITERM_PROFILE')
  if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
  else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
  endif
endif

" FUNCTIONS {{{1
function! Today()
    let today = strftime("%A %m\/%d\/%Y")
    exe "normal a". today
endfunction
command! Today :call Today()

" See http://jeetworks.org/node/89 for explanation
function! DelEmptyLineAbove()
    if line(".") == 1
        return
    endif
    let l:line = getline(line(".") - 1)
    if l:line =~ '^\s*$'
        let l:colsave = col(".")
        .-1d
        silent normal! <C-y>
        call cursor(line("."), l:colsave)
    endif
endfunction

function! AddEmptyLineAbove()
    let l:scrolloffsave = &scrolloff
    " Avoid jerky scrolling with ^E at top of window
    set scrolloff=0
    call append(line(".") - 1, "")
    if winline() != winheight(0)
        silent normal! <C-e>
    endif
    let &scrolloff = l:scrolloffsave
endfunction

function! DelEmptyLineBelow()
    if line(".") == line("$")
        return
    endif
    let l:line = getline(line(".") + 1)
    if l:line =~ '^\s*$'
        let l:colsave = col(".")
        .+1d
        ''
        call cursor(line("."), l:colsave)
    endif
endfunction

function! AddEmptyLineBelow()
    call append(line("."), "")
endfunction

" Arrow key remapping: Up/Dn = move line up/dn; Left/Right = indent/unindent
function! SetArrowKeysAsTextShifters()
    " normal mode
    nmap <silent> <Left> <<
    nmap <silent> <Right> >>
    nnoremap <silent> <Up> <Esc>:call DelEmptyLineAbove()<CR>
    nnoremap <silent> <Down>  <Esc>:call AddEmptyLineAbove()<CR>
    nnoremap <silent> <C-Up> <Esc>:call DelEmptyLineBelow()<CR>
    nnoremap <silent> <C-Down> <Esc>:call AddEmptyLineBelow()<CR>

    " visual mode
    vmap <silent> <Left> <
    vmap <silent> <Right> >
    vnoremap <silent> <Up> <Esc>:call DelEmptyLineAbove()<CR>gv
    vnoremap <silent> <Down>  <Esc>:call AddEmptyLineAbove()<CR>gv
    vnoremap <silent> <C-Up> <Esc>:call DelEmptyLineBelow()<CR>gv
    vnoremap <silent> <C-Down> <Esc>:call AddEmptyLineBelow()<CR>gv

    " insert mode
    imap <silent> <Left> <C-D>
    imap <silent> <Right> <C-T>
    inoremap <silent> <Up> <Esc>:call DelEmptyLineAbove()<CR>a
    inoremap <silent> <Down> <Esc>:call AddEmptyLineAbove()<CR>a
    inoremap <silent> <C-Up> <Esc>:call DelEmptyLineBelow()<CR>a
    inoremap <silent> <C-Down> <Esc>:call AddEmptyLineBelow()<CR>a

    " disable modified versions we are not using
    nnoremap  <S-Up>     <NOP>
    nnoremap  <S-Down>   <NOP>
    nnoremap  <S-Left>   <NOP>
    nnoremap  <S-Right>  <NOP>
    vnoremap  <S-Up>     <NOP>
    vnoremap  <S-Down>   <NOP>
    vnoremap  <S-Left>   <NOP>
    vnoremap  <S-Right>  <NOP>
    inoremap  <S-Up>     <NOP>
    inoremap  <S-Down>   <NOP>
    inoremap  <S-Left>   <NOP>
    inoremap  <S-Right>  <NOP>
endfunction

call SetArrowKeysAsTextShifters()
" }}}
" vim:foldlevel=0:foldclose=all:
