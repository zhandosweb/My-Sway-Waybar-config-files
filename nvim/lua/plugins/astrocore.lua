-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
        -- Configure core features of AstroNvim
        features = {
            large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
            autopairs = true,                           -- enable autopairs at start
            cmp = true,                                 -- enable completion at start
            diagnostics_mode = 3,                       -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
            highlighturl = true,                        -- highlight URLs at start
            notifications = true,                       -- enable notifications at start
        },
        -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
        diagnostics = {
            virtual_text = true,
            underline = true,
        },
        -- vim options can be configured here
        options = {
            opt = {            -- vim.opt.<key>
                relativenumber = true, -- sets vim.opt.relativenumber
                number = true, -- sets vim.opt.number
                spell = true, -- sets vim.opt.spell
                spelllang = { "ru", "en" },
                signcolumn = "yes", -- sets vim.opt.signcolumn to yes
                wrap = true,  -- sets vim.opt.wrap
            },
            g = {              -- vim.g.<key>
                -- configure global vim variables (vim.g)
                -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
                -- This can be found in the `lua/lazy_setup.lua` file
            },
        },
        -- Mappings can be configured through AstroCore as well.
        -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
        mappings = {
            -- first key is the mode
            n = {
                -- second key is the lefthand side of the map

                -- navigate buffer tabs
                ["]b"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
                ["[b"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

                -- mappings seen under group name "Buffer"
                ["<Leader>bd"] = {
                    function()
                        require("astroui.status.heirline").buffer_picker(
                            function(bufnr) require("astrocore.buffer").close(bufnr) end
                        )
                    end,
                    desc = "Close buffer from tabline",
                },
            },
            i = {
                -- Set up autocommand to switch to English layout when leaving insert mode / При переходе в нормальный режим - меняется клавиатура на английский автоматический
                ["<ESC>"] = {
                    function()
                        vim.cmd [[ silent !swaymsg input type:keyboard xkb_switch_layout 0 ]]
                        vim.api.nvim_command('stopinsert')
                    end,
                    desc = "Exit insert mode and switch to English layout"
                },
            },
        },
    },
}
