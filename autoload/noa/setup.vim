function! noa#setup#noaaugroup() abort
   augroup NoaInput
      autocmd!
      autocmd TextChanged * call noa#post#sendBufferText()
      autocmd TextChangedI * call noa#post#sendBufferText()
   augroup END
endfunction

function! noa#setup#InitClient() abort
   if !exists('#NoaInput#TextChanged')
      call noa#setup#noaaugroup()
   endif

   let res = system('curl -s "'.g:noa#serverURL.'/init?roomid='.g:noa#RoomID.'"')

   let s:V = vital#noa#new()
   let s:J = s:V.import('Web.JSON')

   let recvData = s:J.decode(res)

   let g:noa#UUID = recvData['uuid']
   let g:noa#FileType = recvData['filetype']

   let l:fileName = g:noa#RoomID.'.'.g:noa#FileType

   e l:fileName
   execute ':edit' l:fileName

   let g:noa#WindowID = win_getid()

   echo recvData['text']

   if len(recvData['text']) != 1 && recvData['text'][0] != '0'
      call setline(1, recvData['text'])
   endif
endfunction

function! noa#setup#setRoomID(roomID) abort
    let g:noa#RoomID = a:roomID
endfunction
