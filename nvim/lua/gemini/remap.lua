vim.g.mapleader = (' ')
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

-- autoformat with the lsp
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- in visual mode, J and K move the lines around
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- appends the line below to the current line, with a space
vim.keymap.set("n", "J", "mzJ`z")

-- keep cursor in the middle when jumping around
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

--keep search terms in the middle when searching
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- copied things (yanked) are also in the system clipboard so I can paste them
-- elsewhere too. y is for nvim only, leader y if I want to paste outside of vim
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- if I'm over a word, I can substitute it.
vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
--prim: https://github.com/ThePrimeagen/init.lua/blob/master/lua/theprimeagen/remap.lua

-- ctrl to navigate through quickfixes, leader to navigate to locations? 
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")
--[[


vim.keymap.set("n", "<leader>vwm", function()
    require("vim-with-me").StartVimWithMe()
end)
vim.keymap.set("n", "<leader>svwm", function()
    require("vim-with-me").StopVimWithMe()
end)

-- when pasting over a highlighted word, doesn't substitute the next paste
-- with the highlighted word, keeps your copied word the same as before
vim.keymap.set("x", "<leader>p", "\"_dP")

-- delete into void register
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

--alternative of the above (add a ] after _d after uncommenting)
--vim.keymap.set({"n", "v"}, "<leader>d", [["_d])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

--quick fix navigation ???

vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
]]--
