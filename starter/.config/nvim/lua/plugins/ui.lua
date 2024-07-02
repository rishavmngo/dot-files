return {

  -- buffer line
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    keys = {
      { "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
      { "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
    },
    opts = {
      options = {
        mode = "tabs",
        -- separator_style = "slant",
        show_buffer_close_icons = false,
        show_close_icon = false,
      },
    },
  },

  -- filename
  {
    "b0o/incline.nvim",
    dependencies = { "craftzdog/solarized-osaka.nvim" },
    event = "BufReadPre",
    priority = 1200,
    config = function()
      local colors = require("solarized-osaka.colors").setup()
      require("incline").setup({
        highlight = {
          groups = {
            InclineNormal = { guibg = colors.magenta500, guifg = colors.base04 },
            InclineNormalNC = { guifg = colors.violet500, guibg = colors.base03 },
          },
        },
        window = { margin = { vertical = 0, horizontal = 1 } },
        hide = {
          cursorline = true,
        },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
          if vim.bo[props.buf].modified then
            filename = "[+] " .. filename
          end

          local icon, color = require("nvim-web-devicons").get_icon_color(filename)
          return { { icon, guifg = color }, { " " }, { filename } }
        end,
      })
    end,
  },

  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    opts = {
      plugins = {
        gitsigns = true,
        tmux = true,
        kitty = { enabled = false, font = "+2" },
      },
    },
    keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
  },

  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function(_, opts)
      local logo = [[
          $$\           $$\                                                                       
          \__|          $$ |                                                                      
 $$$$$$\  $$\  $$$$$$$\ $$$$$$$\   $$$$$$\ $$\    $$\ $$$$$$\$$$$\  $$$$$$$\   $$$$$$\   $$$$$$\  
$$  __$$\ $$ |$$  _____|$$  __$$\  \____$$\\$$\  $$  |$$  _$$  _$$\ $$  __$$\ $$  __$$\ $$  __$$\ 
$$ |  \__|$$ |\$$$$$$\  $$ |  $$ | $$$$$$$ |\$$\$$  / $$ / $$ / $$ |$$ |  $$ |$$ /  $$ |$$ /  $$ |
$$ |      $$ | \____$$\ $$ |  $$ |$$  __$$ | \$$$  /  $$ | $$ | $$ |$$ |  $$ |$$ |  $$ |$$ |  $$ |
$$ |      $$ |$$$$$$$  |$$ |  $$ |\$$$$$$$ |  \$  /   $$ | $$ | $$ |$$ |  $$ |\$$$$$$$ |\$$$$$$  |
\__|      \__|\_______/ \__|  \__| \_______|   \_/    \__| \__| \__|\__|  \__| \____$$ | \______/ 
                                                                              $$\   $$ |          
                                                                              \$$$$$$  |          
                                                                               \______/      
      ]]

      logo = string.rep("\n", 8) .. logo .. "\n\n"
      opts.config.header = vim.split(logo, "\n")
    end,
  },
}
