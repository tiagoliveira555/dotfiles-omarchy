return {
  {
    "rebelot/kanagawa.nvim",
    config = function()
      require("kanagawa").setup({ transparent = true })
      -- vim.cmd.colorscheme("kanagawa")
    end,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require("rose-pine").setup({
        variant = "moon",
        styles = { transparency = true },
      })
      -- vim.cmd("colorscheme rose-pine")
    end,
  },
  {
    "sainnhe/gruvbox-material",
    config = function()
      vim.g.gruvbox_material_transparent_background = 1
      vim.g.gruvbox_material_foreground = "mix"
      vim.g.gruvbox_material_background = "hard"
      vim.g.gruvbox_material_ui_contrast = "high"
      vim.g.gruvbox_material_float_style = "bright"
      vim.g.gruvbox_material_statusline_style = "mix"
      vim.g.gruvbox_material_cursor = "auto"
      -- vim.cmd.colorscheme("gruvbox-material")
    end,
  },
  {
    "RRethy/base16-nvim",
    lazy = false,
    priority = 1000,
    init = function()
      vim.api.nvim_create_autocmd("ColorScheme", {
        callback = function()
          vim.api.nvim_set_hl(0, "MyIndent", { fg = "#3b3f4a" })
          vim.api.nvim_set_hl(0, "MyIndentScope", { fg = "#4b5263" })
        end,
      })
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = { colorscheme = "base16-tomorrow-night" },
  },
}
