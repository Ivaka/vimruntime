" GENERAL SETTINGS

set nocompatible

set history=500

filetype plugin on
filetype indent on

set autoread

set wildmenu
set wildignore=*.o,*~,*.pyc
set wildignore+=.git\*,.hg\*,.svn\*

"" Don't redraw while executing macros (good performance config)
set lazyredraw

"" For regular expressions turn magic on
set magic

"" Show matching brackets when text indicator is over them

set showmatch

"" How many tenths of a second to blink when matching brackets
set mat=2

"" Add a bit extra margin to the left
set foldcolumn=1

"" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

"" Use Unix as the standard file type
set ffs=unix,dos,mac

"" Be able to undo across restarts
try
	set undodir=~/.vimruntime/temp/undo
	set undofile
catch
endtry

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

"" Turn swapfiles and backup off
set nobackup
set nowb
set noswapfile

"" Linebreak on 500 characters
set lbr
set tw=500

"" Auto indent
set ai

"" Smart indent
set si

"" Wrap lines
set wrap

"" This allows buffers to be hidden if you've modified a buffer.
"" This is almost a must if you wish to use buffers in this way.
set hidden

set backspace=indent,eol,start

" DISPLAY SETTINGS

set listchars=tab:▸·,trail:·,eol:¬,precedes:←,extends:→
set tabstop=4 softtabstop=4 noexpandtab shiftwidth=4 smarttab

set nu
set relativenumber
set ruler

"" Height of the command bar
set cmdheight=2

"" Always show the status line
set laststatus=2
"
"" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

set gfn=Hack:h14,Source\ Code\ Pro:h12,Bitstream\ Vera\ Sans\ Mono:h11

"" Enable syntax highlighting
syntax enable

try
	colorscheme desert
catch
endtry

"" Set Matching Parenthesis group highlight color
hi MatchParen cterm=bold ctermbg=none ctermfg=220

" SHORTCUT SETTINGS

inoremap qq <Esc>

nmap <leader>w :w!<cr>

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <silent> <C-X> :nohlsearch<CR><C-L>

command W w !sudo tee % > /dev/null

inoremap <leader>\ <C-x><C-p>

imap <C-d> <Esc>caw " Ctrl+d delete word under cursor

"" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

map <leader>ee :e <c-r>=expand("%:p:h")<cr>/

"" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

"" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

"" Surround selection with...
vnoremap $1 <esc>`>a)<esc>`<i(<esc>
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $$ <esc>`>a"<esc>`<i"<esc>
vnoremap $q <esc>`>a'<esc>`<i'<esc>
vnoremap $e <esc>`>a"<esc>`<i"<esc>

"" Map auto complete of (, ", ', [
inoremap $1 ()<esc>i
inoremap $2 []<esc>i
inoremap $3 {}<esc>i
inoremap $4 {<esc>o}<esc>O

nnoremap <leader>gu :GitGutterToggle<CR>

"" Move to the next buffer
nmap <leader>l :bnext<CR>

"" Move to the previous buffer
nmap <leader>h :bprevious<CR>

"" Close the current buffer and move to the previous one
nmap <leader>bq :bp <BAR> bd #<CR>

" SEARCH SETTINGS

set ignorecase

set smartcase

set hlsearch

"" Makes search act like search in modern browsers
set incsearch

set background=dark

"" Set Search group highlight color
hi Search ctermbg=220 ctermfg=053

" PLUGIN SETTINGS

"" Load plugins
call pathogen#infect('~/.vimruntime/plugins/{}')
call pathogen#helptags()

"" Vim airline settings
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tagbar#enabled = 1
let g:airline_theme="luna"

"" Tagbar
nmap <F8> :TagbarToggle<CR>

"" Asynchronous Lint Engine
let g:airline#extensions#ale#enabled = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

let g:ale_fix_on_save = 1
let g:ale_lint_on_save = 1

let g:python_autopep8_use_global = 1
let g:ale_fixers = {'python': ['autopep8']}
let g:ale_python_autopep8_options = '--aggressive --aggressive'

" MISC

command Nuke bufdo bd
command TrailBeGone %s/\s\+$//e
command PDB !python -m pdb %
command AllSingle %s/"/'/g
command AllDouble %s/'/"/g

"" Used in the statusline to indicate when in paste mode
function! HasPaste()
	if &paste
		return 'PASTE MODE  '
	endif
	return ''
endfunction
