return {
    "saghen/blink.cmp",
    dependencies = {
        "rafamadriz/friendly-snippets",
    },

    version = "*",

    config = function()
        require("blink.cmp").setup({
            keymap = { preset = "super-tab" },
            appearance = { nerd_font_variant = "mono" },

            completion = {
                menu = { border = "rounded" },
                ghost_text = { enabled = true },
                documentation = {
                    window = { border = "rounded" },
                    auto_show = true,
                    auto_show_delay_ms = 200,
                },
            },

            signature = { enabled = true },

            sources = {
                default = { "lsp", "path", "snippets", "buffer" },
                providers = {
                    lsp = {
                        name = "LSP",
                        module = "blink.cmp.sources.lsp",
                        fallbacks = {},
                    },
                },
            },

            fuzzy = { implementation = "prefer_rust_with_warning" }
        })
    end,

    opts_extend = { "sources.default" }
}
