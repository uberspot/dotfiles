" Forget compatibility with Vi. Who cares.
set nocompatible
filetype off

" Strip trailing whitespace in specific filetypes
autocmd FileType c,cpp,java,php,ruby,python autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

" Setup statusline
set laststatus=2

" Formatting and alignment for each item is of
" the form %-0{minwidth}.{maxwidth}{item}
" where - is left alignment, none is right
" and 0 padds numeric elements with zeros.
" Also the space character has to be escaped with \

set statusline=\ [%-.2n]\ \                                            " number of file in total files to edit
set statusline+=%-10.100F\ \                                           " complete filename
set statusline+=%#error#                                               " change color for warnings
set statusline+=%m                                                     " modified flag
set statusline+=%r                                                     " read only flag
set statusline+=%h                                                     " help file flag
set statusline+=%w                                                     " preview window flag
set statusline+=%*                                                     " return to normal color
set statusline+=\ \|\ %{strlen(&fenc)?&fenc:'none'},\ %{&ff}\ \|\      " file, character encoding (e.g. [utf-8, unix])
set statusline+=%y                                                     " filetype
set statusline+=%=                                                     " switch to the right side
set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}\ \|\  " highlight code under cursor
set statusline+=%b\ \|\ 0x%B\ \|\                                      " ascii and hex representation of character under cursor
set statusline+=%{FileSize()}\ \|\ \                                   " show size of file
set statusline+=%03l/%L,\ %03v\ \|\ \                                    " show currentline/total lines, column
set statusline+=%p%%\ \                                            " show percentage in file

" Write the old file out when switching between files.
set autowrite

" Ever notice a slight lag after typing the leader key + command? This lowers the timeout.
set timeoutlen=500

set backspace=2 " Fix broken backspace in some setups
set clipboard=unnamed " yank and paste with the system clipboard

" Set encoding
set termencoding=utf-8
set encoding=utf-8
set fileencoding=utf-8
scriptencoding utf-8
set langmap+=ΑA,ΒB,ΨC,ΔD,ΕE,ΦF,ΓG,ΗH,ΙI,ΞJ,ΚK,ΛL,ΜM,ΝN,ΟO,ΠP,QQ,ΡR,ΣS,ΤT,ΘU,ΩV,WW,ΧX,ΥY,ΖZ
set langmap+=αa,βb,ψc,δd,εe,φf,γg,ηh,ιi,ξj,κk,λl,μm,νn,οo,πp,qq,ρr,σs,τt,θu,ωv,ςw,χx,υy,ζz
set spell spelllang=en
set nospell

set scrolloff=10 " Start scrolling when we're scrolloff lines away from margin
set sidescrolloff=12 " Start scrolling when we're sidescrolloff chars away from margin
set sidescroll=1

" show line numbers
" set number
" set nornu
set modeline

" hopefully some speed-up
set ttyfast
set ttyscroll=3
set lazyredraw

" Set bracket matching and comment formats
set matchpairs+=<:>
set comments-=s1:/*,mb:*,ex:*/
set comments+=s:/*,mb:**,ex:*/
set comments+=fb:*
set comments+=b:\"
set comments+=n::

" Keep backup of edited files
set backup
set writebackup
set backupdir=~/.backups/

set history=700 " Sets how many lines of history VIM has to remember

" Set to auto read when a file is changed from the outside
set autoread
set nohidden

" Use Unix as the standard file type
set ffs=unix,dos,mac

set ruler "Always show current position

set backspace=indent,eol,start "Allow backspace in insert mode
set whichwrap+=<,>,h,l

set ignorecase " Ignore case when searching

set smartcase " When searching try to be smart about cases

set hlsearch " Highlight search results

set incsearch " Makes search act like search in modern browsers

set showmatch " Show matching brackets when text indicator is over them

set mat=2 " How many tenths of a second to blink when matching brackets

let html_use_css=1 " Use css for generated html files

" No annoying sound on errors
set noerrorbells
set visualbell
set t_vb=
set tm=500

" Clear previous autocmds, stops a few errors creeping in.
autocmd!

" When editing a file, always jump to the last known cursor
" position. Don't do it when the position is invalid or when
" inside an event handler (happens when dropping a file on gvim).
" Also don't do it when the mark is in the first line, that is
" the default position when opening a file.
autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \ exe "normal! g`\"" |
    \ endif

"""""""""""""""""""""""""""""""""""""""""""""""
" colorscheme selection and syntax hilighting "
"""""""""""""""""""""""""""""""""""""""""""""""
syntax on
filetype indent plugin on

set synmaxcol=160
set popt+=syntax:y
set cursorline
set t_Co=16

try
    set background=dark
    colorscheme peaksea
catch
endtry

set colorcolumn=+1 " next column after textwidth


" ================ Persistent Undo ==================
" " Keep undo history across sessions, by storing in file.
" " Only works all the time.
if has('persistent_undo')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

""""""""""""""""""""""""""""""""
" Text, tab and indent related "
""""""""""""""""""""""""""""""""

set expandtab " Use spaces instead of tabs
set smarttab
set copyindent
set softtabstop=4

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
set textwidth=120 " Maximum width of inserted text
set whichwrap=    " Wrap cursor to next/prev line. not!
set formatoptions=qrnl

set nowrap "Don't wrap lines
set linebreak "Wrap lines at convenient points

set mousehide " Hide mouse when typing

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

" More useful command-line completion
set wildmenu

set dictionary=/usr/share/dict/words

set autoindent "Auto indent
set smartindent "Smart indent
set wrap "Wrap lines

" Toggle paste mode
set pastetoggle=<F2>

" KEY MAPPINGS

" Commenting blocks of code.
autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
autocmd FileType sh,ruby,python   let b:comment_leader = '# '
autocmd FileType conf,fstab       let b:comment_leader = '# '
autocmd FileType tex              let b:comment_leader = '% '
autocmd FileType mail             let b:comment_leader = '> '
autocmd FileType vim              let b:comment_leader = '" '
noremap <F7> :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <F8> :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

" Toggle line numbers
nnoremap <F9> :set number!<CR>
map <leader>n :set number!<CR>
map <F3> :retab <CR> :w <CR>

" Remove trailing whitespace by pressing t && s keys
map <F4> :%s/\s\+$//e<enter> :w<enter>

" ask for sudo password when editing a read-only file
cmap w!! %!sudo tee > /dev/null %

" Search and replace word under cursor using F6
nnoremap <F6> :%s/<c-r><c-w>/<c-r><c-w>/gc<c-f>$F/i

" Remap leader key to ,
let mapleader = ","

" Map toggling of folds to space
nnoremap <space> za
vnoremap <space> zf

" Fast saving
nmap <leader>w :w!<cr>

" Move between buffers easily
nmap <C-n> :bnext<CR>
nmap <C-p> :bprev<CR>

" Map <F5> to / (search)
map <F5> /

"Map to display the list of buffers
map <F10> :ls<CR>

" ctrl-h show command history
nnoremap <C-h> q:
" and q: exits instead of showing command history
nnoremap q: :q

nnoremap Q :q
nnoremap WQ :wq


" Remap VIM = to first non-blank character
map = ^

"make <c-l> clear the highlight as well as redraw
nnoremap <C-L> :nohls<CR><C-L>
inoremap <C-L> <C-O>:nohls<CR>

" fix mistyping of :W, :Q etc and turn it to :w, :q etc
if has("user_commands")
    command! -bang -nargs=? -complete=file E e<bang> <args>
    command! -bang -nargs=? -complete=file W w<bang> <args>
    command! -bang -nargs=? -complete=file Wq wq<bang> <args>
    command! -bang -nargs=? -complete=file WQ wq<bang> <args>
    command! -bang Wa wa<bang>
    command! -bang WA wa<bang>
    command! -bang Q q<bang>
    command! -bang QA qa<bang>
    command! -bang Qa qa<bang>
endif

" FUNCTIONS

" Automatically create parent dirs for edited files if they don't exist
function s:MkNonExDir(file, buf)
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
        let dir=fnamemodify(a:file, ':h')
        if !isdirectory(dir)
            call mkdir(dir, 'p')
        endif
    endif
endfunction
augroup BWCCreateDir
    autocmd!
    autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \ exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%


" Copy/Paste from Word*doc files is a mess
fun! FixInvisiblePunctuation()
    silent! %s/\%u2018/'/g
    silent! %s/\%u2019/'/g
    silent! %s/\%u2026/.../g
    silent! %s/\%uf0e0/->/g
    silent! %s/\%u0092/'/g
    silent! %s/\%u2013/--/g
    silent! %s/\%u2014/--/g
    silent! %s/\%u201C/"/g
    silent! %s/\%u201D/"/g
    silent! %s/\%u0052\%u20ac\%u2122/'/g
    silent! %s/\%ua0/ /g
    retab
endfun

function! FileSize()
    let bytes = getfsize(expand("%:p"))
    if bytes <= 0
        return ""
    endif
    if bytes < 1024
        return bytes
    else
        return (bytes / 1024) . "K"
    endif
endfunction

function! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

" VUNDLE

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'Valloric/YouCompleteMe'

call vundle#end()

filetype plugin indent on


" NerdTree conf

map <C-D> :NERDTreeToggle<CR>

" autoclose when nerdtree is the only window left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif


