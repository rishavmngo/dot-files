local fn = vim.fn
local o = vim.o

vim.g.lf_open_command = 'vsp'
-- Defaults
require("lf").setup({
  -- default_action = "vsplit", -- default action when `Lf` opens a file
  default_actions = {
    -- default action keybindings
    ["<C-t>"] = "tabedit",
    ["<C-x>"] = "split",
    ["<C-l>"] = "vsplit",
    ["<C-o>"] = "tab drop",
  },
  winblend = 10,                                   -- psuedotransparency level
  dir = "",                                        -- directory where `lf` starts ('gwd' is git-working-directory, ""/nil is CWD)
  direction = "float",                             -- window type: float horizontal vertical
  border = "rounded",                              -- border kind: single double shadow curved
  height = fn.float2nr(fn.round(0.75 * o.lines)),  -- height of the *floating* window
  width = fn.float2nr(fn.round(0.75 * o.columns)), -- width of the *floating* window
  escape_quit = true,                              -- map escape to the quit command (so it doesn't go into a meta normal mode)
  -- focus_on_open = true,                            -- focus the current file when opening Lf (experimental)
  mappings = true,                                 -- whether terminal buffer mapping is enabled
  tmux = false,                                    -- tmux statusline can be disabled on opening of Lf
  default_file_manager = false,                    -- make lf default file manager
  disable_netrw_warning = true,                    -- don't display a message when opening a directory with `default_file_manager` as true
  highlights = {
    -- highlights passed to toggleterm
    Normal = { link = "Normal" },
    NormalFloat = { link = 'Normal' },
    FloatBorder = { guifg = "<VALUE>", guibg = "<VALUE>" },
  },
  -- Layout configurations
  layout_mapping = "<M-u>", -- resize window with this key
  views = {                 -- window dimensions to rotate through
    { width = 0.800, height = 0.800 },
    { width = 0.600, height = 0.600 },
    { width = 0.950, height = 0.950 },
    { width = 0.500, height = 0.500, col = 0,   row = 0 },
    { width = 0.500, height = 0.500, col = 0,   row = 0.5 },
    { width = 0.500, height = 0.500, col = 0.5, row = 0 },
    { width = 0.500, height = 0.500, col = 0.5, row = 0.5 },
  }
})

-- Equivalent
vim.keymap.set("n", "<C-o>", "<Cmd>lua require('lf').start()<CR>", { noremap = true })
vim.keymap.set("n", "<M-o>", "<Cmd>Lf<CR>", { noremap = true })
