Plug 'vim-pandoc/vim-pandoc-syntax'
augroup pandoc_syntax
  autocmd! FileType vimwiki set syntax=markdown.pandoc
augroup END
