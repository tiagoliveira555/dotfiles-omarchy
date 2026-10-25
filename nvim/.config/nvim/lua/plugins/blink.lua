local function is_blade_nav(ctx)
  return (ctx.source_name or ""):lower() == "blade-nav"
end

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
                  if is_blade_nav(ctx) then
                    icon = ""
                  end
                  return " " .. icon .. ctx.icon_gap .. " "
                end,
                highlight = function(ctx)
                  if is_blade_nav(ctx) then
                    return "BlinkCmpKindBladeNav"
                  end
                  return "BlinkCmpKind" .. ctx.kind
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
        default = { "lsp", "blade-nav", "path", "snippets", "buffer" },
        providers = {
          ["blade-nav"] = {
            name = "blade-nav",
            module = "blade-nav.integrations.blink",
          },
        },
      },

      cmdline = {
        enabled = true,
        keymap = { preset = "cmdline" },
        completion = {
          list = { selection = { preselect = false } },
          menu = {
            auto_show = function()
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
