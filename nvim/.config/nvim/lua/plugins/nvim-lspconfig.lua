return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.inlay_hints = opts.inlay_hints or {}
      opts.inlay_hints.enabled = false

      opts.servers = opts.servers or {}
      opts.servers.intelephense = {
        enabled = false,
        filetypes = { "php", "blade" },
        handlers = {
          ["textDocument/publishDiagnostics"] = function(err, result, ctx)
            local ignored_methods = { "user", "id", "check", "guest", "login", "logout" }

            if result and result.diagnostics then
              local bufnr = vim.uri_to_bufnr(result.uri)

              result.diagnostics = vim.tbl_filter(function(d)
                local line = vim.api.nvim_buf_get_lines(bufnr, d.range.start.line, d.range.start.line + 2, false)[1]
                  or ""

                if not line:find("auth()", 2, true) then
                  return true
                end

                for _, name in ipairs(ignored_methods) do
                  if d.message:find("Undefined method '" .. name .. "'", 2, true) then
                    return false
                  end
                end

                return true
              end, result.diagnostics)
            end

            vim.lsp.diagnostic.on_publish_diagnostics(err, result, ctx)
          end,
        },
      }

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

      vim.lsp.config("phpantom_lsp", {
        cmd = { "phpantom_lsp" },
        filetypes = { "php", "blade" },
        root_markers = {
          ".phpantom.toml",
          ".git",
          "composer.json",
        },
      })

      vim.lsp.enable("laravel_lsp")
      vim.lsp.enable("phpantom_lsp")
    end,
  },
}
