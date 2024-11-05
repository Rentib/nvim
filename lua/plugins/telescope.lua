return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    keys = { "<C-p>", "<leader>f" },
    config = function()
        local telescope = require("telescope")

        telescope.setup({
            defaults = {
                mappings = { i = { ["<esc>"] = require("telescope.actions").close } },
                prompt_prefix = "   ",
                selection_caret = "  ",
                path_display = { "smart" },
            },

            extensions = {
                fzf = {},
            },
        })

        telescope.load_extension("fzf")

        local builtin = require("telescope.builtin")
        local is_inside_work_tree = {}
        local git_files_fallback = function()
            local opts = {}

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

        local m = require('keymap')

        m.n("<c-p>",      git_files_fallback)
        m.n("<leader>ff", builtin.find_files)
        m.n("<leader>fg", builtin.live_grep)
        m.n("<leader>fb", builtin.buffers)
        m.n("<leader>fh", builtin.help_tags)
        m.n("<leader>fm", builtin.man_pages)
    end
}
