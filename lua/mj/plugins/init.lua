return {
        "folke/which-key.nvim",
        lazy = true,
	{ 
        "folke/neoconf.nvim", 
        cmd = "Neoconf", 
        lazy = false,
    },
    {
        "folke/neodev.nvim",
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
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local harpoon = require("harpoon")

    harpoon:setup({})

    vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
    vim.keymap.set("n", "<leader>s", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

    -- basic telescope configuration
    local conf = require("telescope.config").values
    local function toggle_telescope(harpoon_files)
        local file_paths = {}
        for _, item in ipairs(harpoon_files.items) do
            table.insert(file_paths, item.value)
        end

        require("telescope.pickers").new({}, {
            prompt_title = "Harpoon",
            finder = require("telescope.finders").new_table({
                results = file_paths,
            }),
            previewer = conf.file_previewer({}),
            sorter = conf.generic_sorter({}),
        }):find()
    end

    vim.keymap.set("n", "<leader>sH", function() toggle_telescope(harpoon:list()) end,
    { desc = "[s]how [H]arpoon window" })

    end
    },
}

