return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp", -- LSP source
      "hrsh7th/cmp-buffer", -- Buffer source
      "hrsh7th/cmp-path", -- File path source
      "L3MON4D3/LuaSnip", -- Snippet engine
      "saadparwaiz1/cmp_luasnip", -- LuaSnip integration
    },
    event = "InsertEnter",
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item() -- Select next completion item
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump() -- Expand snippet or jump
            else
              fallback() -- Insert 4 spaces (respects expandtab)
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item() -- Select previous completion item
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1) -- Jump to previous snippet placeholder
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Confirm selection with Enter
          ["<C-Space>"] = cmp.mapping.complete(), -- Trigger completion menu
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" }, -- LSP completions
          { name = "luasnip" }, -- Snippet completions
          { name = "buffer" }, -- Buffer words
          { name = "path" }, -- File paths
        }),
      })
    end,
  },
}
