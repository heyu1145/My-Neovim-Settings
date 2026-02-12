-- 实用工具插件
return {
    {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup()
        end,
    },

    {
        "akinsho/toggleterm.nvim",
        keys = {
            { "<leader>t", "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },
        },
        config = function()
            require("toggleterm").setup()
        end,
    },

    {
        "freitass/todo.txt-vim",
        ft = { "todo", "todo.txt" },
    },

    {
        "mg979/vim-visual-multi",
        keys = {
            { "<C-n>", mode = { "n", "v" }, desc = "Start multi-cursor" },
        },
    },

    {
        "nvim-lua/plenary.nvim",
        lazy = true, -- 作为 telescope 的依赖
    },

    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        keys = {
            { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
            { "<leader>fg", "<cmd>Telescope live_grep<cr>",  desc = "Live grep" },
            { "<leader>fb", "<cmd>Telescope buffers<cr>",    desc = "Find buffers" },
            { "<leader>fh", "<cmd>Telescope help_tags<cr>",  desc = "Help tags" },
        },
        lazy = false,
        config = function()
            require("telescope").setup({
                defaults = {
                    mappings = {
                        i = {
                            ["<C-j>"] = "move_selection_next",
                            ["<C-k>"] = "move_selection_previous",
                        },
                    },
                    layout_strategy = "vertical",
                    layout_config = {
                        vertical = {
                            width = 0.9,
                            height = 0.9,
                            preview_height = 0.5,
                        },
                    },
                },
                pickers = {
                    find_files = {
                        theme = "dropdown",
                    },
                    live_grep = {
                        theme = "dropdown",
                    },
                    buffers = {
                        theme = "dropdown",
                        sort_lastused = true,
                    },
                },
                extensions = {
                    -- 可以在这里添加扩展配置
                },
            })
        end,
    },
    {
        'goolord/alpha-nvim',
        config = function()
            require('alpha').setup(require('alpha.themes.dashboard').config)
        end
    },
}
