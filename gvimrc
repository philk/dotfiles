" auto-change directory to current buffer
" autocmd BufEnter * :cd %:p:h

set lines=48
set columns=150
set go-=T

" MacVim keys
if has("gui_macvim")
  map <D-q> :mksession! ~/.vim/.session<CR>
  map <D-w> :tabclose<CR>
  map <D-}> :tabn<CR>
  map <D-}> :tabp<CR>
  nmap <D-]> >>
  vmap <D-]> >>
  imap <D-]> <C-O>>>
  nmap <D-[> <<
  vmap <D-[> <<
  imap <D-[> <C-O><<
  macmenu &File.New\ Tab key=<nop>
  nmap <D-t> :CommandT<CR> 
endif