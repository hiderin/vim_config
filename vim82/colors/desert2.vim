" Vim color file
" Maintainer:	Hans Fugal <hans@fugal.net>
" Last Change:	$Date: 2004/06/13 19:30:30 $
" Last Change:	$Date: 2004/06/13 19:30:30 $
" URL:		http://hans.fugal.net/vim/colors/desert.vim
" Version:	$Id: desert.vim,v 1.1 2004/06/13 19:30:30 vimboss Exp $

" cool help screens
" :he group-name
" :he highlight-groups
" :he cterm-colors

set background=dark
if version > 580
    " no guarantees for version 5.8 and below, but this makes it stop
    " complaining
    hi clear
    if exists("syntax_on")
	syntax reset
    endif
endif
let g:colors_name="desert2"

hi Normal	guifg=grey80 guibg=grey20

" highlight groups
hi Cursor	guibg=SkyBlue guifg=slategrey
"hi CursorLine guibg=Black
"hi CursorLine guibg=SteelBlue4
"hi CursorLine guibg=RoyalBlue4
hi CursorLine guibg=darkslategrey
"hi CursorLine guibg=grey10
"hi CursorLine guibg=slategrey
"hi CursorIM
"hi Directory
"hi DiffAdd
"hi DiffChange
"hi DiffDelete
"hi DiffText
"hi ErrorMsg
hi VertSplit	guibg=#c2bfa5 guifg=grey50 gui=none
hi Folded	guibg=grey30 guifg=gold
hi FoldColumn	guibg=grey30 guifg=tan
hi IncSearch	guifg=slategrey guibg=SkyBlue
hi LineNr	guifg=khaki gui=bold
hi ModeMsg	guifg=goldenrod
hi MoreMsg	guifg=SeaGreen
"hi NonText	guifg=LightBlue guibg=grey30
hi NonText	guifg=RoyalBlue4 gui=none
hi Question	guifg=springgreen
hi Search	guibg=peru guifg=wheat
hi SpecialKey	guifg=yellowgreen
hi StatusLine	guibg=#c2bfa5 guifg=black gui=none
hi StatusLineNC	guibg=#c2bfa5 guifg=grey50 gui=none
hi Title	guifg=indianred
hi Visual	gui=none guifg=SkyBlue guibg=olivedrab
"hi VisualNOS
hi WarningMsg	guifg=salmon
"hi WildMenu
"hi Menu
"hi Scrollbar
"hi Tooltip

" syntax highlighting groups
"hi Comment	guifg=YellowGreen
"hi Comment	guifg=PaleGreen
hi Comment	guifg=#ccdc90
hi htmlComment	guifg=#ccdc90
"hi Comment	guifg=#89e289
"hi Comment	guifg=#99e465
hi Constant	guifg=#ffa0a0
hi Identifier	guifg=palegreen
hi Statement	guifg=SkyBlue
"hi PreProc	guifg=indianred
hi PreProc	guifg=SkyBlue gui=none
hi Type		guifg=SkyBlue
hi Special	guifg=navajowhite
"hi Underlined
hi Ignore	guifg=grey40
"hi Error
"hi Todo		guifg=orangered guibg=yellow2
hi Todo		guifg=yellow2 guibg=grey20
hi Number		      ctermfg=2           guifg=SandyBrown                 gui=NONE
hi Float		      ctermfg=2           guifg=DarkTurquoise                  gui=NONE
hi String guifg=violet guibg=NONE
"hi vimfilerDirectory	guifg=yellow gui=none

" color terminal definitions
hi SpecialKey	ctermfg=darkgreen
hi NonText	cterm=bold ctermfg=darkblue
hi Directory	ctermfg=darkcyan
hi ErrorMsg	cterm=bold ctermfg=7 ctermbg=1
hi IncSearch	cterm=NONE ctermfg=yellow ctermbg=green
hi Search	cterm=NONE ctermfg=grey ctermbg=blue
hi MoreMsg	ctermfg=darkgreen
hi ModeMsg	cterm=NONE ctermfg=brown
hi LineNr	ctermfg=3
hi Question	ctermfg=green
hi StatusLine	cterm=bold,reverse
hi StatusLineNC cterm=reverse
hi VertSplit	cterm=reverse
hi Title	ctermfg=5
hi Visual	cterm=reverse
hi VisualNOS	cterm=bold,underline
hi WarningMsg	ctermfg=1
hi WildMenu	ctermfg=0 ctermbg=3
hi Folded	ctermfg=darkgrey ctermbg=NONE
hi FoldColumn	ctermfg=darkgrey ctermbg=NONE
hi DiffAdd	ctermbg=4
hi DiffChange	ctermbg=5
hi DiffDelete	cterm=bold ctermfg=4 ctermbg=6
hi DiffText	cterm=bold ctermbg=1
hi Comment	ctermfg=darkcyan
hi Constant	ctermfg=brown
hi Special	ctermfg=5
hi Identifier	ctermfg=6
hi Statement	ctermfg=3
hi PreProc	ctermfg=5
hi Type		ctermfg=2
hi Underlined	cterm=underline ctermfg=5
hi Ignore	cterm=bold ctermfg=7
hi Ignore	ctermfg=darkgrey
hi Error	cterm=bold ctermfg=7 ctermbg=1


"IMEの状態でカーソルの色を変更する
if has('multi_byte_ime')
  highlight Cursor guifg=White guibg=LimeGreen
  highlight CursorIM guifg=White guibg=Red
endif
"vim: sw=4
