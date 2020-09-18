if exists('g:loaded_noa')
   finish
endif
let g:loaded_noa = 1

let s:save_cpo = &cpo
set cpo&vim

let g:noa#serverURL = 'http://localhost:5000'
let g:noa#UUID = ''
let g:noa#FileType = ''
let g:noa#RoomID = ''
let g:noa#WindowID = ''

command! NoaPostMsg call noa#postMsg()
command! NoaStart call noa#start()

function! noa#start() abort
   let l:roomid = input('roomid:')
   call NoaCreateConn(l:roomid)
   call NoaWSRECV()
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
