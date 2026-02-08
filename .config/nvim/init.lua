-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.python3_host_prog = vim.fn.exepath("python")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("core.options")
require("core.autocmds")
require("core.keymaps")
require("core.lazy")
