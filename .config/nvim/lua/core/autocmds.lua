-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "*.bas",
	callback = function(args)
		vim.keymap.set("n", "<F5>", function()
			vim.cmd("write")

			local file = vim.fn.expand("%:p")
			local filename = vim.fn.expand("%:t:r")
			local qbdir = vim.fn.expand("$HOME/Developer/QB64pe")

			vim.fn.jobstart({
				"zsh",
				"-c",
				'qb64pe -x "' .. file .. '" && "' .. qbdir .. "/" .. filename .. '"'
			}, { detach = true })
		end, { buffer = args.buf, desc = "Run BASIC silently" })
	end,
})
