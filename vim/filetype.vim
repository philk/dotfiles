" markdown filetype file
"
if exists("did\_load\_filetypes")
	finish
endif
augroup markdown
	au! BufRead,BufNewFile *.mkd   setfiletype mkd
  au! BufRead,BufNewFile *.markdown setfiletype mkd
augroup END

" HAML
au! BufRead,BufNewFile *.haml setfiletype haml

" tmux config
augroup filetypedetect
  au! BufNewFile,BufRead .tmux.conf*,tmux.conf* setf tmux
augroup END

" Haskell
au BufEnter *.hs compiler ghc