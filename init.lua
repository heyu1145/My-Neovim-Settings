-- 基础设置
-- 必须在插件加载之前设置 leader 键
vim.g.mapleader = ";"
vim.g.maplocalleader = ";"

require("config.options")
-- 插件管理 (lazy.nvim)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
    ui = {
        border = "rounded",
    },
    performance = {
        rtp = {
            disabled_plugins = {
                "gzip",
                "matchit",
                "matchparen",
                "netrwPlugin",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
            },
        },
    },
})
-- 快捷键映射
require("config.keymaps")
-- 外观主题
require("config.ui")
-- coc.nvim 配置
require("config.coc")
-- Termux 特定设置
if vim.fn.has('android') == 1 then
    -- 确保浏览器可用
    vim.g.netrw_browsex_viewer = "termux-open"

    -- 设置 HTML 文件类型特定配置
    vim.api.nvim_create_autocmd('FileType', {
        pattern = 'html',
        callback = function()
            vim.bo.shiftwidth = 4
            vim.bo.tabstop = 4
            vim.bo.softtabstop = 4
            vim.bo.expandtab = true
        end
    })
end
