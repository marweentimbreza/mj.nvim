return {
	"folke/which-key.nvim",
        lazy = true,
	{ "folke/neoconf.nvim", 
        cmd = "Neoconf", 
        lazy = false,
    },
    {"folke/neodev.nvim",
        lazy = false,
    },
   
    {
      "nvim-lualine/lualine.nvim",
    dependencies = { 'kyazdani42/nvim-web-devicons', opt = true },
    lazy = false,
    config = function()
      require('lualine').setup {
        options = {
          theme = 'gruvbox', -- Set your preferred theme here
          section_separators = '',
          component_separators = '',
        },
      }
     end
    },
    {
    'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'saadparwaiz1/cmp_luasnip',
            'L3MON4D3/LuaSnip',
            }
    },
}

