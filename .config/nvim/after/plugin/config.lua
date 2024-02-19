vim.g.vim_json_conceal = 0
vim.g.markdown_syntax_conceal = 0

vim.cmd [[colorscheme tokyonight-night]]
vim.g.NERDTreeMinimalMenu = 1
vim.g.NERDTreeShowHidden = 1
vim.g.NERDTreeWinSize = 60
vim.g.NERDTreeIgnore = {'.DS_Store'}

require'colorizer'.setup({})
require'transparent'.setup({
  extra_groups = { -- table/string: additional groups that should be cleared
  "TelescopePromptTitle",
  "TelescopePromptPrefix",
  "TelescopePromptCounter",
  "TelescopePromptNormal",
  "TelescopePromptBorder",

  "TelescopeMatching",
  "TelescopeSelection",

  "TelescopePreviewTitle",
  "TelescopePreviewNormal",
  "TelescopePreviewBorder",

  "TelescopeResultsTitle",
  "TelescopeResultsNormal",
  "TelescopeResultsBorder"
  },
  exclude_groups = {}, -- table: groups you don't want to clear
})
vim.cmd [[:TransparentEnable]]
