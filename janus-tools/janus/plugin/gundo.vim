if !janus#is_plugin_disabled("gundo")
  " Toggle Gundo
  nmap <F5> :GundoToggle<CR>
  imap <F5> <ESC>:GundoToggle<CR>
endif
