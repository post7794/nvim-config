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
                ["q"] = function()
                    vim.cmd.close()
                end,
                ["<CR>"] = function()
                    local oil = require("oil")
                    local entry = oil.get_cursor_entry()
                    if not entry then
                        return
                    end
                    if entry.type == "directory" then
                        oil.select()
                        return
                    end
                    local dir = oil.get_current_dir()
                    if not dir then
                        return
                    end
                    -- Open file in the adjacent window but keep cursor in oil
                    local oil_win = vim.api.nvim_get_current_win()
                    vim.cmd.wincmd("l")
                    if vim.api.nvim_get_current_win() ~= oil_win then
                        vim.cmd.edit(vim.fn.fnameescape(dir .. entry.name))
                        vim.fn.win_gotoid(oil_win)
                    end
                end,
            },
        })

        vim.keymap.set("n", "<leader>e", function()
            for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
                if vim.bo[vim.api.nvim_win_get_buf(win)].filetype == "oil" then
                    if vim.api.nvim_get_current_win() == win then
                        vim.cmd.wincmd("p")
                    else
                        vim.fn.win_gotoid(win)
                    end
                    return
                end
            end
            vim.cmd("leftabove vsplit")
            vim.cmd("vertical resize 25")
            require("oil").open()
        end, { desc = "Open Oil File Manager", silent = true })
    end,
}
