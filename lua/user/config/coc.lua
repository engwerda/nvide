local M = {}

local keymap = vim.api.nvim_set_keymap

function M.setup()
  -- Use tab to cycle trough completions and cr to confirm
  keymap("i", "<tab>", "coc#pum#visible() ? coc#pum#next(1) : '<tab>'", { expr = true, noremap = true })
  keymap("i", "<s-tab>", "coc#pum#visible() ? coc#pum#prev(1) : '<s-tab>'", { expr = true, noremap = true })
  keymap("i", "<cr>", "coc#pum#visible() ? coc#pum#confirm() : '<cr>'", { expr = true, noremap = true })


  keymap("i", "<cr>", "coc#pum#visible() ? coc#pum#confirm() : '<cr>'", { expr = true, noremap = true })

  -- Show context action with Alt + ctrl
  keymap("n", "<M-cr>", "<cmd>call CocActionAsync('codeAction', 'cursor')<CR>", { noremap = true, silent = false })
  keymap("n", "K", ":call CocActionAsync('doHover')<CR>", { silent = true, noremap = true })

  -- Use `[g` and `]g` to navigate diagnostics
  -- Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
  keymap("n", "[g", "<Plug>(coc-diagnostic-prev)", { noremap = true, silent = false })
  keymap("n", "]g", "<Plug>(coc-diagnostic-next)", { noremap = true, silent = false })

  -- GoTo code navigation.
  -- keymap("n", "gd", "<Plug>(coc-definition)", { noremap = true, silent = false })
  -- keymap("n", "gy", "<Plug>(coc-type-definition)", { noremap = true, silent = false })
  -- keymap("n", "gi", "<Plug>(coc-implentation)", { noremap = true, silent = false })
  -- keymap("n", "gr", "<Plug>(coc-references)", { noremap = true, silent = false })

  --  Use K to show documentation in preview window.
  keymap("n", "K", "<cmd>:call ShowDocumentation()<cr>", { noremap = true, silent = false })
  vim.cmd([[
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction
]] )

  -- Highlight the symbol and its references when holding the cursor.
  vim.cmd([[
autocmd CursorHold * silent call CocActionAsync('highlight')
]] )

  vim.g.coc_global_extensions = {
    "coc-clangd",
    "coc-css",
    "coc-cssmodules",
    "coc-dictionary",
    "coc-emmet",
    "coc-emoji",
    "coc-eslint",
    "coc-go",
    "coc-html",
    "coc-html-css-support",
    "coc-htmldjango",
    "coc-json",
    "coc-kotlin",
    "coc-markdown-preview-enhanced",
    "coc-markdownlint",
    "coc-neosnippet",
    "coc-pydocstring",
    "coc-pyright",
    "coc-rust-analyzer",
    "coc-snippets",
    "coc-spell-checker",
    "coc-stylua",
    "coc-sumneko-lua",
    "coc-tabnine",
    "coc-toml",
    "coc-tsserver",
    "coc-ultisnips",
    "coc-vetur",
    "coc-webview",
    "coc-yaml",
  }

end

return M
