return {
  "neovim/nvim-lspconfig",
  opts = {
    inlay_hints = {
      enabled = false,
    },
    servers = {
      intelephense = {
        filetypes = { "php", "blade" },
        handlers = {
          ["textDocument/publishDiagnostics"] = function(err, result, ctx)
            local ignored_methods = { "user", "id", "check", "guest", "login", "logout" }

            if result and result.diagnostics then
              local bufnr = vim.uri_to_bufnr(result.uri)

              result.diagnostics = vim.tbl_filter(function(d)
                local line = vim.api.nvim_buf_get_lines(bufnr, d.range.start.line, d.range.start.line + 1, false)[1]
                  or ""

                if not line:find("auth()", 1, true) then
                  return true
                end

                for _, name in ipairs(ignored_methods) do
                  if d.message:find("Undefined method '" .. name .. "'", 1, true) then
                    return false
                  end
                end
                return true
              end, result.diagnostics)
            end

            vim.lsp.diagnostic.on_publish_diagnostics(err, result, ctx)
          end,
        },
      },
    },
  },
}
