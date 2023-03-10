local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.setup_servers({"gdscript"})
lsp.ensure_installed(
	{
		"tsserver",
		"lua_ls",
		"cssls",
		"eslint",
		"stylelint_lsp",
		"ruff_lsp"
	}
)

-- Fix Undefined global for vim things
lsp.configure(
	"lua_ls",
		{settings = {Lua = {diagnostics = {globals = {"vim", "augroup"}}}}}
)

-- Disable stylelint on JSX
lsp.configure(
	"stylelint_lsp", {
		filetypes = {"css", "less", "scss", "sugarss", "vue", "wxss"},
		settings = {stylelintplus = {cssInJs = false}}
	}
)

-- Disable Tsserver diagnositcs
lsp.configure(
	"tsserver", {
		on_init = function(client)
			-- This is probably a miss config on my side but oh well
			client.handlers["textDocument/publishDiagnostics"] = function() end
			client.server_capabilities.documentFormattingProvider = false
			client.server_capabilities.documentFormattingRangeProvider = false
		end
	}
)

lsp.configure(
	"gdscript", {
		on_attach = function(client)
			local _notify = client.notify
			client.notify = function(method, params)
				if method == "textDocument/didClose" then return end
				_notify(method, params)
			end
		end,
		flags = {debounce_text_changes = 150}
	}
)

-- disable completion with tab
local cmp_mappings = lsp.defaults.cmp_mappings()
cmp_mappings["<Tab>"] = nil
cmp_mappings["<S-Tab>"] = nil

lsp.setup_nvim_cmp({mapping = cmp_mappings})

lsp.set_preferences(
	{
		suggest_lsp_servers = true,
		sign_icons = {
			error = "",
			warn = "",
			hint = "",
			info = ""
		}
	}
)

local function lsp_format_on_save(client, bufnr)
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({group = augroup, buffer = bufnr})
		vim.api.nvim_create_autocmd(
			"BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function() vim.lsp.buf.format({bufnr = bufnr}) end
			}
		)
	end
end

lsp.on_attach(
	function(client, bufnr)
		local opts = {buffer = bufnr, remap = false}
		lsp_format_on_save(client, bufnr)

		vim.keymap.set(
			"n", "gd", function() vim.lsp.buf.definition() end, opts
		)
		vim.keymap.set(
			"n", "<leader>dh", function() vim.lsp.buf.hover() end, opts
		)
		vim.keymap.set(
			"n", "<leader>df", function() vim.diagnostic.open_float() end, opts
		)
		vim.keymap.set(
			"n", "[d", function() vim.diagnostic.goto_next() end, opts
		)
		vim.keymap.set(
			"n", "]d", function() vim.diagnostic.goto_prev() end, opts
		)
		vim.keymap.set(
			"n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts
		)
		vim.keymap.set(
			"i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts
		)

		-- Haven't used them too much
		vim.keymap.set(
			"n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end,
				opts
		)
		vim.keymap.set(
			"n", "<leader>vrr", function() vim.lsp.buf.references() end, opts
		)
		vim.keymap.set(
			"n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts
		)
	end
)

-- Maybe I need to enable this only on nvim configs
lsp.nvim_workspace()
lsp.setup()

local null_ls = require("null-ls")
local null_opts = lsp.build_options("null-ls", {})

null_ls.setup(
	{
		on_attach = function(client, bufnr)
			null_opts.on_attach(client, bufnr)
			lsp_format_on_save(client, bufnr)
		end,
		sources = {
			-- Replace these with the tools you have installed
			null_ls.builtins.formatting.prettier.with({prefer_local = true}),
			null_ls.builtins.formatting.lua_format,
			null_ls.builtins.formatting.gdformat,
			null_ls.builtins.formatting.pg_format,
			null_ls.builtins.formatting.black
		}
	}
)
