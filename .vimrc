 " エンコーディング
"source $VIMRUNTIME/encode.vim
if !has('unix')
"	scriptencoding cp932
	:set encoding=cp932
	:set fileencodings=ucs-bom,iso-2022-jp-3,iso-2022-jp,euc-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,utf-8,cp932
else
"	scriptencoding utf-8
	:set encoding=utf-8
	:set fileencodings=ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,utf-8
	set mouse=a
	let $LANG='ja_JP.UTF-8'
endif

set nocompatible
source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim
"behave mswin


"if has('gui_running') && !has('unix')
"  set encoding=utf-8
"endif
"
"===============================================================================
"   プラグインマネージャ
"===============================================================================
filetype plugin indent off

if has('vim_starting')
        set runtimepath+=$VIMRUNTIME/bundle/automatic/neobundle.vim
endif

call neobundle#begin(expand('$VIMRUNTIME/bundle/automatic'))

"******************************************
"*     neobundle で管理するプラグイン     *
"******************************************
NeoBundle 'https://github.com/Shougo/neobundle.vim.git'

"----- github Plugins -----
if !has('unix')
	NeoBundle 'https://github.com/yuratomo/w3m.vim'
"	NeoBundle 'https://github.com/Shougo/vimfiler.git'
	NeoBundle 'https://github.com/Shougo/vimfiler.vim.git'
	NeoBundle 'https://github.com/Shougo/unite.vim.git'
else
	NeoBundle 'git://github.com/hiderin/vimfiler.vim.git'
	NeoBundle 'git://github.com/hiderin/unite.vim.git'
	NeoBundle 'git://github.com/hiderin/w3m.vim'
endif
"NeoBundle 'https://github.com/Shougo/neocomplcache.git'
NeoBundle 'https://github.com/Shougo/vimproc.git'
NeoBundle 'https://github.com/Shougo/vimshell.git'
NeoBundle 'https://github.com/Shougo/neomru.vim'
NeoBundle 'https://github.com/cohama/agit.vim'
"NeoBundle 'https://github.com/jlanzarotta/bufexplorer'
"NeoBundle 'https://github.com/gregsexton/gitv'
NeoBundle 'https://github.com/thinca/vim-poslist'
"NeoBundle 'https://github.com/tyru/skk.vim'
"NeoBundle 'https://github.com/tyru/eskk.vim'
NeoBundle 'https://github.com/vim-scripts/taglist.vim'
"NeoBundle 'git://github.com/tsaleh/vim-align.git'
NeoBundle 'https://github.com/tpope/vim-fugitive'
NeoBundle 'https://github.com/thinca/vim-visualstar'
NeoBundle 'https://github.com/thinca/vim-ref'
NeoBundle 'https://github.com/tyru/vim-altercmd'
"NeoBundle 'https://github.com/mattn/webapi-vim'
"NeoBundle 'https://github.com/mattn/excitetranslate-vim'
"NeoBundle 'https://github.com/vim-scripts/EasyGrep'
"NeoBundle 'git://github.com/mbbill/echofunc'
NeoBundle 'https://github.com/vim-jp/vimdoc-ja'
"NeoBundle 'https://github.com/itchyny/calendar.vim'
"NeoBundle 'https://github.com/Sunitha/SkypeShell.git'
NeoBundle 'https://github.com/tpope/vim-surround'
NeoBundle 'https://github.com/Shougo/vinarise'
NeoBundle 'https://github.com/fuenor/im_control.vim'
"NeoBundle ''

"----- vim.org Plugins -----
"NeoBundle 'FuzzyFinder'
"NeoBundle 'NERD_tree'

"----- Local Plugins -----
NeoBundleLocal $VIMRUNTIME/bundle/manual

"# [ pathogen ] NeoBundle管理外の自前インストールプラグインはPathogenで管理する
"NeoBundle 'git://github.com/tpope/vim-pathogen.git'
"if isdirectory(expand('$VIMRUNTIME/bundle/automatic/vim-pathogen'))
"        call pathogen#infect('$VIMRUNTIME/bundle/manual')
"endif

call neobundle#end()

filetype plugin indent on
"===============================================================================
let g:neobundle_default_git_protocol="git"
NeoBundleCheck

let mapleader = ","

" カラー設定:
:set t_Co=256
if !has('unix')
	colorscheme desert2
else
	colorscheme ctermdesert2
endif

syntax on
set synmaxcol=200

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

"syntaxの読み込む行を制限(速度向上のため)
set synmaxcol=200

"標準プラグインの無効化
let g:loaded_2html_plugin = 1
let g:loaded_getscriptPlugin = 1
let g:loaded_gzip = 1
let g:loaded_logipat = 1
"let g:loaded_matchparen = 1
let g:loaded_netrwPlugin = 1
let g:loaded_rrhelper = 1
let g:loaded_spellfile_plugin = 1
"let g:loaded_tarPlugin = 1
"let g:loaded_vimballPlugin = 1
"let g:loaded_zipPlugin = 1

"=======================日本語入力関係======================
"日本語入力をリセット
au BufNewFile,BufRead * set iminsert=0

" 「日本語入力固定モード」の動作モード
let IM_CtrlMode = 4
" 「日本語入力固定モード」切替キー
inoremap <silent> <C-j> <C-^><C-r>=IMState('FixMode')<CR>

"" 挿入モード時にIME状態を保存しない
"inoremap <silent> <ESC> <ESC>
"inoremap <silent> <C-[> <ESC>
"
""「日本語入力固定モード」の設定
"inoremap <silent> <C-k> <C-^>

"
"" コマンドモードでのIMEをoffにする。
"let g:IMState = 0
"autocmd InsertEnter * let &iminsert = g:IMState
"autocmd InsertLeave * let g:IMState = &iminsert|set iminsert=0 imsearch=0
"autocmd CmdwinEnter * let &iminsert = g:IMState
"autocmd CmdwinLeave * let g:IMState = &iminsert|set iminsert=0 imsearch=0
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
if !has('unix')
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
endif

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
" タグリスト起動時にタグリストウィンドウにジャンプ
let Tlist_GainFocus_On_ToggleOpen = 1

" TagExplorerの設定
" 表示するファイルのフィルタ
"let TE_Include_File_Pattern='.*\.md$\|.*\.cls$\|.*\.py$\|.*\.bas$\|.*\.rc2$\|.*\.rc$\|.*\.cpp$\|.*\.c$\|.*\.h$\|.*\.hpp$\|.*\.vim$\|.*\.bpr$\|.*\.html$'

" キーマップTAgExplorerの起動
"nnoremap <silent> <Leader>te :TagExplorer<CR>

" 折り畳みの設定
:set foldmethod=syntax
:set nofoldenable

" コメントの設定を解除
autocmd FileType * set comments=

" Calendar.vimの日記用ディレクトリの用意
":let g:calendar_diary="C:\\DropBox\\Vim\\diary"

""=====================プロジェクトの設定========================
""ファイルが選択されたらウィンドウを閉じる
":let g:proj_flags = "tcv"
"
""<Leader>pでデフォルトのプロジェクトを開く
":nmap <silent> <Leader>p <Plug>ToggleProject
"
"" フォールディングを展開した状態でプロジェクトを開く
""autocmd BufAdd _vimprojects silent! %foldopen!
"
""カレントディレクトリにプロジェクトファイルがあったら読み込む
"if getcwd() != $HOME
"	if filereadable(getcwd(). '/_vimprojects')
"		Project _vimprojects
"	endif
"endif
"
""gitコマンドの登録
"" get add
"let g:proj_run1='!git add %f'
"let g:proj_run_fold1='*!git add %f'
"
"" get checkout
"let g:proj_run2='!git checkout -- %f'
"let g:proj_run_fold2='*!git checkout -- %f'
"
"" git status
"let g:proj_run3='!git status'
"
""================================================================

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
"inoremap <C-n>  <Down>
"inoremap <C-p>  <UP>
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
:cnoremap <C-p>		<Up>
" 前の単語へ移動
":cnoremap <C-v>	<S-Left>
" 次の単語へ移動
":cnoremap <C-w>	<S-Right>

" 挿入モードでレジスタの文字列の貼り付け
"inoremap <C-p> <ESC>pa
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
":let g:showmarks_enable = 0

" ちょっと便利系キーマップ
nnoremap * *N
noremap <CR> o<ESC>
if !has('unix')
	nnoremap <Leader>grc :tabnew<CR>:e $VIMRUNTIME/../.gvimrc<CR>
	nnoremap <Leader>trc :tabnew<CR>:e $VIMRUNTIME/../.vimrc<CR>
	nnoremap <Leader>vrc :vs $VIMRUNTIME/../.vimrc<CR>
	nnoremap <Leader>src :sp $VIMRUNTIME/../.vimrc<CR>
	nnoremap <Leader>hrc :e $VIMRUNTIME/../.vimrc<CR>
	nnoremap <Leader>prc :tabnew<CR>:e $VIMRUNTIME/macros\printrc.vim<CR>
	nnoremap <Leader>tkh :tabnew<CR>:e $VIMRUNTIME/../../keyhac/config.py<CR>
	nnoremap <Leader>vkh :vs $VIMRUNTIME/../../keyhac/config.py<CR>
	nnoremap <Leader>skh :sp $VIMRUNTIME/../../keyhac/config.py<CR>
	nnoremap <Leader>hkh :e $VIMRUNTIME/../../keyhac/config.py<CR>
elseif version == 703
" 印刷用設定ファイルを読み込み
	:source .printrc.vim
	nnoremap <Leader>grc :tabnew<CR>:e $HOME/repos/vim_config/.gvimrc<CR>
	nnoremap <Leader>trc :tabnew<CR>:e $HOME/repos/vim_config/.vimrc<CR>
	nnoremap <Leader>vrc :vs $HOME/repos/vim_config/.vimrc<CR>
	nnoremap <Leader>src :sp $HOME/repos/vim_config/.vimrc<CR>
	nnoremap <Leader>hrc :e $HOME/repos/vim_config/.vimrc<CR>
	nnoremap <Leader>prc :tabnew<CR>:e .printrc.vim<CR>
	nnoremap <Leader>tkh :tabnew<CR>:e ~/repos/KeyhacConfig/config.py<CR>
	nnoremap <Leader>vkh :vs ~/repos/KeyhacConfig/config.py<CR>
	nnoremap <Leader>skh :sp ~/repos/KeyhacConfig/config.py<CR>
	nnoremap <Leader>hkh :e ~/repos/KeyhacConfig/config.py<CR>
else
	nnoremap <Leader>grc :tabnew<CR>:e /sdcard/mysys/portvim/.gvimrc<CR>
	nnoremap <Leader>trc :tabnew<CR>:e /sdcard/mysys/portvim/.vimrc<CR>
	nnoremap <Leader>vrc :vs /sdcard/mysys/portvim/.vimrc<CR>
	nnoremap <Leader>src :sp /sdcard/mysys/portvim/.vimrc<CR>
	nnoremap <Leader>hrc :e /sdcard/mysys/portvim/.vimrc<CR>
	nnoremap <Leader>prc :tabnew<CR>:e /sdcard/mysys/portvim/vim73/macros/printrc.vim<CR>
	nnoremap <Leader>tkh :tabnew<CR>:e /sdcard/mysys/keyhac/config.py<CR>
	nnoremap <Leader>vkh :vs /sdcard/mysys/keyhac/config.py<CR>
	nnoremap <Leader>skh :sp /sdcard/mysys/keyhac/config.py<CR>
	nnoremap <Leader>hkh :e /sdcard/mysys/keyhac/config.py<CR>
endif
"nnoremap <Leader>mru :MRU<CR>
nnoremap <Leader>cd  :cd %:h<CR>:pwd<CR>
nnoremap <Leader>cp  :cd %:h<CR>:cd ..<CR>:pwd<CR>
nnoremap <Leader>vf  :VimFilerDouble -tab -create<CR>

" 新しいウィンドウを下に開く
set splitbelow
" 新しいウィンドウを右に開く
set splitright

" Git Bushの呼び出し
nnoremap <Leader>git :cd %:h<CR>:!sh --login -i<CR>

"fugitive.vimのgit commitの画面をutf-8に変換してから閉じる
nnoremap <Leader>cmt  :set fenc=utf-8<CR>:wq!<CR>


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
":let g:toggle_pairs={'max':'min','min':'max'}

"BCB6用のヘルプファイルを開く
"nnoremap <silent> <Leader>hb :sil !$VIMRUNTIME/../BCB_HELP/Help/bcb6.hlp<CR>

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

if has('unix')
	" 現バッファのファイルをインテントを使用して外部アプリで開く
	nnoremap <silent> gka :AndroidIntent<CR>

	command! -nargs=* AndroidIntent :call AndroidIntent(<q-args>)
	function! AndroidIntent(file)
	  let file = a:file == '' ? expand('%:p') : fnamemodify(a:file, ':p')
	  let cmd = 'am start --user 0 -a android.intent.action.VIEW -t text/plain -d '.file
	  let ret = system(cmd)
	endfunction

	"終了時に端末表示色を再設定
	au VimLeave * let saved_t_Co=&t_Co|let &t_Co=1|let &t_Co=saved_t_Co 

endif

"" SKK.vimの辞書設定
"set imdisable
"if !has('unix')
"	let g:eskk#directory = "$VIMRUNTIME/../../skk"
""	let g:eskk#dictionary = { 'path': "$VIMRUNTIME/../../skk/skki1_5u.dic", 'sorted': 0, 'encoding': 'utf-16le', }
"	let g:eskk#dictionary = { 'path': "$VIMRUNTIME/../../skk/.skk-jisyo", 'sorted': 0, 'encoding': 'sjis', }
"	let g:eskk#large_dictionary = { 'path': "$VIMRUNTIME/../../skk/SKK-JISYO.L", 'sorted': 1, 'encoding': 'euc-jp', }
"else
"	let g:eskk#directory = "~/.eskk"
""	let g:eskk#dictionary = { 'path': "~/.eskk/skki1_5u.dic", 'sorted': 0, 'encoding': 'utf-16le', }
"	let g:eskk#dictionary = { 'path': "~/.eskk/.skk-jisyo", 'sorted': 0, 'encoding': 'utf-8', }
"	let g:eskk#large_dictionary = { 'path': "~/.eskk/SKK-JISYO.L", 'sorted': 1, 'encoding': 'euc-jp', }
"endif
"let g:eskk#enable_completion = 1

" SKK.vimの辞書設定
"set imdisable
""let skk_jisyo_encoding = 'utf-8'
"let skk_jisyo_encoding = 'utf-16le'
"let skk_large_jisyo_encodint = 'euc-jp'
""if !has('unix')
""	let skk_jisyo = 'C:\Dropbox\skk\skki1_5u.dic'
""	let skk_large_jisyo = 'C:\Dropbox\skk\SKK-JISYO.L'
""else
"	let skk_jisyo = '$VIMRUNTIME/../../skk/.skk-jisyo'
"	let skk_large_jisyo = '$VIMRUNTIME/../../skk/SKK-JISYO.L'
""endif
"let skk_auto_save_jisyo = 1
"let skk_keep_state = 0
"let skk_egg_like_newline = 1
"let skk_show_annotation = 1
"let skk_use_face = 1

" Agit.vim
"カーソル移動で一覧と差分を更新させない
let g:agit_enable_auto_show_commit = 0

augroup agit_rc
"デフォルトのキーマッピングを変更
  autocmd FileType agit call s:agit_my_settings()
augroup END
function! s:agit_my_settings()
  nmap <buffer> cp <Plug>(agit-git-cherry-pick)
endfunction
"-------------------------------------------------------------------------------
" Uniteの設定
"-------------------------------------------------------------------------------
"Uniteでのmigemoの使用
nnoremap <silent> g/ :<C-u>Unite -buffer-name=search line -start-insert<CR>
call unite#custom#source('line', 'matchers', 'matcher_migemo')
" find の path を設定
if !has('unix')
	let g:unite_source_find_command='vimfind.bat'
else
	let g:unite_source_find_command='find'
endif
"let g:unite_source_find_command='C:/MinGW/msys/1.0/bin/find.exe'
"let g:unite_source_find_command='C:/WINDOWS/system32/find.exe'
" insertモードでUniteを起動させる。
let g:unite_enable_start_insert=1
" 最近使用したファイルの一覧
nnoremap <silent> <Leader>mru :Unite file_mru<CR>
" 現在のバッファの一覧
nnoremap <silent> <Leader>be :Unite buffer<CR>
" 現在のタブのバッファの一覧
nnoremap <silent> <Leader>tbe :Unite buffer_tab<CR>
"-------------------------------------------------------------------------------

"-------------------------------------------------------------------------------
" VimFilerの設定
"-------------------------------------------------------------------------------
"vimデフォルトのエクスプローラをvimfilerで置き換える
let g:vimfiler_as_default_explorer = 1
"セーフモードを無効にした状態で起動する
let g:vimfiler_safe_mode_by_default = 0
"現在開いているバッファのディレクトリを開く
nnoremap <silent> <Leader>fe :<C-u>VimFilerBufferDir -quit<CR>
"現在開いているバッファをIDE風に開く
nnoremap <silent> <Leader>te :<C-u>VimFilerBufferDir -create -split -simple -winwidth=35 -force-quit<CR>

augroup vimrc
"ブックマークでエンターした時に:cdを実行
  autocmd FileType vimfiler call unite#custom_default_action('directory', 'cd')
  autocmd FileType vimfiler call unite#custom_default_action('file', 'cd')
"デフォルトのキーマッピングを変更
  autocmd FileType vimfiler call s:vimfiler_my_settings()
augroup END
function! s:vimfiler_my_settings()
  nmap <buffer> H <Plug>(vimfiler_switch_to_history_directory)
  nmap <buffer> S <Plug>(vimfiler_popup_shell)
  nmap <buffer> s <Plug>(vimfiler_select_sort_type)
  nmap <buffer> O <Plug>(vimfiler_sync_with_current_vimfiler)
  nmap <buffer> o <Plug>(vimfiler_sync_with_another_vimfiler)
  nmap <buffer> J :Unite bookmark<CR>
  nmap <buffer> l <C-w>l
  nmap <buffer> h <C-w>h
"  nmap <buffer> / :Unite file -default-action=vimfiler line -start-insert<CR>
endfunction

if !has('unix')
	"あふの呼び出し
	"nnoremap <Leader>af :!\%VIMRUNTIME\%/../../afxw32_157/AFXW.EXE -L
	nnoremap <Leader>af :!\%VIMRUNTIME\%/../../afxw32_157/AFXW.EXE -L"<C-R>*"<CR>
	"nnoremap <Leader>af call s:call_afxw_chose_dir()
	"function! s:call_afxw_chose_dir()
	"	call vimfiler#yank_full_path()
	"	let mycmd = !\%VIMRUNTIME\%/../../afxw32_157/AFXW.EXE -L <C-R>"<CR>
	"	silent execute mycmd
	"endfunction
endif

" VimFiler関連付けの設定
if !has('unix')
	"ウィンドウズの設定
elseif version==703
	"Ubuntu(ノートPC)の設定
	call vimfiler#set_execute_file('xls','wine "/home/user/Wine-Dirs/Program-Files/Microsoft_Office/Office/EXCEL.EXE"')
else
	"Andoroidの設定
endif

""--------------------------------------------------------------------------------
"" w3mの設定
""--------------------------------------------------------------------------------
if !has('unix')
	"外部ブラウザ
"	let g:w3m#external_browser = '"C:\Dropbox\MySys\programfiles\FirefoxPortable\FirefoxPortable.exe"'
	let g:w3m#external_browser = '$VIMRUNTIME/../../"clnch\clnch.exe" --execute='
else
	let g:w3m#external_browser = '/usr/bin/opera '
endif

augroup w3mrc
"デフォルトのキーマッピングを変更
  autocmd FileType w3m call s:w3m_my_settings()
augroup END
function! s:w3m_my_settings()
  nmap <buffer> br :W3mShowExtenalBrowser<CR>
endfunction

"--------------------------------------------------------------------------------
" Calendar.vimの設定
"--------------------------------------------------------------------------------
"Googleのカレンダーを設定
"let g:calendar_google_calendar = 1
"let g:calendar_google_task = 1
"Calendar.vimの 呼び出し
nnoremap <silent> <Leader>cal :<C-u>Calendar<CR>

"--------------------------------------------------------------------------------
" 辞書関係の設定 vim-ref
"--------------------------------------------------------------------------------

" vim-ref のバッファを q で閉じられるようにする
autocmd FileType ref-* nnoremap <buffer> <silent> q :<C-u>close<CR>

" 辞書定義
let g:ref_source_webdict_sites = {
\   'je': {
\     'url': 'http://dictionary.infoseek.ne.jp/jeword/%s',
\     'keyword_encoding': 'utf-8',
\     'output_encoding': 'euc-jp',
\   },
\   'ej': {
\     'url': 'http://dictionary.infoseek.ne.jp/ejword/%s',
\     'output_encoding': 'euc-jp',
\   },
\ }

" デフォルトサイト
let g:ref_source_webdict_sites.default = 'ej'

"" 出力に対するフィルタ
"" 最初の数行を削除
"function! g:ref_source_webdict_sites.je.filter(output)
"  return join(split(a:output, "\n")[15 :], "\n")
"endfunction
"
"function! g:ref_source_webdict_sites.ej.filter(output)
"  return join(split(a:output, "\n")[15 :], "\n")
"endfunction

" 英単語辞呼び出しのエイリアス
call altercmd#load()
CAlterCommand ej Ref webdict ej
CAlterCommand je Ref webdict je

"Kのマッピング
nmap K <Plug>(ref-keyword)
"エンコーディングの設定
"let g:ref_refe_encoding = 'Shift-JIS'
let g:ref_source_webdict_encoding='shift-jis'
"--------------------------------------------------------------------------------
" 翻訳関係の設定 excitetranslate-vim
"--------------------------------------------------------------------------------
" 開いたバッファを q で閉じれるようにする
autocmd BufEnter ==Translate==\ Excite nnoremap <buffer> <silent> q :<C-u>close<CR>
" 翻訳のエイリアス
CAlterCommand trans ExciteTranslate

"--------------------------------------------------------------------------------
" Neocomplcacheの設定
"--------------------------------------------------------------------------------
"自動補間 ON OFFのエイリアス
"自動補間 ON
CAlterCommand neoce NeoComplCacheEnable
"自動補間 OFF
CAlterCommand neocd NeoComplCacheDisable
" Use neocomplcache.
"let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()


nmap <Leader>sk :VimShellInteractive irb.bat -r skype<CR>

if has('unix') && version ==703
	" ビジュアルモードで選択したテキストが&#12289;クリップボードに入るようにする
	" http://nanasi.jp/articles/howto/editing/clipboard.html
	set clipboard=autoselect

	" 無名レジスタに入るデータを&#12289;*レジスタにも入れる&#12290;
	set clipboard+=unnamed
	set clipboard=unnamedplus
endif


" Neo_Lib3への移動
CAlterCommand neolibdir cd G:\Neo_Lib3\

" ctagsにEchoFuncを用いる
CAlterCommand ctags !ctags -R --fields=+lS<CR>

