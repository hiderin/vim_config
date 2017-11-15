"ウィンドウを最大化して起動
"au GUIEnter * simalt ~x

" フォントの設定
"set guifont=ＭＳ_ゴシック:h10:cSHIFTJIS
"set guifont=ＭＳ_明朝:h10:cSHIFTJIS
"set guifontwide=ＭＳ_ゴシック:h10
"set guifont=Envy_Code_R:h10
"set guifontwide=Envy_Code_R:h10
"set guifont=Osaka－等幅:h10:cSHIFTJIS
"set guifont=MeiryoKe_Gothic:h10:cSHIFTJIS
set guifont=MeiryoKe_Console:h10:cSHIFTJIS

"カーソルを行頭、行末で止まらないようにする
"set whichwrap=b,s,h,l,<,>,[,]


highlight StatusLine guifg=#2E4340 guibg=#ccdc90 ctermfg=green ctermbg=blue

" メニューの表示名の変更
:let g:DrChipTopLvlMenu = "{メニューの表示名}"

" ちょっと便利系キーマップ

" 印刷用設定ファイルを読み込み
:source $VIMRUNTIME/macros/printrc.vim

" ビープ音の変わりに画面フラッシュ
set visualbell

" ビープ音を鳴らさない
set vb t_vb=

"全角スペースを視覚化
"highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666
au BufNewFile,BufRead * match ZenkakuSpace /　/

" メニューバー標準で非表示
set guioptions-=T
set guioptions-=m

" メニューバーの表示非表示
function MyMenuToggle()
	if &guioptions =~# 'T'
		set guioptions-=T
		set guioptions-=m

	else
		set guioptions+=T
		set guioptions+=m

	endif
endfunction

map <silent> <F2> :call MyMenuToggle()<CR>

""ローカル設定の読み込み
"if version >=703
"	source c:/vimLocalSet.vim
"else
"	source vimLocalSet.vim
"endif
