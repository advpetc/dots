let mapleader =","

call plug#begin('~/.vim/plugged')
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex'}
Plug 'tpope/vim-commentary'
Plug 'scrooloose/nerdtree'
Plug 'bling/vim-airline'
Plug 'Raimondi/delimitMate'
Plug 'advpetc/vim-template'
Plug 'honza/vim-snippets'
Plug 'kien/ctrlp.vim'
Plug 'SirVer/ultisnips'
Plug 'ryanoasis/vim-devicons'
if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'majutsushi/tagbar'
Plug 'junegunn/goyo.vim'
call plug#end()

" support for vim-latex-live-preview
let g:livepreview_previewer = 'evince'

" Some basics:
filetype plugin on
" Load plugins according to detected filetype.
filetype plugin indent on
nnoremap c "_c
set nocompatible
syntax on
set encoding=utf-8
set nu rnu
" Enable autocompletion
set wildmode=longest,list,full

" indentations

" Indent according to previous line.
set autoindent
" Use spaces instead of tabs.
set expandtab
" Tab key indents by 4 spaces.
set softtabstop =4
" >> indents by 4 spaces.
set shiftwidth  =4
" >> indents to next multiple of 'shiftwidth'.
set shiftround
" copy ignore line number
set mouse       =a
set bg=light
set go=a
set mouse=a
set nohlsearch
set clipboard=unnamedplus
" Spell-check set to <leader>o, 'o' for 'orthography':
map <leader>o :setlocal spell! spelllang=en_us<CR>

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
set splitbelow splitright

" Copy selected text to system clipboard (requires gvim/nvim/vim-x11 installed):
vnoremap <C-c> "+y
map <C-p> "+P

" Shortcuts

" Quick Update
noremap <Leader>s :update<CR>
" Jumping to previous copy pasted
nmap <Leader>j :call GotoJump()<CR>
" Quick access previous register
nmap <Leader>r :reg<CR>
" Quick Save
map <Leader>w :w<CR>

" Shortening split navigation, saving a keypress:
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Nerd tree
map <leader>n :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Vim-template
let g:email = "chenhaoy@usc.edu"

" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Devicons
set encoding=UTF-8

" Deoplete
let g:deoplete#enable_at_startup = 1

" Tagbar
nnoremap <silent> <Leader>b :TagbarToggle<CR>

" Goyo
nnoremap <Leader>g :Goyo<CR>

" Utilities

"Always set to current directory
autocmd BufEnter * silent! lcd %:p:h
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" colorscheme
colorscheme elflord

" Functions
function! GotoJump()
    jumps
    let j = input("Please select your jump: ")
    if j != ''
        let pattern = '\v\c^\+'
        if j =~ pattern
            let j = substitute(j, pattern, '', 'g')
            execute "normal " . j . "\<c-i>"
        else
            execute "normal " . j . "\<c-o>"
        endif
    endif
endfunction
