let $PYTHONPATH='/usr/lib/python3.4/site-packages'

execute pathogen#infect()

syntax on
filetype plugin indent on

" for https://github.com/fatih/vim-go
au FileType go nmap <leader>f :GoFmt
au FileType go nmap <leader>b <Plug>(go-test)
au FileType go nmap <leader>r <Plug>(go-run)

set tabstop=4
set expandtab
set shiftwidth=4
set number
set laststatus=2

map <C-n> :tabn
map <C-p> :tabp
map <C-e> <End>
map <C-a> <Home>

