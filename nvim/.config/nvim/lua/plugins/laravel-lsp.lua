return {
  {
    "neovim/nvim-lspconfig",
    opts = function()
      vim.lsp.config("laravel_lsp", {
        cmd = {
          vim.fn.expand("~/.config/composer/vendor/bin/laravel-lsp"),
        },
        filetypes = { "php", "blade" },

        root_dir = function(bufnr, on_dir)
          local root = vim.fs.root(bufnr, "artisan")

          if root then
            on_dir(root)
          end
        end,
        init_options = {
          appBindingDiagnostics = false,
          assetDiagnostics = false,
          authDiagnostics = false,
          configDiagnostics = false,
          controllerActionDiagnostics = false,
          envDiagnostics = false,
          inertiaDiagnostics = false,
          middlewareDiagnostics = false,
          mixDiagnostics = false,
          routeDiagnostics = false,
          storageDiagnostics = false,
          translationDiagnostics = false,
          viewDiagnostics = false,
        },
      })

      vim.lsp.enable("laravel_lsp")
    end,
  },
}
