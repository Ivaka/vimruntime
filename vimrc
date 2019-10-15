set nocompatible

set history=500

set hidden

syntax enable

filetype plugin indent on

set autoread

set wildmenu
set wildignore=*.o,*~,*.pyc,.git\*,.hg\*,.svn\*

set lazyredraw

set showmatch

set encoding=utf8

" how many tenths of a second to blink when matching brackets
set mat=2

set ffs=unix,dos,mac

" undo across restarts
try
  set undodir=~/.vimruntime/temp/undo
  set undofile
catch
endtry

" disable sound alerts
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" no swap and backup
set nobackup
set nowb
set noswapfile

set wrap

set linebreak
set textwidth=500

set autoindent
set smartindent

nnoremap <silent> <Tab> :bn<CR>
nnoremap <silent> <S-Tab> :bp<CR>

set backspace=indent,eol,start

set listchars=tab:▸·,trail:·,eol:¬,precedes:←,extends:→
set tabstop=2 softtabstop=2 expandtab shiftwidth=2 smarttab

set number
set relativenumber
set ruler

" status line
set laststatus=2
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

try
  colorscheme desert
catch
endtry

highlight MatchParen cterm=bold ctermbg=none ctermfg=220

set colorcolumn=130
highlight ColorColumn ctermbg=89

inoremap qq <Esc>

" autocomplete
inoremap <Leader>\ <C-N>
inoremap <expr> j ((pumvisible())?("\<C-N>"):("j"))
inoremap <expr> k ((pumvisible())?("\<C-P>"):("k"))

" go to beginning of line with <leader>q
inoremap <Leader>q <esc>^i
nnoremap <Leader>q ^

nnoremap <Leader>w :w!<cr>

nnoremap <Space> /

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" navigate windows
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <silent> <C-X> :nohlsearch<CR><C-L>

nnoremap <Leader>pp :setlocal paste!<CR>
nnoremap <Leader>ee :e <C-R>=expand("%:p:h")<CR>/
nnoremap <Leader>bq :bp <BAR> bd #<CR>

" change cwd
nnoremap <Leader>cd :cd %:p:h<CR>:pwd<CR>

nnoremap <Leader>gu :GitGutterToggle<CR>

vnoremap <C-H> :s/

" surround selection with...
vnoremap $1 <Esc>`>a)<Esc>`<i(<Esc>
vnoremap $2 <Esc>`>a]<Esc>`<i[<Esc>
vnoremap $3 <Esc>`>a}<Esc>`<i{<Esc>
vnoremap $$ <Esc>`>a"<Esc>`<i"<Esc>
vnoremap $q <Esc>`>a'<Esc>`<i'<Esc>

" map auto complete of (, ", ', [
inoremap $1 ()<Esc>i
inoremap $2 []<Esc>i
inoremap $3 {}<Esc>i
inoremap $4 {<Esc>o}<Esc>O

" copy to clipboard
noremap <leader>y "+y
noremap <leader>Y "*y

" paste yanked
noremap <leader>p "0p
noremap <leader>P "0P

command W w !sudo tee % > /dev/null
command Toclip let @+=@"

command Nuke bufdo bd
command TrailBeGone %s/\s\+$//e
command AllSingle %s/"/'/g
command AllDouble %s/'/"/g

" search settings
set ignorecase
set smartcase
set hlsearch
set incsearch

highlight Search ctermbg=220 ctermfg=053

" python stuff
augroup filetype_python
  autocmd BufNewFile,BufRead *.py :iabbrev slef self
  autocmd BufNewFile,BufRead *.py vnoremap <leader>cb <esc>`<O'''<esc>`>o'''<esc>o
  autocmd BufNewFile,BufRead *.py :iabbrev <buffer> debugger import pdb; pdb.set_trace()
augroup END


" typescript
augroup filetype_ts
  autocmd BufNewFile,BufRead *.ts set expandtab
  autocmd FileType typescript imap <buffer> <Leader>o <C-x><C-o>
augroup END

" tsuquyomi (typescript autocomplete using tsserver)
let g:tsuquyomi_completion_detail = 1
let g:tsuquyomi_import_curly_spacing = 0


" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tagbar#enabled = 1
let g:airline_theme="luna"

" tagbar
nmap <F8> :TagbarToggle<CR>

" ale
let g:airline#extensions#ale#enabled = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

let g:ale_fix_on_save = 1
let g:ale_lint_on_save = 1

let g:ale_python_flake8_options = '-m flake8 --max-line-length=120'
let g:python_yapf_use_global = 1
let g:ale_fixers = {'python': ['yapf']}

" nerdcommenter
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1

" nnn
let g:nnn#layout = 'vnew'
let g:nnn#layout = { 'left': '~20%' }

" used in the statusline to indicate when in paste mode
function! HasPaste()
  if &paste
    return 'PASTE MODE  '
  endif
  return ''
endfunction
