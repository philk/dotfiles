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

" JSON
au! BufRead,BufNewFile *.json set filetype=json

" Octopress
au! BufNewFile,BufRead *.{md,mdown,mkd,mkdn,markdown,textile} set filetype=octopress
