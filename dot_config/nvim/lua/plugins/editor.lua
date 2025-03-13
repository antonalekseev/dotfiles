return {
  {
    "kylechui/nvim-surround",
    version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
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
  {
    "justinmk/vim-sneak",
    keys = {
      { "gs", "<Plug>Sneak_s", desc = "Sneak forwards" },
      { "gS", "<Plug>Sneak_S", desc = "Sneak backwards" },
    },
  },
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
    keys = {
      { "gsj", "<cmd>HopLineAC<CR>", mode = { "n", "o" } },
      { "gsk", "<cmd>HopLineBC<CR>", mode = { "n", "o" } },
      { "gs/", "<cmd>HopPattern<CR>", mode = { "n", "o" } },
    },
    opts = {
      keys = "etovxqpdygfblzhckisuran",
    },
  },
}
