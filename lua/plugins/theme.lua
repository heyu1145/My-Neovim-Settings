-- 主题类插件
return {
  {
    "navarasu/onedark.nvim",
    priority = 1000, -- 高优先级，确保最先加载
    lazy = false,    -- 立即加载主题
    config = function()
      require("onedark").setup({
        style = "dark",
        transparent = false,
      })
      vim.cmd("colorscheme onedark")
    end,
  },
}