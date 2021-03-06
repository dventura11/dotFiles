filetype off                  " required

" vundle
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
" let Vundle manage Vundle, required
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
" Plugin 'lifepillar/vim-solarized8'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'scrooloose/nerdtree'
Plugin 'ervandew/supertab'
" Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'Raimondi/delimitMate'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdcommenter'
Plugin 'sjl/splice.vim'
Plugin 'Shougo/neocomplete.vim'
Plugin 'artur-shaik/vim-javacomplete2'
Plugin 'tfnico/vim-gradle'
" Plugin 'airblade/vim-rooter'
" Plugin 'jacob-ogre/vim-syncr'
" All of your Plugins must be added before the following line
call vundle#end()            " required
execute pathogen#infect()

filetype plugin indent on
syntax enable
set nocompatible
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
let mapleader = ","
set clipboard=unnamedplus
set backspace=2
set number
set laststatus=2
set list
" set listchars=tab:\⁞\·
" set listchars=tab:\→\
set listchars=tab:\⁞\ 
nmap <leader>t :tabnew<CR>
nmap <leader>f :tabfirst<CR>
nmap <leader>l :tablast<CR>
nmap <leader>C :tabonly<CR>
nmap <leader>F :tabfind
nmap <leader>rg :Rgrep
nmap <leader>o o<ESC>
nmap <leader>O O<ESC>

" nerdtree
" autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
nmap <leader>n :NERDTreeToggle<CR>
let NERDTreeMapOpenInTab='<ENTER>'

"snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"ctrlp
" Use <leader>t to open ctrlp
let g:ctrlp_map = '<leader>p'
" Ignore these directories
set wildignore+=*/build/**
" disable caching
" let g:ctrlp_use_caching=0

"theme
" solarized
" set background=dark
" let g:solarized_termcolors=256
" solarized 8
" let g:solarized_use16 = 0
" colorscheme solarized8_dark_flat
" papercolor
set background=dark
colorscheme PaperColor

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'cool'

" nerd commenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" vim-syncr
" autocmd BufWritePost * :Suplfil

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_check_on_w = 1
let g:syntastic_java_checkers=['javac']
let g:syntastic_java_javac_config_file_enabled = 1

" neocomplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 2
" let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
" inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
" function! s:my_cr_function()
  " return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
" endfunction
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
" inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType java setlocal omnifunc=javacomplete#Complete

" javacomplete2
autocmd BufWritePre *.java :JCimportsAddMissing
autocmd BufWritePre *.java :JCimportsRemoveUnused
autocmd BufWritePre *.java :JCimportsSort
let g:JavaComplete_GradleExecutabld = 'gradle'
let g:JavaComplete_ImportSortType = 'packageName'
let g:JavaComplete_ImportOrder = ['com.google.', 'com.linkedin.', 'com.', 'org.', 'net.', 'java.', 'javax.' ]
