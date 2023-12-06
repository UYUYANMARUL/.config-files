local cmp = require("cmp")

local plugins = {
  { "christoomey/vim-tmux-navigator" },

  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = "neovim/nvim-lspconfig",
    opts = function()
      return require("plugins.lsp.rust-tools-opts")
    end,
    config = function()
      require("rust-tools").setup()
    end,
  },
  {
    "mfussenegger/nvim-dap",
    init = function() end,
  },
  {
    "saecki/crates.nvim",
    ft = { "toml" },
    config = function(_, opts)
      local crates = require("crates")
      crates.setup(opts)
      require("cmp").setup.buffer({
        sources = { { name = "crates" } },
      })
      crates.show()
    end,
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    lazy = false,
    config = function(_, opts)
      require("nvim-dap-virtual-text").setup()
    end,
  },
  -- {
  --   "hrsh7th/nvim-cmp",
  --   opts = function()
  --     local M = require("plugins.configs.cmp")
  --     M.completion.completeopt = "menu,menuone,noselect"
  --     M.mapping["<CR>"] = cmp.mapping.confirm({
  --       behavior = cmp.ConfirmBehavior.Insert,
  --       select = false,
  --     })
  --     table.insert(M.sources, { name = "crates" })
  --     return M
  --   end,
  -- },
}

return plugins
