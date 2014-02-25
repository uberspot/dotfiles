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

" Set up the status line
fun! <SID>SetStatusLine()
    let l:s1="%-3.3n\\ %f\\ %h%m%r%w"
    let l:s2="[%{strlen(&filetype)?&filetype:'?'},%{&encoding},%{&fileformat}]"
    let l:s3="%=\\ 0x%-8B\\ \\ %-14.(%l,%c%V%)\\ %<%P"
    execute "set statusline=" . l:s1 . l:s2 . l:s3
endfun

" Setup statusline
set laststatus=2
call <SID>SetStatusLine()

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

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
set textwidth=120 " Maximum width of inserted text
set whichwrap=    " Wrap cursor to next/prev line. not!
set dictionary=/usr/share/dict/words

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" ask for sudo password when editing a read-only file
cmap w!! %!sudo tee > /dev/null %
