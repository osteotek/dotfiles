" GENERAL {{{1
set nocompatible            " be iMproved
set timeout ttimeoutlen=50  " timeout 50 milliseconds on key codes
set hidden                  " allow unsaved buffers
set ttyfast                 " indicates fast terminal connection
set tildeop                 " use '~' (case changing) as operator
set undofile                " create <FILENAME>.un~ for persistent undo
set mouse=a                 " use mouse in all modes
set clipboard+=unnamed      " yanks go to clipboard instead
set autowrite               " writes on make/shell commands
set autoread                " reads on make/shell commands
set ignorecase              " ignore case completely
set smartcase               " be case sensitive when input has a capital letter
let g:is_posix = 1          " use modern version of builtin shell
                            " set cuda filetype for *.cu files
" au BufNewFile,BufRead *.cu set ft=cpp
" VISUAL {{{1
syntax on                   " enable syntax highlighting
set showmatch               " show matching brackets
set matchtime=2             " bracket blinking
set visualbell              " use visualbell instead of beeping
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
" VUNDLE INITIALIZATION {{{1
filetype off                " required for vundle initialisation
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
" PLUGINS: COLORSCHEMES {{{1
Bundle 'altercation/vim-colors-solarized'
Bundle 'oguzbilgic/sexy-railscasts-theme'
Bundle 'telamon/vim-color-github'
Bundle 'TechnoGate/janus-colors'
Bundle 'larssmit/vim-getafe'
Bundle 'Color-Sampler-Pack'
Bundle 'jnurmine/Zenburn'
Bundle 'sjl/badwolf'
Bundle 'Mustang2'
Bundle 'molokai'
Bundle 'Wombat'
colorscheme molokai
" PLUGINS: GENERAL {{{1
Bundle 'Lokaltog/vim-easymotion'
Bundle 'tpope/vim-commentary'
Bundle 'davidoc/todo.txt-vim'
Bundle 'tpope/vim-surround'
Bundle 'xolox/vim-easytags'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-repeat'
Bundle 'mattn/webapi-vim'
Bundle 'spolu/dwm.vim'
Bundle 'workflowish'
Bundle 'vimwiki'

Bundle 'majutsushi/tagbar'
nmap <Leader>t :TagbarToggle<CR>

Bundle 'scrooloose/syntastic'
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1

Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
map <Leader>n <plug>NERDTreeTabsToggle<CR>

Bundle 'kien/ctrlp.vim'
let g:ctrlp_map='<c-t>'
let g:ctrlp_cmd='CtrlP'
let g:ctrlp_extensions = ['tag']

Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'honza/snipmate-snippets'
Bundle 'garbas/vim-snipmate'

Bundle 'Gundo'
nnoremap <F5> :GundoToggle<CR>

Bundle 'YankRing.vim'
let g:yankring_history_file='.yankring_history'

Bundle 'benmills/vimux'
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
Bundle 'jeffkreeftmeijer/vim-numbertoggle'
Bundle 'CSApprox'
Bundle 'ScrollColors'

Bundle 'kien/rainbow_parentheses.vim'
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

Bundle 'Lokaltog/vim-powerline'
let g:Powerline_symbols='fancy'

Bundle 'nathanaelkane/vim-indent-guides'
" let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_guide_size=1

" PLUGINS: SYNTAXES {{{1
Bundle 'Arduino-syntax-file'
Bundle 'tpope/vim-git'
Bundle 'pangloss/vim-javascript'
Bundle 'tpope/vim-markdown'
Bundle 'mmalecki/vim-node.js'
Bundle 'rosstimson/scala-vim-support'
Bundle 'vim-ruby/vim-ruby'
Bundle 'VimClojure'
Bundle 'csv.vim'
Bundle 'nono/vim-handlebars'
Bundle 'wlangstroth/vim-haskell'
Bundle 'tpope/vim-rails'
Bundle 'groenewege/vim-less'

filetype plugin indent on   " required after vundle
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
