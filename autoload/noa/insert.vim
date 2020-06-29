function! noa#insert#insertText(recvJSON) abort
   let s:V = vital#noa#new()
   let s:J = s:V.import('Web.JSON')

   let textData = s:J.decode(a:recvJSON)
   echo textData['line']

   echo textData['text'][1]
   if (textData['uuid'] != g:noaUUID)
      call append(textData['line'] - 1, textData['text'][1])
   endif
endfunction
