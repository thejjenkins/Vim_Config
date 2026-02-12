" You can type :help <insert-option-here> for help with anything here
" :help nocompatible
" :help relativenumber
" :help cursorline
set nocompatible
filetype off

set number
set relativenumber

set nobackup "prevents backup files. Example: sdl_tv.c~
set nowritebackup "prevents backup files
set noundofile "prevents persistent undo files. Example: .sdl_tv.c.un~

set expandtab
set shiftwidth=2
set tabstop=2
set smartindent

set hlsearch
syntax on "enable syntax highlighting

" Highlight cursor line and column
set cursorline
set cursorcolumn
set colorcolumn=80
set textwidth=80
set t_Co=256

" next 4 lines turn on autocomplete for command line
" see :help cmdline-autocompletion
set wildmenu
set wildoptions="fuzzy,pum"
autocmd CmdlineChanged [:\/\?] call wildtrigger()
set wildmode=noselect:lastused,full

" next 5 lines turn on autocomplete for insert mode.
" see :help ins-autocomplete
set autocomplete
set complete=.^5,w^5,b^5,u^5
set completeopt=popup
inoremap <silent><expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" the next lines remap Esc to fj in insert and visual mode, respectively
inoremap fj <Esc>
vnoremap fj <Esc>

" the next 8 lines set the cursor type.
" see :help termcap-cursor-shape for more info
if &term =~ 'xterm' || &term == 'win32'
	" Use DECSCUSR escape sequences
	let &t_SI = "\e[1 q"    " blink block
	let &t_SR = "\e[1 q"    " blink block
	let &t_EI = "\e[1 q"    " blink block
	let &t_ti ..= "\e[1 q"  " blink block
	let &t_te ..= "\e[0 q"  " default (depends on terminal, normally blink block)
endif

" the next 10 lines are about CoC NVIM
" see github.com/neoclide/coc.nvim
call plug#begin('~\vimfiles\plugged')
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'ghifarit53/tokyonight-vim'
  Plug 'itchyny/lightline.vim'
call plug#end()
" Go-to code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Hover documentation
nnoremap <silent> K :call CocActionAsync('doHover')<CR>

set termguicolors
let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1
colorscheme tokyonight
set laststatus=2 " needed for the lightline plugin
let g:lightline = {'colorscheme': 'wombat'}
