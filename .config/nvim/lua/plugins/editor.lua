-- This file contains configuration for plugins that modify or add to the behavior of the editor
return {
	-- Comment toggling
	{
		"numToStr/Comment.nvim",
		opts = {
			pre_hook = function()
				return vim.bo.commentstring
			end,
		},
		event = { "BufReadPre", "BufNewFile" },
		keys = {
			{
				"<leader>/",
				function()
					require("Comment.api").toggle.linewise.current()
				end,
				mode = { "n", "x" },
				desc = "Toggle comment",
			},
			{
				"<leader>/",
				"<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
				mode = "v",
				desc = "Toggle comment",
			},
		},
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
			"nvim-treesitter/nvim-treesitter",
		},
	},

	-- Git related signs in the gutter for tracking additions, modifications, and deletions
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			current_line_blame = true,
		},
		event = "BufReadPre",
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		main = "nvim-treesitter.configs",
		opts = {
			ensure_installed = {
				"python", "java", "javascript", "swift", "c", "html", "css", "lua", "markdown", "markdown_inline", "rust", "cpp"
			},
			auto_install = true,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = {"ruby"},
			},
			indent = {enable = true, disable = {"ruby"}},
		}
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {},
	},
	{
		"windwp/nvim-ts-autotag",
		event = "InsertEnter",
		opts = {},
	},
	{ "tpope/vim-sleuth" },
	{ "andweeb/presence.nvim", event = "VeryLazy" }, 
	{ "wakatime/vim-wakatime", event = "VeryLazy" },
	{
		"smjonas/inc-rename.nvim",
		opts = {},
		keys = { { "<leader>rn", ":IncRename ", mode = { "n" } } },
	    },
}
