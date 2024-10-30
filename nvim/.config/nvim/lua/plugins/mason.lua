return {
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"bashls",
				"cssls",
				"html",
				"jsonls",
				"lua_ls",
				"tailwindcss",
				"yamlls",
			},
		},
	},
	{
		"jay-babu/mason-null-ls.nvim",
		opts = {
			ensure_installed = {
				"prettier",
				"jq",
				"markdownlint",
				"stylua",
			},
		},
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		opts = {
			ensure_installed = {
				"python",
			},
		},
	},
}
