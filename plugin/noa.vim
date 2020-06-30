if exists('g:loaded_noa')
   finish
endif
let g:loaded_noa = 1

let s:save_cpo = &cpo
set cpo&vim

let g:serverURL = 'http://localhost:5000'
let g:noaUUID = ''
let g:noaRoomID = ''

command! NoaPostMsg call noa#postMsg()

function! noa#start(roomid) abort
   call NoaCreateConn(a:roomid)
   call NoaWSRECV()
endfunction

augroup NoaInput
   autocmd!
   autocmd TextChangedI * call noa#text_chane_i()
augroup END

let &cpo = s:save_cpo
unlet s:save_cpo
