scriptencoding utf-8
"---------------------------------------------------------------------------
" ����̃t�H���g
"---------------------------------------------------------------------------
" ����Ŏg�p����t�H���g
let &printfont=&guifont
set printfont=MS_Mincho:h10.5
set printfont=MS_Gothic:h10.5
"set printfont=MeiryoKe_Console:h7

" postscript printer
if has('postscript')
    if has('win32')                          " Windows
    elseif has('mac')                        " Mac OSX
        set printencoding=euc-jp
        set printmbcharset=JIS_X_1990

        set printmbfont=

        " ���ʕ����̃t�H���g
        set printmbfont+=r:Osaka-Mono
        " ���� (bold) �̃t�H���g
        set printmbfont+=,b:Osaka-Mono
        " �Α̕��� (italic) �̃t�H���g�B���ݒ莞��r�t���O���g�p����B
        set printmbfont+=,r:Osaka-Mono
        " �����Α̕��� (bold-italic) �̃t�H���g�B���ݒ莞��b�t���O���g�p����B
        set printmbfont+=,b:Osaka-Mono

        set printmbfont+=,c:yes              " ASCII ������ Courier �t�H���g�ŏo��
        "set printmbfont+=,c:no              " �f�t�H���g
        set printmbfont+=,a:yes              " ASCII�R�[�h�͈̔͂� ASCII �����Z�b�g�ŏo��
        "set printmbfont+=,a:no              " �f�t�H���g

    else                                     " ���̑��̊�
    endif
endif


"---------------------------------------------------------------------------
" �w�b�_�[
"---------------------------------------------------------------------------
set printheader=
set printoptions=

"set printoptions+=header:0  " �w�b�_�[��������Ȃ�
"set printoptions+=header:1  " �w�b�_�[�A�{���ԂɃX�y�[�X���󂯂Ȃ�
set printoptions+=header:2   " �w�b�_�[�A�{���Ԃ�1�s�����

"set printheader=-%N-                                     " -�y�[�W-
"set printheader=%t                                       " �t�@�C����
"set printheader=%F                                       " �t�@�C�����i�p�X�܂ށj
set printheader=%t\ -%N-                                  " �t�@�C���� -�y�[�W-
"set printheader=%t\ func\ -%N-                            " �t�@�C���� �֐��� -�y�[�W-
"set printheader=%{strftime('%Y/%m/%d\ %H:%M')}           " �ŏI�������
"set printheader=�R�c\ ���Y                               " �ŏI�ۑ��ҁA�쐬��
"set printheader=�R�c\ ���Y\ %N\ %{strftime('%Y/%m/%d')}  " �쐬�� �y�[�W ���t
"set printheader=�ЊO��\ %N\ %{strftime('%Y/%m/%d')}      " �ЊO�� �y�[�W ���t

" �w�b�_�[�̈ʒu
let &printheader = &printheader . "%="   " ����
"let &printheader = "%=" . &printheader  " �E��


"---------------------------------------------------------------------------
" ����ݒ�
"---------------------------------------------------------------------------
" �]���X�y�[�X
" [left ��]  [right �E]  [top ��]  [bottom ��]
" [in �C���`]  [pt 1/72�C���`]  [mm �~�����[�g��]  [pc �p���T�C�Y�ɑ΂��銄��]
set printoptions+=left:20mm,right:20mm,top:20mm,bottom:20mm

" �{���̐܂�Ԃ�
"if &wrap                       " wrap�̐ݒ�ɉ�킹��
"    set printoptions+=wrap:y
"else
"    set printoptions+=wrap:n
"endif
set printoptions+=wrap:y      " �E�[�Ő܂�Ԃ�
"set printoptions+=wrap:n      " �܂�Ԃ��Ȃ�

" �s�ԍ�
"if &number                     " number�̐ݒ�ɉ�킹��
"    set printoptions+=number:y
"else
"    set printoptions+=number:n
"endif
"set printoptions+=number:y    " �s�ԍ��t���ň��
set printoptions+=number:n    " �s�ԍ���t���Ȃ�

" Syntax�n�C���C�g
"set printoptions+=syntax:y    " Syntax�n�C���C�g�L���ň��
"set printoptions+=syntax:n    " Syntax�n�C���C�g�����ň��
set printoptions+=syntax:a     " �J���[����\�Ȃ�Syntax�n�C���C�g�L��

" ���y�[�W����
set printoptions+=formfeed:y   " ���y�[�W�����ŁA���y�[�W����
"set printoptions+=formfeed:n  " ���y�[�W�������������B���y�[�W�����������Ă����y�[�W���Ȃ��B


"---------------------------------------------------------------------------
" �v�����^�ݒ�
"---------------------------------------------------------------------------
" ���̌���
set printoptions+=portrait:y   " �c�����Ɉ��
"set printoptions+=portrait:n  " �������Ɉ��

" �p���T�C�Y
"set printoptions+=paper:10x14
"set printoptions+=paper:A3
set printoptions+=paper:A4
"set printoptions+=paper:A5
"set printoptions+=paper:B4
"set printoptions+=paper:B5
"set printoptions+=paper:executive
"set printoptions+=paper:folio
"set printoptions+=paper:ledger
"set printoptions+=paper:legal
"set printoptions+=paper:letter
"set printoptions+=paper:quarto
"set printoptions+=paper:statement
"set printoptions+=paper:tabloid

" ����̕��@
set printoptions+=duplex:off     " �Жʈ��
"set printoptions+=duplex:long   " ���ʈ���B�Ԃ������c�B�����ӂŕ���B
"set printoptions+=duplex:short  " ���ʈ���B�Ԃ��������B�Z���ӂŕ���B

" ����P��
set printoptions+=collate:y      " ���P�ʂň���i1,2,3,4,1,2,3,4,1,2,3,4�j
"set printoptions+=collate:n     " �y�[�W�P�ʂň���i1,1,1,1,2,2,2,2,3,3,3,4,4,4,4�j

" ����W���u
"set printoptions+=jobsplit:y    " ����W���u�𕪂���
set printoptions+=jobsplit:n     " ����W���u�𕪂��Ȃ�

" ����Ŏg�p����v�����^�i��̓V�X�e���W���̃v�����^�j
set printdevice=
"set printdevice="CutePDF Writer"

finish

"==============================================================================
"vim�G�f�B�^ ����p�J�X�^���ݒ�t�@�C��
"------------------------------------------------------------------------------
"$VIMRUNTIMEPATH/macros/printrc.vim
"==============================================================================
"author  : ���� ��
"url     : http://nanasi.jp/
"email   : mail@nanasi.jp
"version : 2009/12/19 16:00:00
"==============================================================================
"�W���łȂ������vim�G�f�B�^�ōs���ꍇ�ɁA
"���̃t�@�C�������ό�A�usource %�v�R�}���h�œǂݍ���ŁA
"����ݒ��ύX����B
"�v�����^�A��������́Ahardcopy�R�}���h�ŕ\�������
"GUI�_�C�A���O�Őݒ肵�������y�ŗǂ��B
"�isee more :help print.txt�j
"
"1. ���̈���ݒ�t�@�C���ύX
"2. �ۑ�
"3. ���̃R�}���h�Őݒ�Ǎ�
"   :source %
"4. ����������t�@�C���ŁA���̃R�}���h���s�ň��
"   :hardcopy
"5. ����͈͎̔w��͎��̂悤��
"   :5,90hardcopy
"
"==============================================================================
" vim: set et nowrap ff=unix ft=vim :

