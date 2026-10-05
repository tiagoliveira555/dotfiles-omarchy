if not vim.g.vscode then
  return
end

-- Leader precisa estar definido antes dos mapeamentos
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local function code(cmd)
  return function()
    vim.fn.VSCodeNotify(cmd)
  end
end

local map = vim.keymap.set

-- Interface do VS Code
map("n", "<leader>e", code("workbench.action.toggleSidebarVisibility"), { desc = "Toggle sidebar" })
map("n", "<leader>E", code("workbench.files.action.focusFilesExplorer"), { desc = "Focus explorer" })
map("n", "<leader><space>", code("workbench.action.quickOpen"), { desc = "Find files" })
map("n", "<leader>/", code("workbench.action.findInFiles"), { desc = "Grep" })
map("n", "<leader>ca", code("editor.action.quickFix"), { desc = "Code action" })
map("n", "<leader>cr", code("editor.action.rename"), { desc = "Rename" })
map("n", "gr", code("editor.action.goToReferences"), { desc = "References" })
