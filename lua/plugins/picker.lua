return {
    "ibhagwan/fzf-lua",
    config = function()
        local fzf = require("fzf-lua")

        fzf.setup({ "fzf-vim" })

        local is_inside_work_tree = {}
        local git_files_fallback = function()
            local opts = {}

            local cwd = vim.fn.getcwd()
            if is_inside_work_tree[cwd] == nil then
                vim.fn.system("git rev-parse --is-inside-work-tree")
                is_inside_work_tree[cwd] = vim.v.shell_error == 0
            end

            if is_inside_work_tree[cwd] then
                fzf.git_files(opts)
            else
                fzf.files(opts)
            end
        end

        local m = require("keymap")

        m.n("<c-p>", git_files_fallback)
        m.n("<leader>ff", fzf.files)
        m.n("<leader>fg", fzf.live_grep_native)
        m.n("<leader>fh", fzf.helptags)
        m.n("<leader>fm", fzf.manpages)
        m.n("<leader>fd", fzf.diagnostics_workspace)
    end
}
