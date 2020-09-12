function! noa#insert#insertText(recvJSON) abort
   let s:V = vital#noa#new()
   let s:J = s:V.import('Web.JSON')

   let textData = s:J.decode(a:recvJSON)

   let l:nowBuffLen = line('$')

   if (l:nowBuffLen - len(textData['text']) > 0)
      for i in range(l:nowBuffLen - len(textData['text']))
         execute ':normal dd'
      endfor
   endif

   if (textData['uuid'] != g:noaUUID)
      call setline(1, textData['text'])
   endif
endfunction
