local opt = vim.opt

local options = {
    shiftwidth  = 2,
    tabstop     = 2,
    softtabstop = 2,
}

for k, v in pairs(options) do
    opt[k] = v
end
