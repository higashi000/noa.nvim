function! noa#post#postMsg() abort
   let l:cursorPos = line(".")
   let l:lineText = getline('.')

   let l:cmdStr = 'curl '.g:noa#serverURL.'/send'.' -X POST -H "Content-Type: application/json" -d "{\"text\": \"'.l:lineText.'\", \"line\":'.l:cursorPos.', \"uuid\":\"'.g:noa#UUID.'\", \"roomid\": \"'.g:noa#RoomID.'\"}"'
   echo l:cmdStr

   let res = system(l:cmdStr)
endfunction

function! noa#post#sendBufferText() abort
   let l:fileText = noa#gettext#getBufferText()

   let l:lineNum = line('.')

   let l:data =
      \ "'{"
         \ .'"text"   : '.l:fileText.', '
         \ .'"line"   : '.l:lineNum.', '
         \ .'"uuid"   : "'.g:noa#UUID.'", '
         \ .'"roomid" : "'.g:noa#RoomID.'"'
      \."}'"

   let l:sendCmd = 'curl '.g:noa#serverURL.'/send '
      \ .'-X POST -H "Content-Type: application/json" '
      \ .'-d '.l:data

   call system(l:sendCmd)
endfunction
