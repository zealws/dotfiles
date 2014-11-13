syntax on
filetype on

au BufNewFile,BufRead *.go set filetype=go syntax=go

set tabstop=4
set expandtab
set shiftwidth=4
set number
set laststatus=2

map <C-n> :tabn
map <C-p> :tabp
map <C-e> <End>
map <C-a> <Home>

