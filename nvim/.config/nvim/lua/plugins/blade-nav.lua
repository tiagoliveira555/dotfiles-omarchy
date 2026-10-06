return {
  {
    "ricardoramirezr/blade-nav.nvim",
    cond = not vim.g.vscode,
    ft = { "blade", "php" },
    opts = {
      close_tag_on_complete = true,
      integrations = { cmp = false, coq = false },
      annotations = {
        create_keymaps = true,
      },
    },
  },
  { "jwalton512/vim-blade" },
}
