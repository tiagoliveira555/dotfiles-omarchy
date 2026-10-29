return {
  {
    "neovim/nvim-lspconfig",
    init = function()
      local method = "workspace/diagnostic/refresh"
      local original_handler = vim.lsp.handlers[method]

      if not original_handler then
        vim.schedule(function()
          vim.notify("Handler de workspace/diagnostic/refresh não encontrado", vim.log.levels.ERROR)
        end)

        return
      end

      vim.lsp.handlers[method] = function(err, result, ctx)
        local response = original_handler(err, result, ctx)

        if err then
          return response
        end

        local client = vim.lsp.get_client_by_id(ctx.client_id)

        if not client or client.name ~= "phpantom_lsp" then
          return response
        end

        for bufnr in pairs(client.attached_buffers or {}) do
          vim.lsp.diagnostic._refresh(bufnr, client.id)
        end

        return response
      end
    end,
  },
}
