local map = vim.keymap.set
local opts = { noremap = true, silent = true }

---------------------------------------------------------------------------
-- Geral
---------------------------------------------------------------------------
-- Sair do insert com jj / jk
map("i", "jj", "<ESC>", opts)
map("i", "jk", "<ESC>", opts)

-- Limpar highlight da busca
map("n", "<Esc>", ":nohlsearch<CR>", opts)

-- Selecionar tudo
map("n", "<C-a>", "ggVG", opts)

-- Recortar a linha inteira
map("n", "<C-x>", "dd", opts)

-- Quebrar a linha no cursor
map("n", "X", ":keeppatterns substitute/\\s*\\%#\\s*/\\r/e <bar> normal! ==^<cr>", { silent = true })

-- Copiar tudo entre { e } (incluindo as chaves)
map("n", "YY", "va{Vy", opts)

-- Colar sobre a seleção sem copiar o texto substituído
map("v", "p", '"_dp')
map("v", "P", '"_dP')

-- Indentação sem perder a seleção
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Linhas selecionadas (visual)
map("v", "<leader>ln", ':lua require("config.utils").get_highlighted_line_numbers()<CR>', opts)
