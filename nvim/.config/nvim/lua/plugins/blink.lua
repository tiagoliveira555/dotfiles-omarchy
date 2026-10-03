return {
  {
    "saghen/blink.cmp",
    opts = {
      snippets = {
        expand = function(snippet, _)
          return LazyVim.cmp.expand(snippet)
        end,
      },

      appearance = {
        use_nvim_cmp_as_default = false,
        nerd_font_variant = "mono",
      },

      completion = {
        accept = {
          auto_brackets = {
            enabled = true,
          },
        },
        menu = {
          draw = {
            treesitter = { "lsp" },
            padding = { 0, 1 },
            components = {
              kind_icon = {
                text = function(ctx)
                  local icon = ctx.kind_icon
                  if ctx.source_name == "Blade-nav" then
                    icon = ""
                  end
                  return " " .. icon .. ctx.icon_gap .. " "
                end,
                highlight = function(ctx)
                  local hl = "BlinkCmpKind" .. ctx.kind
                  if ctx.source_name == "Blade-nav" then
                    hl = "BlinkCmpKindBladeNav"
                  end
                  return hl
                end,
              },
            },
          },
        },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 201,
        },
        ghost_text = {
          enabled = vim.g.ai_cmp,
        },
      },
      sources = {
        compat = {},
        default = { "laravel", "lsp", "path", "snippets", "buffer", "blade-nav" },
        providers = {
          laravel = {
            name = "laravel",
            module = "laravel.blink_source",
          },
          ["blade-nav"] = {
            module = "blade-nav.integrations.blink",
            opts = {
              close_tag_on_complete = true,
            },
          },
        },
      },

      cmdline = {
        enabled = true,
        keymap = { preset = "cmdline" },
        completion = {
          list = { selection = { preselect = false } },
          menu = {
            auto_show = function(ctx)
              return vim.fn.getcmdtype() == ":"
            end,
          },
          ghost_text = { enabled = true },
        },
      },

      keymap = {
        preset = "enter",
        ["<C-y>"] = { "select_and_accept" },
      },
    },
  },
}
