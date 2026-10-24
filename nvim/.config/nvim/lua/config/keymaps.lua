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
  vim.keymap.set("n", "<leader>bd", function() Snacks.bufdelete() end, { desc = "Delete Buffer" })
  vim.keymap.set("n", "<leader>bo", function() Snacks.bufdelete.other() end, { desc = "Delete Other Buffers" })
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
vim.keymap.set("n", "gl", function() lang.add() end, { desc = "Laravel: traduções" })
vim.keymap.set("x", "gl", function() lang.add_visual() end, { desc = "Laravel: traduzir seleção" })
