-- This file holds the configuration for the status line
return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons", "linrongbin16/lsp-progress.nvim" },
		lazy = false,
		config = function(_, opts)
			local custom_filename = require("lualine.components.filename"):extend()
			custom_filename.apply_icon = require("lualine.components.filetype").apply_icon
			custom_filename.icon_hl_cache = {}

			require("lualine").setup({
				options = {
					theme = "dracula",
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch", "diff" },
					lualine_c = {
						{
							custom_filename,
							colored = true,
						},
					},
					lualine_x = {
						{ -- Setup lsp-progress component
							function()
								return require("lsp-progress").progress({
									max_size = 80,
									format = function(messages)
										local active_clients = vim.lsp.get_clients()
										if #messages > 0 then
											return table.concat(messages, " ")
										end
										local client_names = {}
										for _, client in ipairs(active_clients) do
											if client and client.name ~= "" then
												table.insert(client_names, 1, client.name)
											end
										end
										return table.concat(client_names, "  ")
									end,
								})
							end,
							icon = { "", align = "right" },
						},
						"diagnostics",
					},
					lualine_y = { "filetype", "encoding", "fileformat" },
					lualine_z = { "location" },
				},
			})
			-- listen lsp-progress event and refresh lualine
			vim.api.nvim_create_augroup("lualine_augroup", { clear = true })
			vim.api.nvim_create_autocmd("User", {
				group = "lualine_augroup",
				pattern = "LspProgressStatusUpdated",
				callback = require("lualine").refresh,
			})
		end,
	},
}
