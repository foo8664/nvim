vim.g.mapleader = ","

vim.keymap.set("i", "jk", "<esc>")
vim.keymap.set("i", "<esc>", "<nop>")
vim.keymap.set("i", "<up>", "<nop>")
vim.keymap.set("i", "<down>", "<nop>")
vim.keymap.set("i", "<right>", "<nop>")
vim.keymap.set("i", "<left>", "<nop>")
vim.keymap.set("n", "<leader>ev", ":split $MYVIMRC<cr>")
vim.keymap.set("n", "<leader>sv", ":source $MYVIMRC<cr>")
-- Using [[]] string because it doesn't escape \s
vim.keymap.set("n", "<leader>ts", [[:%s/\s\+$/<cr>]], { silent = true })

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = true
vim.opt.swapfile = false
vim.opt.colorcolumn = "80"

-- To write README's properly
vim.api.nvim_create_autocmd({"FileType"}, {
	pattern = {"*.md"},
	callback = function()
		vim.opt.colorcolumn = "0"
		vim.opt.wrap = false
	end,
})

vim.opt.syntax = "enable"
vim.cmd.colorscheme("CC")
