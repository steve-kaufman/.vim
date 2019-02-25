set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
"Vundle
Plugin 'VundleVim/Vundle.vim'

Plugin 'christoomey/vim-system-copy'
Plugin 'mattn/emmet-vim'
Plugin 'kana/vim-textobj-user'
Plugin 'kana/vim-textobj-entire'
Plugin 'kana/vim-textobj-indent'
Plugin 'kana/vim-textobj-line'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'vim-scripts/ReplaceWithRegister'

Bundle 'tertelgames/ejs-syntax'

call vundle#end()
"Vundle End

filetype plugin indent on

syntax on
syntax enable

filetype plugin on

set path+=**
set wildignore+=**/node_modules/**
set wildignore+=/usr/include/**

set number
set relativenumber

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" au BufNewFile,BufRead *.ejs set filetype=html

" autocmd BufNewFile,BufRead *.html *.htm *.ejs setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
" autocmd FileType html setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab

set showcmd

" set cursorline
" set cursorcolumn

set wildmenu

set laststatus=2

function! GitBranch()
    return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
    let l:branchname = GitBranch()
    return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

set statusline=
set statusline+=%#Menu#
set statusline+=%{StatuslineGit()}
set statusline+=%#Search#
set statusline+=\ %f
set statusline+=%m
set statusline+=%=
set statusline+=%#PmenuSel#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\ 


set showmatch

set incsearch
" set hlsearch

set foldenable
set foldlevelstart=10
set foldnestmax=10
nnoremap <space> za
set foldmethod=indent

set textwidth=80
set colorcolumn=80
highlight ColorColumn ctermbg=2
" highlight ColorColumn ctermbg=22 guibg=lightgrey


set winwidth=88
set winheight=5
set winminheight=5
set winheight=999

nnoremap j gj
nnoremap k gk

nnoremap <CR> o<esc>

function! ShiftO(count)
    execute "normal! " . a:count . "O\<esc>"
    if a:count > 0
        execute "normal! " . (a:count - 1) . "k"
    endif
    call feedkeys('S')
endfunction

nnoremap O :<C-U>call ShiftO(v:count)<CR>

nnoremap B ^
nnoremap E $

" nnoremap gV `[v`]

let mapleader=","

inoremap jk <esc>

inoremap <leader><CR> <CR><CR><up><esc>

nnoremap <leader>u :GundoToggle<CR>

nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

nnoremap <leader>s :mksession<CR>

nnoremap <leader>a :Ag

let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'


if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
        let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
    else
        let &t_SI = "\<Esc>]50;CursorShape=1\x7"
            let &t_EI = "\<Esc>]50;CursorShape=0\x7"
        endif


set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

let g:user_emmet_settings = {
            \'html': {
            \   'block_elements': 'a',
            \   'inline_elements': ''
            \}
            \}
