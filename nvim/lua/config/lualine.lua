require("lualine").setup({
  options = {
    icons_enabled = false,
    theme = 'catppuccin',
    component_separators = '|',
    section_separators = '',

    lualine_b = {'branch', 'diff', 'diagnostics', DIAGINLINE, 'bo:filetype'};
  },
})
