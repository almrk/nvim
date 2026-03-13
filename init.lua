--                                 s       .                                 .x+=:.   
--                                :8      @88>                              z`    ^%  
--         u.    .d``            .88      %8P          u.      u.    u.        .   <k 
--   ...ue888b   @8Ne.   .u     :888ooo    .     ...ue888b   x@88k u@88c.    .@8Ned8" 
--   888R Y888r  %8888:u@88N  -*8888888  .@88u   888R Y888r ^"8888""8888"  .@^%8888"  
--   888R I888>   `888I  888.   8888    ''888E`  888R I888>   8888  888R  x88:  `)8b. 
--   888R I888>    888I  888I   8888      888E   888R I888>   8888  888R  8888N=*8888 
--   888R I888>    888I  888I   8888      888E   888R I888>   8888  888R   %8"    R88 
--  u8888cJ888   uW888L  888'  .8888Lu=   888E  u8888cJ888    8888  888R    @8Wou 9%  
--   "*888*P"   '*88888Nu88P   ^%888*     888&   "*888*P"    "*88*" 8888" .888888P`   
--     'Y"      ~ '88888F`       'Y"      R888"    'Y"         ""   'Y"   `   ^"F     
--                 888 ^                   ""                                         
--                 *8E                                                                
--                 '8>                                                                
--                  "       

vim.g.mapleader = " "      -- Set the leader key for keymappings
vim.o.number = true        -- Show line numbers
vim.o.encoding = "UTF-8"   -- Sets the character encoding used for files
vim.o.expandtab = true     -- Use spaces instead of tabs when indenting
vim.o.tabstop = 4          -- Number of spaces that a <Tab> represents.
vim.o.shiftwidth = 4       -- Number of spaces for each step of autoindent.
vim.o.autoindent = true    -- Copy the indent from the line above when starting a new line.
vim.o.ruler = true         -- Display the row and column in the bar at the bottom
vim.o.title = true         -- Set the window title to whatever Neovim wants to
vim.o.termguicolors = true -- Enable true color support
vim.o.syntax = "off"       -- Enable syntax highlighting
vim.o.background = "dark"  -- Ensure that all colour schemes know to use the dark variant
vim.o.wrap = false         -- Disable line wrapping



--                                          _            .       ..                  
--                                         u            @88>   dF                    
--     u.    u.                     u.    88Nu.   u.    %8P   '88bu.                 
--   x@88k u@88c.      .u     ...ue888b  '88888.o888c    .    '*88888bu        .u    
--  ^"8888""8888"   ud8888.   888R Y888r  ^8888  8888  .@88u    ^"*8888N    ud8888.  
--    8888  888R  :888'8888.  888R I888>   8888  8888 ''888E`  beWE "888L :888'8888. 
--    8888  888R  d888 '88%"  888R I888>   8888  8888   888E   888E  888E d888 '88%" 
--    8888  888R  8888.+"     888R I888>   8888  8888   888E   888E  888E 8888.+"    
--    8888  888R  8888L      u8888cJ888   .8888b.888P   888E   888E  888F 8888L      
--   "*88*" 8888" '8888c. .+  "*888*P"     ^Y8888*""    888&  .888N..888  '8888c. .+ 
--     ""   'Y"    "88888%      'Y"          `Y"        R888"  `"888*""    "88888%   
--                   "YP'                                ""       ""         "YP'    
                                                                                 
if vim.g.neovide then
    local function get_background_color()
        local hl = vim.api.nvim_get_hl(0, { name = "Normal" })
        local bg = hl.bg
        if bg then
            return string.format("#%06x", bg)
        else
            return "#000000"
        end
    end

    vim.g.neovide_cursor_animation_length = 0.12
    vim.g.neovide_cursor_short_animation_length = 0.03
    vim.g.neovide_cursor_vfx_mode = "pixiedust"
    vim.g.neovide_cursor_vfx_lifetime = 1.0
    vim.g.neovide_cursor_vfx_particle_density = 25.0
    vim.g.neovide_title_background_color = get_background_color()
end



--                                            ..      
--                                      < .z@8"`      
--   .d``                                !@88E        
--   @8Ne.   .u         u           .    '888E   u    
--   %8888:u@88N     us888u.   .udR88N    888E u@8NL  
--    `888I  888. .@88 "8888" <888'888k   888E`"88*"  
--     888I  888I 9888  9888  9888 'Y"    888E .dN.   
--     888I  888I 9888  9888  9888        888E~8888   
--   uW888L  888' 9888  9888  9888        888E '888&  
--  '*88888Nu88P  9888  9888  ?8888u../   888E  9888. 
--  ~ '88888F`    "888*""888"  "8888P'  '"888*" 4888" 
--     888 ^       ^Y"   ^Y'     "P'       ""    ""   
--     *8E                                            
--     '8>                                            
--      " 

-- Install lazy.nvim (if needed)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- Install the plugins/pakcages
require("lazy").setup({
    -- kanagawa.nvim
    { 
        "rebelot/kanagawa.nvim",
        lazy = false,
        priortiy = 1000,
        config = function()
            require("kanagawa").setup()
            vim.cmd("colorscheme kanagawa")
        end
    },
    -- lualine.nvim
    { 
        "nvim-lualine/lualine.nvim",
        lazy = false,
        config = function()
            require("lualine").setup({
                options = {
                    theme = "kanagawa",
                    icons_enabled = true
                }
            })
        end
    },
    -- nvim-tree.lua
    { 
        "nvim-tree/nvim-tree.lua",
        lazy = false,
        config = function()
            require("nvim-tree").setup({
                view = {
                    signcolumn = "yes",
                    float = {
                        enable = true,
                        open_win_config = function()
                            local scr_w = vim.o.columns
                            local scr_h = vim.o.lines
                            local tree_w = 80
                            local tree_h = math.floor(tree_w * scr_h / scr_w)
                            return {
                                border = "double",
                                relative = "editor",
                                width = tree_w,
                                height = tree_h,
                                col = (scr_w - tree_w) / 2,
                                row = (scr_h - tree_h) / 2
                            }
                        end 
                    }
                },
                modified = {
                    enable = true
                },
                renderer = {
                    indent_width = 2,
                    icons = {
                        show = {
                            hidden = true
                        },
                        git_placement = "after",
                        bookmarks_placement = "after",
                        symlink_arrow = " 󰌷 ",
                        glyphs = {
		                    folder = {
		                        arrow_closed = "󱨊",
		                        arrow_open = "󱨉",
		                        default = "󰉋",
		                        open = "󰝰",
		                        empty = "󰉖",
		                        empty_open = "󰷏",
		                        symlink = "󰌹󰉋",
		                        symlink_open = "󰌹󰝰"
		                    },
		                    default = "󰈔",
		                    symlink = "󰌹",
		                    bookmark = "󰃀",
		                    modified = "󰏫",
		                    hidden = "󰊠",
		                    git = {
		                        unstaged = "×",
		                        staged = "",
		                        unmerged = "󰧾",
		                        untracked = "󰓎",
		                        renamed = "󰑕",
		                        deleted = "󰩹",
		                        ignored = "󰈉"
		                    }
	                    } 
                    },
                    indent_markers = {
                        enable = true,
                    }
                },
                filters = {
                    git_ignored = false
                },
                sync_root_with_cwd = true
            })
        end
    },
    -- nvim-web-devicons
    { 
        "nvim-tree/nvim-web-devicons",
        lazy = false
    },
    {
        "mason-org/mason.nvim",
        dependencies = {
            "mason-org/mason-lspconfig.nvim"
        },
        lazy = false,
        config = function()
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "clangd", 
                    "rust_analyzer", 
                    "glsl_analyzer"
                }
            })
            vim.lsp.enable({
                "clangd",
                "rust_analyzer",
                "glsl_analyzer"
            })
            vim.diagnostic.config({
                virtual_text = true,
                underline = true
            })
            --vim.api.nvim_create_autocmd('LspAttach', {
            --  callback = function(args)
            --    local client = vim.lsp.get_client_by_id(args.data.client_id)
            --    if client:supports_method('textDocument/completion') then
            --      -- Enable auto-completion
            --      vim.lsp.completion.enable(true, client.id, args.buf, {autotrigger = true})
            --    end
            --  end,
            --})
        end
    },
    {
        "saghen/blink.cmp",
        version = "1.*",
        opts = {
            -- C-space: Open menu or open docs if already open
            -- C-n/C-p or Up/Down: Select next/previous item
            -- C-e: Hide menu
            -- C-k: Toggle signature help (if signature.enabled = true)
            keymap = { preset = "default" },
            appearance = {
                nerd_font_variant = "mono"
            },
            completion = { documentation = { auto_show = true } },
            sources = {
                default = { 'lsp', 'path', 'buffer' }
            },
            fuzzy = { implementation = "prefer_rust_with_warning" }
        },
        opts_extend = { "sources.default" }
    }
})



--        ..    .x+=:.                 
--  x .d88"    z`    ^%                
--   5888R        .   <k  .d``         
--   '888R      .@8Ned8"  @8Ne.   .u   
--    888R    .@^%8888"   %8888:u@88N  
--    888R   x88:  `)8b.   `888I  888. 
--    888R   8888N=*8888    888I  888I 
--    888R    %8"    R88    888I  888I 
--    888R     @8Wou 9%   uW888L  888' 
--   .888B . .888888P`   '*88888Nu88P  
--   ^*888%  `   ^"F     ~ '88888F`    
--     "%                   888 ^      
--                          *8E        
--                          '8>        
--                           "         

vim.lsp.enable({
    "clangd",
    "rust_analyzer",
    "glsl_analyzer"
})
vim.diagnostic.config({
    virtual_text = true,
    underline = true
})
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client:supports_method('textDocument/completion') then
      -- Enable auto-completion
      vim.lsp.completion.enable(true, client.id, args.buf, {autotrigger = true})
    end
  end,
})



--        ..                                                                                                .                                 .x+=:.   
--  < .z@8"`                   ..                                                                          @88>                              z`    ^%  
--   !@88E                    @L                ..    .     :                 .d``          .d``           %8P      u.    u.                    .   <k 
--   '888E   u         .u    9888i   .dL      .888: x888  x888.        u      @8Ne.   .u    @8Ne.   .u      .     x@88k u@88c.      uL        .@8Ned8" 
--    888E u@8NL    ud8888.  `Y888k:*888.    ~`8888~'888X`?888f`    us888u.   %8888:u@88N   %8888:u@88N   .@88u  ^"8888""8888"  .ue888Nc..  .@^%8888"  
--    888E`"88*"  :888'8888.   888E  888I      X888  888X '888>  .@88 "8888"   `888I  888.   `888I  888. ''888E`   8888  888R  d88E`"888E` x88:  `)8b. 
--    888E .dN.   d888 '88%"   888E  888I      X888  888X '888>  9888  9888     888I  888I    888I  888I   888E    8888  888R  888E  888E  8888N=*8888 
--    888E~8888   8888.+"      888E  888I      X888  888X '888>  9888  9888     888I  888I    888I  888I   888E    8888  888R  888E  888E   %8"    R88 
--    888E '888&  8888L        888E  888I      X888  888X '888>  9888  9888   uW888L  888'  uW888L  888'   888E    8888  888R  888E  888E    @8Wou 9%  
--    888E  9888. '8888c. .+  x888N><888'     "*88%""*88" '888!` 9888  9888  '*88888Nu88P  '*88888Nu88P    888&   "*88*" 8888" 888& .888E  .888888P`   
--  '"888*" 4888"  "88888%     "88"  888        `~    "    `"`   "888*""888" ~ '88888F`    ~ '88888F`      R888"    ""   'Y"   *888" 888&  `   ^"F     
--     ""    ""      "YP'            88F                          ^Y"   ^Y'     888 ^         888 ^         ""                  `"   "888E             
--                                  98"                                         *8E           *8E                              .dWi   `88E             
--                                ./"                                           '8>           '8>                              4888~  J8%              
--                               ~`                                              "             "                                ^"===*"`          

-- Save/session keys
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>q", ":q<CR>")
vim.keymap.set("n", "<leader>x", ":quitall!<CR>")
-- Window split keys
vim.keymap.set("n", "<leader>r", ":vsplit<CR>")
vim.keymap.set("n", "<leader>d", "<C-w>")
-- NvimTree keys
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<cr>")


