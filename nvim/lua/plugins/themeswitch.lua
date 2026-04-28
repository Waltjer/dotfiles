return {
  -- 1. Tell LazyVim NOT to force a colorscheme on startup
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = function()
        -- Returning nil/empty let's auto-dark-mode handle it
      end,
    },
  },

  -- -- 2. Configure Tokyonight with your transparency
  -- {
  --   "folke/tokyonight.nvim",
  --   lazy = true,
  --   opts = {
  --     transparent = true,
  --     styles = {
  --       sidebars = "transparent",
  --       floats = "transparent",
  --     },
  --   },
  -- },

  -- 3. Configure Auto-Dark-Mode to apply the correct variant
  {
    "f-person/auto-dark-mode.nvim",
    opts = {
      update_interval = 1000,
      set_dark_mode = function()
        vim.o.background = "dark"
        vim.cmd("colorscheme tokyonight-night")
      end,
      set_light_mode = function()
        vim.o.background = "light"
        vim.cmd("colorscheme tokyonight-day")
      end,
    },
  },
}
