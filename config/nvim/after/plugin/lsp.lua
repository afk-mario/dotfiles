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

vim.lsp.config('emmet_language_server', {
	filetypes = {
		'css',
		'eruby',
		'html',
		'javascript',
		'javascriptreact',
		'less',
		'sass',
		'scss',
		'pug',
		'typescriptreact',
	},
	-- Automatically expands `className="..."` instead of `class="..."` in JSX/TSX
	init_options = {
		showExpandedAbbreviation = 'always',
		showAbbreviationSuggestions = true,
	},
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
