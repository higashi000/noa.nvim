if exists('g:loaded_noa')
   finish
endif
let g:loaded_noa = 1

let s:save_cpo = &cpo
set cpo&vim

command! NoaPostMsg call noa#postMsg()

let &cpo = s:save_cpo
unlet s:save_cpo
