function! s:LoadLocalSetting()
  let l:path = $HOME."/.vimrc_local"
  if filereadable(expand(l:path))
    execute "source ".l:path
  else
    execute "source".$VIM."/.vimrc_local"
 endif
  unlet l:path
endfunction
call s:LoadLocalSetting()
