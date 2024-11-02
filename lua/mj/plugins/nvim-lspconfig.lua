return {
    'neovim/nvim-lspconfig',
    lazy = false,
    config = function()
        -- Diagnostic configuration for LSPs
        vim.diagnostic.config({
            virtual_text = true,  -- Show diagnostics as inline virtual text
            signs = true,         -- Show signs (like in the gutter)
            update_in_insert = false, -- Disable showing diagnostics while typing
            underline = true,
            severity_sort = true,
        })

        -- Function for attaching LSP to buffers
        local on_attach = function(client, bufnr)
            -- Enable completion triggered by <c-x><c-o>
            vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

            -- Mappings for LSP functions.
            local opts = { noremap = true, silent = true }
            -- LSP functionality keybindings
            vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
            vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
            vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)
            vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<Cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
            vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<Cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
            vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<Cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
            vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<Cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
            vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<Cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
            vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<Cmd>lua vim.lsp.buf.rename()<CR>', opts)
            vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<Cmd>lua vim.lsp.buf.code_action()<CR>', opts)
            vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)

            -- Diagnostic keybindings
            vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>e', '<Cmd>lua vim.diagnostic.open_float()<CR>', opts)
            vim.api.nvim_buf_set_keymap(bufnr, 'n', '[d', '<Cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
            vim.api.nvim_buf_set_keymap(bufnr, 'n', ']d', '<Cmd>lua vim.diagnostic.goto_next()<CR>', opts)
            vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>q', '<Cmd>lua vim.diagnostic.setloclist()<CR>', opts)
        end

        -- LSP flags
        local lsp_flags = {
            debounce_text_changes = 150,
        }

        -- C/C++ (clangd)
        require('lspconfig').clangd.setup{
            on_attach = on_attach,
            flags = lsp_flags,
            capabilities = vim.lsp.protocol.make_client_capabilities(),
        }

        -- Python (pyright)
        require('lspconfig').pyright.setup{
            on_attach = on_attach,
            flags = lsp_flags,
            capabilities = vim.lsp.protocol.make_client_capabilities(),
        }

        -- Lua
        require('lspconfig').lua_ls.setup {
        on_attach = on_attach,
        flags = lsp_flags,
        settings = {
            Lua = {
                runtime = {
                    version = 'LuaJIT', -- Or set to the Lua version you're using
                },
                diagnostics = {
                    globals = {'vim'}, -- Recognize `vim` as a global in Lua
                },
                workspace = {
                    library = vim.api.nvim_get_runtime_file("", true), -- Ensure correct workspace
                },
                telemetry = {
                    enable = false, -- Disable telemetry
                },
            },
        },
    }

     end
}
