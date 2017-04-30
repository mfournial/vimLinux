" mfournial VIM config file
" 
" Man 
"
" vim-surround
" cd <previous block marker> <new BM>
"
" nerdcommenter
" <Leader> c <Space> - toggle line comment
" <Leader> c s - toggle sexy line comment 
" used to be <Leader> cc
" 

set nocompatible

filetype on
colorscheme monokai

filetype indent on
filetype plugin indent on

set colorcolumn=80
set hidden
set history=120
set number
set nowrap
set noshowmode
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
set autoindent
set hlsearch


" TODO to be mapped to same as mac cmd
map <D-A-RIGHT> <C-w>l
map <D-A-LEFT> <C-w>h
map <D-A-DOWN> <C-w><C-w>
map <D-A-UP> <C-w>W

" Syntax checking
map <Leader>s :SyntasticToggleMode<CR>

" Don't copy the cintent of an overwritten selection
vnoremap p "_dP

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" Mapping for Haskell syntax
" map <silent> tw :GhcModTypeInsert<CR>
" map <silent> ts :GhcModSplitFunCase<CR>
" map <silent> tq :GhcModType<CR>
" map <silent> te :GhcModTypeClear<CR>

" Syntastic plugin config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

if has("autocmd")
    au VimEnter,InsertLeave * silent execute '!echo -ne "\e[1 q"' | redraw!
    au InsertEnter,InsertChange *
        \ if v:insertmode == 'i' | 
        \   silent execute '!echo -ne "\e[5 q"' | redraw! |
        \ elseif v:insertmode == 'r' |
        \   silent execute '!echo -ne "\e[3 q"' | redraw! |
        \ endif
    au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
endif

nnoremap <Leader><Leader> :e#<CR>
 
execute pathogen#infect()
 
noremap <Leader>r :CommandTFlush<CR>
 
let NERDTreeMapActivateNode='<right>'
let NERDTtreeShowHidden=1
nmap <leader>n :NerdTreeToggle<CR>
nmap <leader>j :NerdTreeFind<CR>

autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

" Set proper syntax highlighting 
autocmd BufRead,BufNewFile *.fdoc set filetype=yaml
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.md set spell
autocmd BufRead,BufNewFile *.asm set filetype=nasm

let NERDTreeIgnore=['\.DS_Store', '\~$', '\.swp', '\.git']
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:gitgutter_sign_column_always=1

let g:lightline = {
      \ 'colorscheme': 'molokai',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightlineFugitive',
      \   'readonly': 'LightlineReadonly',
      \   'modified': 'LightlineModified'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))'
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

function! LightlineModified()
    if &filetype == "help"
          return ""
    elseif &modified
          return "+"
    elseif &modifiable
          return ""
    else
          return ""
    endif
endfunction

function! LightlineReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return "⭤"
  else
    return ""
  endif
endfunction

function! LightlineFugitive()
  return exists('*fugitive#head') ? fugitive#head() : ''
endfunction

" function! LightlineFugitive()
"   if exists("*fugitive#head")
"     let branch = fugitive#head()
"     return branch !=# '' ? ''.branch : ''
"   endif
" return ''
" endfunction
