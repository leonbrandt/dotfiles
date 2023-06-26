" GENERAL

map <Space> <Leader>
imap jj <ESC>
imap <C-s> <ESC>
nmap <C-s> :w<CR>
nmap <C-p> :Files<CR>
nmap <C-l> :e#<CR>
nmap <C-f> :noh<CR>
nmap <C-j> }
nmap <C-k> {
inoremap <C-j> <Down>
inoremap <C-k> <Up>
nmap <C-m> <Plug>MarkdownPreviewToggle
" write shada-file (deleting markers)
nmap <Leader>s :wshada!<CR>
nmap <Leader>v :loadview<CR>

" FORMATTING

nmap <Leader>2 :set ts=2<CR>
nmap <Leader>4 :set ts=4<CR>
nmap <Leader>r :%retab!<CR>
nmap <Leader>" :%s/'/"/g<CR>

" FOLDING

nmap z+ zr
nmap z* zR
nmap z- zm
nmap z_ zM

" MARKS

" jump to start of next line containing a mark
nmap <Leader>M ]'
" jump to start of prev line containting a mark
nmap <Leader>m ['
nmap <Leader>mf '
nmap <Leader>1 'm

" COC

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gD <Plug>(coc-declaration)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" DISABLE KEYS

map <Up> <Nop>
map <Right> <Nop>
map <Down> <Nop>
map <Left> <Nop>
map <Home> <Nop>
map <End> <Nop>
imap <Up> <Nop>
imap <Right> <Nop>
imap <Down> <Nop>
imap <Left> <Nop>
imap <Home> <Nop>
imap <End> <Nop>



inoremap <silent><expr> <C-j>
	\ coc#pum#visible() ? coc#pum#next(1) :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ coc#refresh()
inoremap <expr><C-k> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction
