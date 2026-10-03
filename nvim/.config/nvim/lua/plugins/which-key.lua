return {
  {
    "folke/which-key.nvim",
    opts = function(_, opts)
      opts.spec = {
        { "<leader>L", group = "Laravel", icon = "" },
      }
    end,
  },
}
