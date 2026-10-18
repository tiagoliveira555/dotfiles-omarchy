return {
  "folke/snacks.nvim",
  opts = {
    scroll = { enabled = true },
    indent = {
      indent = { hl = "MyIndent" },
      scope = {
        enabled = true,
        hl = "MyIndentScope",
        underline = false,
      },
    },
    image = {
      enabled = true,
      doc = {
        enabled = true,
        inline = false,
        float = true,
        max_width = 60,
        max_height = 30,
      },
      formats = { "png", "jpg", "jpeg", "gif", "bmp", "webp", "tiff", "heic", "avif", "mp4", "mov", "avi", "mkv", "webm", "pdf" },
    },
    styles = {
      snacks_image = {
        relative = "editor",
        col = -1,
      },
    },
  },
}
