# cscope-in-quickfix
It aims to show cscope results in quickfix window.

# Installation
This plugin follows the standard runtime path structure, and as such it can be installed with a variety of plugin managers:

| Plugin Manager | Install with... |
| ------------- | ------------- |
| [Vundle](https://github.com/VundleVim/Vundle.vim) | `Plugin 'Kadiryanik/cs-in-qf.vim'` |
| manual | copy all of the files into your `~/.vim` directory |

## Configuration
You can use the following mapping to toggle quickfix window.
```viml
nnoremap <silent> <C-q> :ToggleQF<CR>
```
You can use the following mapping for cscope search.
```viml
" find this C symbol
nmap <leader><leader>s :Qcs s<CR>
" find this definition
nmap <leader><leader>g :Qcs g<CR>
" find functions called by this function
nmap <leader><leader>d :Qcs d<CR>
" find functions calling this function
nmap <leader><leader>c :Qcs c<CR>
" find this text string
nmap <leader><leader>t :Qcs t<CR>
" find this egrep pattern
nmap <leader><leader>e :Qcs e<CR>
" find this file
nmap <leader><leader>f :Qcs f<CR>
" find files #including this file
nmap <leader><leader>i :Qcs i<CR>
" find places where this symbol is assigned a value
nmap <leader><leader>a :Qcs a<CR>
```
You can use the following mapping to navigate.
```viml
nnoremap <silent> <C-p> :cprevious<CR>
nnoremap <silent> <C-n> :cnext<CR>
```
Add following line to don't open quickfix window after search.
```viml
let g:cs_qf_force_open=0
```
