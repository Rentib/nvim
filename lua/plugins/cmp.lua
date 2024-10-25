return {
    'saghen/blink.cmp',
    lazy = false,
    build = 'cargo build --release',
    opts = {
        keymap = {
            show = { '<c-n>', '<c-p>' },
            hide = { '<c-e>' },
            accept = {},
            select_and_accept = { '<c-y>', '<c-space>' },
            select_prev = { '<c-p>' },
            select_next = { '<c-n>' },

            show_documentation = {},
            hide_documentation = {},

            snippet_forward = { '<c-j>' },
            snippet_backward = { '<c-k>' },
        },

        accept = {
            create_undo_point = true,
            auto_brackets = {
                enabled = false,
            },
        },

        trigger = {
            completion = {
                keyword_range = 'prefix',
                keyword_regex = '[%w_\\-]',
                exclude_from_prefix_regex = '[\\-]',
                blocked_trigger_characters = { ' ', '\n', '\t' },
                show_on_insert_on_trigger_character = true,
                show_on_insert_blocked_trigger_characters = { "'", '"' },
                show_in_snippet = false,
            },

            signature_help = {
                enabled = true,
            },
        },

        fuzzy = {
            use_frecency = true,
            use_proximity = true,
            max_items = 100,
            sorts = { 'label', 'kind', 'score' },
        },

        sources = {
            completion = {
                enabled_providers = { 'lsp', 'path', 'snippets', 'buffer' },
            },
        },

        windows = {
            autocomplete = {
                auto_show = true,
                selection = 'auto_insert', -- 'preselect', 'manual', 'auto_insert'
                draw = 'minimal',          -- 'simple', 'reversed', 'minimal',
            },
            signature_help = {
                border = 'padded',
            },
            ghost_text = {
                enabled = true,
            },
        },

        nerd_font_variant = 'normal', -- 'mono', 'normal'
        blocked_filetypes = {},
    },
}
