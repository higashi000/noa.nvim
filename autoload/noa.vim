let s:save_cpo = &cpo
set cpo&vim

function! noa#postMsg()
   let l:cursorPos = line(".")
   let l:lineText = getline('.')

   let l:cmdStr = 'curl '.g:serverURL.'/send'.' -X POST -H "Content-Type: application/json" -d "{\"text\": \"'.l:lineText.'\", \"line\":'.l:cursorPos.', \"uuid\":\"'.g:noaUUID.'\"}"'
   echo l:cmdStr

   let res = system(l:cmdStr)
endfunction

function! noa#InitClient()
   let res = system('curl -s '.g:serverURL.'/init')

   let g:noaUUID = res
endfunction

function! noa#insertText(recvJSON)
   let s:V = vital#noa#new()
   let s:J = s:V.import('Web.JSON')

   let textData = s:J.decode(a:recvJSON)
   echo textData['line']

   if (textData['uuid'] != g:noaUUID)
      call append(textData['line'] - 1, textData['text'])
   endif
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
