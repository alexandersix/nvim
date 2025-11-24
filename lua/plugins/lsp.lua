return {
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"astro",
				"bashls",
				"biome",
				"cssls",
				"dockerls",
				"elixirls",
				"eslint",
				-- "gopls",
				"html",
				"intelephense",
				-- "java_language_server",
				"jqls",
				"jsonls",
				"kotlin_language_server",
				"lua_ls",
				"php-cs-fixer",
				"pint",
				"postgres_lsp",
				"prettier",
				"rust-analyzer",
				"shopify_theme_ls",
				"sqlls",
				"stylua",
				"svelte",
				"tailwindcss",
				"ts_ls",
				"vue_ls",
				"yamlls",
				"zls",
			}
		},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
	},
	{
		"onsails/lspkind.nvim"
	},
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		branch = "main",
		build = ":TSUpdate",
		config = function()
			local ensure_installed = {
				"go", "java", "javascript", "jq", "json", "json5", "kotlin", "liquid", "nginx", "php", "rust",
				"lua", "markdown", "markdown_inline", "astro", "bash", "caddy", "css", "diff", "dockerfile", "elixir",
				"runescript", "sql", "svelte", "tmux", "typescript", "vue", "yaml", "zig",
			}

			-- install required parsers
			require("nvim-treesitter").install(ensure_installed)

			-- enable highlighting, indentation, and folds
			-- (with autocmd)
			vim.api.nvim_create_autocmd("FileType", {
				pattern = ensure_installed,
				callback = function(ev)
					-- Highlighting
					vim.treesitter.start()

					-- Folds
					vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"

					-- Indentation (experimental)
					vim.bo.indentexpr = "v:lua.require('nvim-treesitter').indentexpr()"
				end
			})
		end
	}
}
