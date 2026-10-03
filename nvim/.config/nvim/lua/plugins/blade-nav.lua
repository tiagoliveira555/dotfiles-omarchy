return {
  {
    "ricardoramirezr/blade-nav.nvim",
    config = function()
      package.loaded["nvim-treesitter.ts_utils"] = require("nvim-treesitter.util")
      require("blade-nav").setup()
    end,
    dependencies = {                -- totally optional
      "saghen/blink.cmp",           -- if using blink.cmp
    },
    ft = { "blade", "php" },        -- optional, improves startup time
    opts = {
      close_tag_on_complete = true, -- default: true
    },
  },
  { "jwalton512/vim-blade" },
}
