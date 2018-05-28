syntax on
set shiftwidth=4
set smarttab
set smartindent
set expandtab
set hls
set nu
set rnu
set nowrap
set ruler
set colorcolumn=80
set bg=light
colorscheme default
"set autochdir
set gfn=Monaco:h12
highlight ColorColumn ctermbg=lightgrey guibg=lightgrey
set cursorline
set noswapfile
set backupdir=/tmp/vimtmp,.
set directory=/tmp/vimtmp,.
set ttymouse=xterm2
set mouse=a
set shortmess=a
set cmdheight=2
set clipboard=unnamed
set listchars=tab:>\ 
set backspace=indent,eol,start

"commands
function! EnvReload(text)
    let path = a:text
    execute 'cd ~/projects/' . path
    :windo e
endfunction

command! -nargs=* DS call EnvReload('d-chess/backend')
command! -nargs=* DF call EnvReload('d-chess/frontend')

"command session
function! SaveSession(text)
    let path = a:text
    execute 'mksession! ~/.vim/sessions/' . path
endfunction

command! -nargs=* SessionD call SaveSession('board')

"plugins
execute pathogen#infect()

"NERDtree
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"let g:NERDTreeDirArrowExpandable = '▸'
"let g:NERDTreeDirArrowCollapsible = '▾'
"map <C-n> :NERDTreeToggle<CR>

"fzf
set rtp+=/usr/local/opt/fzf
map ƒ :FZF<CR>
let $FZF_DEFAULT_COMMAND = 'ag -l -g ""'

"This is the default extra key bindings
let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-x': 'split',
      \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
" - window (nvim only)
let g:fzf_layout = { 'down': '~40%' }

" For Commits and BCommits to customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" Advanced customization using autoload functions
autocmd VimEnter * command! Colors
    \ call fzf#vim#colors({'left': '15%', 'options': '--reverse --margin 30%,0'})

" File types settings
au FileType make set tabstop=8 shiftwidth=8 noexpandtab
au FileType javascript set tabstop=2 shiftwidth=2 expandtab
au FileType python set tabstop=4 shiftwidth=4 expandtab
au FileType yaml set tabstop=2 shiftwidth=2 expandtab

" Fullscreen mode
nnoremap <C-z> :vertical resize 190<CR>:resize 50<CR>
nnoremap <C-x> :vertical resize 250<CR>:resize 57<CR>

" Hide toolbars
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
