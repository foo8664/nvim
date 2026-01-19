vim.g.mapleader = ","

-- the <nop>'s are for training
vim.keymap.set("i", "jk", "<esc>")
vim.keymap.set("i", "<esc>", "<nop>")
vim.keymap.set("i", "<up>", "<nop>")
vim.keymap.set("i", "<down>", "<nop>")
vim.keymap.set("i", "<right>", "<nop>")
vim.keymap.set("i", "<left>", "<nop>")

-- Source and edit config files quickly
vim.keymap.set("n", "<leader>ev", ":split $MYVIMRC<cr>")
vim.keymap.set("n", "<leader>sv", ":source $MYVIMRC<cr>")
-- Removing whitespace at the end of lines
-- Using [[]] string because it doesn't escape \s
vim.keymap.set("n", "<leader>ts", [[:%s/\s\+$/<cr>]], { silent = true })
-- Going back into "directory view" quickly
vim.g.netrw_bufsettings = "wrap number relativenumber"
vim.keymap.set("n", "<leader>d", vim.cmd.Ex)


vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = true
vim.opt.swapfile = false
vim.opt.colorcolumn = "80"

-- Tree-sitter config
treesit = require("nvim-treesitter")
treesit.install({"c", "python", "bash"})
treesit.setup({
	install_dir = vim.fn.stdpath("data") .. "/site"
})
vim.api.nvim_create_autocmd({"FileType"}, {
	pattern = {"*"},
	callback = function()
		vim.treesitter.start()
	end,
})

-- To write README's properly
vim.api.nvim_create_autocmd({"FileType"}, {
	pattern = {"*.md"},
	callback = function()
		vim.opt.colorcolumn = "0"
		vim.opt.wrap = false
	end,
})

vim.opt.syntax = "enable"
vim.treesitter.language.add("c")
vim.cmd.colorscheme("CC")
