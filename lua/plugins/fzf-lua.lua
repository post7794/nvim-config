return {
    {
        "ibhagwan/fzf-lua",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },

        config = function()
            -- Patch: vim.nonnil missing in some Neovim builds
            if not vim.nonnil then
                vim.nonnil = function(val, ...)
                    for i = 1, select("#", ...) do
                        local default = select(i, ...)
                        if val == nil then
                            val = default
                        end
                    end
                    return val
                end
            end

            local fzf = require("fzf-lua")
            fzf.setup({
                files = {
                    hidden = true,
                    no_ignore = true,
                },
                grep = {
                    hidden = true,
                },
            })

            vim.keymap.set("n", "<leader>ff", function()
                fzf.files({ hidden = true, no_ignore = true })
            end, { desc = "Find Files" })

            vim.keymap.set("n", "<leader>fg", function()
                fzf.live_grep({ hidden = true })
            end, { desc = "Live Grep" })
        end,
    }
}
