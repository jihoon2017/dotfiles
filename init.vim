
" vim-plug
call plug#begin('~/.config/nvim/plugged')

Plug 'altercation/vim-colors-solarized'
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'kshenoy/vim-signature'
Plug 'majutsushi/tagbar'
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/limelight.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'

call plug#end()


""""""""""""""""""""""""""""""""""""""""""""""""""""""
" settings for plug-ins
""""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDTreeShowHidden = 1

" for limelight
let g:limelight_conceal_ctermfg = 'gray'

" for fzf
" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
"command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow -g "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)

" for rg
set grepprg=rg\ --vimgrep

" gtags
if filereadable("./GTAGS")
	echo "GTAGS file found"
    set cscopetag cscopeverbose
    set cscopeprg=gtags-cscope
	cs add ./GTAGS
	nmap <F4> :Gtags <C-R>=expand("<cword>")<CR><CR>
	nmap <F5> :Gtags -r <C-R>=expand("<cword>")<CR><CR>
	nmap <F6> :Gtags -s <C-R>=expand("<cword>")<CR><CR>
	nmap <F7> :Gtags -f %<CR>
    let g:Gtags_No_Auto_Jump = 1
elseif filereadable("./tags")
	echo "tags file found"
    set tags=tags
	if filereadable("./cscope.out")
		echo "cscope.out file found"
		set csprg=/usr/local/bin/cscope
		set csto=0
		set nocsverb
		cs add ./cscope.out
		set csverb
	endif
	nmap <F4> :cs find s <C-R>=expand("<cword>")<CR><CR>
	nmap <F5> :cs find c <C-R>=expand("<cword>")<CR><CR>
	nmap <F6> :cs find t <C-R>=expand("<cword>")<CR><CR>
endif

" ctags and cscope
"if filereadable("./tags")
"    set tags=tags
"endif
"if filereadable("./cscope.out")
"    set csprg=/usr/local/bin/cscope
"    set csto=0
"    set nocsverb
"    cs add ./cscope.out
"    set csverb
"endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" key map
""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <F3> :Find <C-R>=expand("<cword>")<CR><CR>

" for gtags
"nmap <F4> :Gtags <C-R>=expand("<cword>")<CR><CR>
"nmap <F5> :Gtags -r <C-R>=expand("<cword>")<CR><CR>
"nmap <F6> :Gtags -s <C-R>=expand("<cword>")<CR><CR>
"nmap <F7> :Gtags -f %<CR>

" for ctags and cscope
"nmap <F4> :cs find s <C-R>=expand("<cword>")<CR><CR>
"nmap <F5> :cs find c <C-R>=expand("<cword>")<CR><CR>
"nmap <F6> :cs find t <C-R>=expand("<cword>")<CR><CR>

nmap <F8> :NERDTreeToggle<CR>
nmap <F9> :TagbarToggle<CR>
"nmap <F9> :bn<CR>

nmap <Leader>ff :Files<CR>
nmap <Leader>bb :Buffers<CR>
nmap <Leader>ll :Lines<CR>
"nmap <Leader>fc :Colors<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""
" settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=utf-8
"set fileencodings=utf-8,cp949
set fileencodings=utf-8
set ruler
set cindent
set smartindent
"set autoindent
set nu
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
set mouse=a
" paste option could disable indent
"set paste
set backspace=indent,eol,start
set wrap
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
"set noexpandtab
set nobackup
set noswapfile
set visualbell
set showcmd
"set list listchars=tab:▸\ ,trail:·,precedes:←,extends:→,eol:⏎
"set list listchars=tab:>>,trail:·,precedes:←,extends:→,eol:★
"set list listchars=tab:→\ ,trail:·,precedes:«,extends:»,eol:¶
set list listchars=tab:→\ ,trail:·,precedes:«,extends:»,eol:★
set cursorcolumn
set cursorline

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" color scheme
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" for seoul256 colorscheme
"let g:seoul256_background=233
"colorscheme seoul256
set background=dark
colorscheme solarized

let &colorcolumn=join(range(101,999),",")
