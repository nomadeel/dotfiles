" set location for vim plug
call plug#begin('~/.local/share/nvim/plugged')

" Plugins
Plug 'morhetz/gruvbox'
Plug 'arcticicestudio/nord-vim'
Plug 'chriskempson/base16-vim'
Plug 'dylanaraps/wal'
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'majutsushi/tagbar'
"Plug 'ludovicchabant/vim-gutentags'
Plug 'scrooloose/nerdcommenter'

" end vim-plug
call plug#end()

" ===============================================
" NVIM Settings
" ===============================================

"
" Colour
"
syntax enable
" colorscheme gruvbox
" colorscheme wal
colorscheme nord
" colorscheme base16-material
set termguicolors
" let g:gruvbox_contrast_dark=0
" set background=dark
" let $NVIM_TUI_ENABLE_TRUE_COLOR = 1

"
" Misc
"
set autoindent
set number
set relativenumber
set encoding=utf-8

"
" Tabs
"
set tabstop=4
set shiftwidth=4
set expandtab
set laststatus=0

let mapleader = "\<Space>"

"
" Keybinds
"
nmap <F8> :TagbarToggle<CR>
nmap <F9> :NERDTreeToggle<CR>
" open init.vim
nnoremap <leader>v :e ~/.config/nvim/init.vim<CR>
" easymotion rebinds
nmap <leader>s <Plug>(easymotion-s)
nmap <leader>S <Plug>(easymotion-S)
nmap <leader>j <Plug>(easymotion-j)
nmap <leader>k <Plug>(easymotion-k)
" fzf
nmap <leader>f :FZF<CR>
" Grammerous
" nmap <leader>g <Plug>(grammarous-move-to-info-window)
" nmap <leader>o <Plug><Plug>(grammarous-open-info-window)
" nmap <leader>c <Plug>(grammarous-close-info-window)
" nmap <leader>r <Plug>(grammarous-remove-error)
" nmap <leader>n <Plug>(grammarous-move-to-next-error)
" nmap <leader>p <Plug>(grammarous-move-to-previous-error)


" ===============================================
" Plugin Settings
" ===============================================

" 
" deoplete.nvim
"

let g:deoplete#enable_at_startup = 1
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")

"
" Airline
"
" let g:airline#extensions#tabline#enabled = 1
" let g:airline_powerline_fonts = 1

"
" Syntastic
"
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1

"
" EasyMotion
"
let g:EasyMotion_smartcase = 1

"
" FZF (Default Configs)
"
let g:fzf_action = {
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-x': 'split',
    \ 'ctrl-v': 'vsplit' }

let g:fzf_layout = { 'down': '~40%' }

let g:fzf_layout = { 'window': 'enew'}
let g:fzf_layout = { 'window': '-tabnew'}
let g:fzf_layout = { 'window': '10split enew' }

let g:fzf_colors = {
    \ 'fg': ['fg', 'Normal'],
    \ 'bg': ['bg', 'Normal'],
    \ 'hl': ['fg', 'Comment'],
    \ 'fg+': ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
    \ 'bg+': ['bg', 'CursorLine', 'CursorColumn'],
    \ 'hl+': ['fg', 'Statement'],
    \ 'info': ['fg', 'PreProc'],
    \ 'prompt': ['fg', 'Conditional'],
    \ 'pointer': ['fg', 'Exception'],
    \ 'marker': ['fg', 'Keyword'],
    \ 'spinner': ['fg', 'Label'],
    \ 'header': ['fg', 'Comment'] }

" Enable per-command history
let g:fzf_history_dir = '~/.local/share/fzf-history'

"
" NERD Commenter
"
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1
