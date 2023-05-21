local lsp = require("lsp-zero")
-- I need this one for deno only
local nvim_lsp = require("lspconfig")

lsp.preset("recommended")

lsp.ensure_installed({
  'tsserver',
  'eslint',
  'rust_analyzer',
  'lua_ls',
  'denols',
})

-- Fix Undefined global 'vim' (was lua_ls previously
lsp.configure('lua_ls', { --
settings = {
  Lua = {
    diagnostics = {
      globals = { 'vim' }
    }
  }
}
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  -- next autosuggestion
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  -- previous autosuggestion
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  -- confirm selection
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  -- start the completion (make it pop up)
  ['<C-space>'] = cmp.mapping.complete(),
})

-- to uncomment the block just add a - in front of the --brackets
--[[
lsp.set_preferences({
  sign_icons = {}
})
--]]


-- disable the default behavior of tab and shift-tab 
--cmp_mappings['<Tab>'] = nil
--cmp_mappings['<S-Tab>'] = nil

-- set the custom mappings I defined in the local variable above named cmp_mappings
lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

-- on attach makes this stuff work only in the buffer with an LSP attached, otherwise these shortcuts will do something else
lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "gd", vim.lsp.buf.definition , opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover , opts)
  vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol , opts)
  vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float , opts)
  vim.keymap.set("n", "[d", vim.diagnostic.goto_next , opts)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_prev , opts)
  vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action , opts)
  vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references , opts)
  vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename , opts)
  vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help , opts)
end)


lsp.setup()

-- display errors inline in the buffer
vim.diagnostic.config({
  virtual_text = true
})





--deno vs tsserver issues, now deno is activated only when there's deno.json in the root
--had to require("lspconfig") to make it work. 
--note: lsp.onattach uses lspzero because I defined the onattach commands there
--they are active in the buffer only when an lsp client is attached to the buffer
--single_file_support is false so tsserver doesn't run on singlefiles ???
nvim_lsp.denols.setup{
    on_attach = lsp.on_attach,
    root_dir = nvim_lsp.util.root_pattern("deno.json", "deno.jsonc"),
}

nvim_lsp.tsserver.setup{
    on_attach = lsp.on_attach,
    root_dir = nvim_lsp.util.root_pattern("package.json"),
    single_file_support = false
}
