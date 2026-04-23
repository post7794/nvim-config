return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,

    opts = {
        indent = {
            enabled = false,
        },
        bigfile = { enabled = true, notify = false },
        quickfile = { enabled = true },
        dashboard = {
            enabled = true,
            preset = {
                header = table.concat({
                    "",
                    "",
                    "",
                    "██╗   ██╗██╗███████╗████████╗   ███╗   ██╗██╗   ██╗██╗███╗   ███╗",
                    "██║   ██║██║██╔════╝╚══██╔══╝   ████╗  ██║██║   ██║██║████╗ ████║",
                    "██║   ██║██║█████╗     ██║█████╗██╔██╗ ██║██║   ██║██║██╔████╔██║",
                    "╚██╗ ██╔╝██║██╔══╝     ██║╚════╝██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║",
                    " ╚████╔╝ ██║███████╗   ██║      ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║",
                    "  ╚═══╝  ╚═╝╚══════╝   ╚═╝      ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝",
                    "",
                    "",
                }, "\n"),
                keys = {
                    { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
                    { icon = " ", key = "f", desc = "Find File", action = function() require("fzf-lua").files({ hidden = true, no_ignore = true }) end },
                    { icon = " ", key = "t", desc = "Find Text", action = function() require("fzf-lua").live_grep({ hidden = true, no_ignore = true }) end },
                    { icon = " ", key = "u", desc = "Update Plugins", action = ":Lazy update" },
                    { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
                    { icon = "⏻ ", key = "q", desc = "Quit", action = ":qa" },
                },
            },
            sections = {
                { section = "header" },
                { section = "keys", gap = 1, padding = 1 },
                { section = "startup" },
                { footer = " Have a great time with Viet-Nvim!!!", padding = 1 },
            },
        },
    },
}
