-- coc.nvim 配置
-- 扩展列表已在 lazy.nvim 的 lsp.lua 中配置

-- Tab 键补全
vim.keymap.set("i", "<TAB>", "coc#pum#visible() ? coc#pum#next(1) : '<TAB>'", { expr = true, noremap = true })
vim.keymap.set("i", "<S-TAB>", "coc#pum#visible() ? coc#pum#prev(1) : '<C-h>'", { expr = true, noremap = true })

-- 回车确认补全
vim.keymap.set("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], { expr = true, noremap = true })

-- 快捷键映射
vim.keymap.set("n", "gd", "<Plug>(coc-definition)", { silent = true })
vim.keymap.set("n", "gy", "<Plug>(coc-type-definition)", { silent = true })
vim.keymap.set("n", "gi", "<Plug>(coc-implementation)", { silent = true })
vim.keymap.set("n", "gr", "<Plug>(coc-references)", { silent = true })

-- 代码操作
vim.keymap.set("n", "<leader>ac", "<Plug>(coc-codeaction)", { silent = true })
vim.keymap.set("n", "<leader>rn", "<Plug>(coc-rename)", { silent = true })

-- 格式化代码
vim.keymap.set("n", "<leader>f", ":call CocAction('format')<CR>", { silent = true, desc = "Format code" })

-- 文档悬浮
function _G.show_documentation()
  if vim.fn.index({'vim','help'}, vim.bo.filetype) >= 0 then
    vim.cmd('h '..vim.fn.expand('<cword>'))
  elseif vim.fn.CocAction('hasProvider', 'hover') then
    vim.fn.CocActionAsync('doHover')
  else
    vim.cmd('!' .. vim.o.keywordprg .. ' ' .. vim.fn.expand('<cword>'))
  end
end

vim.keymap.set("n", "K", '<CMD>lua show_documentation()<CR>', { silent = true })

-- 诊断导航
vim.keymap.set("n", "[d", "<Plug>(coc-diagnostic-prev)", { silent = true })
vim.keymap.set("n", "]d", "<Plug>(coc-diagnostic-next)", { silent = true })
