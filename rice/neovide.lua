function get_background_color()
    local hl = vim.api.nvim_get_hl(0, { name = "Normal" })
    local bg = hl.bg
    if bg then
        return string.format("#%06x", bg)
    else
        return "#000000"
    end
end

if vim.g.neovide then
    vim.g.neovide_cursor_animation_length = 0.12
    vim.g.neovide_cursor_short_animation_length = 0.03
    vim.g.neovide_cursor_vfx_mode = "pixiedust"
    vim.g.neovide_cursor_vfx_lifetime = 1.0
    vim.g.neovide_cursor_vfx_particle_density = 25.0
    vim.g.neovide_title_background_color = get_background_color()
end
