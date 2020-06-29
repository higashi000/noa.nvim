function! noa#send#postMsg() abort
   let l:cursorPos = line(".")
   let l:lineText = getline('.')

   let l:cmdStr = 'curl '.g:serverURL.'/send'.' -X POST -H "Content-Type: application/json" -d "{\"text\": \"'.l:lineText.'\", \"line\":'.l:cursorPos.', \"uuid\":\"'.g:noaUUID.'\", \"roomid\": \"'.g:noaRoomID.'\"}"'
   echo l:cmdStr

   let res = system(l:cmdStr)
endfunction

function! noa#send#getBufferText() abort
   let l:fileLineLen = line('$')

   let l:bufferText = getline(1, l:fileLineLen)
   let l:linkBufText = '[\"START\"'

   for i in l:bufferText
      let l:linkBufText = l:linkBufText.','.'\"'.i.'\"'
   endfor

   let l:linkBufText = l:linkBufText.',\"EOF\"]'

   echo l:linkBufText


   let l:cmdStr = 'curl '.g:serverURL.'/send'.' -X POST -H "Content-Type: application/json" -d "{\"text\": '.l:linkBufText.', \"line\":2, \"uuid\":\"'.g:noaUUID.'\", \"roomid\": \"'.g:noaRoomID.'\"}"'
   let res = system(l:cmdStr)
endfunction


