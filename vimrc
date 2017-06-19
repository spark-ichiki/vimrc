" ==========================
" 起動時のメッセージを表示しない
" ==========================
set shortmess+=I


" ==========================
" NeoBundle設定
" ==========================
"----------------------------------------------------
" プラグインのインストール :NeoBundleInstall
" プラグインのアップデート :NeoBundleInstall!
" プラグインのアンインストール :NeoBundleClean
"----------------------------------------------------
" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
" netBundle本体
NeoBundleFetch 'Shougo/neobundle.vim'
" 非同期処理
NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }
" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!
" NERDTree
NeoBundle 'scrooloose/nerdtree'
" NERDTree option
NeoBundle 'jistr/vim-nerdtree-tabs'
" ご存知uniteでも今は無効
" NeoBundle 'Shougo/unite.vim'
" タブ事のカレントディレクトリ
NeoBundle 'kana/vim-tabpagecd'
" ステータスをカラフルに（vim-power-lineより簡単）
NeoBundle 'itchyny/lightline.vim'
" 多機能セレクタ
NeoBundle 'ctrlpvim/ctrlp.vim'
" CtrlPの拡張プラグイン. 関数検索
NeoBundle 'tacahiroy/ctrlp-funky'
" CtrlPの拡張プラグイン. コマンド履歴検索
NeoBundle 'suy/vim-ctrlp-commandline'
" 複数行をコメントアウト
NeoBundle "tyru/caw.vim.git"
" カラースキーマー
NeoBundle 'tomasr/molokai'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck


" ==========================
" NERDTREE
" ==========================
" NERDTreeで見せたくないファイルの設定
let g:NERDTreeIgnore=['\.class$', '\.clean$', '\.swp$', '\.bak$', '\~$']

" 隠しファイルを表示する
let NERDTreeShowHidden = 1

" ショートカットキー
"nnoremap <silent><C-e> :NERDTreeFocusToggle<CR>
nnoremap <silent><C-e> :NERDTreeToggle<CR>

" デフォルトでツリーを表示させる
let g:nerdtree_tabs_open_on_console_startup=1

" 他のバッファをすべて閉じた時にNERDTreeが開いていたらNERDTreeも一緒に閉じる。
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" ==========================
" 行番号関連
" ==========================
set number " 行番号表示
hi CursorLineNr term=bold   cterm=NONE ctermfg=228 ctermbg=NONE

" ==========================
" tabと全角スペースの可視化
" ==========================
set list
set listchars=tab:>\ \,trail:-,nbsp:%,extends:>,precedes:<
"highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
"match ZenkakuSpace /　/
highlight JpSpace cterm=underline ctermfg=Blue guifg=Blue
au BufRead,BufNew * match JpSpace /　/


" ==========================
" マウス設定
" ==========================
set mouse=a
set ttymouse=xterm2


" ==========================
" 文字コード設定
" ==========================
set fileencoding=utf-8 " 保存時の文字コード
set fileencodings=ucs-boms,utf-8,euc-jp,cp932 " 読み込み時の文字コードの自動判別. 左側が優先される
set fileformats=unix,dos,mac " 改行コードの自動判別. 左側が優先される
set ambiwidth=double " □や○文字が崩れる問題を解解決


" ==========================
" タブ・インデント設定
" ==========================
set expandtab " タブ入力を複数の空白入力に置き換える
set tabstop=4 " 画面上でタブ文字が占める幅
set softtabstop=4 " 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent " 改行時に前の行のインデントを継続する
set smartindent " 改行時に前の行の構文をチェックし次の行のインデントを増減する
set shiftwidth=4 " smartindentで増減する幅


" ==========================
" 検索設定
" ==========================
set incsearch " インクリメンタルサーチ. １文字入力毎に検索を行う
set ignorecase " 検索パターンに大文字小文字を区別しない
set smartcase " 検索パターンに大文字を含んでいたら大文字小文字を区別する
set hlsearch " 検索結果をハイライト

" ESCキー2度押しでハイライトの切り替え
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>


" ==========================
" カーソル設定
" ==========================
set whichwrap=b,s,h,l,<,>,[,],~ " カーソルの左右移動で行末から次の行の行頭への移動が可能になる
set number " 行番号を表示
set cursorline " カーソルラインをハイライト
"highlight CursorLine cterm=underline ctermfg=NONE ctermbg=NONE
"highlight CursorLine cterm=NONE ctermfg=NONE ctermbg=white


" 行が折り返し表示されていた場合、行単位ではなく表示行単位でカーソルを移動する
nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk

" バックスペースキーの有効化
set backspace=indent,eol,start


" ==========================
" 貼り付け設定
" ==========================
if &term =~ "xterm"
    let &t_SI .= "\e[?2004h"
    let &t_EI .= "\e[?2004l"
    let &pastetoggle = "\e[201~"

    function XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction

    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif


" ==========================
" ステータスラインの設定
" ==========================
set laststatus=2 " ステータスラインを常に表示
set showmode " 現在のモードを表示
set showcmd " 打ったコマンドをステータスラインの下に表示
set ruler " ステータスラインの右側にカーソルの現在位置を表示する


" ==========================
" CtrlPの設定
" ==========================
let g:ctrlp_match_window = 'order:ttb,min:20,max:20,results:100' " マッチウインドウの設定. 「下部に表示, 大きさ20行で固定, 検索結果100件」
let g:ctrlp_show_hidden = 1 " .(ドット)から始まるファイルも検索対象にする
let g:ctrlp_types = ['fil'] "ファイル検索のみ使用
let g:ctrlp_extensions = ['funky', 'commandline'] " CtrlPの拡張として「funky」と「commandline」を使用

" CtrlPCommandLineの有効化
command! CtrlPCommandLine call ctrlp#init(ctrlp#commandline#id())

" CtrlPFunkyの有効化
let g:ctrlp_funky_matchtype = 'path' 


" ==========================
" 複数行コメントアウトのショートカット
" ==========================
nmap <C-K> <Plug>(caw:i:toggle)
vmap <C-K> <Plug>(caw:i:toggle)


" ==========================
" カラースキーマー 構文ハイライト
" ==========================
"colorscheme molokai
if &term == "xterm-256color"
    colorscheme molokai
    hi Comment ctermfg=102
    hi Visual  ctermbg=236
endif

syntax on

" ==========================
" ファイルの拡張子が特殊な場合でも構文ハイライトを有効にする
" ==========================
"autocmd BufNewFile,BufRead *.psgi set filetype=perl
"autocmd BufNewFile,BufRead *.t    set filetype=perl
"autocmd BufNewFile,BufRead *.pm   set filetype=perl
"autocmd BufNewFile,BufRead *.cgi  set filetype=ruby
"autocmd BufNewFile,BufRead *.cgi  set filetype=perl

" ==========================
" perltidy（要インストール）
" ==========================
" map ,pt <Esc>:%! perltidy<CR>
" Perltidy

" ファイル保存時にperltidyを実行
" function! s:Perltidy()
"     %! perltidy -q
" endfunction
" autocmd BufWritePre *.pl silent :call s:Perltidy() 
" autocmd BufWritePre *.pm silent :call s:Perltidy()
