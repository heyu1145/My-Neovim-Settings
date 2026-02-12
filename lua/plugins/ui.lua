-- UI 相关插件
return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "kyazdani42/nvim-web-devicons" },
    event = "VeryLazy",
    config = function()
      require("lualine").setup({
        options = {
          theme = "onedark",
        },
      })
    end,
  },

  {
    "akinsho/bufferline.nvim",
    dependencies = { "kyazdani42/nvim-web-devicons" },
    event = "VeryLazy",
    config = function()
      require("bufferline").setup({
        options = {
          mode = "tabs",
          separator_style = "slant",
        },
      })
    end,
  },

  {
    "kyazdani42/nvim-web-devicons",
    lazy = true, -- 作为依赖懒加载
  },

  {
    "kyazdani42/nvim-tree.lua",
    dependencies = { "kyazdani42/nvim-web-devicons" },
    keys = {
      { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Toggle file tree" },
    },
    config = function()
      require("nvim-tree").setup()
    end,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("ibl").setup({
        indent = {
          char = "▏",
        },
        scope = {
          enabled = true,
          show_start = true,
        },
      })
    end,
  },

  {
    "norcalli/nvim-colorizer.lua",
    ft = { "css", "scss", "less", "html", "javascript", "typescript" },
    config = function()
      require("colorizer").setup()
    end,
  },
}
