return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPost", "BufWritePost", "BufNewFile" },
	opts = {},
	keys = {
		{
			"]h",
			function()
				require("gitsigns")

				if vim.wo.diff then
					vim.cmd.normal({ "]c", bang = true })
				else
					require("gitsigns").nav_hunk("next")
				end
			end,
			"Next Hunk",
		},
		{
			"[h",
			function()
				require("gitsigns")

				if vim.wo.diff then
					vim.cmd.normal({ "[c", bang = true })
				else
					require("gitsigns").nav_hunk("prev")
				end
			end,
			"Previous Hunk",
		},
		{
			"[H",
			function()
				require("gitsigns").nav_hunk("first")
			end,
			"First Hunk",
		},
		{
			"]H",
			function()
				require("gitsigns").nav_hunk("last")
			end,
			"Last Hunk",
		},
		{
			"<leader>ghs",
			":Gitsigns stage_hunk<cr>",
			"Stage Hunk",
		},
		{
			"<leader>ghr",
			":Gitsigns reset_hunk<cr>",
			"Reset Hunk",
		},
	},
}
