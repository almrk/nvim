return {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 9999,
    config = function()
        require("nightfox").setup({
            -- specs = {
            --     carbonfox = {
            --         bg0 = "bg1",
            --         bg1 = "bg0",
            --     }
            -- },
            options = {
                transparent = true,
                terminal_colors = true,
                styles = {
                    comments = "italic",
                    keywords = "bold",
                    types = "italic,bold"
                }
            }
        })
        vim.cmd("colorscheme carbonfox")
    end
}
