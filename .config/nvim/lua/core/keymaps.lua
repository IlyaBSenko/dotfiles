-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Remap arrow keys in normal mode to switch between buffers
vim.keymap.set("n", "<left>", "<C-w>h")
vim.keymap.set("n", "<right>", "<C-w>l")
vim.keymap.set("n", "<up>", "<C-w>k")
vim.keymap.set("n", "<down>", "<C-w>j")

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

-- add or subtract from the next number on the line
vim.keymap.set("n", "+", "<C-a>", { desc = "Increment the next number on the line" })
vim.keymap.set("n", "-", "<C-x>", { desc = "Decrement the next number on the line" })

-- Select all with CTRL+a
vim.keymap.set("n", "<C-a>", "gg<S-v>G", { desc = "Select the entire contents of a buffer" })

-- Make CTRL+del work in insert mode
vim.keymap.set("i", "<C-Del>", "<C-o>dw")
-- Make CTRL+Backspace work in insert mode
vim.keymap.set("i", "<C-H>", "<C-W>")

-- Insert a blank line below and above your cursor without going into insert mode
vim.keymap.set(
	"n",
	"<leader>o",
	[[:<C-u>put =repeat(nr2char(10),v:count)<Bar>execute "'[-1"<CR>]],
	{ desc = "Insert a blank line below the cursor" }
)

vim.keymap.set(
	"n",
	"<leader>O",
	[[:<C-u>put!=repeat(nr2char(10),v:count)<Bar>execute "']+1"<CR>]],
	{ desc = "Insert a blank line above the cursor" }
)
