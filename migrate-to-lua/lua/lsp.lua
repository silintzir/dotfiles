local lsp = require "lspconfig"

-- Lua specific: Your custom attach function for nvim-lspconfig goes here.
local sumneko_root_path = "/Users/silintzir/.local/share/nvim/lspinstall/lua/sumneko-lua/extension/server"
local sumneko_binary = sumneko_root_path .. "/bin/macOS/lua-language-server"

-- global defaults
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

  -- mappings
  local opts = {noremap = true, silent = true}
  buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
  buf_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)

  require "completion".on_attach(client)
end

-- PHP
lsp.intelephense.setup {
  on_attach = on_attach,
  root_dir = lsp.util.root_pattern(".git")
}

lsp.tsserver.setup {
  on_attach = on_attach,
  cmd = {
    "typescript-language-server",
    "--stdio",
    "--log-level",
    "4",
    "--tsserver-path",
    "/Users/silintzir/Projects/pandectes/monorepo/.yarn/sdks/typescript/bin/tsserver"
  },
  root_dir = lsp.util.root_pattern("tsconfig.json", ".git")
}

vim.lsp.set_log_level("debug")

lsp.sumneko_lua.setup {
  on_attach = on_attach,
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = "LuaJIT",
        -- Setup your lua path
        path = vim.split(package.path, ";")
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {"vim", "use"}
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true
        }
      }
    }
  }
}

-- auto completion with completion-nvim
