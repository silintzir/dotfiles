require("lualine").setup {
    options = {
        theme = "gruvbox",
        icons_enabled = false
    },
    sections = {
        lualine_a = {"mode"},
        lualine_b = {"branch", "diff"},
        lualine_c = {{"filename", full_path = true}},
        lualine_x = {"bo:filetype"},
        lualine_y = {{"diagnostics", sources = {"coc"}}},
        lualine_z = {"location", "progress"}
    },
    inactive_sections = {
        lualine_a = {{"filename", full_path = true}},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {"bo:filetype"},
        lualine_y = {{"diagnostics", sources = {"coc"}}},
        lualine_z = {}
    },
    extensions = {
        "nerdtree",
        "fugitive"
    }
}
