function! noa#setup#InitClient() abort
   let res = system('curl -s '.g:serverURL.'/init')

   let g:noaUUID = res
endfunction

function! noa#setup#setRoomID(roomID) abort
    let g:noaRoomID = a:roomID
endfunction
