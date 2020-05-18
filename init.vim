
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
Plug 'morhetz/gruvbox.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 't9md/vim-quickhl'
Plug 'sheerun/vim-polyglot'
Plug 'dracula/vim', {'as':'dracula'}
Plug 'frazrepo/vim-rainbow'
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

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
"command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow -g "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
"command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
"command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
"command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --follow --glob "!.git/*" -g "!*.class" -g "!tags" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --follow --glob "!.git/*" -g "!*.class" -g "!tags" -g "!*.d" -g "!*.d.*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
"let g:fzf_layout = { 'window': 'enew' }
let $FZF_DEFAULT_COMMAND='fd --type f --follow --exclude .git'

" for rg
set grepprg=rg\ --vimgrep

" deoplete
"let g:python3_host_prog = '/home/jihoon.lee/tools/python-3.6.5/bin/python3'
let g:deoplete#enable_at_startup = 1

" vim-airline
let g:airline#extensions#tabline#enabled = 1 " turn on buffer list
let g:airline_powerline_fonts = 1
set laststatus=2
let g:airline#extensions#tabline#fnamemod = ':t' " name only in tabline

" vim-rainbow
let g:rainbow_active = 1

let g:ranger_map_keys = 0
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" key map and tags
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" gtags
if filereadable("./GTAGS")
	echo "GTAGS file found"
    set cscopetag cscopeverbose
    set cscopeprg=gtags-cscope
	cs add ./GTAGS
	"nmap <F4> :Gtags <C-R>=expand("<cword>")<CR><CR>
	"nmap <F4> :Gtags -r <C-R>=expand("<cword>")<CR><CR>
	nmap <F5> :Gtags -r <C-R>=expand("<cword>")<CR><CR>
	"nmap <F6> :Gtags -s <C-R>=expand("<cword>")<CR><CR>
	nmap <F6> :BTags <CR>
	"nmap <F7> :Gtags -f %<CR>
	nmap <F7> :Tags <CR>
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
nmap <Leader>mm :Marks<CR>
"nmap <Leader>fc :Colors<CR>
nmap <Leader>rr :Ranger<CR>

nmap <Space>m <Plug>(quickhl-manual-this)
xmap <Space>m <Plug>(quickhl-manual-this)
nmap <F2> <Plug>(quickhl-manual-toggle)
xmap <F2> <Plug>(quickhl-manual-toggle)
nmap <Space>M <Plug>(quickhl-manual-reset)
xmap <Space>M <Plug>(quickhl-manual-reset)

" for window navigation
nmap <C-h> <C-W>h
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-l> <C-W>l

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
set encoding=utf-8
"set fileencodings=utf-8,cp949
set fileencodings=utf-8
set ruler
set cindent
set smartindent
"set autoindent
" absolute number
"set nu
" absolute + relative number
set nu rnu
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
" for large file syntax highlight
set redrawtime=10000

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" color scheme
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" for seoul256 colorscheme
"let g:seoul256_background=233
"colorscheme seoul256
set background=dark
"colorscheme solarized
colorscheme gruvbox
let g:gruvbox_gruvbox_italic = 1

"let &colorcolumn=join(range(101,999),",")
set colorcolumn=100
"highlight ColorColumn guibg=grey
highlight ColorColumn ctermbg=238

