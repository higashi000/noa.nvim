function! noa#setup#InitClient() abort
   let res = system('curl -s "'.g:serverURL.'/init?roomid='.g:noaRoomID.'"')

   let s:V = vital#noa#new()
   let s:J = s:V.import('Web.JSON')

   let recvData = s:J.decode(res)

   let g:noaUUID = recvData["uuid"]

   if len(recvData['text']) != 0
      call setline(1, recvData['text'])
   endif
endfunction

function! noa#setup#setRoomID(roomID) abort
    let g:noaRoomID = a:roomID
endfunction
