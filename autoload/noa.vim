function! noa#text_chane_i() abort
   let l:pos = getpos('.')
   let l:lineText = getline('.')

   echo l:lineText[l:pos[2] - 2]
endfunction
