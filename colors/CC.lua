vim.g.colors_name = "CC"

-- don't use cterm<fg/bg>, these are copied from fg and bg
local groups = {
	-- Standard vim/neovim stuff
	["Normal"] = { fg = "LightGray", },
	["Search"] = { fg = "Yellow", bg = "None", underline = true, },
	["CurSearch"] = { fg = "Yellow", bg = "None", underline = true, },
	["Cursors"] = { fg = "White", bg = "White", bold = true, },
	["ColorColumn"] = { bg = "LightYellow", },
	["LineNr"] = { fg = "LightYellow", bold = true, },
	["LineNrAbove"] = { fg = "LightYellow", },
	["LineNrBelow"] = { fg = "LightYellow", },
	["StatusLine"] = { fg = "Black", bg = "LightYellow", },
	["ErrMsg"] = { fg = "Red", bg = "Black", },
	["WarningMsg"] = { fg = "Red", bg = "Black", },
	["StderrMsg"] = { fg = "Red", bg = "Black", },


	-- Tree-sitter stuff
	["@function"] = { fg = "DarkRed", },

	["@macro"] = { fg = "White", bold = true, },
	["@constant"] = { fg = "White", bold = true, },
	["@constant.builtin"] = { fg = "LightGrey", },
	["@comment"] = { fg = "LightYellow", },

	["@keyword.import"] = { fg = "Red", },
	["@keyword.conditional"] = { fg = "LightGray", },
	["@keyword.repeat"] = { fg = "LightGray", },
	["@keyword.return"] = { fg = "LightGray", },
	["@keyword"] = { fg = "DarkGreen", },

	["@type"] = { fg = "DarkGreen", },
	["@type.builtin"] = { fg = "DarkGreen", },

	["@character"] = { fg = "LightYellow", },
	["@number"] = { fg = "LightYellow", },

	["@variable"] = { fg = "Gray", },
	["@variable.builtin"] = { fg = "Gray", },
	
	["@string"] = { fg = "Gray", },
	["@string.escape"] = { fg = "DarkGray", underline = true, },
	["@String"] = { fg = "Gray", },
	["@String.escape"] = { fg = "DarkGray", underline = true, },

	["@property"] = { fg = "Gray", },
}

-- Linking everything up, linking to unused groups is not a problem
local langs = {"c", "python", "bash", "lua", "cpp"}
for group in pairs(groups) do
	for lang in pairs(langs) do
		vim.api.nvim_set_hl(0, group .. "." .. lang, { link = group })
	end
end

-- Setting all the highlights
for group, color in pairs(groups) do
	-- The color names have different RGB values in terminal and gui, but
	-- since tmux seems to only take cterm values, it doesn't really matter
	color.ctermfg = color.fg
	color.ctermbg = color.bg
	vim.api.nvim_set_hl(0, group, color)
end
