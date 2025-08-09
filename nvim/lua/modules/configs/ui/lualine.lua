-- Eviline config for lualine
-- Author: shadmansaleh
-- Credit: glepnir
return function()
    local lualine = require("lualine")

    local conditions = {
        buffer_not_empty = function()
            return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
        end,
        hide_in_width = function()
            return vim.fn.winwidth(0) > 80
        end,
        check_git_workspace = function()
            local filepath = vim.fn.expand("%:p:h")
            local gitdir = vim.fn.finddir(".git", filepath .. ";")
            return gitdir and #gitdir > 0 and #gitdir < #filepath
        end,
    }

    -- Config
    local config = {
        options = {
            -- Disable sections and component separators
            component_separators = "",
            section_separators = "",
            theme = {
                -- We are going to use lualine_c an lualine_x as left and
                -- right section. Both are highlighted by c theme .  So we
                -- are just setting default looks o statusline
                normal = { c = { fg = "none", bg = "none" } },
                inactive = { c = { fg = "none", bg = "none" } },
            },
        },
        sections = {
            -- these are to remove the defaults
            lualine_a = {},
            lualine_b = {},
            lualine_y = {},
            lualine_z = {},
            -- These will be filled later
            lualine_c = {},
            lualine_x = {},
        },
        inactive_sections = {
            -- these are to remove the defaults
            lualine_a = {},
            lualine_b = {},
            lualine_y = {},
            lualine_z = {},
            lualine_c = {},
            lualine_x = {},
        },
        tabline = {
            lualine_a = {
                {
                    "buffers",
                    buffers_color = {
                        inactive = { bg = "auto", fg = "auto" },
                        active = "Normal"
                    },
                    mode = 2,
                },
            },
            lualine_b = {},
            -- This component pushes everything in lualine_z to the far right
            lualine_c = { function() return "%=" end },
            lualine_x = {},
            lualine_y = {},
            lualine_z = { "tabs" },
        },
    }

    -- Inserts a component in lualine_c at left section
    local function ins_left(component)
        table.insert(config.sections.lualine_c, component)
    end

    -- Inserts a component in lualine_x at right section
    local function ins_right(component)
        table.insert(config.sections.lualine_x, component)
    end

    ins_left({
        "filename",
        cond = conditions.buffer_not_empty,
        color = { fg = "auto", gui = "bold" },
    })

    -- Insert mid section. You can make any number of sections in neovim :)
    -- for lualine it's any number greater then 2
    ins_left({
        function()
            return "%="
        end,
    })

    ins_right({
        "branch",
        color = { fg = "auto", gui = "bold" },
    })

    ins_right({
        "diff",
        -- Is it me or the symbol for modified us really weird
        symbols = { added = "+", modified = ".", removed = "-" },
        diff_color = {
            added = { fg = "auto" },
            modified = { fg = "auto" },
            removed = { fg = "auto" },
        },
        cond = conditions.hide_in_width,
    })

    lualine.setup(config)
end

