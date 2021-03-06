require("formatter").setup {
    logging = false,
    filetype = {
        lua = {
            -- luafmt
            function()
                return {
                    exe = "luafmt",
                    args = {"--indent-count", 4, "--stdin"},
                    stdin = true
                }
            end
        }
    }
}

vim.api.nvim_exec(
    [[
    augroup FormatAutoGroup
      autocmd!
      autocmd BufWritePost *.lua FormatWrite
    augroup END
]],
    true
)
