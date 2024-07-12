local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find files" })
vim.keymap.set('n', '<leader>fg', builtin.git_files, { desc = "Find git files" })
-- diagnostics
vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = "Find diagnostics" })
-- requires ripgrep to be installed
vim.keymap.set('n', '<leader>fs', function()
    builtin.grep_string({ search = vim.fn.input("Search > ") })
end, { desc = "Find string" })

local setup = require('telescope').setup {
    defaults = {
        file_ignore_patterns = { "node_modules", ".git", ".env", "__pycache__" },
    }
}
