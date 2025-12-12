return {
	-- Tab bar
	{
		"romgrk/barbar.nvim",
		dependencies = {
			"lewis6991/gitsigns.nvim", -- for git status
			"nvim-tree/nvim-web-devicons", -- for file icons
		},
		keys = {
			-- Navigation
			{ "<Tab>", "<Cmd>BufferNext<CR>", desc = "Next buffer" },
			{ "<S-Tab>", "<Cmd>BufferPrevious<CR>", desc = "Previous buffer" },

			-- Re-ordering
			{ "<A-,>", "<Cmd>BufferMovePrevious<CR>", desc = "Move buffer backward" },
			{ "<A-.>", "<Cmd>BufferMoveNext<CR>", desc = "Move buffer forward" },

			-- Direct Jumps (Goto)
			{ "<A-1>", "<Cmd>BufferGoto 1<CR>", desc = "Go to buffer 1" },
			{ "<A-2>", "<Cmd>BufferGoto 2<CR>", desc = "Go to buffer 2" },
			{ "<A-3>", "<Cmd>BufferGoto 3<CR>", desc = "Go to buffer 3" },
			{ "<A-4>", "<Cmd>BufferGoto 4<CR>", desc = "Go to buffer 4" },
			{ "<A-5>", "<Cmd>BufferGoto 5<CR>", desc = "Go to buffer 5" },
			{ "<A-6>", "<Cmd>BufferGoto 6<CR>", desc = "Go to buffer 6" },
			{ "<A-7>", "<Cmd>BufferGoto 7<CR>", desc = "Go to buffer 7" },
			{ "<A-8>", "<Cmd>BufferGoto 8<CR>", desc = "Go to buffer 8" },
			{ "<A-9>", "<Cmd>BufferGoto 9<CR>", desc = "Go to buffer 9" },
			{ "<A-0>", "<Cmd>BufferLast<CR>", desc = "Go to last buffer" },

			-- Actions
			{ "<A-p>", "<Cmd>BufferPin<CR>", desc = "Pin/Unpin buffer" },
			{ "<Leader>w", "<Cmd>BufferClose<CR>", desc = "Close current buffer" },
			{ "<A-x>", "<Cmd>BufferCloseAllButCurrentOrPinned<CR>", desc = "Close all but current/pinned" },
		},
	},
}
