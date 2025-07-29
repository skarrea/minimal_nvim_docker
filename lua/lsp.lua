local lspconfig = require("lspconfig")
local cmp = require("cmp")
local luasnip = require("luasnip")

-- LSP: pyright
lspconfig.pyright.setup {}

-- Autocompletion config
vim.o.completeopt = "menu,menuone,noselect"

cmp.setup({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  	['<Tab>'] = cmp.mapping.select_next_item(),
  	['<S-Tab>'] = cmp.mapping.select_prev_item(),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip" },
  }),
})