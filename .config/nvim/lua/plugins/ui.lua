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
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
		    "nvim-tree/nvim-web-devicons",
		},
		init = function()
		    -- disable netrw
		    vim.g.loaded_netrw = 1
		    vim.g.loaded_netrwPlugin = 1

		    -- enable 24-bit colour
		    --vim.opt.termguicolors = true
		end,
		opts = {
		    renderer = {
			highlight_git = true,
		    },
		    filters = {
			git_ignored = false,
		    },
		},
		keys = {
			{
				"<C-n>",
				":NvimTreeFindFileToggle<CR>",
			}
		}
	},
	{
		  "dracula/vim",
		  name = "dracula",
		  lazy = false,
		  priority = 1000,
		  opts = {},
		  config = function(_, _)
			  vim.opt.termguicolors = false
			  vim.cmd.colorscheme("dracula")
		  end
	},
	{
	    "nvim-telescope/telescope.nvim",
    event = "VimEnter",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" },
    opts = {
	defaults = {
	    file_ignore_patterns = { ".git/" },
	    vimgrep_arguments = {
		"rg",
		"--color=never",
		"--no-heading",
		"--with-filename",
		"--line-number",
		"--column",
		"--smart-case",
		"--hidden",
	    },
	},
    },
    init = function()
	local builtin = require("telescope.builtin")
	vim.keymap.set("n", "<leader>ff", function()
	    builtin.find_files({ hidden = true })
	end, {desc = "[F]ind [F]iles"})
	vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "[F]ind [G]rep" })
	vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "[F]ind [B]uffers" })
	vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "[F]ind [H]elp Tags" })
		vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "[F]ind [K]eymaps" })
		vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })
	    end,
	},
    {
	"folke/which-key.nvim", 
	event = "VimEnter", 
	opts = {
	    delay = 0,
	    icons = { mappings = true, keys = {} },
	    spec = {
		{ "<leader>f", group = "[F]ind"},
		{ "g", group = "[G]o to..."},
	    }
	}
    }
}
