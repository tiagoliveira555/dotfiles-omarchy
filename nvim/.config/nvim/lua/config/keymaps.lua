local opts = { noremap = true, silent = true }

local lang = require("config.laravel_lang")
lang.setup()

-- local map = vim.keymap.set

-- Keep cursor centered when scrolling
-- vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
-- vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)

-- Move selected line / block of text in visual mode
-- vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts)
-- vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Move Lines
vim.keymap.set("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
vim.keymap.set("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
vim.keymap.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
vim.keymap.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
vim.keymap.set("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
vim.keymap.set("v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })

-- Fast saving
-- vim.keymap.set("n", "<leader>w", ":write!<CR>", { silent = true, desc = "Save file" })
-- vim.keymap.set("n", "<leader>q", ":q!<CR>", opts)

-- Remap for dealing with visual line wraps
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- Move to window using the <ctrl> hjkl keys
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- better indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- paste over currently selected text without yanking it
vim.keymap.set("v", "p", '"_dp')
vim.keymap.set("v", "P", '"_dP')

-- copy everything between { and } including the brackets
-- p puts text after the cursor,
-- P puts text before the cursor.
vim.keymap.set("n", "YY", "va{Vy", opts)

-- Move line on the screen rather than by line in the file
-- vim.keymap.set("n", "j", "gj", opts)
-- vim.keymap.set("n", "k", "gk", opts)

-- Exit on jj and jk
vim.keymap.set("i", "jj", "<ESC>", opts)
vim.keymap.set("i", "jk", "<ESC>", opts)

-- Move to start/end of line
-- vim.keymap.set({ "n", "x", "o" }, "H", "^", opts)
-- vim.keymap.set({ "n", "x", "o" }, "L", "g_", opts)

-- buffers
vim.keymap.set("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
vim.keymap.set("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
vim.keymap.set("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
vim.keymap.set("n", "]b", "<cmd>bnext<cr>", { desc = "Next Buffer" })
vim.keymap.set("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
vim.keymap.set("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
if not vim.g.vscode then
  vim.keymap.set("n", "<leader>bd", function()
    Snacks.bufdelete()
  end, { desc = "Delete Buffer" })
  vim.keymap.set("n", "<leader>bo", function()
    Snacks.bufdelete.other()
  end, { desc = "Delete Other Buffers" })
end
vim.keymap.set("n", "<leader>bD", "<cmd>:bd<cr>", { desc = "Delete Buffer and Window" })

-- Navigate buffers
-- vim.keymap.set("n", "<Right>", ":bnext<CR>", opts)
-- vim.keymap.set("n", "<Left>", ":bprevious<CR>", opts)

-- Panes resizing
vim.keymap.set("n", "+", ":vertical resize +5<CR>")
vim.keymap.set("n", "_", ":vertical resize -5<CR>")
vim.keymap.set("n", "=", ":resize +5<CR>")
vim.keymap.set("n", "-", ":resize -5<CR>")

-- Map enter to ciw in normal mode
-- vim.keymap.set("n", "<CR>", "ciw", opts)  -- Commented out: This overwrites word on Enter - too disruptive
-- vim.keymap.set("n", "<BS>", "ci", opts)   -- Commented out: This changes text on Backspace - too disruptive

-- Search navigation
vim.keymap.set("n", "n", "nzz", opts)
vim.keymap.set("n", "N", "Nzz", opts)
vim.keymap.set("n", "*", "*zz", opts)
vim.keymap.set("n", "#", "#zz", opts)
vim.keymap.set("n", "g*", "g*zz", opts)
vim.keymap.set("n", "g#", "g#zz", opts)

-- map ; to resume last search
-- map("n", ";", "<cmd>Telescope resume<cr>", opts)

-- search current buffer
-- vim.keymap.set("n", "<C-s>", ":Telescope current_buffer_fuzzy_find<CR>", opts)

-- Split line with X
vim.keymap.set("n", "X", ":keeppatterns substitute/\\s*\\%#\\s*/\\r/e <bar> normal! ==^<cr>", { silent = true })

-- ctrl + x to cut full line
vim.keymap.set("n", "<C-x>", "dd", opts)

-- Select all
vim.keymap.set("n", "<C-a>", "ggVG", opts)

-- write file in current directory
-- :w %:h/<new-file-name>
-- vim.keymap.set("n", "<C-n>", ":w %:h/", opts)

-- delete forward
-- w{number}dw
-- delete backward
-- w{number}db

-- vim.keymap.set("n", "<C-P>", ':lua require("config.utils").toggle_go_test()<CR>', opts)

-- Get highlighted line numbers in visual mode
vim.keymap.set("v", "<leader>ln", ':lua require("config.utils").get_highlighted_line_numbers()<CR>', opts)

vim.keymap.set("n", "<Esc>", ":nohlsearch<CR>", opts)

-- Laravel: traduzir / adicionar tradução
vim.keymap.set("n", "gl", function()
  lang.add()
end, { desc = "Laravel: traduções" })
vim.keymap.set("x", "gl", function()
  lang.add_visual()
end, { desc = "Laravel: traduzir seleção" })

-- Lazy passa para <leader>L (o <leader>l minúsculo fica livre para o Laravel)
pcall(vim.keymap.del, "n", "<leader>l") ---------------------------------------------------------------------------
-- Requires
---------------------------------------------------------------------------
local lang = require("config.laravel_lang")
local tools = require("config.laravel_tools")
local goto_ = require("config.laravel_goto")
local routes = require("config.laravel_routes")
local make = require("config.laravel_make")
local livewire = require("config.laravel_livewire")

---------------------------------------------------------------------------
-- Helpers
---------------------------------------------------------------------------
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

---------------------------------------------------------------------------
-- Setup dos módulos Laravel
---------------------------------------------------------------------------
lang.setup()
tools.setup()
goto_.setup()
routes.setup()

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

-- Navegar por linhas visuais (wrap)
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- Busca: mantém o resultado centralizado
map("n", "n", "nzz", opts)
map("n", "N", "Nzz", opts)
map("n", "*", "*zz", opts)
map("n", "#", "#zz", opts)
map("n", "g*", "g*zz", opts)
map("n", "g#", "g#zz", opts)

-- Linhas selecionadas (visual)
map("v", "<leader>ln", ':lua require("config.utils").get_highlighted_line_numbers()<CR>', opts)

---------------------------------------------------------------------------
-- Mover linhas
---------------------------------------------------------------------------
map("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
map("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
map("v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })

---------------------------------------------------------------------------
-- Janelas
---------------------------------------------------------------------------
-- Navegar com <ctrl> hjkl
map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- Redimensionar
map("n", "+", ":vertical resize +5<CR>")
map("n", "_", ":vertical resize -5<CR>")
map("n", "=", ":resize +5<CR>")
map("n", "-", ":resize -5<CR>")

---------------------------------------------------------------------------
-- Buffers
---------------------------------------------------------------------------
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "]b", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", "<leader>bD", "<cmd>:bd<cr>", { desc = "Delete Buffer and Window" })

if not vim.g.vscode then
  map("n", "<leader>bd", function()
    Snacks.bufdelete()
  end, { desc = "Delete Buffer" })
  map("n", "<leader>bo", function()
    Snacks.bufdelete.other()
  end, { desc = "Delete Other Buffers" })
end

---------------------------------------------------------------------------
-- Lazy (movido para <leader>L; <leader>l fica para o Laravel)
---------------------------------------------------------------------------
pcall(vim.keymap.del, "n", "<leader>l")
map("n", "<leader>L", "<cmd>Lazy<cr>", { desc = "Lazy" })

---------------------------------------------------------------------------
-- Laravel: traduções
---------------------------------------------------------------------------
map("n", "gl", function()
  lang.add()
end, { desc = "Laravel: traduções" })
map("x", "gl", function()
  lang.add_visual()
end, { desc = "Laravel: traduzir seleção" })

---------------------------------------------------------------------------
-- Laravel: criar
---------------------------------------------------------------------------
map("n", "<leader>ln", function()
  make.create()
end, { desc = "Criar (job, listener, model...)" })
map("n", "<leader>ll", function()
  livewire.create()
end, { desc = "Novo componente Livewire" })
map("n", "<leader>lA", function()
  make.create("action")
end, { desc = "Nova Action" })
map("n", "<leader>lj", function()
  make.create("job")
end, { desc = "Novo Job" })
map("n", "<leader>lL", function()
  make.create("listener")
end, { desc = "Novo Listener" })

---------------------------------------------------------------------------
-- Laravel: rotas
---------------------------------------------------------------------------
map("n", "<leader>lg", function()
  routes.goto_route("action")
end, { desc = "Ir para a action da rota" })
map("n", "<leader>lp", function()
  routes.pick()
end, { desc = "Lista de rotas" })

---------------------------------------------------------------------------
-- Laravel: pastas
---------------------------------------------------------------------------
map("n", "<leader>lc", function()
  goto_.pick("controllers")
end, { desc = "Controllers" })
map("n", "<leader>lm", function()
  goto_.pick("models")
end, { desc = "Models" })
map("n", "<leader>lv", function()
  goto_.pick("views")
end, { desc = "Views" })
map("n", "<leader>lr", function()
  goto_.pick("routes")
end, { desc = "Arquivos de rotas" })
map("n", "<leader>lw", function()
  goto_.pick("livewire")
end, { desc = "Componentes Livewire" })

---------------------------------------------------------------------------
-- Laravel: artisan, composer, testes
---------------------------------------------------------------------------
map("n", "<leader>la", "<cmd>Artisan<cr>", { desc = "Artisan" })
map("n", "<leader>lC", "<cmd>Composer<cr>", { desc = "Composer" })
map("n", "<leader>lM", tools.migrate, { desc = "Migrations" })
map("n", "<leader>lt", function()
  tools.test()
end, { desc = "Testes (artisan test)" })
map("n", "<leader>lT", tools.tinker, { desc = "Tinker" })

---------------------------------------------------------------------------
-- Laravel: Sail
---------------------------------------------------------------------------
map("n", "<leader>lsu", tools.sail_up, { desc = "Sail up" })
map("n", "<leader>lsd", tools.sail_down, { desc = "Sail down" })
map("n", "<leader>lsr", tools.sail_restart, { desc = "Sail restart" })
map("n", "<leader>lss", tools.sail_status, { desc = "Sail status" })
map("n", "<leader>lsh", tools.sail_shell, { desc = "Sail shell" })
map("n", "<leader>lsl", tools.sail_logs, { desc = "Sail logs" })
map("n", "<leader>lso", tools.open, { desc = "Abrir app no browser" })
