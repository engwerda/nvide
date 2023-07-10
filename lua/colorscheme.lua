vim.cmd([[
try
  colorscheme moonlight
  set background=dark
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme dracula
  set background=dark
endtry
]])
