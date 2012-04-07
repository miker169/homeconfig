"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" BASIC EDITING CONFIGURATION
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

"My Bundles here"

""""""""""""""
"" Colors
""""""""""""""
Bundle 'sjl/badwolf' 
Bundle 'altercation/vim-colors-solarized'
Bundle 'tomasr/molokai'



" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles 

" Allow unsaved background buffer and remember marks/undo for them

set hidden
filetype plugin indent on "required!
" Remember more commands and search history
set history=100000
set timeoutlen=250
set clipboard+=unnamed "Yanks go on a clipboard instead
set et
set sw=4
set autoindent
set nu
syntax on set ruler set autoindent
set smartindent
colorscheme badwolf
set pastetoggle=<F6>
set autowrite

set autoread
set tags=./tags;$HOME
" Modeline
set modeline
set modelines=5 " default numbers of lines to read for modeline instructions

"Back up and swap
set nobackup "Just don't back up
set nowritebackup "No write backups
set noswapfile " And no swap files
set directory=/tmp// " prepend(^=) $HOME/.tmp/ to default path; use full path as backup filename(//)

set hidden "The current buffer can be put to the background without writing to disk
"Match and search
set hlsearch "highlight search
set ignorecase "Do case insensitive matchingf
set smartcase "be sensitive when theres a capital letter
set incsearch "

"Formatting "{{{
set fo+=o "Automatically insert the current comment leader after hitting 'o' or 'O' in Normal mode.
set fo-=r "Do not automatically insert a comment leader after an enter
set fo-=t "Do not auto-wrap text using textwidth (does not apply to comments)

set nowrap
set textwidth=0 "Don't wrap lines by itself
set wildmode=longest,list "At command line, complete longest common string, then list alternatives

set backspace=indent,eol,start " more powerful backspacing

set tabstop=2 "set the default tab stop
set softtabstop=2 
set shiftwidth=2 " Set the default shift width for indents
set expandtab "Make tabs into spaces
set smarttab "Smarter tab levels

set autoindent
set cindent
set cinoptions=:s,ps,ts,cs
set cinwords=if,else,while,do,for,switch,case
set showbreak=s



if has("autocmd")
  filetype indent on "Automatically detect file types.
endif

" Visual 
set nonumber "Line numbers off
set showmatch " Show matching brackets
set matchtime=5 "Brackey blinking
set novisualbell "No blinking
set noerrorbells "No noise
set laststatus=2 " Always show status line
set vb t_vb= "disable any beeps or flashes on error
set ruler " show ruler
set showcmd " Display an incomplete command in the lower right corner of the vim window
set shortmess=atI " Shortens messages

set nolist "Display unprintable characters f12 - switches
set listchars=tab:·\ ,eol:¶,trail:·,extends:»,precedes:« " Unprintable chars mapping 

set foldenable "Turn on folding
set foldmethod=marker " Fold on the marker
set foldlevel=100 " Don't autofold anything (but I can still fold manually)
set foldopen=block,hor,mark,percent,quickfix,tag " what movements open folds

set mouse-=a "Disable mouse
set mousehide "Hide mouse after chats typed

set splitbelow
set splitright

"Command and Auto commands
"sudo write
comm! W exec 'w !sudo tee % > /dev/null' | e!  
"Auto commands
au BufRead,BufNewFile {Gemfile,Rakefile,Capfile,*.rake,config.ru}   set ft=ruby
au BufRead,BufNewFile {*.md,*.mkd,*.markdown}                       set ft=markdown
au BufRead,BufNewFile {COMMIT_EDITMSG}                              set ft=gitcommit

au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | execute "normal g'\"" | endif " restore position in file

"Key mappings
:let maplocalleader="\\"

nnoremap <silent> <LocalLeader>rs :source ~/.vimrc<CR>
nnoremap <silent> <LocalLeader>rt :tabnew ~/.vimrc<CRs
nnoremap <silent> <LocalLeader>re :e ~/.vimrc
nnoremap <silent> <LocalLeader>rd :e ~/.vim <Cd>


 " 'quote' a word
nnoremap qw :silent! normal mpea'<Esc>bi'<Esc>`pl
 " 'double "quote" a word
nnoremap qd :silent! normal mpea"<Esc>bi"<Esc>`pl
 " remove quotes from a word
snoremap dq :silent! normal mpeld bhd `ph<CR>

" Tabs 
nnoremap <silent> <LocalLeader>[ :tabprev<CR>
nnoremap <silent> <LocalLeader>] :tabnext<CR>
" Duplication 
vnoremap <silent> <LocalLeader>= yP
nnoremap <silent> <LocalLeader>= YP
" Buffers
nnoremap <silent> <LocalLeader>- :bd<CR>
" Split line(opposite to S-J joining line) 
nnoremap <silent> <C-J> gEa<CR><ESC>ew 

" map <silent> <C-W>v :vnew<CR>
" map <silent> <C-W>s :snew<CR>

nnoremap # :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>
nnoremap * #

map <S-CR> A<CR><ESC>
"
" Control+S and Control+Q are flow-control characters: disable them in your terminal settings.
" $ stty -ixon -ixoff
noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR>
"
" show/Hide hidden Chars
map <silent> <F12> :set invlist<CR>     
"
" generate HTML version current buffer using current color scheme
map <silent> <LocalLeader>2h :runtime! syntax/2html.vim<CR> 
" " }}}

set runtimepath+=~/.vim/vundle.git/ " my dev version

"Plugins
"
"Programming
Bundle "jQuery"
Bundle "rails.vim"
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-speeddating'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'

"Syntax highlighting
Bundle "cucumber.zip"
Bundle "Markdown"
Bundle 'ecomba/vim-ruby-refactoring'
Bundle 'kchmck/vim-coffee-script'
Bundle 'https://github.com/pangloss/vim-javascript'
Bundle 'https://github.com/digitaltoad/vim-jade'
Bundle 'https://github.com/wavded/vim-stylus' 
"Snippets
Bundle "http://gitgub.com/gmarik/snipmate.vim.git"

"Git inegration
Bundle "git.zip"
Bundle "fugitive.vim"

"Html tool
Bundle "ragtag.vim"

"Utility
Bundle "repeat.vim"
Bundle "surround.vim"
Bundle "SuperTab"
Bundle "file-line"
Bundle "Align"
Bundle "https://github.com/godlygeek/tabular"
Bundle "https://github.com/hallettj/jslint.vim"
Bundle "https://github.com/manalang/jshint.vim"

" FuzzyFinder
Bundle "L9"
Bundle "FuzzyFinder"
let g:fuf_modesDisable = [] " {{{
nnoremap <silent> <LocalLeader>h :FufHelp<CR>
nnoremap <silent> <LocalLeader>2  :FufFileWithCurrentBufferDir<CR>
nnoremap <silent> <LocalLeader>@  :FufFile<CR>
nnoremap <silent> <LocalLeader>3  :FufBuffer<CR>
nnoremap <silent> <LocalLeader>4  :FufDirWithCurrentBufferDir<CR>
nnoremap <silent> <LocalLeader>$  :FufDir<CR>
nnoremap <silent> <LocalLeader>5  :FufChangeList<CR>
nnoremap <silent> <LocalLeader>6  :FufMruFile<CR>
nnoremap <silent> <LocalLeader>7  :FufLine<CR>
nnoremap <silent> <LocalLeader>8  :FufBookmark<CR> 
nnoremap <silent> <LocalLeader>*  :FuzzyFinderAddBookmark<CR><CR>
nnoremap <silent> <LocalLeader>9  :FufTaggedFile<CR> 
" " }}}

" Zoomwin
Bundle "ZoomWin"
noremap <LocalLeader>o :ZoomWin<CR>
vnoremap <LocalLeader>o <C-C>:ZoomWin<CR>
inoremap <LocalLeader>o <C-O>:ZoomWin<CR>
noremap <C-W>+o :ZoomWin<CR>

" Ack
Bundle "ack.vim"
noremap <LocalLeader># "ayiw:Ack <C-r>a<CR>
vnoremap <LocalLeader># "ay:Ack <C-r>a<CR>

" tComment
Bundle "tComment"
nnoremap // :TComment<CR>
vnoremap // :TComment<CR>

" Command-T
Bundle "git://git.wincent.com/command-t.git"
let g:CommandTMatchWindowAtTop=1 " show window at top

" Navigation
Bundle "http://github.com/gmarik/vim-visual-star-search.git"
