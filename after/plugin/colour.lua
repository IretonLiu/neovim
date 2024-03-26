vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
-- require('tokyonight').setup({
--     style = "night",
--     transparent = "true",
-- })
require('catppuccin').setup({
    flavour = "mocha",
    transparent_background = true
})
vim.cmd [[colorscheme catppuccin]]
vim.cmd [[hi NvimTreeNormal guibg=none]]
