local options = {
    shiftwidth  = 8,
    tabstop     = 8,
    softtabstop = 8,
    expandtab   = false,
    comments    = ":;",
    commentstring = "; %s",
}

for k, v in pairs(options) do
    vim.opt_local[k] = v
end
