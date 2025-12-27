return {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 9999,
    config = function()
        require("nightfox").setup({
            options = {
                terminal_colors = true,
                dim_inactive = true,
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
