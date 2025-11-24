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
				"gopls",
				"html",
				"intelephense",
				-- "java_language_server",
				"jqls",
				"jsonls",
				"kotlin_language_server",
				"lua_ls",
				"postgres_lsp",
				"rust-analyzer",
				"shopify_theme_ls",
				"sqlls",
				"svelte",
				"tailwindcss",
				"ts_ls",
				"vue_ls",
				"yamlls",
				"zls",
			},
			ensure_formatter_installed = {
				"php-cs-fixer",
				"pint",
				"prettier",
				"stylua",
			}

		},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
		config = function(_, opts)
			local registry = require("mason-registry")

			for _, formatter_name in ipairs(opts.ensure_formatter_installed)  do
				local ok, formatter = pcall(registry.get_package, formatter_name)

				if ok then
					if not formatter:is_installed() then
						formatter:install()
					end
				end
			end
		end
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
