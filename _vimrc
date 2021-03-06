set nocompatible              " be iMproved, required
filetype off                  " required

"=====================================================
" Vundle settings
"=====================================================
" set the runtime path to include Vundle and initialize
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
set rtp+=$HOME/vim/bundle/Vundle.vim/
call vundle#begin('$HOME/vim/bundle/')

Plugin 'gmarik/Vundle.vim'		" let Vundle manage Vundle, required

"---------=== Code/project navigation ===-------------
Plugin 'scrooloose/nerdtree' 	    	" Project and file navigation
set runtimepath^=~/.vim/bundle/ctrlp.vim "установил плагин непривычным способом, набрал :PluginSearch ctrlP, установил, добавил эту строку, заработало
"Plugin 'majutsushi/tagbar'          	" Class/module browser

"------------------=== Other ===----------------------
"Plugin 'bling/vim-airline'   	    	" Lean & mean status/tabline for vim
"Plugin 'fisadev/FixedTaskList.vim'  	" Pending tasks list
"Plugin 'rosenfeld/conque-term'      	" Consoles as buffers
Plugin 'tpope/vim-surround'	   	" Parentheses, brackets, quotes, XML tags, and morei
Plugin 'vim-syntastic/syntastic'	"проверка синтаксиса
Plugin 'tpope/vim-commentary'


"--------------=== Snippets support ===---------------
"Plugin 'garbas/vim-snipmate'		" Snippets manager
"Plugin 'MarcWeber/vim-addon-mw-utils'	" dependencies #1
"Plugin 'tomtom/tlib_vim'		" dependencies #2
Plugin 'honza/vim-snippets'		" snippets repo
Plugin 'sirver/ultisnips'
Plugin 'Valloric/YouCompleteMe'
Plugin 'ervandew/supertab'

"---------------=== Languages support ===-------------

" --- Python ---
Plugin 'klen/python-mode'	        " Python mode (docs, refactor, lints, highlighting, run and ipdb and more)
Plugin 'PProvost/vim-ps1'           " Powershell
"Plugin 'davidhalter/jedi-vim' 		" Jedi-vim autocomplete plugin
"Plugin 'mitsuhiko/vim-jinja'		" Jinja support for vim
"Plugin 'mitsuhiko/vim-python-combined'  " Combined Python 2/3 for Vim

" --- PHP ---
"Plugin 'StanAngeloff/php.vim'

" --- SQL ---
Plugin 'vim-scripts/SQLComplete.vim'

" --- HTML ---
Plugin 'othree/html5.vim'               " HTML5 omnicomplete and sytnax
Plugin 'idanarye/breeze.vim'            " Html navigation like vim-easymotion, tag matching, tag highlighting and DOM navigation
Plugin 'mattn/emmet-vim'                "html:5 insert form, what other functions

call vundle#end()            		" required
filetype on
filetype plugin on
filetype plugin indent on

" настройки Vim-Airline
set laststatus=2
let g:airline_theme='powerlineish'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'



"=====================================================
" Languages support
"=====================================================

" --- HTML ---
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType html setlocal commentstring=<!--\ %s\ -->





"=====================================================
" General settings
"=====================================================

set number						"номера строк слева
set cursorline					"подcвечивать линию
syntax on						"включить подсветку кода
set tabstop=4					"ширина таба (4 пробела) в режиме вставки, надо нажать tab
set shiftwidth=4				"ширина таба (4 пробела) в номарльном режиме, надо нажать shift >>/<<
set expandtab					"пробелы вместо Tab
" set smartindent
let NERDTreeShowHidden=1		"let NERDTree see hidden files
let @a=expand('%:p')

"=====================================================
" Powershell
"=====================================================
" set encoding=utf-8
set fileencodings=utf-8,cp1251,cp866,koi8-r
set shell=powershell
" set shellcmdflag=-command

" set background=dark
"colorscheme solas 
set term=xterm
set t_Co=256
let &t_AB="\e[48;5;%dm"
let &t_AF="\e[38;5;%dm"
" colorscheme 'C:\Program Files (x86)\Vim\vimfiles\colors\jellybeans.vim' 
colorscheme jellybeans 
" let g:jellybeans_use_lowcolor_black = 0
"colorscheme molokai 
"colorscheme myterm 
"colorscheme tomorrow 
"colorscheme nightly


" mappings
map <C-n> :NERDTreeToggle<CR>
"save in normal mode
nmap ;w :w<CR>

"в режиме вставки можно сменить раскладку нажанием Ctrl-6
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"   " <s-tab> = shift+tab
let g:UltiSnipsListSnippets = "<s-tab>"

"Recommended settings vim-syntastic/syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" let g:syntastic_php_checkers = ['php', 'phpcs']	"phpcs - проверка на соответсвие документации (стиля); php - не работает в vim, в консоле работает. Странная особенность некоторые ошибки отлавливаются, некоторые нет, даже командой из коноли php -l, но когда запускаешь на исплонение php выдает ошибку
let g:syntastic_php_checkers = ['php']	"phpcs - проверка на соответсвие документации (стиля); php - не работает в vim, в консоле работает. Странная особенность некоторые ошибки отлавливаются, некоторые нет, даже командой из коноли php -l, но когда запускаешь на исплонение php выдает ошибку

