return {
  {
    "miikanissi/modus-themes.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme modus_operandi")
    end,
    version = "*",
  },
}
