set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)
Plugin 'vim-scripts/indentpython.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'preservim/nerdtree'
Plugin 'drewtempelmeyer/palenight.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"Plugin 'jremmen/vim-ripgrep'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'fatih/vim-go'
Plugin 'nvie/vim-flake8'
Plugin 'hashivim/vim-terraform'

" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

au BufNewFile,BufRead *.go
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=119 |
    \ set autoindent |
    \ set fileformat=unix |
    \ set number |
    \ set relativenumber

au BufNewFile,BufRead *.py,*.swift
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=119 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |
    \ set number |
    \ set relativenumber

au BufNewFile,BufRead *.js,*.html,*.css,*.sql
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
    \ set number |
    \ set relativenumber

au BufNewFile,BufRead *Snakefile
    \ set filetype=snakefile |
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
    \ set number |
    \ set relativenumber

let python_highlight_all=1
set background=dark
colorscheme palenight
syntax on

set autoread
Bundle 'djoshea/vim-autoread'

Bundle 'Valloric/YouCompleteMe'
let g:ycm_autoclose_preview_window_after_completion = 1

let g:airline_theme = "palenight"

let mapleader = "\<Space>"

let g:go_template_autocreate = 0

let g:terraform_fmt_on_save = 1

set wildmenu
set wildmode=longest,list

nmap <leader>n :NERDTreeToggle<CR>
nmap <leader>b :Buffers<CR>
nmap <leader>o :FZF<CR>
nmap <leader>d :YcmCompleter GoTo<CR>
nmap <leader>h :let &hls=(&hls == 1 ? 0 : 1)<CR>
nmap <leader>gb :Git Blame<CR>
nmap <leader>gg :GitGutterToggle<CR>
nmap <leader>f :Rg<CR>
nmap <leader><Tab> <C-w>w
