function! noa#gettext#getBufferText() abort
   let l:fileLineLen = line('$')

   let l:bufferText = getline(1, l:fileLineLen)

   let l:linkBuffText = '['

   let cnt = 0
   for i in l:bufferText
      if (cnt == l:fileLineLen - 1)
         let l:linkBuffText = l:linkBuffText.'\"'.i.'\"'
      else
         let l:linkBuffText = l:linkBuffText.'\"'.i.'\",'
      endif
      let cnt = cnt + 1
   endfor

   let l:linkBuffText = l:linkBuffText.']'

   return l:linkBuffText
endfunction
