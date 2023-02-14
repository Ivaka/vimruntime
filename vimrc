"
" enable syntax highlighting and filetype plugins and indents
syntax enable

filetype plugin indent on

" set colorscheme here, as I override some options below
try
  colorscheme desert
catch
endtry

"
" refresh file if it was changed from outside vim
set autoread

"
" enable wildmenu and ignore files
set wildmenu
set wildignore=*.o,*~,*.pyc,.git\*,.hg\*,.svn\*

"
" don't redraw when executing macros etc.
set lazyredraw

"
" show (){}[] matches
set showmatch
set matchtime=2
highlight MatchParen cterm=bold ctermbg=none ctermfg=220

"
" set default encoding and fileformats
set encoding=utf8
set ffs=unix,dos,mac

"
" undo across restarts
try
  set undodir=~/.vim/temp/undo
  set undofile
catch
endtry

" no swap and backup
set nobackup
set nowb
set noswapfile

" disable sound alerts
set noerrorbells
set novisualbell
set t_vb=
set tm=500

"
" set line break options
set wrap
set linebreak
set textwidth=500

"
" set indent options
set autoindent
set smartindent

"
" use tab to switch between buffers
nnoremap <silent> <Tab> :bn<CR>
nnoremap <silent> <S-Tab> :bp<CR>

"
" adjust backspace
" should be like this by default on most systems
set backspace=indent,eol,start

"
" set nicer chars for list mode
set listchars=tab:▸·,trail:·,eol:¬,precedes:←,extends:→

"
" configure tabs to two spaces
set expandtab shiftwidth=2 softtabstop=2 smarttab

"
" set number bar, relateive mode and enable ruler
set number
set relativenumber
set ruler

"
" always show status bar
set laststatus=2
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

" used in the statusline to indicate when in paste mode
function! HasPaste()
  if &paste
    return 'PASTE MODE  '
  endif
  return ''
endfunction

"
" show column at 140 chars
set colorcolumn=140
highlight ColorColumn ctermbg=89


hi clear CursorLine
hi CursorLineNR cterm=bold

"
" search settings
set ignorecase
set smartcase
set hlsearch
set incsearch

highlight Search ctermbg=220 ctermfg=053


"
" bindings that I am used to

" exit insert mode with 'qq'
inoremap qq <Esc>

" go to beginning of line with <leader>q
inoremap <Leader>q <esc>^i
nnoremap <Leader>q ^

" quick save
nnoremap <Leader>w :w!<cr>

" space open forward search
nnoremap <Space> /

" disable useless keys on keyboard
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" easier window navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" remove search highlights
nnoremap <silent> <C-X> :nohlsearch<CR><C-L>

" set paste mode
nnoremap <Leader>pp :setlocal paste!<CR>

" open file from current directory
nnoremap <Leader>ee :e <C-R>=expand("%:p:h")<CR>/

" change cwd
nnoremap <Leader>cd :cd %:p:h<CR>:pwd<CR>

" quit current buffer
nnoremap <Leader>bq :bp <BAR> bd #<CR>

" search and replace in visual
vnoremap <C-H> :s/

" surround selection with...
vnoremap $1 <Esc>`>a)<Esc>`<i(<Esc>
vnoremap $2 <Esc>`>a]<Esc>`<i[<Esc>
vnoremap $3 <Esc>`>a}<Esc>`<i{<Esc>
vnoremap $$ <Esc>`>a"<Esc>`<i"<Esc>
vnoremap $q <Esc>`>a'<Esc>`<i'<Esc>

" copy to clipboard
noremap <leader>y "+y
noremap <leader>Y "*y

" paste yanked
noremap <leader>p "0p
noremap <leader>P "0P

" save file with sudo
command W w !sudo tee % > /dev/null

" keep 4 lines off the edges of the screen when scrolling
set scrolloff=4

" source ~/.vim/vim-airline


" GUI stuff
if has('gui_running')
  set guifont=Liberation\ Mono\ 16
endif
