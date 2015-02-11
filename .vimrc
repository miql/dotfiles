version 6.0
if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
nmap gx <Plug>NetrwBrowseX
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#NetrwBrowseX(expand("<cWORD>"),0)
let &cpo=s:cpo_save
unlet s:cpo_save
execute pathogen#infect()
set backspace=2
syntax on
:imap \\ <Esc>
:nmap <F2> :echo 'Current time is ' . strftime('%c')<CR>
"Making parens & Brackets Handling Easer
"http://vim.wikia.com/wiki/Making_Parenthesis_And_Brackets_Handling_Easier
"inoremap ( ()<Esc>:call BC_AddChar(")")<CR>i 
inoremap { {<CR>}<Esc>:call BC_AddChar("}")<CR><Esc>kA<CR>
inoremap [ []<Esc>:call BC_AddChar("]")<CR>i
inoremap " ""<Esc>:call BC_AddChar("\"")<CR>i
" jump out of parenthesis
inoremap <C-j> <Esc>:call search(BC_GetChar(), "W")<CR>a

function! BC_AddChar(schar)
 if exists("b:robstack")
 let b:robstack = b:robstack . a:schar
 else
 let b:robstack = a:schar
 endif
endfunction

function! BC_GetChar()
 let l:char = b:robstack[strlen(b:robstack)-1]
 let b:robstack = strpart(b:robstack, 0, strlen(b:robstack)-1)
 return l:char
endfunction

set tabstop=2
set shiftwidth=2
set smarttab
set smartindent
set hlsearch
set autoindent
set incsearch
set expandtab
set number


"set paste disables imap?
set nopaste

set fileencodings=ucs-bom,utf-8,default,latin1
set helplang=en
set modelines=0
set window=0
filetype plugin indent on
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
au BufRead,BufNewFile *.clj set filetype=clojure
" vim: set ft=vim :
