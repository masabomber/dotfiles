set nocompatible
filetype off

set rtp+=~/dotfiles/vimfiles/vundle.git
call vundle#rc()

"Bundle 'vundle'
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/unite.vim'
Bundle 'thinca/vim-ref'
Bundle 'thinca/vim-quickrun'

"Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-rails'
Bundle 'scrooloose/nerdtree'
Bundle 'csexton/rvm.vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'cucumber/cucumber'
Bundle 'kchmck/vim-coffee-script'
Bundle 'thinca/vim-quickrun'
Bundle 'tomasr/molokai'
Bundle 'Shougo/vimshell'
"Bundle 'Shougo/vimproc'

Bundle 'leshill/vim-json'
Bundle 'mattn/zencoding-vim'
Bundle 'gmarik/snipmate.vim'
Bundle 'pix/vim-align'
"Bundle 'tsaleh/vim-tcomment'

Bundle 'cakephp.vim'
Bundle 'php.vim'

Bundle 'twilight'

Bundle 'ruby.vim'
Bundle 'rails.vim'

Bundle 'python.vim'


filetype plugin indent on
" required!

"------------------------------------
" VimShell
"------------------------------------
let g:vimshell_enable_interactive = 1
let g:vimshell_enable_auto_slash = 1
"nnoremap <C-W><C-W> :VimShell<CR>

"------------------------------------
" SnipMate
"------------------------------------
let g:snippets_dir = '~/.vim/snippets'

"------------------------------------
" noecomletecache
"------------------------------------
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
"let g:neocomplcache_min_keyword_length = 3

let g:neocomplcache_plugin_completion_length = {
  \ 'snipmate_complete' : 1,
  \ 'keyword_complete' : 2,
  \ 'syntax_complete' : 2
  \ }

" 候補popup時に先頭の候補を選択しておく
let g:neocomplcache_enable_auto_select = 1

" Define snippets directory.
let g:neocomplcache_snippets_dir = '~/.vim/snippets'


let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

    " Define dictionary.
    let g:neocomplcache_dictionary_filetype_lists = {
        \ 'default' : '',
        \ 'vimshell' : $HOME.'/.vimshell_hist',
        \ 'scheme' : $HOME.'/.gosh_completions',
        \ 'javascript' : $HOME.'.vim/dict/javascript.dict',
        \ 'php' : $HOME.'.vim/dict/php.dict',
        \ 'vim' : $HOME.'.vim/dict/vim.dict',
        \ }

    " Define keyword.
    if !exists('g:neocomplcache_keyword_patterns')
        let g:neocomplcache_keyword_patterns = {}
    endif
    let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

    " Plugin key-mappings.
    inoremap <expr><C-g>     neocomplcache#undo_completion()
    inoremap <expr><C-l>     neocomplcache#complete_common_string()

    " Recommended key-mappings.
    " <CR>: close popup and save indent.
    "inoremap <expr><CR>  neocomplcache#close_popup() . "\<CR>"
    " <TAB>: completion.
    inoremap <expr><TAB>  pumvisible() ?   "\<C-n>" : "\<TAB>"
    " <C-h>, <BS>: close popup and delete backword char.
    inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
    inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
    inoremap <expr><C-y>  neocomplcache#close_popup()
    inoremap <expr><C-e>  neocomplcache#cancel_popup()

    " For cursor moving in insert mode(Not recommended)
    "inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
    "inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
    "inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
    "inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
    " Or set this.
    "let g:neocomplcache_enable_cursor_hold_i = 1

    " AutoComplPop like behavior.
    "let g:neocomplcache_enable_auto_select = 1

    " Shell like behavior(not recommended).
    "set completeopt+=longest
    "let g:neocomplcache_enable_auto_select = 1
    "let g:neocomplcache_disable_auto_complete = 1
    "inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"
    "inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"

    " Enable omni completion.
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

    " Enable heavy omni completion.
    if !exists('g:neocomplcache_omni_patterns')
      let g:neocomplcache_omni_patterns = {}
    endif
    let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
    "autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
    let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
    let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
    let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'


"<TAB>で補完
" {{{ Autocompletion using the TAB key
" This function determines, wether we are on the start of the line text (then tab indents) or
" if we want to try autocompletion
function! InsertTabWrapper()
        let col = col('.') - 1
        if !col || getline('.')[col - 1] !~ '\k'
                return "\<TAB>"
        else
                if pumvisible()
                        return "\<C-N>"
                else
                        return "\<C-N>\<C-P>"
                end
        endif
endfunction
" Remap the tab key to select action with InsertTabWrapper
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
" }}} Autocompletion using the TAB key

"inoremap <expr> <CR> pumvisible() ? \<C-Y>\<CR>" : "\<CR>"


"autocmd FileType * let g:AutoComplPop_CompleteOption = '.,w,b,u,t,i'
"autocmd FileType perl let g:AutoComplPop_CompleteOption = '.,w,b,u,t,k~/.vim/dict/perl.dict'
"autocmd FileType ruby let g:AutoComplPop_CompleteOption = '.,w,b,u,t,i,k~/.vim/dict/ruby.dict'
"autocmd FileType javascript let g:AutoComplPop_CompleteOption = '.,w,b,u,t,i,k~/.vim/dict/javascript.dict'
"autocmd FileType erlang let g:AutoComplPop_CompleteOption = '.,w,b,u,t,i,k~/.vim/dict/erlang.dict'

"let g:AutoComplPop_IgnoreCaseOption = 1


"PATH
let $PATH = $PATH. ':/usr/bin/w3m'


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

"------------------------------------
" unite.vim
"------------------------------------
" 入力モードで開始する
let g:unite_enable_start_insert=0
" バッファ一覧
noremap <C-U><C-B> :Unite buffer<CR>
" ファイル一覧
noremap <C-U><C-F> :UniteWithBufferDir -buffer-name=files file<CR>
" 最近使ったファイルの一覧
noremap <C-U><C-R> :Unite file_mru<CR>
" レジスタ一覧
noremap <C-U><C-Y> :Unite -buffer-name=register register<CR>
" ファイルとバッファ
noremap <C-U><C-U> :Unite buffer file_mru<CR>
" 全部
noremap <C-U><C-A> :Unite UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>


" python設定
"filetype plugin on
"autocmd FileType python setl autoindent
"autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
"autocmd FileType python setl expandtab tabstop=4 shiftwidth=4 softtabstop=4


" Execute python script C-P
function! s:ExecPy()
     exe "!" . &ft . " %"
:endfunction
command! Exec call <SID>ExecPy()
autocmd FileType python map <silent> <C-P> :call <SID>ExecPy()<CR>


"rubyのタブストップ変更
au BufNewFile,BufRead *.rb    set nowrap tabstop=2 shiftwidth=2


" solia

syntax enable
set background=dark
" light にしたければ下
" set background=light
"colorscheme molokai
colorscheme twilight

" solia

"syntax enable
"set background=dark
" light にしたければ下
" set background=light
"colorscheme molokai

"全角スペースを表示
highlight JpSpace cterm=underline ctermfg=Blue guifg=Bule
au BufRead,BufNew * match JpSpace /　/

"---------------------
"surround.vim
"---------------------
"s , ssで選択範囲を指定文字でくくる
nmap s <Plug>Ysurround
nmap ss <Plug>Yssurround
