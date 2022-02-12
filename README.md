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
You can use the following mapping to navigate.
```viml
nnoremap <silent> <C-p> :cprevious<CR>
nnoremap <silent> <C-n> :cnext<CR>
```
Add following line to don't open quickfix window after search.
```viml
let g:cs_qf_force_open=0
```
