return {
  {
    "ricardoramirezr/blade-nav.nvim",
    config = function(_, opts)
      package.loaded["nvim-treesitter.ts_utils"] = require("nvim-treesitter.util")
      require("blade-nav").setup(opts)
    end,
    dependencies = {                -- totally optional
      "saghen/blink.cmp",           -- if using blink.cmp
    },
    ft = { "blade", "php" },        -- optional, improves startup time
    opts = {
      close_tag_on_complete = true,
      integrations = { cmp = false, coq = false }
    },
  },
  { "jwalton512/vim-blade" },
}
