return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
            config = function()
                require("telescope").load_extension("fzf")
            end
        },
    },
    keys = { "<C-p>", "<leader>f" },
    cmd = { "Telescope" },
    config = function()
        local telescope = require("telescope")

        telescope.setup({
            defaults = {
                mappings = {
                    i = {
                        ["<C-h>"] = "which_key",
                        ["<esc>"] = require("telescope.actions").close,
                    },
                },
                prompt_prefix = "   ",
                selection_caret = "  ",
                path_display = { "smart" },
                use_less = true,
            },

            extensions = {
                fzf = {
                    fuzzy = true,
                    override_generic_sorter = true,
                    override_file_sorter = true,
                    case_mode = "smart_case",
                },
            },
        })

        -- telescope.load_extension("fzf")

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

        local mappings = {
            { "<c-p>",      git_files_fallback, },
            { "<leader>ff", builtin.find_files, },
            { "<leader>fg", builtin.live_grep,  },
            { "<leader>fb", builtin.buffers,    },
            { "<leader>fh", builtin.help_tags,  },
            { "<leader>fm", builtin.man_pages,  },
        }

        for _, m in pairs(mappings) do
            vim.keymap.set("n", m[1], m[2], { noremap = true, silent = true })
        end
    end
}
