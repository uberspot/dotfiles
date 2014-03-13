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

" Forget compatibility with Vi. Who cares.
set nocompatible

" Write the old file out when switching between files.
set autowrite

" Ever notice a slight lag after typing the leader key + command? This lowers
" the timeout.
set timeoutlen=500

" Set encoding
set termencoding=utf-8
set encoding=utf-8
set fileencoding=utf-8
scriptencoding utf-8
set langmap+=ΑA,ΒB,ΨC,ΔD,ΕE,ΦF,ΓG,ΗH,ΙI,ΞJ,ΚK,ΛL,ΜM,ΝN,ΟO,ΠP,QQ,ΡR,ΣS,ΤT,ΘU,ΩV,WW,ΧX,ΥY,ΖZ
set langmap+=αa,βb,ψc,δd,εe,φf,γg,ηh,ιi,ξj,κk,λl,μm,νn,οo,πp,qq,ρr,σs,τt,θu,ωv,ςw,χx,υy,ζz

set spell spelllang=en
set nospell

set scrolloff=5 " Start scrolling when we're scrolloff lines away from margin
set sidescrolloff=8 " Start scrolling when we're sidescrolloff chars away from margin
set sidescroll=1

" show line numbers
" set number
" set nornu
" set modeline

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
set novisualbell
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
set synmaxcol=160
set popt+=syntax:y
set cursorline
set t_Co=16

try
	colorscheme Mustang
catch
endtry
  
set colorcolumn=+1 " next column after textwidth

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

set mousehide " Hide mouse when typing

" More useful command-line completion
set wildmenu

set dictionary=/usr/share/dict/words

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Toggle paste mode
set pastetoggle=<F2> 

" Toggle line numbers
nnoremap <F8> :set number!<CR>
map <leader>n :set number!<cr>

" ask for sudo password when editing a read-only file
cmap w!! %!sudo tee > /dev/null %

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
