return {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = { "c", "javascript", "lua", "markdown", "python", "query", "vim", "vimdoc" },
            auto_install = false,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false
            }
        })
    end
}
