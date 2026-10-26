---------------------------------------------------------------------------
-- Requires
---------------------------------------------------------------------------
-- local lang = require("config.laravel_lang")
-- local tools = require("config.laravel_tools")
-- local goto_ = require("config.laravel_goto")
-- local routes = require("config.laravel_routes")
-- local make = require("config.laravel_make")
-- local livewire = require("config.laravel_livewire")

---------------------------------------------------------------------------
-- Helpers
---------------------------------------------------------------------------
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

---------------------------------------------------------------------------
-- Setup dos módulos Laravel
---------------------------------------------------------------------------
-- lang.setup()
-- tools.setup()
-- goto_.setup()
-- routes.setup()

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
-- pcall(vim.keymap.del, "n", "<leader>l")
-- map("n", "<leader>L", "<cmd>Lazy<cr>", { desc = "Lazy" })

------------------------------------------------------------------------------
----- Laravel: traduções
------------------------------------------------------------------------------
---map("n", "gl", function()
---  lang.add()
---end, { desc = "Laravel: traduções" })
---map("x", "gl", function()
---  lang.add_visual()
---end, { desc = "Laravel: traduzir seleção" })
---
------------------------------------------------------------------------------
----- Laravel: criar
------------------------------------------------------------------------------
---map("n", "<leader>ln", function()
---  make.create()
---end, { desc = "Criar (job, listener, model...)" })
---map("n", "<leader>ll", function()
---  livewire.create()
---end, { desc = "Novo componente Livewire" })
---map("n", "<leader>lA", function()
---  make.create("action")
---end, { desc = "Nova Action" })
---map("n", "<leader>lj", function()
---  make.create("job")
---end, { desc = "Novo Job" })
---map("n", "<leader>lL", function()
---  make.create("listener")
---end, { desc = "Novo Listener" })
---
------------------------------------------------------------------------------
----- Laravel: rotas
------------------------------------------------------------------------------
---map("n", "<leader>lg", function()
---  routes.goto_route("action")
---end, { desc = "Ir para a action da rota" })
---map("n", "<leader>lp", function()
---  routes.pick()
---end, { desc = "Lista de rotas" })
---
------------------------------------------------------------------------------
----- Laravel: pastas
------------------------------------------------------------------------------
---map("n", "<leader>lc", function()
---  goto_.pick("controllers")
---end, { desc = "Controllers" })
---map("n", "<leader>lm", function()
---  goto_.pick("models")
---end, { desc = "Models" })
---map("n", "<leader>lv", function()
---  goto_.pick("views")
---end, { desc = "Views" })
---map("n", "<leader>lr", function()
---  goto_.pick("routes")
---end, { desc = "Arquivos de rotas" })
---map("n", "<leader>lw", function()
---  goto_.pick("livewire")
---end, { desc = "Componentes Livewire" })
---
------------------------------------------------------------------------------
----- Laravel: artisan, composer, testes
------------------------------------------------------------------------------
---map("n", "<leader>la", "<cmd>Artisan<cr>", { desc = "Artisan" })
---map("n", "<leader>lC", "<cmd>Composer<cr>", { desc = "Composer" })
---map("n", "<leader>lM", tools.migrate, { desc = "Migrations" })
---map("n", "<leader>lt", function()
---  tools.test()
---end, { desc = "Testes (artisan test)" })
---map("n", "<leader>lT", tools.tinker, { desc = "Tinker" })
---
------------------------------------------------------------------------------
----- Laravel: Sail
------------------------------------------------------------------------------
---map("n", "<leader>lsu", tools.sail_up, { desc = "Sail up" })
---map("n", "<leader>lsd", tools.sail_down, { desc = "Sail down" })
---map("n", "<leader>lsr", tools.sail_restart, { desc = "Sail restart" })
---map("n", "<leader>lss", tools.sail_status, { desc = "Sail status" })
---map("n", "<leader>lsh", tools.sail_shell, { desc = "Sail shell" })
---map("n", "<leader>lsl", tools.sail_logs, { desc = "Sail logs" })
---map("n", "<leader>lso", tools.open, { desc = "Abrir app no browser" })
