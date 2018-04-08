call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'airblade/vim-gitgutter'

Plug 'itchyny/lightline.vim'

Plug 'sheerun/vim-polyglot'

Plug 'junegunn/goyo.vim'

Plug 'insanum/votl'

call plug#end()


"colors

"for true color support, enable termguicolors:
"set termguicolors

let g:onedark_termcolors=16
syntax on
colorscheme onedark

let g:lightline = {'colorscheme': 'onedark'}

"statusline replaces the need for this
set noshowmode
:set cursorline


" FZF (replaces Ctrl-P, FuzzyFinder and Command-T)
set rtp+=/usr/local/opt/fzf
set rtp+=~/.fzf

"TODO: check if i need ack.vim?


let g:ackprg = 'rg --vimgrep'
set grepprg=rg\ --vimgrep

" see https://medium.com/@crashybang/supercharge-vim-with-fzf-and-ripgrep-d4661fc853d2
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

" fugitive
autocmd QuickFixCmdPost *grep* cwindow


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"key bindings

:let mapleader = "\<Space>"

nmap ; :Buffers<CR>
nmap <Leader>r :Tags<CR>
nmap <Leader>t :Files<CR>
nmap <Leader>a :Ack<CR>
nmap <Leader>f :Find 


nmap <Leader>c    :Ack! "\b<cword>\b" <CR>
"nmap <Esc>k   :Ack! "\b<cword>\b" <CR>
"nmap <M-S-k>  :Ggrep! "\b<cword>\b" <CR>
"nmap <Esc>K   :Ggrep! "\b<cword>\b" <CR>

nnoremap tj  :tabfirst<CR>
nnoremap tk  :tabnext<CR>
nnoremap tl  :tabprev<CR>
nnoremap t;  :tablast<CR>
nnoremap tw  :tabclose<CR>
