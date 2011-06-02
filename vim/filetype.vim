" markdown
augroup markdown
  au! BufRead,BufNewFile *.mkd   setfiletype mkd
  au! BufRead,BufNewFile *.markdown setfiletype mkd
  au! BufRead,BufNewFile *.md   setfiletype mkd
augroup END

" mustache
runtime! ftdetect/*.vim
au BufNewFile,BufRead *.mustache  setf mustache

" HAML
au! BufRead,BufNewFile *.haml setfiletype haml

" tmux config
augroup filetypedetect
  au! BufNewFile,BufRead .tmux.conf*,tmux.conf* setf tmux
augroup END

" Vagrantfile
augroup vagrant
  au!
  au BufRead,BufNewFile Vagrantfile set filetype=ruby
augroup END