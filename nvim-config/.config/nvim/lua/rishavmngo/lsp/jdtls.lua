local opts = {

  cmd = {},

  settings = {
    java = {
      signatureHelp = { enabled = true },
      completion = {
        favoriteStaticMembers = {},
        filteredTypes = {
        },
      },
      sources = {
        organizeImports = {
          starThreshold = 9999,
          staticStarThreshold = 9999,
        },
      },
      codeGeneration = {
        toString = {
          template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
        },
        useBlocks = true,
      },
      configuration = {
        runtimes = {
          -- {
          --   name = "JavaSE-11",
          --   path = "/usr/lib/jvm/java-11-openjdk",
          -- },
          {
            name = "JavaSE-17",
            path = "/usr/lib/jvm/java-17-openjdk",
            default = true,
          },
          -- {
          --   name = "JavaSE-21",
          --   path = "/usr/lib/jvm/java-21-openjdk",
          -- },
        },
      },
    },
  },
}

local function setup()
  local pkg_status, jdtls = pcall(require, "jdtls")
  if not pkg_status then
    vim.notify("unable to load nvim-jdtls", "error")
    return {}
  end

  -- local jdtls_path = vim.fn.stdpath("data") .. "/mason/packages/jdtls"
  local jdtls_bin = vim.fn.stdpath("data") .. "/mason/bin/jdtls"

  local root_markers = { '.git', 'mvnw', 'gradlew' }
  local root_dir = jdtls.setup.find_root(root_markers)
  local project_name = vim.fn.fnamemodify(root_dir, ":p:h:t")
  local home = os.getenv("HOME")
  local workspace_dir = home .. "/.cache/jdtls/workspace/" .. project_name
  local lombok_path = vim.fn.stdpath("data") .. "/mason/share/jdtls/lombok.jar"

  opts.cmd = {
    "jdtls",
    -- "-configuration", "/home/rishavmngo/.cache/jdtls",
    -- "-javaagent:/home/rishavmngo/.local/share/nvim/mason/share/jdtls/lombok.jar",
    "--jvm-arg=-javaagent:/home/rishavmngo/.local/share/nvim/mason/share/jdtls/lombok.jar",
    "-data",
    workspace_dir,
  }



  local on_attach = function(client, bufnr)
    jdtls.setup.add_commands() -- important to ensure you can update configs when build is updated

    vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'

    local signs = {
      { name = "DiagnosticSignError", text = "" },
      { name = "DiagnosticSignWarn", text = "" },
      { name = "DiagnosticSignHint", text = "" },
      { name = "DiagnosticSignInfo", text = "" },
    }

    for _, sign in ipairs(signs) do
      vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
    end

    local config = {
      virtual_text = false, -- disable virtual text
      signs = {
        active = signs,     -- show signs
      },
      update_in_insert = true,
      underline = true,
      severity_sort = true,
      float = {
        focusable = true,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
      },
    }

    vim.diagnostic.config(config)


    local nmap = function(keys, func, desc)
      if desc then
        desc = 'LSP: ' .. desc
      end

      vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
    end



    nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
    nmap("gl", vim.diagnostic.open_float, 'open float diagnostic')
    -- nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
    vim.keymap.set("", "<C-u>", vim.lsp.buf.code_action)
    nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
    nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
    nmap('gi', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
    nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
    nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
    nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
    nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
    nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
    nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
    nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
    nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
    nmap('<leader>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, '[W]orkspace [L]ist Folders')
    vim.keymap.set("n", "go", "<C-T>")
    vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
      vim.lsp.buf.format()
    end, { desc = 'Format current buffer with LSP' })
    nmap("<leader>lf", "<cmd>Format<CR>", "hey")
  end

  opts.on_attach = on_attach
  opts.capabilities = vim.lsp.protocol.make_client_capabilities()

  return opts
end

return { setup = setup }
