set nocompatible

filetype off
set rtp+=~/dotfiles/vimfiles/Vundle.vim

call vundle#begin()

Plugin 'Shougo/neocomplcache'
Plugin 'Shougo/unite.vim'
Plugin 'thinca/vim-ref'
Plugin 'thinca/vim-quickrun'
Plugin 'VundleVim/Vundle.vim'
Plugin 'ryanoasis/vim-devicons'
Plugin 'airblade/vim-gitgutter'



Plugin 'tpope/vim-commentary'
cal vundle#end()
filetype plugin indent on
" required!


" 基本設定
" vi互換無し
 set nocompatible
" スクロール時の余白確保
 set scrolloff=5
 " 一行に長い文章を書いていても自動折り返しをしない
 set textwidth=0
 " バックアップ取らない
 set nobackup
 " 他で書き換えられたら自動で読み直す
 set autoread
 " スワップファイル作らない
 set noswapfile
 " 編集中でも他のファイルを開けるようにする
 set hidden
 " バックスペースでなんでも消せるように
 set backspace=indent,eol,start
 " 全角記号の不具合対応
 set ambiwidth=double
 " テキスト整形オプション，マルチバイト系を追加
 set formatoptions=lmoq
" ビープをならさない
 set vb t_vb=
 " Exploreの初期ディレクトリ
 set browsedir=buffer
 " カーソルを行頭、行末で止まらないようにする
 set whichwrap=b,s,h,l,<,>,[,]
 " コマンドをステータス行に表示
 set showcmd
 " 現在のモードを表示
 set showmode
 " viminfoファイルの設定
 set viminfo='50,<1000,s100,\"50
 " モードラインは無効
 set modelines=0
 " OSのクリップボードを使用する
 set clipboard+=unnamed
 "set clipboard=unnamedplus,autoselect

 "ヤンクした文字は、システムのクリップボードに入れる"
 set clipboard=unnamed

"makeprg
 "set makeprg=php\ -l\ %
 set errorformat=%m\ in\ %f\ on\ line\ %l

 set autoindent

" 保存時に行末の空白を除去する
autocmd BufWritePre * :%s/\s\+$//ge
" 保存時にtabをスペースに変換する
autocmd BufWritePre * :%s/\t/ /ge



 "-------------------------------------------------------------------------------
 " ステータスライン StatusLine
 "-------------------------------------------------------------------------------
 " 常にステータスラインを表示
 set laststatus=2
 "カーソルが何行目の何列目に置かれているかを表示する
 set ruler
 "ステータスラインに文字コードと改行文字を表示する
 if winwidth(0) >= 120
   set statusline=%<[%n]%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%y\ %F%=[%{GetB()}]\ %l,%c%V%8P
 else
   set statusline=%<[%n]%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%y\ %f%=[%{GetB()}]\ %l,%c%V%8P
 endif
 "入力モード時、ステータスラインのカラーを変更
  augroup InsertHook
  autocmd!
  autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340
  autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90
  augroup END

 function! GetB()
   let c = matchstr(getline('.'), '.', col('.') - 1)
   let c = iconv(c, &enc, &fenc)
   return String2Hex(c)
 endfunction
 "help eval-examples
   " The function Nr2Hex() returns the Hex string of a number.
   func! Nr2Hex(nr)
     let n = a:nr
     let r = ""
   while n
     let r = '0123456789ABCDEF'[n % 16] . r
     let n = n / 16
   endwhile
   return r
 endfunc
 " The function String2Hex() converts each character
 " in a string to a two
 " character Hex string.
 func! String2Hex(str)
   let out = ''
   let ix = 0
   while ix < strlen(a:str)
      let out = out . Nr2Hex(char2nr(a:str[ix]))
      let ix = ix + 1
   endwhile
   return out
 endfunc

"-------------------------------------------------------------------------------
"" 表示 Apperance
"-------------------------------------------------------------------------------
"" 括弧の対応をハイライト
 set showmatch
" 行番号表示
 set number
 " 不可視文字表示
 set list
 " 不可視文字の表示形式
 set listchars=tab:>.,trail:_,extends:>,precedes:<
 " 印字不可能文字を16進数で表示
 set display=uhex
 " 全角スペースの表示
 highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
 match ZenkakuSpace /　/

 " カーソル行をハイライト
" set cursorline
 " カレントウィンドウにのみ罫線を引く
 augroup cch
   autocmd! cch
   autocmd WinLeave * set nocursorline
   autocmd WinEnter,BufRead * set cursorline
 augroup END
 :hi clear CursorLine
 :hi CursorLine gui=underline
 highlight CursorLine ctermbg=black guibg=black
 " コマンド実行中は再描画しない
 :set lazyredraw
 " 高速ターミナル接続を行う
 :set ttyfast

"-------------------------------------------------------------------------------
"" インデント Indent
"-------------------------------------------------------------------------------
"" 自動でインデント
set autoindent
" ペースト時にautoindentを無効に(onにするとautocomplpop.vimが動かない)
":set paste
" 新しい行を開始したときに、新しい行のインデントを現在行と同じ量にする。
set smartindent
" Cプログラムファイルの自動インデントを始める
set cindent
" softtabstopはTabキー押し下げ時の挿入される空白の量，0の場合はtabstopと同じ，BSにも影響する
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

"if has("autocmd")
"  "ファイルタイプの検索を有効にする
"    filetype plugin on
      "そのファイルタイプにあわせたインデントを利用する
"    filetype indent on
    " これらのftではインデントを無効に
"    autocmd FileType html :set indentexpr=
"    autocmd FileType xhtml :set indentexpr=
"endif

" 文字コードの自動認識
if &encoding !=# 'utf-8'
  set encoding=japan
  set fileencoding=japan
endif
if has('iconv')
  let s:enc_euc = 'euc-jp'
  let s:enc_jis = 'iso-2022-jp'
  " iconvがeucJP-msに対応しているかをチェック
  if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'eucjp-ms'
    let s:enc_jis = 'iso-2022-jp-3'
  " iconvがJISX0213に対応しているかをチェック
  elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'euc-jisx0213'
    let s:enc_jis = 'iso-2022-jp-3'
  endif
  " fileencodingsを構築
  if &encoding ==# 'utf-8'
    let s:fileencodings_default = &fileencodings
    let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
    let &fileencodings = &fileencodings .','. s:fileencodings_default
    unlet s:fileencodings_default
  else
    let &fileencodings = &fileencodings .','. s:enc_jis
    set fileencodings+=utf-8,ucs-2le,ucs-2
    if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
      set fileencodings+=cp932
      set fileencodings-=euc-jp
      set fileencodings-=euc-jisx0213
      set fileencodings-=eucjp-ms
      let &encoding = s:enc_euc
      let &fileencoding = s:enc_euc
    else
      let &fileencodings = &fileencodings .','. s:enc_euc
    endif
  endif
  " 定数を処分
  unlet s:enc_euc
  unlet s:enc_jis
endif
" 日本語を含まない場合は fileencoding に encoding を使うようにする
if has('autocmd')
  function! AU_ReCheck_FENC()
    if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
      let &fileencoding=&encoding
    endif
  endfunction
  autocmd BufReadPost * call AU_ReCheck_FENC()
endif
" 改行コードの自動認識
set fileformats=unix,dos,mac
" □とか○の文字があってもカーソル位置がずれないようにする
if exists('&ambiwidth')
  set ambiwidth=double
endif

syntax on
