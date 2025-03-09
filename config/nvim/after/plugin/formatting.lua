local conform = require('conform')
local prettier = { 'prettierd', 'prettier' }

conform.setup({
	formatters_by_ft = {
		javascript = prettier,
		typescript = prettier,
		typescriptreact = prettier,
		javascriptreact = prettier,
		json = prettier,
		jsonc = prettier,
		html = prettier,
		markdown = prettier,
		css = prettier,
		yaml = prettier,
		gohtmltmpl = prettier,
		c = { 'clangd-format' },
		cpp = { 'clangd-format' },
		sql = { 'pg_format' },
	},
})

vim.api.nvim_create_autocmd('BufWritePre', {
	pattern = '*',
	callback = function(args)
		-- Disable with a global or buffer-local variable
		if vim.g.disable_autoformat or vim.b[args.buf].disable_autoformat then
			return
		end

		conform.format({
			bufnr = args.buf,
			timeout_ms = 1000,
			lsp_fallback = true,
		})
	end,
})

vim.api.nvim_create_user_command('FormatDisable', function(args)
	if args.bang then
		-- FormatDisable! will disable formatting just for this buffer
		vim.b.disable_autoformat = true
	else
		vim.g.disable_autoformat = true
	end
end, {
	desc = 'Disable autoformat-on-save',
	bang = true,
})

vim.api.nvim_create_user_command('FormatEnable', function()
	vim.b.disable_autoformat = false
	vim.g.disable_autoformat = false
end, {
	desc = 'Re-enable autoformat-on-save',
})

-- local lsp_zero = require('lsp-zero')
-- lsp_zero.format_on_save({
--   format_opts = {
--     async = false,
--     timeout_ms = 10000,
--   },
--   servers = {
--     ['lua_ls'] = { 'lua' },
--     ['clangd'] = { 'c', 'cpp' },
--     ['ruff_lsp'] = { 'python' },
--     ['bashls'] = { 'sh' },
--   }
-- })
--
