let s:save_cpo = &cpo
set cpo&vim

function! noa#postMsg() abort
   let l:cursorPos = line(".")
   let l:lineText = getline('.')

   let l:cmdStr = 'curl '.g:serverURL.'/send'.' -X POST -H "Content-Type: application/json" -d "{\"text\": \"'.l:lineText.'\", \"line\":'.l:cursorPos.', \"uuid\":\"'.g:noaUUID.'\", \"roomid\": \"'.g:noaRoomID.'\"}"'
   echo l:cmdStr

   let res = system(l:cmdStr)
endfunction

function! noa#InitClient() abort
   let res = system('curl -s '.g:serverURL.'/init')

   let g:noaUUID = res
endfunction

function! noa#insertText(recvJSON) abort
   let s:V = vital#noa#new()
   let s:J = s:V.import('Web.JSON')

   let textData = s:J.decode(a:recvJSON)
   echo textData['line']

   if (textData['uuid'] != g:noaUUID)
      call append(textData['line'] - 1, textData['text'])
   endif
endfunction

function! noa#setRoomID(roomID) abort
    let g:noaRoomID = a:roomID
endfunction

function! noa#text_chane_i() abort
   let l:pos = getpos('.')
   let l:lineText = getline('.')

   echo l:lineText[l:pos[2] - 2]
endfunction

function! noa#getBufferText() abort
   let l:fileLineLen = line('$')

   let l:bufferText = getline(1, l:fileLineLen)
   let l:cmdStr = 'curl '.g:serverURL.'/send'.' -X POST -H "Content-Type: application/json" -d "{\"text\": \"'.l:bufferText.'\", \"line\":'.l:cursorPos.', \"uuid\":\"'.g:noaUUID.'\", \"roomid\": \"'.g:noaRoomID.'\"}"'
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
