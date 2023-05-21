--[[function ColorMe(color)
  color = color
  vim.cmd.colorscheme(color or 'rose-pine')

  vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
end

ColorMe()

vim.keymap.set("n", "<leader>col", "<cmd>lua ColorMe()<CR>:echo 'Colors updated!'<CR>", {silent = true})
]]--



