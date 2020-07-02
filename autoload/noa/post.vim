function! noa#post#postMsg() abort
   let l:cursorPos = line(".")
   let l:lineText = getline('.')

   let l:cmdStr = 'curl '.g:serverURL.'/send'.' -X POST -H "Content-Type: application/json" -d "{\"text\": \"'.l:lineText.'\", \"line\":'.l:cursorPos.', \"uuid\":\"'.g:noaUUID.'\", \"roomid\": \"'.g:noaRoomID.'\"}"'
   echo l:cmdStr

   let res = system(l:cmdStr)
endfunction

function! noa#post#sendBufferText() abort
   let l:fileText = noa#gettext#getBufferText()

   let l:sendCmd = 'curl '.g:serverURL.'/send '
      \ .'-X POST -H "Content-Type: application/json" '
      \ .'-d '
      \ .'"{'
      \ .'\"text\":'.l:fileText
      \ .', \"line\":2,'
      \ .' \"uuid\":\"'.g:noaUUID
      \ .'\", \"roomid\":\"'.g:noaRoomID
      \.'\"}"'

   call system(l:sendCmd)
endfunction
