" Rich's filetype file
if exists("did_load_filetype")
  finish
endif
augroup filetypedetect
  au BufRead,BufNewFile *.puml setfiletype plantuml
  au BufRead,BufNewFile *.uml setfiletype plantuml
augroup END

