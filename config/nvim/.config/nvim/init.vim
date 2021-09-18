" plugins will be downloaded under the specified directory.
" use :PlugInstall
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'preservim/nerdtree'
Plug 'editorconfig/editorconfig-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'

Plug 'tpope/vim-fugitive'
Plug 'wellle/targets.vim'
Plug 'lambdalisue/suda.vim'
Plug 'kshenoy/vim-signature'

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

" Plug 'itchyny/vim-gitbranch'
Plug 'itchyny/lightline.vim'
let g:lightline = {
	\ 'active': {
	\ 	'left': [ [ 'mode', 'paste' ],
	\ 		[ 'gitbranch', 'readonly', 'filename', 'modified' ],
	\		[ 'wordcount' ] ]
	\ },
	\ 'component_function': {
	\ 	'gitbranch': 'FugitiveHead',
	\	'wordcount': 'WordCount'
	\ }
	\ }

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'neoclide/coc.nvim', { 'branch': 'release' }
let g:coc_global_extensions = [ 'coc-eslint', 'coc-tslint', 'coc-tsserver', 'coc-json', 'coc-yaml', 'coc-vetur' ]
" use :CocInstall

let g:suda_smart_edit = 1

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

colo brandt

set clipboard=unnamedplus " make system-clipboard default register

set number
set relativenumber
set cursorcolumn
set cursorline
set updatetime=100 " vim-gitgutter
" set colorcolumn=80

set listchars=eol:¬,tab:> ,trail:~,extends:>,precedes:<,space:␣
set list

set noet ci pi " noexpandtab copyindent preserveindent
set softtabstop=0
set shiftwidth=4
set tabstop=4
set autoindent
set smartindent

set foldmethod=manual
set foldnestmax=10
set nofoldenable
set foldlevel=2

" FileType-Specific

autocmd FileType yaml set et tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType tf set et tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType typescript setlocal commentstring=//\ %s

map <Space> <Leader>
imap jj <ESC>
imap <C-s> <ESC>
nmap <C-s> :w<CR>
nmap <C-p> :Files<CR>
nmap <C-l> :e#<CR>
nmap <C-f> :noh<CR>
nmap <C-n> :NERDTreeToggle<CR>
nmap <C-k> {
nmap <C-j> }
" write shada-file (deleting markers)
nmap <Leader>s :wshada!<CR>
nmap <Leader>2 :set ts=2<CR>
nmap <Leader>4 :set ts=4<CR>
nmap <Leader>r :%retab!<CR>
nmap <Leader>" :%s/'/"/g<CR>
" vim-signature
" jump to start of next line containing a mark
nmap <Leader>M ]'
" jump to start of prev line containting a mark
nmap <Leader>m ['
nmap <Leader>mf '

" vim-fugitive

" nmap <leader>gj :diffget //3<CR>
" nmap <leader>gf :diffgef //2<CR>
" nmap <leader>gs :G<CR>

" COC

nmap <silent> gd <Plug>(coc-definition)

" ALTERNATIVE FOR ARROW KEYS

inoremap <C-j> <Down>
inoremap <C-k> <Up>

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
