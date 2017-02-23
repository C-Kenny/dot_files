set nocompatible
filetype off
let mapleader = "\<Space>"
filetype plugin indent off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'leafgarland/typescript-vim'

call vundle#end()
filetype plugin indent on    " required

" typescript syntax highlighting
au BufRead,BufNewFile *.ts   setfiletype typescript

" leader w saves
nnoremap <Leader>w :w<CR>

" leader x saves and quits
nnoremap <Leader>x :x<CR>
execute pathogen#infect()

nmap gm :LivedownToggle<CR>

" Move around vim window splits with space as leader
noremap <leader>h :wincmd h<CR>
noremap <leader>j :wincmd j<CR>
noremap <leader>k :wincmd k<CR>
noremap <leader>l :wincmd l<CR>

nnoremap ' `
nnoremap ` '
set history=1000
set foldenable          " enable folding
set noswapfile
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

" Tmux
if exists('$TMUX')
  function! TmuxOrSplitSwitch(wincmd, tmuxdir)
    let previous_winnr = winnr()
    silent! execute "wincmd " . a:wincmd
    if previous_winnr == winnr()
      call system("tmux select-pane -" . a:tmuxdir)
      redraw!
    endif
  endfunction

  let previous_title = substitute(system("tmux display-message -p '#{pane_title}'"), '\n', '', '')
  let &t_ti = "\<Esc>]2;vim\<Esc>\\" . &t_ti
  let &t_te = "\<Esc>]2;". previous_title . "\<Esc>\\" . &t_te

  nnoremap <silent> <C-h> :call TmuxOrSplitSwitch('h', 'L')<cr>
  nnoremap <silent> <C-j> :call TmuxOrSplitSwitch('j', 'D')<cr>
  nnoremap <silent> <C-k> :call TmuxOrSplitSwitch('k', 'U')<cr>
  nnoremap <silent> <C-l> :call TmuxOrSplitSwitch('l', 'R')<cr>
else
  map <C-h> <C-w>h
  map <C-j> <C-w>j
  map <C-k> <C-w>k
  map <C-l> <C-w>l
endif

"== Appearance =="
set term=screen-256color
syntax enable
syntax on
set background=dark
set relativenumber  " see below
set number          " enables a hybrid like mode, with current line non-relative
set cul             " hightlights current line
hi CursorLine term=none ctermfg=White ctermbg=Blue

"== Tabs =="
set expandtab
set autoindent      " indentation will match prev line
set tabstop=4
set softtabstop=4
set smartindent
set shiftwidth=4

"== Searching =="
set showmatch       " Show matching brackets.
set nohlsearch      " Don't continue to highlight searched phrases
set ignorecase      " searches are case insensitive
set incsearch       " find next match while typing
set hlsearch        " highlight matches

"== Misc =="
set ttyfast         " we have a fast terminal
set showcmd
set noerrorbells    " don't whine
set autoread        " automatically reloads file if external alterations
set nocompatible
filetype off
filetype plugin indent on

"== Editing =="
set backspace=indent,eol,start  " backspace in insert mode, naughty!
set shiftround          " when at 3 spaces, and I hit > ... go to 4, not 5

"== Auto Commands =="
" Remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif
autocmd CursorHold * checktime  " execute checktime when no key is pressed (normal mode)

"== Swap ; w/ : =="
nnoremap ; :
nnoremap : ;

