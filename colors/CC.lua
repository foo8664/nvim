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
	-- C stuff
	["@function.c"] = { fg = "DarkRed", },
	["@macro.c"] = { fg = "White", bold = true, },
	["@constant.c"] = { fg = "White", bold = true, },
	["@constant.builtin.c"] = { fg = "LightGrey", },
	["@comment.c"] = { fg = "LightYellow", },
	["@keyword.import.c"] = { fg = "Red", },
	["@keyword.conditional.c"] = { fg = "LightGray", },
	["@keyword.repeat.c"] = { fg = "LightGray", },
	["@keyword.return.c"] = { fg = "LightGray", },
	["@keyword.c"] = { fg = "DarkGreen", },
	["@type.c"] = { fg = "DarkGreen", },
	["@type.builtin.c"] = { fg = "DarkGreen", },
	["@character.c"] = { fg = "LightYellow", },
	["@number.c"] = { fg = "LightYellow", },
	["@variable.c"] = { fg = "Gray", },
	["@variable.builtin.c"] = { fg = "Gray", },
	["@string.escape.c"] = { fg = "DarkGray", underline = true, },
	["@string.c"] = { fg = "Gray", },
	["@property.c"] = { fg = "Gray", },

	-- Sh stuff
	["shComment"] = { fg = "LightYellow", },
	["shStatement"] = { fg = "DarkRed", },
	["bashStatement"] = { link = "shStatement", },
	["shVariable"] = { fg = "Green", },
	["shAlias"] = { link = "shVariable", },
	["shDerefSimple"] = { fg = "Red", },
	["bashSpecialVariables"] = { link = "shVariable", },
	["shDoubleQuote"] = { fg = "Grey", },
	["shSingleQuote"] = { link = "shDoubleQuote", },
	["shEscape"] = { fg = "DarkGrey", },
	["shSpecial"] = { fg = "DarkGrey", },

	-- Asm stuff
	["@function.builtin.asm"] = { fg = "DarkRed", },
	["@variable.builtin.asm"] = { fg = "LightYellow", },
	["@label.asm"] = { fg = "DarkGreen", },
	["@comment.asm"] = { fg = "LightYellow", },
	["@number.asm"] = { fg = "Grey", },
	["@string.asm"] = { fg = "Grey", },
}

function capitalize(str)
    return (str:gsub("^%l", string.upper))
end

-- Handling capitalization bs
for group, color in pairs(groups) do
	groups[capitalize(group)] = color
end

-- Setting all the highlights
for group, color in pairs(groups) do
	-- The color names have different RGB values in terminal and gui, but
	-- since tmux seems to only take cterm values, it doesn't really matter
	color.ctermfg = color.fg
	color.ctermbg = color.bg
	vim.api.nvim_set_hl(0, group, color)
end
