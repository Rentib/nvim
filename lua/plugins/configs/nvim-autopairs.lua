local present, npairs = pcall(require, "nvim-autopairs")

if not present then
  return
end

local Rule = require('nvim-autopairs.rule')

local options = {
  check_ts = true,
  ts_config = {},
  ignored_next_char = "[%w%.]",
  fast_wrap = {
    map = "<A-e>",
    chars = { "{", "[", "(", "'", '"' },
    check_comma = true,
    highlight = "PmenuSel",
    highlight_grey = "Comment",
  },
  disable_filetype = { "TelescopePrompt" },
}

local rules = {
  Rule(' ', ' ')
    :with_pair(function (opts)
      local pair = opts.line:sub(opts.col - 1, opts.col)
      return vim.tbl_contains({ '()', '[]', '{}' }, pair)
    end),
  Rule('( ', ' )')
      :with_pair(function() return false end)
      :with_move(function(opts)
          return opts.prev_char:match('.%)') ~= nil
      end)
      :use_key(')'),
  Rule('{ ', ' }')
      :with_pair(function() return false end)
      :with_move(function(opts)
          return opts.prev_char:match('.%}') ~= nil
      end)
      :use_key('}'),
  Rule('[ ', ' ]')
      :with_pair(function() return false end)
      :with_move(function(opts)
          return opts.prev_char:match('.%]') ~= nil
      end)
      :use_key(']')
}

npairs.setup(options)
npairs.add_rules(rules)
