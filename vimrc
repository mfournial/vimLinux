filetype on
syntax on
colorscheme monokai

set guifont=Menlo\ Regular:h18

set colorcolumn=80

set hidden
set history=120

filetype indent on
set nowrap
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
set autoindent

autocmd BufWritePre * :%s/\s\+$//e

set hlsearch
nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>

nnoremap <Leader><Leader> :e#<CR>
