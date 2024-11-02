return {
	"williamboman/mason.nvim",
	cmd = "Mason",
	event = "BufReadPre",
	opts = {
		ui = {
			icons = {
				package_installed = "✓",
				package_pending = "➜",
				package_uninstalled = "✗",
			},
		},
            ensure_installed = {
			    "efm",
			    "bashls",
			    "pyright",
			    "lua_ls",
			    "emmet_ls",
			    "jsonls",
			    "clangd",
		},
		automatic_installation = true,
	},



}
