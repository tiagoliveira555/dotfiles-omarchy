return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        intelephense = {
          -- init_options = {
          --   licencekey = os.getenv("intelephense_license_key"),
          -- },
          filetypes = { "php", "blade" },
        },
      },
    },
  },
}
