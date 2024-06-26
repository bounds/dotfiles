local telescope = require('telescope')
local actions = require("telescope.actions")
telescope.setup({
  defaults = {
    path_display = { 'shorten' },
    file_ignore_patterns = {".git/", ".cache", "%.o", "%.a", "%.out", "%.class", "%.pdf", "%.mkv", "%.mp4", "%.zip", ".DS_Store", "node_modules"},
    mappings = {
      i = {
        ["<esc>"] = actions.close
      },
    },
  },
  pickers = {
    find_files = {
      hidden = true
    }
  }
})

local builtin = require('telescope.builtin')
-- telescope-config.lua
local M = {}

-- We cache the results of "git rev-parse"
-- Process creation is expensive in Windows, so this reduces latency
local is_inside_work_tree = {}
local builtin = require("telescope.builtin")

M.project_files = function()
  local opts = {} -- define here if you want to define something

  local cwd = vim.fn.getcwd()
  if is_inside_work_tree[cwd] == nil then
    vim.fn.system("git rev-parse --is-inside-work-tree")
    is_inside_work_tree[cwd] = vim.v.shell_error == 0
  end

  if is_inside_work_tree[cwd] then
    builtin.git_files(opts)
  else
    builtin.find_files(opts)
  end
end

vim.keymap.set('n', '<leader>s', builtin.live_grep, {})
vim.keymap.set("n", "<leader>p", M.project_files, {})
vim.keymap.set('n', '<leader>.', function() builtin.find_files({ cwd = vim.fn.expand('%:p:h') }) end)

vim.keymap.set("n", "<leader>g", builtin.git_commits, {})
