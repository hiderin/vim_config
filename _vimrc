 " エンコーディン
"source $VIMRUNTIME/encode.vim
"scriptencoding utf-8
scriptencoding cp932
:set fileencodings=ucs-bom,iso-2022-jp-3,iso-2022-jp,euc-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,utf-8,cp932

set nocompatible
source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim
"behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

"if has('gui_running') && !has('unix')
"  set encoding=utf-8
"endif

"////////////////////////////////////////////////////////////////////////////////
""pathogenでftdetectなどをロードさせるために一度ファイルタイプ判定をoffにする
filetype off

"pathogen.vimを使ってbundle配下のプラグインをpathに加える
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
set helpfile=$VIMRUNTIME/doc/help.txt

":call rtputil#bundle()
":call rtputil#helptags()

"ファイルタイプ設定をonにする
filetype on

"////////////////////////////////////////////////////////////////////////////////

let mapleader = " "

" カラー設定:
:set t_Co=256
"colorscheme cuideveloper
"colorscheme developer
"colorscheme murphy
"colorscheme darkblue
colorscheme desert2
"colorscheme desert3
"colorscheme generik
"colorscheme molokai
syntax on

"入力モード時、ステータスラインのカラーを変更
augroup InsertHook
autocmd!
autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340 ctermfg=blue ctermbg=green
autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90 ctermfg=green ctermbg=blue
augroup END

highlight StatusLine guifg=#2E4340 guibg=#ccdc90 ctermfg=green ctermbg=blue

"カラースキーマの切り替え(印刷時はdeveloperを使用したい)
nnoremap <silent> <Leader>dv :colorscheme developer<CR> :set guifont=ＭＳ_ゴシック:h10:cSHIFTJIS<CR>
nnoremap <silent> <Leader>ds :colorscheme desert2<CR> :set guifont=MeiryoKe_Console:h10:cSHIFTJIS<CR>

" viとの互換性をとらない(vimの独自拡張機能を使う為)
set nocompatible
" 改行コードの自動認識
set fileformats=unix,dos,mac

"行番号表示
set nu

"カーソルラインの表示
set cursorline

" カーソルの上下に表示する最低限の行数
set scrolloff=2

"タブ設定
set tabstop=4
set shiftwidth=4

"新しい行を作ったときに高度な自動インデントを行う
set smartindent

"=======================日本語入力関係======================
"日本語入力をリセット
au BufNewFile,BufRead * set iminsert=0

" 挿入モード時にIME状態を保存しない
inoremap <silent> <ESC> <ESC>
inoremap <silent> <C-{> <ESC>

"「日本語入力固定モード」の設定
inoremap <silent> <C-k> <C-^>


" コマンドモードでのIMEをoffにする。
let g:IMState = 0
autocmd InsertEnter * let &iminsert = g:IMState
autocmd InsertLeave * let g:IMState = &iminsert|set iminsert=0 imsearch=0
autocmd CmdwinEnter * let g:IMState = &iminsert|set iminsert=0 imsearch=0
autocmd CmdwinLeave * let g:IMState = &iminsert|set iminsert=0 imsearch=0
"autocmd CmdwinLeave * let &iminsert = g:IMState

"
" フォントの設定
"set ctermfont=MS_Gothic:h8:cSHIFTJIS
"set ctermfontwide=MS_Gothic:h8:cSHIFTJIS
"================================================================
" ESC 2回押しで検索ハイライトを消去
:nnoremap <Esc><Esc> :nohlsearch<CR>

"Tab、行末の半角スペースを明示的に表示する。
set listchars=tab:^\ ,trail:_,eol:$
au BufNewFile,BufRead *.*  set list

" 最下ウィンドウにいつステータス行が表示されるかを設定する。
"               0: 全く表示しない
"               1: ウィンドウの数が2以上のときのみ表示
"               2: 常に表示
:set laststatus=2

" テキストの折り返し無し
set nowrap

"ctagsの使用
:set tags=tags

" grepの設定
"set grepprg=C:/DropBox/GnuWin32/bin/grep\ -nH
"let mygrepprg='C:/DropBox/GnuWin32/bin/grep'
"let mygrepprg='C:/cygwin/bin/grep'
let mygrepprg='findstr'
"set grepprg=c:/cygwin/bin/grep\ -nH
"set grepprg=grep\ -nH
set grepprg=findstr\ /n
"set grepprg=jvgrep
"let Grep_Path = 'C:/DropBox/GnuWin32/bin/grep.exe'
"let Fgrep_Path = 'C:/DropBox/GnuWin32/bin/grep.exe -F'
"let Egrep_Path = 'C:/DropBox/GnuWin32/bin/grep.exe -E'
"let Grep_Find_Path = 'C:/DropBox/GnuWin32/bin/find.exe'
"let Grep_Xargs_Path = 'C:/DropBox/GnuWin32/bin/xargs.exe'
"let Grep_Shell_Quote_Char = '"'

"変更中のファイルでも、保存しないで他のファイルを表示
set hidden

"TagListの設定
"編集中ファイルのみのタグを表示
let Tlist_Show_One_File = 1
"taglistのみの時に終了
let Tlist_Exit_OnlyWindow = 1
" tag選択時にtaglistを閉じる
let Tlist_Close_On_Select =1
" キーマップ TagListの起動
nnoremap <silent> <Leader>tl :Tlist<CR>

" TagExplorerの設定
" 表示するファイルのフィルタ
let TE_Include_File_Pattern='.*\.cls$\|.*\.py$\|.*\.bas$\|.*\.rc2$\|.*\.rc$\|.*\.cpp$\|.*\.c$\|.*\.h$\|.*\.hpp$\|.*\.vim$\|.*\.bpr$\|.*\.html$'

" キーマップTAgExplorerの起動
nnoremap <silent> <Leader>te :TagExplorer<CR>

" 折り畳みの設定
:set foldmethod=syntax
:set nofoldenable

" コメントの設定を解除
autocmd FileType * set comments=

" Calendar.vimの日記用ディレクトリの用意
":let g:calendar_diary="C:\\DropBox\\Vim\\diary"

"=====================プロジェクトの設定========================
"ファイルが選択されたらウィンドウを閉じる
:let g:proj_flags = "tcv"

"<Leader>pでデフォルトのプロジェクトを開く
:nmap <silent> <Leader>p <Plug>ToggleProject

" フォールディングを展開した状態でプロジェクトを開く
"autocmd BufAdd _vimprojects silent! %foldopen!

"カレントディレクトリにプロジェクトファイルがあったら読み込む
if getcwd() != $HOME
	if filereadable(getcwd(). '/_vimprojects')
		Project _vimprojects
	endif
endif

"gitコマンドの登録
" get add
let g:proj_run1='!git add %f'
let g:proj_run_fold1='*!git add %f'

" get checkout
let g:proj_run2='!git checkout -- %f'
let g:proj_run_fold2='*!git checkout -- %f'

" git status
let g:proj_run3='!git status'

"================================================================

"----------------------------------------------------
" Emacs風関係  ちょっと違うけど(^^;)
"----------------------------------------------------
" コマンド入力中断
"imap <silent> <C-g> <ESC><ESC><ESC><CR>i

" 画面分割
"imap <silent> <C-x>1 <ESC>:only<CR>i
"imap <silent> <C-x>2 <ESC>:sp<CR>i
"imap <silent> <C-x>3 <ESC>:vsp<CR>i
"imap <silent> <C-x>o <ESC><C-w>w<CR>i
"imap <silent> <C-x>p <ESC><C-w>p<CR>i

" 消去、編集
"imap <C-k> <ESC>d$i
"imap <C-y> <ESC>pi
"imap <C-d> <ESC>xi

" 移動
inoremap <C-a>  <Home>
inoremap <C-e>  <End>
inoremap <C-b>  <Left>
inoremap <C-f>  <Right>
inoremap <C-n>  <Down>
inoremap <C-u>  <UP>
"imap <ESC>< <ESC>ggi
"imap <ESC>> <ESC>Gi

"コマンドラインでのキーバインドを Emacs スタイルにします: >
" 行頭へ移動
:cnoremap <C-A>		<Home>
" 一文字戻る
:cnoremap <C-B>		<Left>
" カーソルの下の文字を削除
:cnoremap <C-D>		<Del>
" 行末へ移動
:cnoremap <C-E>		<End>
" 一文字進む
:cnoremap <C-F>		<Right>
" コマンドライン履歴を一つ進む
:cnoremap <C-N>		<Down>
" コマンドライン履歴を一つ戻る
:cnoremap <C-u>		<Up>
" 前の単語へ移動
":cnoremap <C-v>	<S-Left>
" 次の単語へ移動
":cnoremap <C-w>	<S-Right>

" 挿入モードでレジスタの文字列の貼り付け
inoremap <C-p> <ESC>pa
"=================================================================================== 

"""仮想タブ設定
"":let g:miniBufExplMapWindowNavVim = 1
"":let g:miniBufExplMapWindowNavArrows = 1
"":let g:miniBufExplMapCTabSwitchBuffs = 1

"" SrcExpの使用
"let g:SrcExpl_UpdateTags = 1
"" SrcExpのプレビューを手動
"let g:SrcExpl_RefreshTime = 1

" Alignを日本語環境で使用するための設定
:let g:Align_xstrlen = 3
:let g:DrChipTopLvMenu = ''

" 起動時のShowMarksをoffにする。
:let g:showmarks_enable = 0

" ちょっと便利系キーマップ
nnoremap * *N
noremap <CR> o<ESC>
nnoremap <Leader>grc :tabnew<CR>:e $VIMRUNTIME/../_gvimrc<CR>
nnoremap <Leader>trc :tabnew<CR>:e $VIMRUNTIME/../_vimrc<CR>
nnoremap <Leader>prc :tabnew<CR>:e $VIMRUNTIME/../vimfiles\macros\printrc.vim<CR>
nnoremap <Leader>tkh :tabnew<CR>:e $VIMRUNTIME/../../keyhac\config.py<CR>
nnoremap <Leader>mru :MRU<CR>
nnoremap <Leader>cd  :cd %:h<CR>:pwd<CR>
nnoremap <Leader>cp  :cd %:h<CR>:cd ..<CR>:pwd<CR>

" Git Bushの呼び出し
nnoremap <Leader>git :!sh --login -i<CR>

"fugitive.vimのgit commitの画面をutf-8に変換してから閉じる
nnoremap <Leader>cmt  :set fenc=utf-8<CR>:wq<CR>


" poslist.vimの設定
nmap <C-o> <Plug>(poslist-prev-pos)
nmap <C-i> <Plug>(poslist-next-pos)
nmap <Leader><C-o> <Plug>(poslist-prev-buf)
nmap <Leader><C-i> <Plug>(poslist-next-buf)
let g:poslist_histsize = 1000

"QfixHowmの設定
" キーマップリーダー
let QFixHowm_Key = 'g'

" howm_dirはファイルを保存したいディレクトリを設定
let howm_dir             = 'howm'
let howm_filename        = '%Y/%m/%Y-%m-%d-%H%M%S.txt'
let howm_fileencoding    = 'cp932'
let howm_fileformat      = 'dos'

" ラインの短縮入力
:inoreabbrev sl /*******************************************************************************
:inoreabbrev el *******************************************************************************/
:inoreabbrev l1 //------------------------------------------------------------------------------
:inoreabbrev l2 //==============================================================================
:inoreabbrev l3 ////////////////////////////////////////////////////////////////////////////////
:inoreabbrev vl1 '-------------------------------------------------------------------------------
:inoreabbrev vl2 '===============================================================================
:inoreabbrev vl3 '///////////////////////////////////////////////////////////////////////////////

" toggle.vimでトグルさせる単語の追加
:let g:toggle_pairs={'max':'min','min':'max'}

"BCB6用のヘルプファイルを開く
nnoremap <silent> <Leader>hb :sil !$VIMRUNTIME/../BCB_HELP/Help/bcb6.hlp<CR>

" バックアップをとらない
set nobackup
" ファイルの上書きの前にバックアップを作る
" (ただし、backup がオンでない限り、バックアップは上書きに成功した後削除される)
set writebackup

"----------------------------------------------------
" 検索関係
"----------------------------------------------------
" コマンド、検索パターンを100個まで履歴に残す
set history=100
" 検索の時に大文字小文字を区別しない
set ignorecase
" 検索の時に大文字小文字を区別する
"set noignorecase
" 検索の時に大文字が含まれている場合は区別して検索する
set smartcase
" 最後まで検索したら先頭に戻る
set wrapscan

" インクリメンタルサーチを使わない
"set noincsearch
" インクリメンタルサーチ
set incsearch

" 他で書き換えられたら自動で読み直す
set autoread

" QuickFixウィンドウの高さ
let QFix_Height = 10
" QuickFixウィンドウの幅
let QFix_Width = 0
" QuickFixウィンドウの開き方
"let QFix_CopenCmd = ''
" QuickFixウィンドウでカーソルラインを表示
let QFix_CursorLine = 1
" カレントウィンドウの最低幅(Vim設定値)
"set winwidth=20
" QuickFixウィンドウのプレビューでfiletype別のハイライトを有効にする
let QFix_PreviewFtypeHighlight = 1

" QuickFixウィンドウから開いた後ウィンドウを閉じる
let QFix_CloseOnJump = 1

