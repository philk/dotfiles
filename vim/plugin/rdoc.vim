" rdoc.vim

command! -nargs=0 RDocPreview call RDocRenderBufferToPreview()
noremap <buffer> <LocalLeader>rd :RDocPreview<CR>

function! RDocRenderBufferToPreview()
  if (system('which rdoc') == "rdoc not found\n")
    throw "Could not find rdoc!"
  end
  
  let rdocoutput = "/tmp/vimrdoc/"
  call system("rdoc " . bufname("%") . " --op " . rdocoutput)
  call system("open ". rdocoutput . "index.html")
endfunction