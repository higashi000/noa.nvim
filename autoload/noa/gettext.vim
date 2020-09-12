function! noa#gettext#getBufferText() abort
   let l:fileLineLen = line('$')

   let l:bufferText = getline(1, l:fileLineLen)

   let l:linkBuffText = '['

   let cnt = 0
   for i in l:bufferText
      let l:replaceText = substitute(i, '"', '”', 'g')
      let l:replaceText = substitute(l:replaceText, "'", "’", 'g')
      if (cnt == l:fileLineLen - 1)
         let l:linkBuffText = l:linkBuffText.'"'.l:replaceText.'"'
      else
         let l:linkBuffText = l:linkBuffText.'"'.l:replaceText.'",'
      endif
      let cnt = cnt + 1
   endfor

   let l:linkBuffText = l:linkBuffText.']'

   return l:linkBuffText
endfunction
