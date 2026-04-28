return {
  "obsidian-nvim/obsidian.nvim",
  version = "*", -- use latest release, remove to use latest commit
  ---@module 'obsidian'
  ---@type obsidian.config

  opts = {
    legacy_commands = false, -- this will be removed in the next major release
    workspaces = {
      {
        name = "personal",
        path = "~/vault/Personal",
      },
      {
        name = "work",
        path = "~/vault/Work",
      },
    },
    templates = {
      folder = "/Templates",
    },
    daily_notes = {
      enabled = true,
      folder = "/Dailies/Daily Journal",
      template = "~/vault/Templates/daily-note.md",
      default_tags = { "daily" },
    },
  },

  keys = {
    { "<leader>ow", "<cmd>Obsidian workspace<cr>", desc = "Peek Workspace" },
    { "<leader>ou", "<cmd>Obsidian unique_note<cr>", desc = "New Obsidian Unique Note" },
    { "<leader>od", "<cmd>Obsidian today<cr>", desc = "Today's Daily Note" },
    { "<leader>oh", "<cmd>Obsidian helpgrep<cr>", desc = "Grep help" },
    { "<leader>os", "<cmd>Obsidian quick_switch<cr>", desc = "Search Notes (Obsidian dir)" },
    { "<leader>on", "<cmd>Obsidian new<cr>", desc = "New Obsidian Note" },
    { "<leader>oo", "<cmd>Obsidian open<cr>", desc = "Open in Obsidian App" },
    { "<leader>os", "<cmd>Obsidian search<cr>", desc = "Grep (Obsidian dir)" },
    { "<leader>oD", "<cmd>Obsidian dailies<cr>", desc = "Search Daily Notes" },
    { "<leader>oy", "<cmd>Obsidian yesterday<cr>", desc = "Yesterday's Daily Note" },
    { "<leader>ob", "<cmd>Obsidian tomorrow<cr>", desc = "Tomorrow's Daily Note" },
    { "<leader>oN", "<cmd>Obsidian new_from_template<cr>", desc = "New Obsidian Note From Template" },
    { "<leader>oH", "<cmd>Obsidian help<cr>", desc = "Search Help Files" },
    { "<leader>ot", "<cmd>Obsidian tags<cr>", desc = "Search Notes By Tags" },
    { "<leader>oc", "<cmd>Obsidian check<cr>", desc = "Check Notes Status" },
  },
}
