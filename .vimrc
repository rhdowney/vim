set background=dark
colorscheme habamax
syntax on
filetype indent on
set textwidth=80
set autoindent
set smartindent
" tabstop:          width of tab character
" softtabstop:      fine tunes the amount of white space to be added
" shiftwidth        determines the amount of whitespace to add in normal mode
" expandtab:        when this option is enabled, vi will use spaces instead of tabs
set tabstop     =4
set softtabstop =4
set shiftwidth  =4
set expandtab
set shiftround
set number
set cursorline cursorlineopt=number
set printoptions =paper:letter,duplex:off
" don't prompt to save when changing tab/buffer
set hidden

let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

let mapleader=" " 

" copy visual selection to system clipboard
vnoremap <leader>y "+y

" save file text with syntax highlighting to PDF
nnoremap <leader>p :hardcopy > %.ps<cr> :w<cr>:silent exec '!ps2pdf %.ps'<cr><c-l> :silent exec '!rm %.ps'<cr><c-l>

" shortcut for switching buffers
nnoremap <leader>b :buffers<cr>:buffer<space>

" esc in insert mode
inoremap jk <esc>
" uppercase current word in insert mode
inoremap <c-u> <esc>vbUea
" uppercase current word in normal mode
nnoremap <c-u> wvbUe
" page between split windows in normal mode; follow by w or hjkl
nnoremap <leader>w <c-w>
" insert blank line in normal mode
nnoremap <leader><cr> O<esc>
" insert space in normal mode
nnoremap <leader><space> i<space><esc>
" wrap visual selection in ()
vnoremap <leader>( di()<esc>Pll
" view changes to current buffer
nnoremap <leader>d :w !git diff % -<cr>

" edit .vimrc
nnoremap <leader>ev :split $MYVIMRC<cr>
" source vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>:filetype detect<cr>
" shift current character right
nnoremap L xp
" shift current character left
nnoremap H Xph

iabbrev teh the

augroup fileTypeVim
    autocmd!
    " no automatic wrapping
    set textwidth=0
    " comment line
    autocmd FileType vim nnoremap <leader>/ I" <esc>
    " uncomment line
    autocmd FileType vim nnoremap <leader>u ^xx<esc>
    " comment visual selection
    autocmd FileType vim vnoremap <leader>/ :norm I" <cr>
    " uncomment visual selection
    autocmd FileType vim vnoremap <leader>u :norm ^xx<cr>
augroup END

augroup fileTypeTex
    autocmd!
    " comment line
    autocmd FileType tex nnoremap <leader>/ I% <esc>
    " uncomment line
    autocmd FileType tex nnoremap <leader>u ^xx
    " comment visual selection
    autocmd FileType tex vnoremap <leader>/ :norm I% <cr>
    " uncomment visual selection
    autocmd FileType tex vnoremap <leader>u :norm ^xx<cr>
    " reset filetype (useful after adding a filetype-dependent autocommand in .vimrc)
    autocmd FileType tex nnoremap <leader>ft :set filetype=tex<cr>
    " shortcut to create itemized list
    autocmd FileType tex nnoremap <leader>it i\begin{itemize}<cr>\item<cr>\end{itemize}<esc><up>A<space>
    " shortcut to create enumerated list
    autocmd FileType tex nnoremap <leader>en i\begin{enumerate}<cr>\item<cr>\end{enumerate}<esc><up>A<space>
    " build (compile) PDF using pdflatex
    autocmd FileType tex nnoremap <leader>c :w<cr>:silent exec '!pdflatex %'<cr><c-l>
    " build PDF using XeTeX
    autocmd FileType tex nnoremap <leader>x :w<cr>:silent exec '!xelatex %'<cr><c-l>
    " open PDF if it exists
    autocmd FileType tex nnoremap <leader>o :silent exec '!open %:r.pdf'<cr><c-l>
    " put visual selection in math mode
    autocmd FileType tex vnoremap <leader>m di$$<esc>P
    " wrap visual selection in \texttt{}
    autocmd FileType tex vnoremap <leader>tt di\texttt{}<esc>P
    " wrap visual selection in latex double quotes
    autocmd FileType tex vnoremap <leader>" di``''<esc>hPlll
    " operate on rest of sentence (until period)
    autocmd FileType tex onoremap s /\.<cr>
augroup END

augroup fileTypePython
    autocmd!
    " comment line
    autocmd FileType python nnoremap <leader>/ I# <esc>
    " uncomment line
    autocmd FileType python nnoremap <leader>u ^xx<esc>
    " comment visual selection
    autocmd FileType python vnoremap <leader>/ :norm I# <cr>
    " uncomment visual selection
    autocmd FileType python vnoremap <leader>u :norm ^xx<cr>
augroup END

augroup fileTypeJava
    autocmd!
    " comment line
    autocmd FileType java nnoremap <leader>/ I// <esc>
    " uncomment line
    autocmd FileType java nnoremap <leader>u ^xxx<esc>
    " comment visual selection
    autocmd FileType java vnoremap <leader>/ :norm I// <cr>
    " uncomment visual selection
    autocmd FileType java vnoremap <leader>u :norm ^xxx<cr>
    " compile code and exit
    autocmd FileType java nnoremap <leader>c :w<cr>:silent exec '!javac %'<cr><c-l>:q<cr>
    " run compiled program
    autocmd FileType java nnoremap <leader>r :w<cr>:silent exec '!java %:r'<cr>:q<cr>
    " compile code and associated unit test
    autocmd FileType java nnoremap <leader>t :w<cr>:silent exec '!javac -cp /Users/rich/java/lib/junit-platform-console-standalone-1.11.4.jar % %:rTest.java %'<cr>:q<cr>
    " statement blocks
    autocmd FileType java :iabbrev <buffer> iff if<space>(<space>)<space>{<left><left><left><left>
    autocmd FileType java :iabbrev <buffer> whilee while<space>(<space>)<space>{<left><left><left><left>
    autocmd FileType java :iabbrev <buffer> forr for<space>(<space>)<space>{<left><left><left><left>
    " set tabstop to 4 spaces for java code
    autocmd FileType java setlocal shiftwidth=4 tabstop=4
    " set text to wrap at 80 characters
    autocmd FileType java setlocal textwidth=80
augroup END

augroup fileTypeMatlab
    autocmd!
    " comment line
    autocmd FileType matlab nnoremap <leader>/ I% <esc>
    " uncomment line
    autocmd FileType matlab nnoremap <leader>u ^xx<esc>
    " comment visual selection
    autocmd FileType matlab vnoremap <leader>/ :norm I% <cr>
    " uncomment visual selection
    autocmd FileType matlab vnoremap <leader>u :norm ^xx<cr>
augroup END

augroup fileTypePlantUML
    autocmd!
    " open a web page with the currently open file
    autocmd FileType plantuml nnoremap <leader>o :w<cr>:PlantumlOpen<cr><c-l>
augroup END

