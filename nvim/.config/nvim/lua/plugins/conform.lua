return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>cf",
      function()
        require("conform").format({ async = true }, function(err, did_edit)
          if not err and did_edit then
            vim.notify("Code formatted", vim.log.levels.INFO, { title = "Conform" })
          end
        end)
      end,
      mode = { "n", "v" },
      desc = "Format buffer",
    },
  },
  opts = {
    formatters_by_ft = {
      -- Lua
      lua = { "stylua" },

      -- Web technologies
      javascript = { "prettier" },
      typescript = { "prettier" },
      javascriptreact = { "prettier" },
      typescriptreact = { "prettier" },
      json = { "prettier" },
      jsonc = { "prettier" },
      yaml = { "prettier" },
      markdown = { "prettier" },
      html = { "prettier" },
      css = { "prettier" },
      scss = { "prettier" },

      -- PHP/Laravel
      php = { "pint" },
      blade = { "blade-formatter" },

      -- Shell
      sh = { "shfmt" },
      bash = { "shfmt" },
    },
    default_format_opts = {
      lsp_format = "fallback",
    },
  },

  init = function()
    local function register_conform()
      LazyVim.format.register({
        name = "conform.nvim",
        priority = 100,
        primary = true,
        format = function(buf)
          require("conform").format({ bufnr = buf })
        end,
        sources = function(buf)
          local formatters = require("conform").list_formatters(buf)

          return vim.tbl_map(function(formatter)
            return formatter.name
          end, formatters)
        end,
      })
    end

    if vim.v.vim_did_enter == 1 then
      register_conform()
    else
      LazyVim.on_very_lazy(register_conform)
    end

    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
}
