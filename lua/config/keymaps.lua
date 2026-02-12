local keymap = vim.keymap.set


-- 保存退出
keymap("n", "<leader>w", "<cmd>w<CR>", { desc = "Save file" })
keymap("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit" })

-- 文件树
keymap("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file tree" })

-- 标签页
keymap("n", "<C-Tab>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Previous buffer" })
keymap("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" })
keymap("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Delete buffer" })

-- 窗口管理
keymap("n", "<leader>sv", "<C-w>v", { desc = "Split vertically" })
keymap("n", "<leader>sh", "<C-w>s", { desc = "Split horizontally" })
keymap("n", "<leader>se", "<C-w>=", { desc = "Make splits equal" })
keymap("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close split" })

-- 终端
keymap("n", "<leader>tt", "<cmd>ToggleTerm<CR>", { desc = "Toggle terminal" })

-- 望远镜查找
keymap("n", "<leader>ff", function() require("telescope.builtin").find_files() end, { desc = "Find files" })
keymap("n", "<leader>fg", function() require("telescope.builtin").live_grep() end, { desc = "Live grep" })
keymap("n", "<leader>fb", function() require("telescope.builtin").buffers() end, { desc = "Find buffers" })
keymap("n", "<leader>fh", function() require("telescope.builtin").help_tags() end, { desc = "Help tags" })

-- coc.nvim 相关快捷键
keymap("n", "<leader>cd", "<cmd>CocList diagnostics<CR>", { desc = "Coc diagnostics" })
keymap("n", "<leader>ce", "<cmd>CocList extensions<CR>", { desc = "Coc extensions" })
keymap("n", "<leader>cc", "<cmd>CocConfig<CR>", { desc = "Coc config" })

-- 其他实用快捷键
keymap("n", "<Esc>", "<cmd>nohlsearch<CR>") -- 清除搜索高亮
keymap("n", "<C-s>", "<cmd>w<CR>")          -- Ctrl+s 保存
keymap("i", "<C-s>", "<Esc><cmd>w<CR>")     -- 插入模式保存

-- HTML 和网页开发快捷键
keymap('n', '<leader>hp', '<cmd>PrevimOpen<CR>', { desc = 'HTML Preview' })
keymap('n', '<leader>hr', '<cmd>PrevimRefresh<CR>', { desc = 'Refresh Preview' })

-- Emmet 快捷键
keymap('i', '<C-e>,', '<C-y>,', { desc = 'Emmet expand' }) -- 在插入模式使用 Ctrl+e, 触发

-- 浏览器重载 (如果使用 bracey)
keymap('n', '<leader>bs', '<cmd>Bracey<CR>', { desc = 'Start Bracey Server' })
keymap('n', '<leader>br', '<cmd>BraceyReload<CR>', { desc = 'Bracey Reload' })
keymap('n', '<leader>bS', '<cmd>BraceyStop<CR>', { desc = 'Stop Bracey Server' })
