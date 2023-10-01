-- local status_ok, indent_blankline = pcall(require, 'ibl')
-- if not status_ok then
--   return
-- end
--
-- vim.cmd([[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]])
-- vim.cmd([[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]])
-- vim.cmd([[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]])
-- vim.cmd([[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]])
-- vim.cmd([[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]])
-- vim.cmd([[highlight IndentBlanklineIndent7 guifg=#C678DD gui=nocombine]])
--
-- print("hello")
-- indent_blankline.setup {
--   char = "▏",
--   use_treesitter = true,
--   show_current_context = true,
--   show_current_context_start = true,
--   space_char_blankline = " ",
--   char_highlight_list = {
--     "IndentBlanklineIndent1",
--     "IndentBlanklineIndent2",
--     "IndentBlanklineIndent3",
--     "IndentBlanklineIndent4",
--     "IndentBlanklineIndent5",
--     "IndentBlanklineIndent6",
--   },
-- }


local highlight = {
  "RainbowRed",
  "RainbowYellow",
  "RainbowBlue",
  "RainbowOrange",
  "RainbowGreen",
  "RainbowViolet",
  "RainbowCyan",
}

local hooks = require "ibl.hooks"
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
  vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
  vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
  vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
  vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
  vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
  vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
  vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
end)

require("ibl").setup { indent = { highlight = highlight, tab_char = '▎' } }
