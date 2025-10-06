require('mason').setup({})
require('mason-lspconfig').setup({
	ensure_installed = {
		'html',
		'ts_ls',
		'lua_ls',
		'cssls',
		'eslint',
		'stylelint_lsp',
		'ruff',
		'clangd',
		'emmet_language_server',
		'bashls',
		'yamlls',
		'nil_ls',
	},
})

-- Add the same capabilities to ALL server configurations.
-- Refer to :h vim.lsp.config() for more information.
vim.lsp.config('*', {
	capabilities = vim.lsp.protocol.make_client_capabilities()
})

-- Disable stylelint on js
vim.lsp.config('stylelint_lsp', {
	settings = {
		stylelintplus = {
			stylelintplus = { cssInJs = false }
		}
	}
})

vim.lsp.config('nil_ls', {
	formatting = {
		command = { 'nixfmt' },
	},
	settings = {
		nix = {
			flake = {
				autoEvalInputs = false,
			},
		},
	}
})

vim.diagnostic.config({
	virtual_text = false,
	float = {
		source = true,
	}
})
