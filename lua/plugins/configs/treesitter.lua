local present, treesitter = pcall(require, "nvim-treesitter.configs")

if not present then
  return
end

local options = {
  ensure_installed = { "c", "lua" },
  sync_install = false,
  ignore_install = { "javascript" },
  highlight = {
    enable = true,
    disable = { "latex" },
    additional_vim_regex_highlighting = false,
    use_languagetree = true,
  },
}

treesitter.setup(options)
