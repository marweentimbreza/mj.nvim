return {
  "windwp/nvim-autopairs",
  event = "InsertEnter", -- Load plugin when entering insert mode
  dependencies = {
    "hrsh7th/nvim-cmp", -- Ensure nvim-cmp is loaded for integration
  },
  config = function()
    local autopairs = require("nvim-autopairs")
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    local cmp = require("cmp")

    -- Set up autopairs
    autopairs.setup({
      check_ts = true, -- Enable Tree-sitter integration
      ts_config = {
        lua = { "string", "source" }, -- Enable autopairs in Lua strings and source
        -- Add more languages if needed
      },
      disable_filetype = { "TelescopePrompt", "spectre_panel" }, -- Disable in specific filetypes
      fast_wrap = {
        map = "<M-e>", -- Fast wrap key (Alt+e)
        chars = { "{", "[", "(", '"', "'" }, -- Characters to wrap
        pattern = [=[[%'%"%>%]%)%}%,]]=], -- Pattern for wrapping
        end_key = "$",
        keys = "qwertyuiopzxcvbnmasdfghjkl", -- Keys for selecting wrap character
        check_comma = true,
        highlight = "Search",
        highlight_grey = "Comment",
      },
    })

    -- Integrate with nvim-cmp
    cmp.event:on(
      "confirm_done",
      cmp_autopairs.on_confirm_done()
    )
  end,
}
