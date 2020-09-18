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

   let l:index = 0
   for i in textData['text']
      let textData['text'][l:index] = substitute(i, '”', '"', 'g')
      let textData['text'][l:index] = substitute(textData['text'][l:index], '’', "'", 'g')
      let l:index = l:index + 1
   endfor

   if (textData['uuid'] != g:noa#UUID)
      call setline(1, textData['text'])
   endif
endfunction
