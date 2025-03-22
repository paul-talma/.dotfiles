return {
	{
		"williamboman/mason.nvim",

		config = function()
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})
		end,
	},

	{
		"williamboman/mason-lspconfig.nvim",

		config = function()
			require("mason-lspconfig").setup({

				ensure_installed = {
					"lua_ls",
					"pyright",
					"ruff",
					"clangd",
				},
			})
		end,
	},

	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
		},

		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local map = vim.keymap

			require("mason-lspconfig").setup_handlers({
				function(server_name)
					lspconfig[server_name].setup({
						capabilities = capabilities,
					})
				end,
			})

			-- -- -- -- -- -- --
			--   Diagnostics  --
			-- -- -- -- -- -- --

			vim.diagnostic.config({
				virtual_text = true,
				signs = true,
				update_in_insert = false,
			})

			-- Change the Diagnostic symbols in the sign column (gutter)
			local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
			end

			-- -- -- -- -- -- --
			-- Server Configs --
			-- -- -- -- -- -- --

			lspconfig.lua_ls.setup({
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
						completion = {
							callSnippet = "Replace",
						},
					},
				},
			})

			lspconfig.pyright.setup({
				capabilities = capabilities,
				settings = {
					python = {
						analysis = {
							typeCheckingMode = "basic",
							autoSearchPaths = true,
							useLibraryCodeForTypes = true,
							diagnosticMode = "workspace",
						},
					},
				},
			})

			lspconfig.ruff.setup({
				init_options = {
					settings = {
						args = { "--format=on" },
						-- select = { "E", "F", "W" },
						ignore = { "F405" },
					},
				},
				on_attach = function(client, bufnr)
					-- Disable hover to avoid conflicts with pyright (if used)
					client.server_capabilities.hoverProvider = true
				end,
			})

			-- -- -- -- --
			-- Keymaps  --
			-- -- -- -- --

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),

				callback = function(ev)
					vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

					local opts = { buffer = ev.buf, noremap = true, silent = true }

					opts.desc = "Go to definition"
					map.set("n", "gd", vim.lsp.buf.definition, opts)

					opts.desc = "See available code actions"
					map.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

					opts.desc = "Smart rename"
					map.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

					opts.desc = "Show documentation for symbol under cursor"
					map.set("n", "<leader>K", vim.lsp.buf.hover, opts)
				end,
			})
		end,
	},
}
