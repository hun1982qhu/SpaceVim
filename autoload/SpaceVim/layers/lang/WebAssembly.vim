"=============================================================================
" WebAssembly.vim --- WebAssembly support for SpaceVim
" Copyright (c) 2016-2022 Wang Shidong & Contributors
" Author: Wang Shidong < wsdjeg at 163.com >
" URL: https://spacevim.org
" License: GPLv3
"=============================================================================


function! SpaceVim#layers#lang#WebAssembly#plugins() abort
  let plugins = []
  call add(plugins, ['rhysd/vim-wasm', {'merged' : 0}])
  return plugins
endfunction

function! SpaceVim#layers#lang#WebAssembly#health() abort
  call SpaceVim#layers#lang#WebAssembly#plugins()
  return 1
endfunction
