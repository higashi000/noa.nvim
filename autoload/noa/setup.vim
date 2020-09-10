function! noa#setup#InitClient() abort
   let res = system('curl -s "'.g:serverURL.'/init?roomid='.g:noaRoomID.'"')

   let s:V = vital#noa#new()
   let s:J = s:V.import('Web.JSON')

   let recvData = s:J.decode(res)

   let g:noaUUID = recvData['uuid']
   let g:noaFileType = recvData['filetype']

   let l:fileName = g:noaRoomID.'.'.g:noaFileType

   e l:fileName
   execute ':edit' l:fileName

   let g:noaWindowID = win_getid()

   echo recvData['text']

   if len(recvData['text']) != 1 && recvData['text'][0] != '0'
      call setline(1, recvData['text'])
   endif
endfunction

function! noa#setup#setRoomID(roomID) abort
    let g:noaRoomID = a:roomID
endfunction
