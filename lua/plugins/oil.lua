return {
    "stevearc/oil.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },

    config = function()
        require("oil").setup({
            default_file_explorer = true,
            columns = {
                "icon",
            },
            view_options = {
                show_hidden = true,
            },
            keymaps = {
                ["<C-s>"] = { "actions.select", opts = { vertical = true } },
            },
        })

        vim.keymap.set("n", "<leader>e", function()
            vim.cmd("leftabove vsplit")
            vim.cmd("vertical resize 25")
            require("oil").open()
        end, { desc = "Open Oil File Manager", silent = true })
    end,
}
