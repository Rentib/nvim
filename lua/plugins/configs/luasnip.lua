local present, luasnip = pcall(require, "luasnip")

if not present then
  return
end

local types = require("luasnip.util.types")

local options = {
  history = true,
  updateevents = "TextChanged,TextChangedI",
  enable_autosnippets = true,
}

luasnip.config.set_config(options)

require("luasnip.loaders.from_vscode").lazy_load()
