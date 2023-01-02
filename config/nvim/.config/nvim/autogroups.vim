" " https://stackoverflow.com/a/37558470/6124544
" augroup rememberfolds
" 	autocmd!
" 	autocmd BufWinLeave * mkview
" 	" autocmd BufWinEnter * silent! loadview
" augroup END

" https://github.com/benknoble/vim-auto-origami
augroup autofoldcolumn
	au!

	" Or whatever autocmd-events you want
	au CursorHold,BufWinEnter,WinEnter * AutoOrigamiFoldColumn
augroup END
