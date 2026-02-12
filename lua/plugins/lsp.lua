-- LSP 和补全相关插件
return {
    {
        "neoclide/coc.nvim",
        branch = "release",
        build = ":CocInstall",
        config = function()
            -- coc.nvim 配置
            vim.g.coc_global_extensions = {
                'coc-json',
                'coc-tsserver',
                'coc-html',
                'coc-css',
                'coc-pyright',
                'coc-vimlsp',
            }

            -- Tab 键补全
            vim.keymap.set("i", "<TAB>", "coc#pum#visible() ? coc#pum#next(1) : '<TAB>'", { expr = true, noremap = true })
            vim.keymap.set("i", "<S-TAB>", "coc#pum#visible() ? coc#pum#prev(1) : '<C-h>'",
                { expr = true, noremap = true })
            -- -- 回车确认补全
            vim.keymap.set("i", "<cr>",
                [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]],
                { expr = true, noremap = true })
        end,
    },

    {
        "neovim/nvim-lspconfig",
        event = "VeryLazy",
        config = function()
            -- LSP 配置
            local lspconfig = require("lspconfig")
            -- 这里可以添加具体的 LSP 服务器配置
            -- 例如：lspconfig.lua_ls.setup({})
        end,
    },

    {
        "zbirenbaum/copilot.lua",
        event = "VeryLazy",
        config = function()
            require("copilot").setup({
                suggestion = {
                    enabled = true,
                    auto_trigger = true,
                    keymap = {
                        accept = "<C-g>",
                    },
                },
                panel = { enabled = true },
            })
        end,
    },
}
