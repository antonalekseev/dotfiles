return {
  {
    "joshporter3/nvim-base16",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme base16-default-light")
    end,
    version = "*",
  },
}
