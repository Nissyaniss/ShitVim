require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		'bashls',
		'clangd',
		'cssls',
		'jdtls',
		'lua_ls',
		'pylsp',
		'rust_analyzer',
	}
})
