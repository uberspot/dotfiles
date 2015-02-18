" Colorscheme created with ColorSchemeEditor v1.2.3
"Name: PerfectDark
"Maintainer: Vic Luo <lz96@foxmail.com>
"Last Change: 2015 02 17
set background=dark
if version > 580
	highlight clear
	if exists("syntax_on")
		syntax reset
	endif
endif
let g:colors_name = "PerfectDark"

if v:version >= 700
highlight CursorColumn guibg=grey40 gui=NONE ctermbg=241 cterm=NONE
highlight CursorLine guibg=#3d3d3d gui=NONE ctermbg=237 cterm=NONE
highlight Pmenu guibg=#000d52 gui=NONE ctermbg=17 cterm=NONE
highlight PmenuSel guibg=#0040b7 gui=NONE ctermbg=26 cterm=NONE
highlight PmenuSbar guibg=grey gui=NONE ctermbg=250 cterm=NONE
highlight PmenuThumb guibg=white gui=NONE ctermbg=231 cterm=NONE
highlight TabLine guibg=darkgrey gui=underline ctermbg=248 cterm=underline
highlight TabLineFill gui=reverse cterm=reverse
highlight TabLineSel gui=bold cterm=bold
	if has('spell')
highlight SpellBad gui=undercurl cterm=undercurl
highlight SpellCap gui=undercurl cterm=undercurl
highlight SpellLocal gui=undercurl cterm=undercurl
highlight SpellRare gui=undercurl cterm=undercurl
	endif
endif
highlight Cursor guifg=bg guibg=#aaaaaa gui=NONE ctermbg=248 cterm=NONE
highlight CursorIM gui=NONE cterm=NONE
highlight DiffAdd guibg=darkblue gui=NONE ctermbg=18 cterm=NONE
highlight DiffChange guibg=darkmagenta gui=NONE ctermbg=90 cterm=NONE
highlight DiffDelete guifg=blue guibg=darkcyan gui=bold ctermfg=21 ctermbg=30 cterm=bold
highlight DiffText guibg=red gui=bold ctermbg=196 cterm=bold
highlight Directory guifg=#35d244 gui=NONE ctermfg=77 cterm=NONE
highlight ErrorMsg guifg=white guibg=red gui=NONE ctermfg=231 ctermbg=196 cterm=NONE
highlight FoldColumn guifg=cyan guibg=grey gui=NONE ctermfg=51 ctermbg=250 cterm=NONE
highlight Folded guifg=#111111 guibg=#8090a0 gui=NONE ctermfg=233 ctermbg=245 cterm=NONE
highlight IncSearch guifg=slategrey guibg=khaki gui=reverse ctermfg=67 ctermbg=186 cterm=reverse
highlight LineNr guifg=#999999 guibg=#191414 gui=NONE ctermfg=247 ctermbg=233 cterm=NONE
highlight MatchParen guibg=darkcyan gui=NONE ctermbg=30 cterm=NONE
highlight ModeMsg gui=bold cterm=bold
highlight MoreMsg guifg=seagreen gui=bold ctermfg=29 cterm=bold
highlight NonText guifg=#444444 guibg=#222222 gui=bold ctermfg=238 ctermbg=235 cterm=bold
highlight Normal guifg=#ececec guibg=#222222 gui=NONE ctermfg=255 ctermbg=235 cterm=NONE
highlight Question guifg=green gui=bold ctermfg=46 cterm=bold
highlight Search guifg=wheat guibg=#633509 gui=underline ctermfg=223 ctermbg=88 cterm=underline
highlight SignColumn guifg=cyan guibg=#000000 gui=NONE ctermfg=51 ctermbg=16 cterm=NONE
highlight SpecialKey guifg=cyan gui=NONE ctermfg=51 cterm=NONE
highlight StatusLine guifg=white guibg=#8090a0 gui=bold ctermfg=231 ctermbg=245 cterm=bold
highlight StatusLineNC guifg=#506070 guibg=#a0b0c0 gui=reverse ctermfg=59 ctermbg=110 cterm=reverse
highlight Title guifg=#ffffff gui=bold ctermfg=231 cterm=bold
highlight VertSplit guifg=#000735 guibg=#152269 gui=reverse ctermfg=17 ctermbg=17 cterm=reverse
highlight Visual guibg=#5c5c5c gui=NONE ctermbg=59 cterm=NONE
highlight VisualNOS gui=bold,underline cterm=bold,underline
highlight WarningMsg guifg=red gui=NONE ctermfg=196 cterm=NONE
highlight WildMenu guifg=black guibg=yellow gui=NONE ctermfg=16 ctermbg=226 cterm=NONE
highlight link Boolean Constant
highlight link Character Constant
highlight Comment guifg=#999999 gui=NONE ctermfg=247 cterm=NONE
highlight link Conditional Statement
highlight Constant guifg=#ed9d13 gui=NONE ctermfg=214 cterm=NONE
highlight link Debug Special
highlight Define guifg=#cd23cd gui=NONE ctermfg=164 cterm=NONE
highlight link Delimiter Special
highlight Error guifg=white guibg=red gui=NONE ctermfg=231 ctermbg=196 cterm=NONE
highlight link Exception Statement
highlight link Float Number
highlight Function guifg=#447fcf gui=NONE ctermfg=68 cterm=NONE
highlight Identifier guifg=#40ffff gui=NONE ctermfg=51 cterm=NONE
highlight Ignore guifg=bg gui=NONE cterm=NONE
highlight link Include PreProc
highlight link Keyword Statement
highlight link Label Statement
highlight Macro guifg=#ae2fae gui=bold ctermfg=127 cterm=bold
highlight Number guifg=#546cff gui=NONE ctermfg=63 cterm=NONE
highlight link Operator Statement
highlight PreCondit guifg=#ac8dc6 gui=bold ctermfg=140 cterm=bold
highlight PreProc guifg=#ae2fae gui=bold ctermfg=127 cterm=bold
highlight link Repeat Statement
highlight Special guifg=orange gui=NONE ctermfg=214 cterm=NONE
highlight link SpecialChar Special
highlight link SpecialComment Special
highlight Statement guifg=#729fcf gui=bold ctermfg=110 cterm=bold
highlight link StorageClass Type
highlight String guifg=#ed9d13 gui=NONE ctermfg=214 cterm=NONE
highlight link Structure Type
highlight link Tag Special
highlight Todo guifg=#e50808 guibg=#520000 gui=bold ctermfg=160 ctermbg=52 cterm=bold
highlight Type guifg=#6ab825 gui=bold ctermfg=70 cterm=bold
highlight cType guifg=#27B684 gui=bold
highlight cTypeTag guifg=#27B684 gui=NONE
highlight Typedef guifg=#27b684 gui=bold ctermfg=36 cterm=bold
highlight Underlined guifg=#80a0ff gui=underline ctermfg=111 cterm=underline
highlight cPreProc guifg=#ed0000 gui=bold

"ColorScheme metadata{{{
if v:version >= 700
	let g:native_Metadata = {
				\"Palette" : "black:white:gray50:red:purple:blue:light blue:green:yellow:orange:lavender:brown:goldenrod4:dodger blue:pink:light green:gray10:gray30:gray75:gray90",
				\"Last Change" : "2015 02 17",
				\"Name" : "PerfectDark",
				\}
endif
"}}}
" vim:set foldmethod=marker expandtab filetype=vim:
