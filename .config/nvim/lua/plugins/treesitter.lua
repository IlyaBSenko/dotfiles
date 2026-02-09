return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("nvim-treesitter.configs").setup({
        highlight = { enable = true },
        indent = { enable = true },
        ensure_installed = {
          "lua",
          "vim",
          "vimdoc",
          "python",
          "javascript",
          "typescript",
          "html",
          "css",
          "c",
          "json",
          "bash",
          "ruby",
          "haskell",
          "rust",
          "latex",
          "markdown",
          "assembly"
        },
        auto_install = true,
      })
    end,
  },
}
