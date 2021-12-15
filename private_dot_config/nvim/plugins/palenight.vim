Plug 'drewtempelmeyer/palenight.vim'

augroup PalenightOverrides
    autocmd!
    autocmd User PlugLoaded ++nested colorscheme palenight
augroup end

if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if (has("termguicolors"))
  set termguicolors
endif

" Italics for my favorite color scheme
let g:palenight_terminal_italics=1
