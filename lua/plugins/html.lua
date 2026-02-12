-- HTML 和网页开发插件
return {
  {
    "previm/previm",
    ft = { "markdown", "html", "css", "asciidoc", "textile" },
    config = function()
      vim.g.previm_open_cmd = 'firefox'
      vim.g.previm_enable_realtime = 1
      vim.g.previm_filetypes = {
        'markdown',
        'asciidoc',
        'textile',
        'html',
        'css'
      }
    end,
  },

  {
    "mattn/emmet-vim",
    ft = { "html", "css", "javascriptreact", "typescriptreact" },
    config = function()
      vim.g.user_emmet_install_global = 0
      vim.g.user_emmet_mode = 'a'
      vim.g.user_emmet_leader_key = '<C-e>'
      vim.cmd([[autocmd FileType html,css,javascriptreact,typescriptreact EmmetInstall]])
    end,
  },

  {
    "othree/html5.vim",
    ft = { "html" },
    config = function()
      vim.g.html5_event_handler_attributes_complete = 1
      vim.g.html5_rdfa_attributes_complete = 1
      vim.g.html5_microdata_attributes_complete = 1
      vim.g.html5_aria_attributes_complete = 1
    end,
  },

  {
    "alvan/vim-closetag",
    ft = { "html", "xhtml", "phtml", "jsx", "tsx" },
    config = function()
      vim.g.closetag_filetypes = 'html,xhtml,phtml,jsx,tsx'
      vim.g.closetag_emptyTags_caseSensitive = 1
      vim.g.closetag_shortcut = '>'
    end,
  },

  {
    "ap/vim-css-color",
    ft = { "css", "scss", "less", "sass", "stylus" },
    config = function()
      vim.g.cssColorVimDoNotMessMyUpdatetime = 1
    end,
  },

  {
    "turbio/bracey.vim",
    ft = { "html", "css", "javascript" },
    build = 'npm install --prefix server',
    config = function()
      vim.g.bracey_browser_command = 'firefox'
      vim.g.bracey_server_port = 3000
    end,
  },
}
