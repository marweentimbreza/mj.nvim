-- TODO This is a todo test commment 
return {
    "mbbill/undotree",
    lazy = false,
    config = function() 
        vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
    end
}
