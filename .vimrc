" General/Behaviour {{{

" Forget compatibility with Vi. Who cares.
set nocompatible
filetype off

" Strip trailing whitespace in specific filetypes
autocmd FileType c,cpp,java,php,ruby,python autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

" Set syntax highlighting for specific file types
autocmd BufRead,BufNewFile *.md set filetype=markdown

" Enable spellchecking for Markdown
autocmd FileType markdown setlocal spell

" Write the old file out when switching between files.
set autowrite

" Ever notice a slight lag after typing the leader key + command? This lowers the timeout.
set timeoutlen=500

set backspace=2 " Fix broken backspace in some setups
set clipboard=unnamed " yank and paste with the system clipboard

set scrolloff=10 " Start scrolling when we're scrolloff lines away from margin
set sidescrolloff=12 " Start scrolling when we're sidescrolloff chars away from margin
set sidescroll=1

" set number  " show line numbers
" set nornu
filetype indent plugin on
" set modeline
set modelines=0

" hopefully some speed-up
set ttyfast
if !has('nvim')
	set ttyscroll=3
endif
set lazyredraw

set mouse=a " Enable VIM mouse support
set mousehide " Hide mouse when typing

set wildmenu " More useful command-line completion

set dictionary=/usr/share/dict/words

set pastetoggle=<F2> " Toggle paste mode

" Set to auto read when a file is changed from the outside
set autoread
set copyindent
set undolevels=1000
set nohidden

set binary
set noeol " Don’t add empty newlines at the end of files

set ffs=unix,dos,mac " Use Unix as the standard file type

set ruler " Always show current position

set backspace=indent,eol,start " Allow backspace in insert mode
set whichwrap+=<,>,h,l

let html_use_css=1 " Use css for generated html files

" No annoying sound on errors
set noerrorbells
set visualbell
set t_vb=
set tm=500

" Autocomplete me when opening a file:
set wildmode=longest,list

" When editing a file, always jump to the last known cursor
" position. Don't do it when the position is invalid or when
" inside an event handler (happens when dropping a file on gvim).
" Also don't do it when the mark is in the first line, that is
" the default position when opening a file.
autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \ exe "normal! g`\"" |
    \ endif

" }}}

" Vim-plug {{{

silent! if plug#begin('~/.vim/plugged')

Plug 'kien/ctrlp.vim', { 'on': 'CtrlP' }
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'scrooloose/syntastic'
Plug 'vim-utils/vim-troll-stopper'
Plug 'junegunn/limelight.vim'
Plug 'rking/ag.vim'
Plug 'kien/rainbow_parentheses.vim'
Plug 'Chiel92/vim-autoformat'
Plug 'airblade/vim-gitgutter'
Plug 'Yggdroot/indentLine', { 'on': 'IndentLinesEnable' }
autocmd! User indentLine doautocmd indentLine Syntax

call plug#end()
endif

" }}}

" Comments {{{

" Commenting blocks of code.
autocmd FileType c,cpp,java,scala,javascript      let b:comment_leader = '// '
autocmd FileType sh,ruby,python,make              let b:comment_leader = '# '
autocmd FileType conf,fstab,sysctl                let b:comment_leader = '# '
autocmd FileType tex                              let b:comment_leader = '% '
autocmd FileType mail                             let b:comment_leader = '> '
autocmd FileType vim                              let b:comment_leader = '" '
noremap <F7> :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <F8> :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

" Set bracket matching and comment formats
set matchpairs+=<:>
set comments-=s1:/*,mb:*,ex:*/
set comments+=s:/*,mb:**,ex:*/
set comments+=fb:*
set comments+=b:\"
set comments+=n::

" }}}

" Statusline {{{

set laststatus=2

" Formatting and alignment for each item is of
" the form %-0{minwidth}.{maxwidth}{item}
" where - is left alignment, none is right
" and 0 padds numeric elements with zeros.
" Also the space character has to be escaped with \

set statusline=\ [%-.2n]\ \                                            " Number of file in total files to edit
set statusline+=%-10.100F\ \                                           " Complete filename
set statusline+=%#error#                                               " Change color for warnings
set statusline+=%m                                                     " Modified flag
set statusline+=%r                                                     " Read only flag
set statusline+=%h                                                     " Help file flag
set statusline+=%w                                                     " Preview window flag
set statusline+=%*                                                     " Return to normal color
set statusline+=\ \|\ %{strlen(&fenc)?&fenc:'none'},\ %{&ff}\ \|\      " File, character encoding (e.g. [utf-8, unix])
set statusline+=%y                                                     " Filetype
set statusline+=%=                                                     " Switch to the right side
set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}\ \|\  " Highlight code under cursor
set statusline+=%b\ \|\ 0x%B\ \|\                                      " Ascii and hex representation of character under cursor
set statusline+=%{FileSize()}\ \|\ \                                   " Show size of file
set statusline+=%03l/%L,\ %03v\ \|\ \                                    " Show currentline/total lines, column
set statusline+=%p%%\ \                                            " Show percentage in file

" }}}

" Encoding {{{

set termencoding=utf-8
set encoding=utf-8
set fileencoding=utf-8
scriptencoding utf-8
set langmap+=ΑA,ΒB,ΨC,ΔD,ΕE,ΦF,ΓG,ΗH,ΙI,ΞJ,ΚK,ΛL,ΜM,ΝN,ΟO,ΠP,QQ,ΡR,ΣS,ΤT,ΘU,ΩV,WW,ΧX,ΥY,ΖZ
set langmap+=αa,βb,ψc,δd,εe,φf,γg,ηh,ιi,ξj,κk,λl,μm,νn,οo,πp,qq,ρr,σs,τt,θu,ωv,ςw,χx,υy,ζz
set spell spelllang=en
set nospell

" }}}

" Folding {{{

set foldmethod=indent   " Fold based on indent level
set foldnestmax=10      " Max 10 depth
set foldenable          " Don't fold files by default on open
set foldlevelstart=10 " Start with fold level of 1

augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
    autocmd FileType vim setlocal foldlevel=0
    autocmd Syntax c,cpp,xml,html,xhtml setlocal foldmethod=syntax
augroup END

autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

" }}}

" Backups/Undo/Dirs {{{

" Keep backup of edited files
set backup
set writebackup

" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo')
  silent !mkdir -p ~/.cache/vim_backups > /dev/null 2>&1
  set undodir=~/.cache/vim_backups
  set undofile
endif

set backupdir=~/.cache/vim_backups/

silent !mkdir -p ~/.cache/vim_backups/view/ > /dev/null 2>&1
set viewdir=~/.cache/vim_backups/view/
silent !mkdir -p ~/.cache/vim_backups/swap/ > /dev/null 2>&1
set directory=~/.cache/vim_backups/swap/

if !has('nvim')
	set viminfo+=n~/.cache/vim_backups/viminfo
else
	set viminfo+=n~/.cache/vim_backups/nviminfo
endif

set history=1000 " Sets how many lines of history VIM has to remember

" }}}

" Searching {{{

set ignorecase " Ignore case when searching
set gdefault " Add the g flag to search/replace by default
set smartcase " When searching try to be smart about cases
set hlsearch " Highlight search results
set incsearch " Makes search act like search in modern browsers
set showmatch " Show matching brackets when text indicator is over them
set mat=4 " How many tenths of a second to blink when matching brackets

" }}}

" Text, tab and indent related {{{

set expandtab " Use spaces instead of tabs
set smarttab
set copyindent
set softtabstop=4

set shiftwidth=4 " 1 tab == 4 spaces
set tabstop=4
set textwidth=120 " Maximum width of inserted text
set whichwrap=    " Wrap cursor to next/prev line. not!
set formatoptions=qrnl
set nostartofline " Don’t reset cursor to start of line when moving around.

set nowrap " Don't wrap lines
set linebreak " Wrap lines at convenient points

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

set autoindent " Auto indent
set smartindent " Smart indent
set wrap " Wrap lines

" }}}

" Colorscheme selection and syntax highlighting {{{

syntax on

set synmaxcol=1000
set popt+=syntax:y
set cursorline
set t_Co=16
set t_ut= " Disable background color erase
let base16colorspace="256"

try
    if ! has("gui_running")
        set t_Co=256
    endif
    set background=dark
    colorscheme peaksea
catch
endtry

if exists('+colorcolumn')
    set colorcolumn=+1 " Next column after textwidth
    highlight ColorColumn ctermbg=lightblue
endif

" }}}

" Persistent Undo {{{

" }}}

" Key mappings {{{

" Toggle line numbers
nnoremap <F9> :set number!<CR>
map <leader>n :set number!<CR>
map <F3> :retab <CR> :w <CR>

" Remove trailing whitespaces
map <F4> :%s/\s\+$//e<enter> :w<enter>

" Ask for sudo password when editing a read-only file
cmap w!! %!sudo tee > /dev/null %

" Search and replace word under cursor using F6
nnoremap <F6> :%s/<c-r><c-w>/<c-r><c-w>/gc<c-f>$F/i

" Remap leader key to space
let mapleader = "\<Space>"
" let mapleader = ","

" Open ag.vim with <leader> + s(earch)
nnoremap <leader>s :Ag

" Map toggling of folds to space
nnoremap <space> za
vnoremap <space> zf

" Fast saving
nnoremap <leader>w :w!<cr>
nnoremap <leader>wq :wq!<cr>
nnoremap <leader>w11 :w!!<cr>

" Fast quit
nnoremap <leader>q :q<cr>
nnoremap <leader>q1 :q!<cr>

" Fast escape in insert mode
inoremap <leader>ee <ESC>

" Open files
nnoremap <leader>o :CtrlP<CR>

" Copy & paste to system clipboard with <Space>p and <Space>y:
vmap <leader>y "+y
vmap <leader>d "+d
nmap <leader>p "+p
nmap <leader>P "+P
vmap <leader>p "+p
vmap <leader>P "+P

" Enter visual line mode with <Space><Space>:
nmap <leader><leader> V

" Easier search-and-replace
" Search things usual way using /something
" Hit cs, replace first match, and hit <Esc>
" Hit n.n.n.n.n. reviewing and replacing all matches
vnoremap <silent> s //e<C-r>=&selection=='exclusive'?'+1':''<CR><CR>
    \:<C-u>call histdel('search',-1)<Bar>let @/=histget('search',-1)<CR>gv
omap s :normal vs<CR>

" Enter to go to end of file
nnoremap <leader><CR> G
" Backspace to go to beginning of file
nnoremap <leader><BS> gg

" Move between buffers easily
nmap <leader>n :bnext<CR>
nmap <leader>m :bprev<CR>

"Map to display the list of buffers
map <leader>b :ls<CR>

" ctrl-h show command history
nnoremap <leader>h q:

" And q: exits instead of showing command history
nnoremap q: :q
nnoremap Q :q
nnoremap WQ :wq
nnoremap X :x

" Passes whole file from xml identation formatting
nnoremap <leader>xml :%!xmllint --format -

" Run commands that require an interactive shell
nnoremap <leader>run :RunInInteractiveShell<space>

" Autoformat whitespace in file
noremap <leader>format :Autoformat<CR>

" Remap VIM = to first non-blank character
map = ^

" Make <leader-l> clear the highlight as well as redraw
nnoremap <leader>l :nohls<CR><C-L>

" Fix mistyping of :W, :Q etc and turn it to :w, :q etc
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

" }}}

" Functions {{{

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

" }}}

" Plugin configs {{{

" NerdTree
map <leader>t :NERDTreeToggle<CR>

" Autoclose when nerdtree is the only window left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Syntactic

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_quiet_messages = { "type": "style" }
" Echo current error to the command window
let g:syntastic_echo_current_error = 1

" ==== Ignoring certain errors/warnings ====
" - Pylint is checking the modules against python2, don't know how to change that.
" - Disabling import checks.
" - Disabling 80 character width style warning.
" - I don't care about missing module docstrings.
" - Don't complain if I use dashes in my filenames for example (invalid-name).
" - Parens are neccessary after print keyword in python3.
" - Ignored too-many-* warnings make no sense to me.
" - ConnectionResetError is only on python3 namespace.
" - I like to use strings as comments (pointless-string-statements).
" - too-few-public-methods makes no sense.
" - global-variable-not-assigned does not detect if some properties of the variable are changed.
" - Python 3 automatically supports unicode (invalid-encoded-data)
" - [syntax-error] pylint gets python3 syntax wrong sometimes
" - [-bad-builtin] hardly makes any sense??
" - [-star-args] why???
" - [-global-statements] i do like to use them sometimes ...
" - FileNotFoundError is introduced in python3 i believe
let pylint_ignore_regexp = 
    \'\(invalid-name\|Missing module docstring\|line-too-long\|no-name-in-module\|
    \import-error\|redefined-outer-name\|no-member\|too-many-instance-attributes\|
    \pointless-string-statement\|too-few-public-methods\|
    \global-variable-not-assigned\|invalid-encoded-data\|
    \syntax-error\|bad-builtin\|star-args\|global-statement\|
    \FileNotFoundError\)'
" E501 = 80 character width style warning
" ConnectionResetError is only on python3 namespace
" E302 => sometimes i like to use nested functions
"         (2 lines warning not appropriate there)
" E301 => 1 lines warning inappropriate when using nested function
let flake8_ignore_regexp =
    \'\(E501\|undefined name .ConnectionResetError\|E302\|E301\)'
" Ignore 80 character width style warning
let g:syntastic_python_flake8_quiet_messages = { 'regex': flake8_ignore_regexp }
let g:syntastic_python_pylint_quiet_messages = { 'regex': pylint_ignore_regexp }

nmap <leader>sc :SyntasticCheck<CR>



" Close the autocompletion window on movement in insert mode or when leaving insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" Rainbow parentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Use git or silver searcher for CTRL+P autocompletion
let g:ctrlp_use_caching = 0
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor

    let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'
    " ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0

else
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
  let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
    \ }
endif

nmap <Leader>l :Limelight!!0.5<CR>
xmap <Leader>l :Limelight!!0.5<CR>

" }}}

" NVim specific {{{

if has('nvim')

    " Use cursor shape feature
    let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1

endif

" }}}
