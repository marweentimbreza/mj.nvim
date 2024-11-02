return {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,  -- ensure it's loaded on startup
    build = ':TSUpdate',  -- automatically update Treesitter parsers
    config = function()
      require'nvim-treesitter.configs'.setup {
        -- List of parser names, or "all"
        ensure_installed = { "lua", "python", "c", "cpp" },

        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,

        -- Automatically install missing parsers when entering buffer
        auto_install = true,

        highlight = {
          -- `false` will disable the whole extension
          enable = true,
          additional_vim_regex_highlighting = true,  -- Disables default Vim syntax highlighting

          -- List of languages that will be disabled
          disable = { },

          -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
          -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        },
      }
    end
}

