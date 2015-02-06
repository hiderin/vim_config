 " �G���R�[�f�B��
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

"===============================================================================
"   �v���O�C���}�l�[�W��
"===============================================================================
filetype plugin indent off

if has('vim_starting')
        set runtimepath+=$VIMRUNTIME/bundle/automatic/neobundle.vim
endif

call neobundle#begin(expand('$VIMRUNTIME/bundle/automatic'))

"******************************************
"*     neobundle �ŊǗ�����v���O�C��     *
"******************************************
NeoBundle 'git://github.com/Shougo/neobundle.vim.git'

"----- github Plugins -----
NeoBundle 'Shougo/neocomplcache.git'
NeoBundle 'Shougo/vimfiler.git'
NeoBundle 'Shougo/unite.vim.git'
NeoBundle 'Shougo/vimproc.git'
NeoBundle 'Shougo/vimshell.git'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'cohama/agit.vim'
"NeoBundle 'jlanzarotta/bufexplorer'
"NeoBundle 'gregsexton/gitv'
NeoBundle 'thinca/vim-poslist'
"NeoBundle 'tyru/skk.vim'
NeoBundle 'vim-scripts/taglist.vim'
"NeoBundle 'tsaleh/vim-align.git'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'thinca/vim-visualstar'
NeoBundle 'yuratomo/w3m.vim'
NeoBundle 'vim-scripts/EasyGrep'
"NeoBundle 'mbbill/echofunc'
NeoBundle 'vim-jp/vimdoc-ja'
NeoBundle 'itchyny/calendar.vim'
"NeoBundle ''

"----- vim.org Plugins -----
NeoBundle 'FuzzyFinder'
NeoBundle 'NERD_tree'

"----- Local Plugins -----
NeoBundleLocal $VIMRUNTIME/bundle/manual

"# [ pathogen ] NeoBundle�Ǘ��O�̎��O�C���X�g�[���v���O�C����Pathogen�ŊǗ�����
"NeoBundle 'git://github.com/tpope/vim-pathogen.git'
"if isdirectory(expand('$VIMRUNTIME/bundle/automatic/vim-pathogen'))
"        call pathogen#infect('$VIMRUNTIME/bundle/manual')
"endif

call neobundle#end()

filetype plugin indent on
"===============================================================================

""////////////////////////////////////////////////////////////////////////////////
"""pathogen��ftdetect�Ȃǂ����[�h�����邽�߂Ɉ�x�t�@�C���^�C�v�����off�ɂ���
"filetype off
"
""pathogen.vim���g����bundle�z���̃v���O�C����path�ɉ�����
"call pathogen#runtime_append_all_bundles()
"call pathogen#helptags()
"set helpfile=$VIMRUNTIME/doc/help.txt
"
"":call rtputil#bundle()
"":call rtputil#helptags()
"
""�t�@�C���^�C�v�ݒ��on�ɂ���
"filetype on
"
""////////////////////////////////////////////////////////////////////////////////

let mapleader = " "

" �J���[�ݒ�:
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

"���̓��[�h���A�X�e�[�^�X���C���̃J���[��ύX
augroup InsertHook
autocmd!
autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340 ctermfg=blue ctermbg=green
autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90 ctermfg=green ctermbg=blue
augroup END

highlight StatusLine guifg=#2E4340 guibg=#ccdc90 ctermfg=green ctermbg=blue

"�J���[�X�L�[�}�̐؂�ւ�(�������developer���g�p������)
nnoremap <silent> <Leader>dv :colorscheme developer<CR> :set guifont=�l�r_�S�V�b�N:h10:cSHIFTJIS<CR>
nnoremap <silent> <Leader>ds :colorscheme desert2<CR> :set guifont=MeiryoKe_Console:h10:cSHIFTJIS<CR>

" vi�Ƃ̌݊������Ƃ�Ȃ�(vim�̓Ǝ��g���@�\���g����)
set nocompatible
" ���s�R�[�h�̎����F��
set fileformats=unix,dos,mac

"�s�ԍ��\��
set nu

"�J�[�\�����C���̕\��
set cursorline

" �J�[�\���̏㉺�ɕ\������Œ���̍s��
set scrolloff=2

"�^�u�ݒ�
set tabstop=4
set shiftwidth=4

"�V�����s��������Ƃ��ɍ��x�Ȏ����C���f���g���s��
set smartindent

"=======================���{����͊֌W======================
"���{����͂����Z�b�g
au BufNewFile,BufRead * set iminsert=0

" �}�����[�h����IME��Ԃ�ۑ����Ȃ�
inoremap <silent> <ESC> <ESC>
inoremap <silent> <C-{> <ESC>

"�u���{����͌Œ胂�[�h�v�̐ݒ�
inoremap <silent> <C-k> <C-^>


" �R�}���h���[�h�ł�IME��off�ɂ���B
let g:IMState = 0
autocmd InsertEnter * let &iminsert = g:IMState
autocmd InsertLeave * let g:IMState = &iminsert|set iminsert=0 imsearch=0
autocmd CmdwinEnter * let g:IMState = &iminsert|set iminsert=0 imsearch=0
autocmd CmdwinLeave * let g:IMState = &iminsert|set iminsert=0 imsearch=0
"autocmd CmdwinLeave * let &iminsert = g:IMState

"
" �t�H���g�̐ݒ�
"set ctermfont=MS_Gothic:h8:cSHIFTJIS
"set ctermfontwide=MS_Gothic:h8:cSHIFTJIS
"================================================================
" ESC 2�񉟂��Ō����n�C���C�g������
:nnoremap <Esc><Esc> :nohlsearch<CR>

"Tab�A�s���̔��p�X�y�[�X�𖾎��I�ɕ\������B
set listchars=tab:^\ ,trail:_,eol:$
au BufNewFile,BufRead *.*  set list

" �ŉ��E�B���h�E�ɂ��X�e�[�^�X�s���\������邩��ݒ肷��B
"               0: �S���\�����Ȃ�
"               1: �E�B���h�E�̐���2�ȏ�̂Ƃ��̂ݕ\��
"               2: ��ɕ\��
:set laststatus=2

" �e�L�X�g�̐܂�Ԃ�����
set nowrap

"ctags�̎g�p
:set tags=tags

" grep�̐ݒ�
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

"�ύX���̃t�@�C���ł��A�ۑ����Ȃ��ő��̃t�@�C����\��
set hidden

"TagList�̐ݒ�
"�ҏW���t�@�C���݂̂̃^�O��\��
let Tlist_Show_One_File = 1
"taglist�݂̂̎��ɏI��
let Tlist_Exit_OnlyWindow = 1
" tag�I������taglist�����
let Tlist_Close_On_Select =1
" �L�[�}�b�v TagList�̋N��
nnoremap <silent> <Leader>tl :Tlist<CR>

" TagExplorer�̐ݒ�
" �\������t�@�C���̃t�B���^
let TE_Include_File_Pattern='.*\.md$\|.*\.cls$\|.*\.py$\|.*\.bas$\|.*\.rc2$\|.*\.rc$\|.*\.cpp$\|.*\.c$\|.*\.h$\|.*\.hpp$\|.*\.vim$\|.*\.bpr$\|.*\.html$'

" �L�[�}�b�vTAgExplorer�̋N��
"nnoremap <silent> <Leader>te :TagExplorer<CR>

" �܂��݂̐ݒ�
:set foldmethod=syntax
:set nofoldenable

" �R�����g�̐ݒ������
autocmd FileType * set comments=

" Calendar.vim�̓��L�p�f�B���N�g���̗p��
":let g:calendar_diary="C:\\DropBox\\Vim\\diary"

""=====================�v���W�F�N�g�̐ݒ�========================
""�t�@�C�����I�����ꂽ��E�B���h�E�����
":let g:proj_flags = "tcv"
"
""<Leader>p�Ńf�t�H���g�̃v���W�F�N�g���J��
":nmap <silent> <Leader>p <Plug>ToggleProject
"
"" �t�H�[���f�B���O��W�J������ԂŃv���W�F�N�g���J��
""autocmd BufAdd _vimprojects silent! %foldopen!
"
""�J�����g�f�B���N�g���Ƀv���W�F�N�g�t�@�C������������ǂݍ���
"if getcwd() != $HOME
"	if filereadable(getcwd(). '/_vimprojects')
"		Project _vimprojects
"	endif
"endif
"
""git�R�}���h�̓o�^
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
" Emacs���֌W  ������ƈႤ����(^^;)
"----------------------------------------------------
" �R�}���h���͒��f
"imap <silent> <C-g> <ESC><ESC><ESC><CR>i

" ��ʕ���
"imap <silent> <C-x>1 <ESC>:only<CR>i
"imap <silent> <C-x>2 <ESC>:sp<CR>i
"imap <silent> <C-x>3 <ESC>:vsp<CR>i
"imap <silent> <C-x>o <ESC><C-w>w<CR>i
"imap <silent> <C-x>p <ESC><C-w>p<CR>i

" �����A�ҏW
"imap <C-k> <ESC>d$i
"imap <C-y> <ESC>pi
"imap <C-d> <ESC>xi

" �ړ�
inoremap <C-a>  <Home>
inoremap <C-e>  <End>
inoremap <C-b>  <Left>
inoremap <C-f>  <Right>
inoremap <C-n>  <Down>
inoremap <C-u>  <UP>
"imap <ESC>< <ESC>ggi
"imap <ESC>> <ESC>Gi

"�R�}���h���C���ł̃L�[�o�C���h�� Emacs �X�^�C���ɂ��܂�: >
" �s���ֈړ�
:cnoremap <C-A>		<Home>
" �ꕶ���߂�
:cnoremap <C-B>		<Left>
" �J�[�\���̉��̕������폜
:cnoremap <C-D>		<Del>
" �s���ֈړ�
:cnoremap <C-E>		<End>
" �ꕶ���i��
:cnoremap <C-F>		<Right>
" �R�}���h���C����������i��
:cnoremap <C-N>		<Down>
" �R�}���h���C����������߂�
:cnoremap <C-u>		<Up>
" �O�̒P��ֈړ�
":cnoremap <C-v>	<S-Left>
" ���̒P��ֈړ�
":cnoremap <C-w>	<S-Right>

" �}�����[�h�Ń��W�X�^�̕�����̓\��t��
inoremap <C-p> <ESC>pa
"=================================================================================== 

"""���z�^�u�ݒ�
"":let g:miniBufExplMapWindowNavVim = 1
"":let g:miniBufExplMapWindowNavArrows = 1
"":let g:miniBufExplMapCTabSwitchBuffs = 1

"" SrcExp�̎g�p
"let g:SrcExpl_UpdateTags = 1
"" SrcExp�̃v���r���[���蓮
"let g:SrcExpl_RefreshTime = 1

" Align����{����Ŏg�p���邽�߂̐ݒ�
:let g:Align_xstrlen = 3
:let g:DrChipTopLvMenu = ''

" �N������ShowMarks��off�ɂ���B
":let g:showmarks_enable = 0

" ������ƕ֗��n�L�[�}�b�v
nnoremap * *N
noremap <CR> o<ESC>
nnoremap <Leader>grc :tabnew<CR>:e $VIMRUNTIME/../_gvimrc<CR>
nnoremap <Leader>trc :tabnew<CR>:e $VIMRUNTIME/../_vimrc<CR>
nnoremap <Leader>vrc :vs $VIMRUNTIME/../_vimrc<CR>
nnoremap <Leader>src :sp $VIMRUNTIME/../_vimrc<CR>
nnoremap <Leader>prc :tabnew<CR>:e $VIMRUNTIME/../vimfiles\macros\printrc.vim<CR>
nnoremap <Leader>tkh :tabnew<CR>:e $VIMRUNTIME/../../keyhac\config.py<CR>
nnoremap <Leader>mru :MRU<CR>
nnoremap <Leader>cd  :cd %:h<CR>:pwd<CR>
nnoremap <Leader>cp  :cd %:h<CR>:cd ..<CR>:pwd<CR>

" Git Bush�̌Ăяo��
nnoremap <Leader>git :!sh --login -i<CR>

"fugitive.vim��git commit�̉�ʂ�utf-8�ɕϊ����Ă������
nnoremap <Leader>cmt  :set fenc=utf-8<CR>:wq<CR>


" poslist.vim�̐ݒ�
nmap <C-o> <Plug>(poslist-prev-pos)
nmap <C-i> <Plug>(poslist-next-pos)
nmap <Leader><C-o> <Plug>(poslist-prev-buf)
nmap <Leader><C-i> <Plug>(poslist-next-buf)
let g:poslist_histsize = 1000

"QfixHowm�̐ݒ�
" �L�[�}�b�v���[�_�[
let QFixHowm_Key = 'g'

" howm_dir�̓t�@�C����ۑ��������f�B���N�g����ݒ�
let howm_dir             = 'howm'
let howm_filename        = '%Y/%m/%Y-%m-%d-%H%M%S.txt'
let howm_fileencoding    = 'cp932'
let howm_fileformat      = 'dos'

" ���C���̒Z�k����
:inoreabbrev sl /*******************************************************************************
:inoreabbrev el *******************************************************************************/
:inoreabbrev l1 //------------------------------------------------------------------------------
:inoreabbrev l2 //==============================================================================
:inoreabbrev l3 ////////////////////////////////////////////////////////////////////////////////
:inoreabbrev vl1 '-------------------------------------------------------------------------------
:inoreabbrev vl2 '===============================================================================
:inoreabbrev vl3 '///////////////////////////////////////////////////////////////////////////////

" toggle.vim�Ńg�O��������P��̒ǉ�
":let g:toggle_pairs={'max':'min','min':'max'}

"BCB6�p�̃w���v�t�@�C�����J��
nnoremap <silent> <Leader>hb :sil !$VIMRUNTIME/../BCB_HELP/Help/bcb6.hlp<CR>

" �o�b�N�A�b�v���Ƃ�Ȃ�
set nobackup
" �t�@�C���̏㏑���̑O�Ƀo�b�N�A�b�v�����
" (�������Abackup ���I���łȂ�����A�o�b�N�A�b�v�͏㏑���ɐ���������폜�����)
set writebackup

"----------------------------------------------------
" �����֌W
"----------------------------------------------------
" �R�}���h�A�����p�^�[����100�܂ŗ����Ɏc��
set history=100
" �����̎��ɑ啶������������ʂ��Ȃ�
set ignorecase
" �����̎��ɑ啶������������ʂ���
"set noignorecase
" �����̎��ɑ啶�����܂܂�Ă���ꍇ�͋�ʂ��Č�������
set smartcase
" �Ō�܂Ō���������擪�ɖ߂�
set wrapscan

" �C���N�������^���T�[�`���g��Ȃ�
"set noincsearch
" �C���N�������^���T�[�`
set incsearch

" ���ŏ���������ꂽ�玩���œǂݒ���
set autoread

" QuickFix�E�B���h�E�̍���
let QFix_Height = 10
" QuickFix�E�B���h�E�̕�
let QFix_Width = 0
" QuickFix�E�B���h�E�̊J����
"let QFix_CopenCmd = ''
" QuickFix�E�B���h�E�ŃJ�[�\�����C����\��
let QFix_CursorLine = 1
" �J�����g�E�B���h�E�̍Œᕝ(Vim�ݒ�l)
"set winwidth=20
" QuickFix�E�B���h�E�̃v���r���[��filetype�ʂ̃n�C���C�g��L���ɂ���
let QFix_PreviewFtypeHighlight = 1

" QuickFix�E�B���h�E����J������E�B���h�E�����
let QFix_CloseOnJump = 1

" SKK.vim�̎����ݒ�
set imdisable
let skk_jisyo_encoding = 'utf-8'
let skk_large_jisyo_encodint = 'euc-jp'
"let skk_jisyo = '~/.skk-jisyo'
let skk_jisyo = 'C:\Dropbox\skk\skki1_5u.dic'
let skk_large_jisyo = 'C:\Dropbox\skk\SKK-JISYO.L'
let skk_auto_save_jisyo = 1
let skk_keep_state = 0
let skk_egg_like_newline = 1
let skk_show_annotation = 1
let skk_use_face = 1

" Agit.vim
"�J�[�\���ړ��ňꗗ�ƍ������X�V�����Ȃ�
let g:agit_enable_auto_show_commit = 0

"-------------------------------------------------------------------------------
" Unite�̐ݒ�
"-------------------------------------------------------------------------------
"Unite�ł�migemo�̎g�p
nnoremap <silent> g/ :<C-u>Unite -buffer-name=search line -start-insert<CR>
call unite#custom#source('line', 'matchers', 'matcher_migemo')
" find �� path ��ݒ�
let g:unite_source_find_command='C:/MinGW/msys/1.0/bin/find.exe'
"let g:unite_source_find_command='C:/WINDOWS/system32/find.exe'
" insert���[�h��Unite���N��������B
"let g:unite_enable_start_insert=1
" �ŋߎg�p�����t�@�C���̈ꗗ
nnoremap <silent> <Leader>mru :Unite file_mru<CR>
" ���݂̃o�b�t�@�̈ꗗ
nnoremap <silent> <Leader>be :Unite buffer<CR>
" ���݂̃^�u�̃o�b�t�@�̈ꗗ
nnoremap <silent> <Leader>tbe :Unite buffer_tab<CR>
"-------------------------------------------------------------------------------

"-------------------------------------------------------------------------------
" VimFiler�̐ݒ�
"-------------------------------------------------------------------------------
"vim�f�t�H���g�̃G�N�X�v���[����vimfiler�Œu��������
let g:vimfiler_as_default_explorer = 1
"�Z�[�t���[�h�𖳌��ɂ�����ԂŋN������
let g:vimfiler_safe_mode_by_default = 0
"���݊J���Ă���o�b�t�@�̃f�B���N�g�����J��
nnoremap <silent> <Leader>fe :<C-u>VimFilerBufferDir -quit<CR>
"���݊J���Ă���o�b�t�@��IDE���ɊJ��
nnoremap <silent> <Leader>te :<C-u>VimFilerBufferDir -split -simple -winwidth=35 -no-quit<CR>

augroup vimrc
"�u�b�N�}�[�N�ŃG���^�[��������:cd�����s
  autocmd FileType vimfiler call unite#custom_default_action('directory', 'cd')
"�f�t�H���g�̃L�[�}�b�s���O��ύX
  autocmd FileType vimfiler call s:vimfiler_my_settings()
augroup END
function! s:vimfiler_my_settings()
  nmap <buffer> H <Plug>(vimfiler_switch_to_history_directory)
  nmap <buffer> s <Plug>(vimfiler_popup_shell)
  nmap <buffer> O <Plug>(vimfiler_sync_with_current_vimfiler)
  nmap <buffer> o <Plug>(vimfiler_sync_with_another_vimfiler)
  nmap <buffer> J :Unite bookmark<CR>
"  nmap <buffer> / :Unite file -default-action=vimfiler line -start-insert<CR>
endfunction

"���ӂ̌Ăяo��
nnoremap <Leader>af :!\%VIMRUNTIME\%/../../afxw32_157/AFXW.EXE -L
