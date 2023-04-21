local status, n = pcall(require, "neosolarized")

if not status then
	return
end

n.setup({
	comment_italics = true,
})

local cb = require("colorbuddy.init")
local Color = cb.Color
local colors = cb.colors
local Group = cb.Group
local groups = cb.groups
local styles = cb.styles

Color.new("white", "#ff0000")
Color.new("black", "#000000")
Color.new("color1", "#ff8080")
Color.new("color2", "#262A56")
Color.new("color3", "#CBE4DE")
Color.new("color4", "#C7E9B0")
Color.new("color5", "#FF6000")
Color.new("color6", "#0B2447")
-- Color.new("base1", "#ff0000")

Group.new("Normal", colors.base1, colors.NONE, styles.NONE)
Group.new("CursorLine", colors.none, colors.color6, styles.none, colors.base1)
Group.new("CursorLineNr", colors.yellow, colors.none, styles.NONE, colors.base1)
Group.new("Visual", colors.none, colors.color4, styles.reverse)

--Bufferline
Group.new("BufferlineFill", colors.none, colors.none, styles.none)
--unactive
Group.new("BufferlineBackground", colors.none, colors.none, styles.none)

Group.new("BufferlineBufferVisible", colors.color4, colors.none, styles.none)
-- selected
Group.new("BufferlineBufferSelected", colors.yellow, colors.none, styles.none)
Group.new("BufferlineTabSelected", colors.white, colors.white, styles.reverse)

-- Group.new("BufferlineTab", colors.white, colors.white, styles.reverse)
-- Group.new("BufferlineTabClose", colors.white, colors.white, styles.reverse)

local cError = groups.Error.fg
local cInfo = groups.Information.fg
local cWarn = groups.Warning.fg
local cHint = groups.Hint.fg

Group.new("DiagnosticVirtualTextError", cError, cError:dark():dark():dark():dark(), styles.NONE)
Group.new("DiagnosticVirtualTextInfo", cInfo, cInfo:dark():dark():dark(), styles.NONE)
Group.new("DiagnosticVirtualTextWarn", cWarn, cWarn:dark():dark():dark(), styles.NONE)
Group.new("DiagnosticVirtualTextHint", cHint, cHint:dark():dark():dark(), styles.NONE)
Group.new("DiagnosticUnderlineError", colors.none, colors.none, styles.undercurl, cError)
Group.new("DiagnosticUnderlineWarn", colors.none, colors.none, styles.undercurl, cWarn)
Group.new("DiagnosticUnderlineInfo", colors.none, colors.none, styles.undercurl, cInfo)
Group.new("DiagnosticUnderlineHint", colors.none, colors.none, styles.undercurl, cHint)

Group.new("HoverBorder", colors.yellow, colors.none, styles.NONE)
