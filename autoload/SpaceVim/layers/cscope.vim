"=============================================================================
" cscope.vim --- SpaceVim cscope layer
" Copyright (c) 2016-2022 Wang Shidong & Contributors
" Author: Wang Shidong < wsdjeg at 163.com >
" URL: https://spacevim.org
" License: GPLv3
"=============================================================================
scriptencoding utf-8

""
" @section cscope, layers-cscope
" @parentsection layers
" `cscope` layer provides |cscope| integration for SpaceVim.
" To load this layer:
" >
"   [[layers]]
"     name = 'cscope'
" <
" @subsection Layer options
"
" The layer option can be used when loading the `cscope` layer, for example:
" >
"   [[layers]]
"     name = 'cscope'
"     auto_update = true
"     open_quickfix = 0
" <
" 1. `auto_update`: Enable or disable automatic updating of the cscope database.
" 2. `cscope_command`: set the command or path of `cscope` executable.
" 3. `open_location`: enable/disable open location list after searching.
" 4. `preload_path`: set the proload paths.

if exists('s:cscope_command')
  finish
endif

let s:cscope_command = 'cscope'
let s:auto_update = 1

function! SpaceVim#layers#cscope#plugins() abort
  let plugins = [
        \ [g:_spacevim_root_dir . 'bundle/cscope.vim', {'merged' : 0}],
        \ ]
  return plugins
endfunction


function! SpaceVim#layers#cscope#config() abort
  let g:_spacevim_mappings_space.m.c = {'name' : '+cscope'}
  call SpaceVim#mapping#space#def('nnoremap', ['m', 'c', 'c'], 'call cscope#find("d", expand("<cword>"))', 'find-functions-called-by-this-function', 1)
  call SpaceVim#mapping#space#def('nnoremap', ['m', 'c', 'C'], 'call cscope#find("c", expand("<cword>"))', 'find-functions-calling-this-function', 1)
  call SpaceVim#mapping#space#def('nnoremap', ['m', 'c', 'd'], 'call cscope#find("g", expand("<cword>"))', 'find-global-definition-of-a-symbol', 1)
  call SpaceVim#mapping#space#def('nnoremap', ['m', 'c', 'r'], 'call cscope#find("s", expand("<cword>"))', 'find-references-of-a-symbol', 1)
  call SpaceVim#mapping#space#def('nnoremap', ['m', 'c', 'f'], 'call cscope#find("f", expand("<cword>"))', 'find-files', 1)
  call SpaceVim#mapping#space#def('nnoremap', ['m', 'c', 'F'], 'call cscope#find("i", expand("<cword>"))', 'find-files-including-this-file', 1)
  call SpaceVim#mapping#space#def('nnoremap', ['m', 'c', 'e'], 'call cscope#find("e", expand("<cword>"))', 'Find-this-egrep-pattern', 1)
  call SpaceVim#mapping#space#def('nnoremap', ['m', 'c', 't'], 'call cscope#find("t", expand("<cword>"))', 'find-this-text-string', 1)
  call SpaceVim#mapping#space#def('nnoremap', ['m', 'c', '='], 'call cscope#find("a", expand("<cword>"))', 'find-assignments-to-this-symbol', 1)
  call SpaceVim#mapping#space#def('nnoremap', ['m', 'c', 'u'], 'call cscope#update_databeses()', 'create-cscope-index', 1)
  call SpaceVim#mapping#space#def('nnoremap', ['m', 'c', 'i'], 'call cscope#create_databeses()', 'create-cscope-databases', 1)
  call SpaceVim#mapping#space#def('nnoremap', ['m', 'c', 'l'], 'call cscope#list_databases()', 'list-cscope-databases', 1)
  call SpaceVim#mapping#space#def('nnoremap', ['m', 'c', 'm'], 'call cscope#clear_databases(SpaceVim#plugins#projectmanager#current_root())', 'remove-current-cscope-databases', 1)
  call SpaceVim#mapping#space#def('nnoremap', ['m', 'c', 'M'], 'call cscope#clear_databases()', 'remove-all-cscope-databases', 1)

  " setting cscope.vim based on layer options
  let g:cscope_cmd = s:cscope_command
  let g:cscope_auto_update = s:auto_update
endfunction


function! SpaceVim#layers#cscope#health() abort
  call SpaceVim#layers#cscope#plugins()
  call SpaceVim#layers#cscope#config()
  return 1
endfunction

function! SpaceVim#layers#cscope#set_variable(var) abort

  let s:cscope_command = get(a:var,
        \ 'cscope_command',
        \ s:cscope_command)
  let s:auto_update = get(a:var,
        \ 'auto_update',
        \ s:auto_update)
  let g:cscope_open_location = get(a:var,
        \ 'open_location',
        \ 1)
  let g:cscope_preload_path = get(a:var,
        \ 'preload_path',
        \ '')

endfunction

function! SpaceVim#layers#cscope#get_options() abort

  return ['cscope_command',
        \ 'auto_update',
        \ 'open_location',
        \ 'preload_path']

endfunction
