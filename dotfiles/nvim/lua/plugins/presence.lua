return {
    {
        "andweeb/presence.nvim",
        config = function()
            require("presence").setup({

                auto_update         = true,
                neovim_image_text   = "The One True Text Editor",
                main_image          = "neovim",
                log_level           = nil,
                debounce_timeout    = 10,
                enable_line_number  = true,
                blacklist           = {},
                buttons             = true,
                file_assets         = {},
                show_time           = true,


                editing_text        = "Editing %s",
                file_explorer_text  = function(explorer_name)
                    if explorer_name == "NvimTree" then
                        return "Browsing my filetree"
                    end
                   
                    if explorer_name == "Telescope" then
                        return "Searching files"
                    end

                    return string.format("Pondering %s", explorer_name)
                end,
                git_commit_text     = "Committing changes",
                reading_text        = function(filename)
                    if string.find(filename, "#toggleterm", 1, true) then
                        return "Staring at my terminal"
                    else
                        return string.format("Staring at %s", filename)
                    end
                end,
                workspace_text      = "Working on %s",
                line_number_text    = "Tripping on line %s/%s",
            })
        end
    }
}
