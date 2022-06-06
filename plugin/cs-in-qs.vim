
" check for required stuffs
if !has("cscope") || !has("quickfix")
	echoerr "cscope or quickfix doesn't exist!"
	finish
endif

" set cscope-quicfix option if user doesn't defined yet
if empty(&cscopequickfix)
	set cscopequickfix=g-,s-,c-,f-,i-,t-,d-,e-,a-
endif

if !exists("g:cs_qf_force_open")
	let g:cs_qf_force_open=1
endif

function! GetCS_In_QF (type, sstr) abort
	let l:type = get({ "0": "s", "1": "g", "2": "d", "3": "c", "4": "t", "5": "e", "6": "f", "7": "i", "8": "a" }, a:type, a:type)
	let l:word = ((a:sstr == "0") ? (expand((l:type =~ '[if]') ? "<cfile>" : "<cword>")) : (a:sstr))
	let l:cmd = 'cs find ' . l:type . ' ' . l:word

	if strridx(&cscopequickfix, l:type) < 0
		echo "cscopequickfix option doesn't contain '" . l:type . "' option\n\n"
		execute l:cmd
		return
	endif
	" clear qflist
	call setqflist([])

	" get with results for requested type
	silent! keepjumps execute l:cmd

	" get qflist and len
	let l:qf_list = getqflist()
	let l:qf_list_len = len(l:qf_list)

	if qf_list_len > 0
		" update content
		for qf_entry in l:qf_list
			let str = substitute(qf_entry['text'], '<<', "", '')
			let qf_entry['text'] = substitute(str, '>>*', " |", '')
		endfor

		" set updated qf_list back and title
		call setqflist(l:qf_list)
		call setqflist([], 'r', {'title': ':' . l:cmd})

		if g:cs_qf_force_open == 1
			copen
		else
			cclose
			" FIXME: little hack here to update statusline
			echo '(1 of ' . l:qf_list_len . '):' l:qf_list[0]['text']
		endif
	else
		echo "No matches found for command '" . l:cmd . "'"
	endif
endfunction

function! ToggleQuickFix ()
	if empty(filter(getwininfo(), 'v:val.quickfix'))
		copen
	else
		cclose
	endif
endfunction

command! -nargs=* C :call GetCS_In_QF(<f-args>)
command! -nargs=1 Qcs call GetCS_In_QF(<f-args>, "0")
command! -nargs=0 ToggleQF call ToggleQuickFix()

