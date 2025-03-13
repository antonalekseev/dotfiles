return {
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end,
  },
  {
    "numToStr/Comment.nvim",
    opts = {
      -- add any options here
    },
  },
  { "justinmk/vim-sneak" },
  -- See also https://github.com/stevearc/conform.nvim/blob/master/doc/recipes.md#lazy-loading-with-lazynvim
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      {
        "<leader>cf",
        function()
          require("conform").format({ async = true })
        end,
        mode = "",
        desc = "Format buffer",
      },
    },
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "isort", "black" },
        go = { "gofmt" },
        sh = { "shfmt" },
      },
    },
  },
  {
    "smoka7/hop.nvim",
    version = "*",
    config = function()
      require("hop").setup()
      vim.keymap.set(
        { "n", "o" },
        "gsj",
        "<cmd>HopLineAC<CR>",
        { noremap = true }
      )
      vim.keymap.set(
        { "n", "o" },
        "gsk",
        "<cmd>HopLineBC<CR>",
        { noremap = true }
      )
    end,
    opts = {
      keys = "etovxqpdygfblzhckisuran",
    },
  },
}
