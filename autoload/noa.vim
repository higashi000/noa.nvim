let s:save_cpo = &cpo
set cpo&vim

function! noa#postMsg()
   let l:name = input('Name :')
   let l:text = input('Post Text :')

   let l:cmdStr = 'curl http://localhost:5000/send -X POST -H "Content-Type: application/json" -d "{\"text\": \"'.l:text.'\", \"name\": \"'.l:name.'\"}"'

   let res = system(l:cmdStr)

"   let s:V = vital#noa#new()
"   let s:H = s:V.import('Web.HTTP')
"
"   let url = 'http://localhost:5000/send'
"   let res = s:H.post(url, {'text': l:text})
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
