function! noa#conn#InitClient() abort
   let res = system('curl -s '.g:serverURL.'/init')

   let g:noaUUID = res
endfunction

function! noa#conn#setRoomID(roomID) abort
    let g:noaRoomID = a:roomID
endfunction
