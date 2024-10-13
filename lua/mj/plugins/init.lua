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
}

