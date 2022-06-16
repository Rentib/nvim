local present, telescope = pcall(require, "telescope")

if not present then
  return
end

local options = {
  defaults = {
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
    },
    prompt_prefix = "   ",
    selection_caret = "  ",
    path_display = { "smart" },
    entry_prefix = "  ",
    initial_mode = "insert",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        prompt_position = "bottom",
        preview_width = 0.55,
        results_width = 0.8,
      },
      width = 0.87,
      height = 0.80,
    },
    border = {},
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    color_devicons = true,
    use_less = true,

    mappings = {
      n = { ["q"] = require("telescope.actions").close },
    }
  },
  extensions_list = { "fzf", "themes", "terms" },
}

telescope.setup(options)

pcall(function()
  for _, ext in ipairs(options.extensions_list) do
    telescope.load_extension(ext)
  end
end)

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', '<C-p>',       ':Telescope find_files<Enter>',  opts)
map('n', '<leader>ff',  ':Telescope find_files<Enter>',  opts)
map('n', '<leader>fg',  ':Telescope live_grep<Enter>',   opts)
map('n', '<leader>fb',  ':Telescope buffers<Enter>',     opts)
map('n', '<leader>fh',  ':Telescope help_tags<Enter>',   opts)
map('n', '<leader>ucs', ':Telescope colorscheme<Enter>', opts)
