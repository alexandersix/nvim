return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
		bigfile = { enabled = true },
		dashboard = { enabled = true },
		gh = { enabled = true },
		indent = { enabled = true },
		input = { enabled = true },
		picker = {
			enabled = true,
			matcher = {
				frecency = true, -- Include frecency bonus
				history_bonus = true, -- Give more weight to recent items
			},
			debug = {
				scores = true,
			},
		},
		notifier = { enabled = true },
		quickfile = { enabled = true },
		scratch = { enabled = true },
		statuscolumn = { enabled = true },
		terminal = { enabled = true },
		words = { enabled = false },
		zen = { enabled = true },
	},
	keys = {
		-- General Picker
		{
			"<leader><space>",
			function()
				Snacks.picker.files()
			end,
			desc = "Find Files",
		},
		{
			"<leader>.",
			function()
				Snacks.picker.grep()
			end,
			desc = "Grep Files",
		},
		{
			"<leader>bl",
			function()
				Snacks.picker.buffers()
			end,
			desc = "Buffers",
		},

		-- gh
		{
			"<leader>gi",
			function()
				Snacks.picker.gh_issue()
			end,
			desc = "Open Github Issues",
		},
		{
			"<leader>gI",
			function()
				Snacks.picker.gh_issue({ state = "all" })
			end,
			desc = "All Github Issues",
		},
		{
			"<leader>gp",
			function()
				Snacks.picker.gh_pr()
			end,
			desc = "Open Github PRs",
		},
		{
			"<leader>gP",
			function()
				Snacks.picker.gh_pr({ state = "all" })
			end,
			desc = "All Github PRs",
		},

		-- Scratch Buffer
		{
			"<leader>S",
			function()
				Snacks.scratch()
			end,
			desc = "Toggle Scratch Buffer",
		},

		-- Terminal
		{
			"<leader>tt",
			function()
				Snacks.terminal()
			end,
			desc = "Toggle Terminal",
		},

		-- Zen Mode
		{
			"<leader>zz",
			function()
				Snacks.zen()
			end,
			desc = "Toggle Zen Mode",
		},
	},
}
