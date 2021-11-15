"cローカル設定のための分岐ファイル(_gvimrcから呼び出される。)
"    ※このファイルはCドライブ直下に置くこと
let $LocalPath=$VIM . '/LocalSetting/Home.vim'
source $LocalPath
nnoremap <Leader>lrc :tabnew<CR>:e $LocalPath<CR>
