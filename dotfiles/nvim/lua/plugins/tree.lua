return {
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,

        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },

        config = function()
            local function my_on_attach(bufnr)
                local api = require("nvim-tree.api")

                local function opts(desc)
                    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
                end

                -- Load default mappings first
                api.config.mappings.default_on_attach(bufnr)

                -- Smart Git Toggle Staged Keybind
                vim.keymap.set("n", "ga", function()
                    local node = api.tree.get_node_under_cursor()
                    
                    if not node or node.name == ".." or not node.absolute_path then
                        return
                    end

                    -- Check current git status of the selected file
                    vim.fn.jobstart({ "git", "status", "--porcelain", node.absolute_path }, {
                        stdout_buffered = true,
                        on_stdout = function(_, data)
                            local status_line = data and data[1] or ""
                            
                            -- Determine if file is staged (Staged indicator sits in the first column)
                            -- e.g., 'A ', 'M ', 'D ' means staged. ' M', '??' means unstaged.
                            local first_char = string.sub(status_line, 1, 1)
                            local is_staged = first_char ~= " " and first_char ~= "?" and first_char ~= ""

                            -- Select action based on current status
                            local git_cmd = is_staged and { "git", "restore", "--staged", node.absolute_path } 
                                                       or { "git", "add", node.absolute_path }
                            local action_msg = is_staged and "Unstaged: " or "Staged: "

                            -- Execute the action
                            vim.fn.jobstart(git_cmd, {
                                on_exit = function(_, exit_code)
                                    if exit_code == 0 then
                                        api.tree.reload()
                                        vim.notify(action_msg .. node.name, vim.log.levels.INFO)
                                    else
                                        vim.notify("Git action failed for: " .. node.name, vim.log.levels.ERROR)
                                    end
                                end,
                            })
                        end,
                    })
                end, opts("Git Toggle Stage"))
            end

            require("nvim-tree").setup({
                on_attach = my_on_attach, -- Hook up our custom keybinds function
                git = {
                    enable = true, -- Ensure nvim-tree reads git statuses
                },
                view = {
                    float = {
                        enable = true,
                        open_win_config = function()
                            local width = math.floor(vim.o.columns * 0.9) - 2
                            local height = math.floor(vim.o.lines * 0.9)

                            return {
                                relative = "editor",
                                width = width,
                                height = height,
                                row = math.floor((vim.o.lines - height) / 2),
                                col = math.floor((vim.o.columns - width) / 2) - 1,
                                border = "rounded",
                            }
                        end,
                    },
                },
            })

            vim.keymap.set("n", "<leader>d", "<cmd>NvimTreeToggle<cr>")
        end,
    },
}

