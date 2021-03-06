" Load pathogen
source ~/.vim/bundle/pathogen/autoload/pathogen.vim 

set nocompatible

" Silence please
set vb
set t_vb=

" Pathogen
call pathogen#interpose('bundle/{}')

" Change the leader to ,
let mapleader = ","
let maplocalleader = "\\"

set hidden

set nowrap        " don't wrap lines
set tabstop=4     " a tab is four spaces
set backspace=indent,eol,start
set ttyfast
set lazyredraw
set splitbelow
set splitright
set title
set completeopt=longest,menuone,preview
                  " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set shiftwidth=4  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
" set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                  "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
                  "    shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
set textwidth=79  " wrap lines at 79 characters
set relativenumber
set number
set autoread      " Reload the files if they changed on disk!
" set shell=/bin/bash\ --login
set shell=bash

" wild menu completion
set wildmenu
set wildmode=list:longest
set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=_build                           " Sphinx build dir
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.pyc                            " Python byte code
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store
set wildignore+=*.rdb                            " Redis database file
set wildignore+=*CACHE                           " django compressor cache

" Two spaces to end a sentence
set cpoptions+=J

" TODO: Only add the 73 to Python files
set colorcolumn=80,73

set cursorline
set nojoinspaces

set undodir=~/.vim/tmp/undo//     " undo files
set backupdir=~/.vim/tmp/backup// " backups
set directory=~/.vim/tmp/swap//   " swap files
set backup                        " enable backups
set noswapfile                    " It's 2012, Vim.

filetype on
filetype plugin on
filetype indent on
filetype plugin indent on

set expandtab

if has('mouse')
    set mouse=a
endif

nnoremap j gj
nnoremap k gk

" Remap : to ;
nnoremap ; :

" Fix syntax highlighting
nnoremap <leader>u :syntax sync fromstart<cr>:redraw!<cr>

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Open a new split and switch to it
nnoremap <leader>w <C-w>v<C-w>1

" Simple clearing of search results
:nnoremap <CR> :nohlsearch<cr>

" Strip all trailing whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" HTML tag folding
nnoremap <leader>ft Vatzf

function! g:CopyTheTextPlease()
    normal! gv
    silent '<,'>w !pbcopy
endfunction
vnoremap <leader>y :<c-u>call g:CopyTheTextPlease()<cr>

" Toggle whitespace characters
nmap <leader>l :set list!<cr>

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%80v.\+/

" Diplay cursor position in bottom right corner
set ruler

" Editing .vimrc
map <leader>v :vs ~/.vimrc<CR><C-W>
map <silent> <leader>V :source ~/.vimrc<CR>

" Editing .bashrc
map <leader>b :vs ~/.bashrc<CR><C-W>

au FileType javascript setlocal tabstop=2 shiftwidth=2

au FileType coffee setlocal tabstop=4 shiftwidth=4

au BufNewFile,BufRead *.html setlocal filetype=htmldjango
au FileType htmldjango setlocal textwidth=0 tabstop=2 shiftwidth=2

au FileType mail setlocal textwidth=72

au FileType c setlocal tabstop=8 shiftwidth=8 softtabstop=8 noexpandtab cindent

" Open help files in a vertical split
au BufWinEnter *.txt if &ft == 'help' | wincmd L | endif

au BufNewFile,BufRead *.j setlocal filetype=objj
let g:syntastic_enable_signs=1
let g:syntastic_javascript_checkers=["eslint"]
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='✗'

let g:syntastic_python_checkers=["flake8"]
let g:syntastic_haskell_checkers=["hlint"]

let g:snips_author="Honza Pokorny"

" Status line stuff
set statusline=%F   " Full path to file
set statusline+=%h  " Help buffer flag, e.g. [Help]
set statusline+=%m  " Modified flag
set statusline+=%r  " Read only flag
set statusline+=%w  " Preview window flag
set statusline+=%=%{\"[\".(&fenc==\"\"?&enc:&fenc).\"]\\"}%k\%=%{fugitive#statusline()}
set statusline+=%y\[%l\/%L,%c] " file type, line num, num lines, col num

set laststatus=2

set scrolloff=3

" tagbar
let g:tagbar_sort = 0
let g:tagbar_ctags_bin="/usr/local/bin/ctags"
nmap <leader>d :TagbarToggle<CR>

" Don't display manual
nnoremap K <nop>

" Make vim able to edit crontab
set backupskip=/tmp/*,/private/tmp/*"

au Filetype rst nnoremap <buffer> <localleader>1 yypVr=
au Filetype rst nnoremap <buffer> <localleader>2 yypVr-
au Filetype rst nnoremap <buffer> <localleader>3 yypVr~
au Filetype rst nnoremap <buffer> <localleader>4 yypVr`

au Filetype mkd nnoremap <buffer> <localleader>1 yypVr=
au Filetype mkd nnoremap <buffer> <localleader>2 yypVr-

" Keep splits sized properly
au VimResized * exe "normal! \<cw>="

" Uppercase
nnoremap <C-u> gUiw
inoremap <C-u> <esc>gUiwea

" Format
nnoremap Q gqip

" vagrant
au BufRead,BufNewFile Vagrantfile set ft=ruby

" fish
augroup ft_fish
    au!

    au BufNewFile,BufRead *.fish setlocal filetype=fish

    au FileType fish setlocal foldmethod=marker foldmarker={{{,}}}
augroup END

" Substitute
nnoremap <leader>s :%s//g<left><left>

function! CloseHiddenBuffers()
  " figure out which buffers are visible in any tab
  let visible = {}
  for t in range(1, tabpagenr('$'))
    for b in tabpagebuflist(t)
      let visible[b] = 1
    endfor
  endfor
  " close any buffer that are loaded and not visible
  let l:tally = 0
  for b in range(1, bufnr('$'))
    if bufloaded(b) && !has_key(visible, b)
      let l:tally += 1
      exe 'bw ' . b
    endif
  endfor
  echon "Deleted " . l:tally . " buffers"
endfun

command! -nargs=* Only call CloseHiddenBuffers()

nmap \ <Plug>CommentaryLine

" ctrlp
" let g:loaded_ctrlp = 1
let g:ctrlp_working_path_mode = 0
" let g:ctrlp_custom_ignore = ['\v[\/]node_modules$', '\v[\/]target']
let g:ctrlp_extensions = ['tag']

let my_ctrlp_ffind_command = "ffind --dir %s --type e -B -f"

let g:ctrlp_user_command = ['.git/', my_ctrlp_ffind_command, my_ctrlp_ffind_command]
let g:selecta_path = "selecta"

function! SelectaMatch(items, str, limit, mmode, ispath, crfile, regex)
    let cachefile = ctrlp#utils#cachedir().'/selecta.cache'

    if !( filereadable(cachefile) && a:items == readfile(cachefile) )
        call writefile(a:items, cachefile)
    endif

    if !filereadable(cachefile)
        return []
    endif

    let cmd = "cat ".cachefile." | ".g:selecta_path." ".a:str
    return split(system(cmd), "\n")

endfunction

let g:ctrlp_match_func = {'match' : 'SelectaMatch' }

nnoremap <leader><cr> :silent !/usr/local/bin/ctags -R . && sed -i .bak -E -e '/^[^     ]+      [^      ]+.py   .+v$/d' tags<cr>:redraw!<cr>

" Use c-\ to do c-] but open it in a new split.
nnoremap <c-\> <c-w>v<c-]>zvzz

nnoremap <leader>. :CtrlPTag<cr>
nmap <leader>f :ClearCtrlPCache<cr>

" hi link coffeeObject NONE
" hi link coffeeBracket NONE
" hi link coffeeCurly NONE
" hi link coffeeParen NONE
" hi link coffeeSpecialVar Identifier

" Send visual selection to gist.honza.ca (custom sprunge.us)
" - places gist url to clipboard
" via @dotvimrc
" https://github.com/honza/heroku-sprunge
vnoremap <leader>S :w !curl -sF 'sprunge=<-' 'http://gist.honza.ca' \| pbcopy<cr>

" Space to toggle folds.
nnoremap <Space> za
vnoremap <Space> za

" Toggle paste
set pastetoggle=<F9>

let g:pymode_doc = 1
let g:pymode_doc_key = '<localleader>ds'
let g:pydoc = 'pydoc'
let g:pymode_syntax = 1
let g:pymode_syntax_all = 0
let g:pymode_syntax_builtin_objs = 1
let g:pymode_syntax_print_as_function = 0
let g:pymode_syntax_space_errors = 0
let g:pymode_run = 0
let g:pymode_lint = 0
let g:pymode_breakpoint = 0
let g:pymode_utils_whitespaces = 0
let g:pymode_virtualenv = 0
let g:pymode_folding = 0

let g:pymode_options_indent = 0
let g:pymode_options_fold = 0
let g:pymode_options_other = 0

let g:pymode_rope = 1
let g:pymode_rope_global_prefix = "<localleader>R"
let g:pymode_rope_local_prefix = "<localleader>r"
let g:pymode_rope_auto_project = 1
let g:pymode_rope_enable_autoimport = 0
let g:pymode_rope_autoimport_generate = 1
let g:pymode_rope_autoimport_underlineds = 0
let g:pymode_rope_codeassist_maxfixes = 10
let g:pymode_rope_sorted_completions = 1
let g:pymode_rope_extended_complete = 1
let g:pymode_rope_autoimport_modules = ["os", "shutil", "datetime"]
let g:pymode_rope_confirm_saving = 1
let g:pymode_rope_vim_completion = 1
let g:pymode_rope_guess_project = 1
let g:pymode_rope_goto_def_newwin = 0
let g:pymode_rope_always_show_complete_menu = 0

" Clojure
autocmd FileType clojure set commentstring=;;\ %s

" let g:rbpt_loadcmd_toggle = 0

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Golang
autocmd FileType go set commentstring=//\ %s

" Fish
autocmd FileType fish set commentstring=\#\ %s

au FileType mkd setlocal foldmethod=manual
let g:vim_markdown_folding_disabled=1

" Remove trailing whitespace on save
" autocmd BufWritePre <buffer> :%s/\s\+$//e

" Salt files
au BufRead,BufNewFile *.sls set ft=yaml

let g:haskell_conceal = 0

" GUI stuff

if has("gui_running")
    set guioptions=aAce
    " set guifont=Droid\ Sans\ Mono:h14
    " set guifont=Source\ Code\ Pro:h14
    " set guifont=Source\ Code\ Pro:h14
    " set guifont=Droid\ Sans\ Mono:h12
    set guifont=Ubuntu\ Mono:h14
    set linespace=1
endif

syntax enable
set background=dark
" set background=light
" let base16colorspace=256
" colorscheme badwolf
colorscheme solarized
" colorscheme molokai
" colorscheme base16-bright
" colorscheme base16-monokai
" colorscheme base16-default
" colorscheme base16-mocha
" set t_Co=256
