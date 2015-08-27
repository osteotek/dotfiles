" GENERAL {{{1
set nocompatible            " be iMproved
set encoding=utf-8          " use unicode everywhere
set timeout ttimeoutlen=50  " timeout 50 milliseconds on key codes
set hidden                  " allow unsaved buffers
set ttyfast                 " indicates fast terminal connection
set tildeop                 " use '~' (case changing) as operator
set mouse=a                 " use mouse in all modes
"set clipboard+=unnamed      " yanks go to clipboard instead
set autowrite               " writes on make/shell commands
set autoread                " reads on make/shell commands
set ignorecase              " ignore case completely
set smartcase               " be case sensitive when input has a capital letter
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
"set visualbell              " use visualbell instead of beeping
set colorcolumn=81          " use color column
set relativenumber          " use relative line numbering
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
set t_Co=256                " terminal has 256 colors

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
let mapleader=','           " set leader key to ','
set pastetoggle=<F4>        " toggle between paste and normal
                            " type 'jj' in insert mode to go to command mode
inoremap jj <ESC>
                            " L-space to clear highlighting after search
nnoremap <leader><space> :noh<cr>
                            " L-w to make new vertical split and jump to it
noremap <leader>w <C-w>v<C-w>l
                            " TAB and Shift-TAB for tab switching in normal mode
nnoremap <TAB> gt
nnoremap <S-TAB> gT
" VIM-PLUG INITIALIZATION {{{1
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !mkdir -p ~/.vim/autoload
    silent !curl -fLo ~/.vim/autoload/plug.vim
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
endif
call plug#begin('~/.vim/bundle')
" PLUGINS: COLORSCHEMES {{{1
Plug 'altercation/vim-colors-solarized'
Plug 'oguzbilgic/sexy-railscasts-theme'
Plug 'Lokaltog/vim-distinguished'
Plug 'telamon/vim-color-github'
Plug 'TechnoGate/janus-colors'
Plug 'junegunn/seoul256.vim'
Plug 'whatyouhide/vim-gotham'
Plug 'larssmit/vim-getafe'
Plug 'Color-Sampler-Pack'
Plug 'jnurmine/Zenburn'
Plug 'sjl/badwolf'
Plug 'Mustang2'
Plug 'Guardian'
Plug 'molokai'
Plug 'Wombat'
" PLUGINS: GENERAL {{{1
Plug 'Shougo/unite.vim'
Plug 'Lokaltog/vim-easymotion'
Plug 'tpope/vim-commentary'
Plug 'freitass/todo.txt-vim'
Plug 'tpope/vim-surround'
Plug 'jlanzarotta/bufexplorer'
"Plug 'xolox/vim-easytags'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'mattn/webapi-vim'
Plug 'spolu/dwm.vim'
Plug 'workflowish'
Plug 'vimwiki'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
Plug 'rizzatti/funcoo.vim'
Plug 'rizzatti/dash.vim'

Plug 'majutsushi/tagbar'
nmap <Leader>t :TagbarToggle<CR>

Plug 'scrooloose/syntastic'
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1

Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
map <Leader>n <plug>NERDTreeTabsToggle<CR>

Plug 'kien/ctrlp.vim'
let g:ctrlp_map='<c-t>'
let g:ctrlp_cmd='CtrlP'
let g:ctrlp_extensions = ['tag']

Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'honza/vim-snippets'
Plug 'garbas/vim-snipmate'

Plug 'Gundo'
nnoremap <F5> :GundoToggle<CR>

Plug 'YankRing.vim'
let g:yankring_history_file='.yankring_history'

Plug 'benmills/vimux'
let VimuxUseNearestPane = 1
                            " Prompt for a command to run
noremap <Leader>rp :PromptVimTmuxCommand<CR>
                            " Run last command executed by RunVimTmuxCommand
noremap <Leader>rl :RunLastVimTmuxCommand<CR>
                            " Inspect runner pane
noremap <Leader>ri :InspectVimTmuxRunner<CR>
                            " Close all other tmux panes in current window
noremap <Leader>rx :CloseVimTmuxPanes<CR>
                            " Interrupt any command running in the runner pane
noremap <Leader>rs :InterruptVimTmuxRunner<CR>
" PLUGINS: VISUAL {{{1
Plug 'jeffkreeftmeijer/vim-numbertoggle'
" Plugin 'CSApprox'
Plug 'ScrollColors'
Plug 'airblade/vim-gitgutter'

Plug 'junegunn/rainbow_parentheses.vim'
au VimEnter * RainbowParentheses

"Plugin 'Lokaltog/vim-powerline'
"let g:Powerline_symbols='fancy'

Plug 'bling/vim-airline'
let g:airline_powerline_fonts = 1

"Plug 'edkolev/tmuxline.vim'

Plug 'nathanaelkane/vim-indent-guides'
" let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_guide_size=1

" PLUGINS: SYNTAXES {{{1
Plug 'Arduino-syntax-file'
Plug 'tpope/vim-git'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-markdown'
Plug 'mmalecki/vim-node.js'
Plug 'rosstimson/scala-vim-support'
Plug 'vim-ruby/vim-ruby'
Plug 'VimClojure'
Plug 'csv.vim'
Plug 'nono/vim-handlebars'
Plug 'wlangstroth/vim-haskell'
Plug 'tpope/vim-rails'
Plug 'groenewege/vim-less'
Plug 'Keithbsmiley/swift.vim'

call plug#end()
" PLUGINS: CONFIGURATION {{{1
colorscheme gotham
" FUNCTIONS {{{1
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
