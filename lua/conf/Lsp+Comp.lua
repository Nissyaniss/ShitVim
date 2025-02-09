 -- Set up nvim-cmp.
local cmp = require('cmp')

cmp.setup({
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
	sources = cmp.config.sources({
			{ name = 'nvim_lsp' },
			{ name = 'luasnip' },
			{
				name = 'spell',
				option = {
					keep_all_entries = false,
					enable_in_context = function()
						return require('cmp.config.context').in_treesitter_capture('spell')
					end,
				},
			},
		}, {}
	)
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
	sources = cmp.config.sources({
		{ name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
	}, {})
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = 'buffer' }
	}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'path' }
	}, {
		{ name = 'cmdline' }
	})
})

-- Set up lspconfig.

local capabilities = require('cmp_nvim_lsp').default_capabilities()
local on_attach = function(client)
	if client.resolved_capabilities.document_formatting then
		vim.cmd [[augroup lsp_formatting]]
		vim.cmd [[autocmd!]]
		vim.cmd [[autocmd BufWritePre <buffer> :lua vim.lsp.buf.formatting_sync()]]
		vim.cmd [[augroup END]]
	end
end
require('lspconfig')['lua_ls'].setup {
	capabilities = capabilities,
	settings = {
		Lua = {
			diagnostics = {
				globals = { 'vim' }
			}
		}
	}
}
require('lspconfig')['clangd'].setup {}
require('lspconfig')['cssls'].setup {}
require('lspconfig')['pylsp'].setup {}
require('lspconfig')['jdtls'].setup {}

require("lsp-format").setup {}
require("lspconfig").rust_analyzer.setup {
	on_attach = require("lsp-format").on_attach,
	settings = {
		["rust-analyzer"] = {
			check = {
				command = "cargo clippy -- -W clippy::pedantic -W clippy::nursery -W clippy::cargo"
			}
		}
	}
}


require('lspconfig')['kotlin_language_server'].setup {}
require('lspconfig')['lua_ls'].setup {}
require('lspconfig')['r_language_server'].setup {}
