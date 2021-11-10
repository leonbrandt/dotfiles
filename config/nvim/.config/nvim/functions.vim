" https://gist.github.com/cormacrelf/d0bee254f5630b0e93c3
function! WordCount()
	let currentmode = mode()
	if !exists("g:lastmode_wc")
		let g:lastmode_wc = currentmode
	endif
	" if we modify file, open a new buffer, be in visual ever, or switch modes
	" since last run, we recompute.
	if &modified || !exists("b:wordcount") || currentmode =~? '\c.*v' || currentmode != g:lastmode_wc
		let g:lastmode_wc = currentmode
		let l:old_position = getpos('.')
		let l:old_status = v:statusmsg
		execute "silent normal g\<c-g>"
		if v:statusmsg == "--No lines in buffer--"
			let b:wordcount = 0
		else
			let s:split_wc = split(v:statusmsg)
			if index(s:split_wc, "Selected") < 0
				let b:wordcount = str2nr(s:split_wc[11])
			else
				let b:wordcount = str2nr(s:split_wc[5])
			endif
			let v:statusmsg = l:old_status
		endif
		call setpos('.', l:old_position)
		return b:wordcount
	else
		return b:wordcount
	endif
endfunction

" https://stackoverflow.com/a/28460676/6124544
" Function to permanently delete views created by 'mkview'
function! MyDeleteView()
	let path = fnamemodify(bufname('%'),':p')
	" vim's odd =~ escaping for /
	let path = substitute(path, '=', '==', 'g')
	if empty($HOME)
	else
		let path = substitute(path, '^'.$HOME, '\~', '')
	endif
	let path = substitute(path, '/', '=+', 'g') . '='
	" view directory
	let path = &viewdir.'/'.path
	call delete(path)
	echo "Deleted: ".path
endfunction
" Command Delview (and it's abbreviation 'delview')
command Delview call MyDeleteView()
" Lower-case user commands: http://vim.wikia.com/wiki/Replace_a_builtin_command_using_cabbrev
cabbrev delview <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'Delview' : 'delview')<CR>
