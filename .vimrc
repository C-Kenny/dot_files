set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'tpope/vim-surround'
"Vim-Tmux Navigator"
Plugin 'christoomey/vim-tmux-navigator'

filetype plugin indent on

set term=screen-256color
set tabstop=4
set softtabstop=4
set smartindent
set shiftwidth=4
set expandtab
set autoindent      " indentation will match prev line
set relativenumber
set number          " enables a hybrid like mode, with current line non-relative
set hlsearch        " highlight matches
set ignorecase      " searches are case insensitive
set noswapfile      " how annoying are these? / what is source control?
set autoread        " automatically reloads file if there's alterations
autocmd CursorHold * checktime  " execute checktime when no key is pressed (normal mode)

syntax on



"== Pydiction =="
let g:pydiction_location = 'home/cosc/student/csk29/.vim/after/rkulla-pydiction-91-ee439/complete-dict'
let g:pydiction_menu_height = 5

"== Swap ; w/ : =="
nnoremap ; :
nnoremap : ;

"== Solarized =="
syntax enable
set background=dark
"let g:solarized_termcolors=256
"colorscheme solarized

"== Makes the 81st column shine =="

"highlight ColorColumn ctermbg=magenta
"all matchadd('ColorColumn', '\%81v', 100)
