return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
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
            elseif luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump() -- Expand or jump snippet
            else
              vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("    ", true, false, true), "n", true) -- Insert 4 spaces
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item() -- Select previous item
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1) -- Jump to previous snippet placeholder
            else
              fallback() -- Do nothing
            end
          end, { "i", "s" }),
          ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Confirm with Enter
          ["<C-Space>"] = cmp.mapping.complete(), -- Trigger completion
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        }),
      })
    end,
  },
}
