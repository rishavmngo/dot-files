local null_ls = require("null-ls")
local fmt = null_ls.builtins.formatting
local dgn = null_ls.builtins.diagnostics
null_ls.setup({
  sources = {
    -- null_ls.builtins.formatting.prettierd,
    fmt.prettier.with({
      extra_args = {
        '--tab-width=4',
        '--trailing-comma=es5',
        '--end-of-line=lf',
        '--arrow-parens=always',
      },
    }),
    -- fmt.eslint_d,
    -- dgn.eslint_d,
    -- dgn.eslint_d.with({
    --   extra_args = {
    --     '--no-eslintrc'
    --   }
    -- }),
  },
})
