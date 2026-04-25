return {
    "rebelot/kanagawa.nvim",
    name = "kanagawa",
    priority = 1000,

    config = function()
        require("kanagawa").setup({
            transparent = false,
        })
        vim.cmd.colorscheme("kanagawa-wave")
    end
}
