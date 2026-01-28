vim.opt.rtp:prepend(vim.fn.stdpath("data") .. "/lazy.nvim")

require("lazy").setup({
    -- Icons (Need to install Nerd Font - I am using CaskaydiaMono Nerd Font and Font Size 14)
    {
        "nvim-tree/nvim-web-devicons",
        config = function()
            require("nvim-web-devicons").setup({
                default = true;
            })
           end,
        },

        -- File explorer
         {
      "nvim-tree/nvim-tree.lua",
      dependencies = { "nvim-tree/nvim-web-devicons" },
      config = function()
        require("nvim-tree").setup({
            view = {
                width = 30, 
                side = "left", 
                adaptive_size = false,
                preserve_window_proportions = true
            },
            renderer = { icons = { show = { file = true, folder = true, folder_arrow = true, }, }, },
            -- git = { enable = true, ignore = true },
            filters = { git_ignored = false, dotfiles = false },
        })
      end,
    },


        -- Status line
         {
          "nvim-lualine/lualine.nvim",
          config = function()
          require("lualine").setup({
              options = { icons_enabled = true,}
          })
          end,
         },
         {
            "tpope/vim-commentary",
            event = "VeryLazy",  -- lazy load on first file open
            -- gcc for single line toggle commenting
            -- gc for visual selection and toggle commenting
         },
         {
            "folke/which-key.nvim",
            enabled = false,
            event = "VeryLazy",
            config = function()
                require("which-key").setup {
                    -- your options go here (optional)
                    plugins = {
                        marks = true,       -- show marks
                        registers = true,   -- show registers
                        spelling = {
                            enabled = true,
                            suggestions = 20,
                        },
                    },
                    key_labels = {},
                    icons = {
                        breadcrumb = "»",
                        separator = "➜",
                        group = "+",
                    },
                    window = {
                        border = "rounded",
                        position = "bottom",
                        margin = {1,0,1,0},
                        padding = {2,2,2,2},
                    },
                    layout = {
                        height = {min = 4, max = 25},
                        width = {min = 20, max = 50},
                        spacing = 3,
                    },
                }

                -- Example keybinding registration
                local wk = require("which-key")
                 wk.register({
                    f = {
                        name = "File",
                        f = "Find File",
                        r = "Recent Files",
                    },
                    b = {
                        name = "Buffer",
                        d = "Delete Buffer",
                        n = "Next Buffer",
                    },
                    w = { name = "Write" },
                    q = { name = "Quit"},
                    t = { name = "Tab / Terminal"}
                }, { prefix = "<leader>" }) 
            end,
         },
        -- Fuzzy finder
         {
      "nvim-telescope/telescope.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
      config = function()
        require("telescope").setup({
            defaults = {
            layout_strategy = "horizontal", -- or 'vertical'
            layout_config = {
                width = 0.8,
                height = 0.8,
                preview_width = 0.6,
            },
            sorting_strategy = "ascending",
            file_ignore_patterns = {
                "%.git/*", -- Git
                "node_modules/*", -- Node
                "build/*", -- Gradle
                "target/*", -- Maven
                "%.github/*",
                "%.settings/*",
                "%.vscode/*",
                "%.classpath/*",
                "%.project/*",
                "%.mvn/*",
                "%*.exe"
            }
        },
        })
      end,
    },

    {
        "jake-stewart/multicursor.nvim",
        branch = "1.0",
        config = function()
            local mc = require("multicursor-nvim")
            mc.setup()

            local set = vim.keymap.set

            -- Add or skip cursor above/below the main cursor.
            set({"n", "x"}, "<M-UP>", function() mc.lineAddCursor(-1) end)
            set({"n", "x"}, "<M-DOWN>", function() mc.lineAddCursor(1) end)
            set({"n", "x"}, "<M-LEFT>", function() mc.lineSkipCursor(-1) end)
            set({"n", "x"}, "<M-RIGHT>", function() mc.lineSkipCursor(1) end)

            -- Add or skip adding a new cursor by matching word/selection
            set({"n", "x"}, "<C-UP>", function() mc.matchAddCursor(-1) end)
            set({"n", "x"}, "<C-DOWN>", function() mc.matchAddCursor(1) end)
            set({"n", "x"}, "<C-M-UP>", function() mc.matchSkipCursor(-1) end)
            set({"n", "x"}, "<C-M-DOWN>", function() mc.matchSkipCursor(1) end)

            -- Add and remove cursors with control + left click.
            set("n", "<c-leftmouse>", mc.handleMouse)
            set("n", "<c-leftdrag>", mc.handleMouseDrag)
            set("n", "<c-leftrelease>", mc.handleMouseRelease)

            -- Disable and enable cursors.
            set({"n", "x"}, "<c-q>", mc.toggleCursor)

            -- Mappings defined in a keymap layer only apply when there are
            -- multiple cursors. This lets you have overlapping mappings.
            mc.addKeymapLayer(function(layerSet)

                -- Select a different cursor as the main one.
                layerSet({"n", "x"}, "<left>", mc.prevCursor)
                layerSet({"n", "x"}, "<right>", mc.nextCursor)

                -- Delete the main cursor.
                layerSet({"n", "x"}, "<leader>x", mc.deleteCursor)

                -- Enable and clear cursors using escape.
                layerSet("n", "<esc>", function()
                    if not mc.cursorsEnabled() then
                        mc.enableCursors()
                    else
                        mc.clearCursors()
                    end
                end)
            end)
        end
    },

     {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
      config = function()
        require("nvim-treesitter").setup({
          ensure_installed = {
            "c",
            "cpp",
            "java",
            "lua",
            "html",
            "css",
            "jsx",
            "tsx",
            "javascript",
            "typescript",
            "sql",
          },
          highlight = { enable = true },
          indent = { enable = true },
        })
      end,
    },
    -- Mason (REQUIRED)
      {
        "williamboman/mason.nvim",
        config = function()
          require("mason").setup()
        end,
      },

      -- LSP config
      {
        "neovim/nvim-lspconfig",
      },

      -- Mason + LSP bridge
      {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
          "williamboman/mason.nvim",
          "neovim/nvim-lspconfig",
        },
        config = function()
          require("mason-lspconfig").setup({
            ensure_installed = {}, -- list of preinstalled lsp
          })
        end,
      },

      -- Autocompletion
      {
        "hrsh7th/nvim-cmp",
        dependencies = {
          "hrsh7th/cmp-nvim-lsp",
          "L3MON4D3/LuaSnip",
        },
      },
      {
         "windwp/nvim-autopairs",
            event = "InsertEnter",
            config = function()
                require("nvim-autopairs").setup({
                    check_ts = true,   -- enable treesitter
                    enable_check_bracket_line = false,
                })
            end,
      },
      -- auto close tag
      {
        "windwp/nvim-ts-autotag",
      },
      {
        "folke/flash.nvim",
            event = "VeryLazy",
            opts = {},
            config = function()
                local flash = require("flash")

                -- VS Code EasyMotion style
                -- Jump to words **above** the cursor
                vim.keymap.set({"n","x"}, "<leader><leader>h", function()
                    flash.jump({
                        search = { mode = "word", direction = "backward" }, -- jump upward
                        labels = "asdfghjklqwertyuiopzxcvbnm",
                        multi_char = true,
                        highlight = { backdrop = false },
                        pattern = [[\<\w]]
                    })
                end)
                -- Jump to words **below** the cursor
                vim.keymap.set({"n","x"}, "<leader><leader>l", function()
                    flash.jump({
                        search = { mode = "word", direction = "forward" }, -- jump downward
                        labels = "asdfghjklqwertyuiopzxcvbnm",
                        multi_char = true,
                        highlight = { backdrop = false },
                        pattern = [[\<\w]]
                    })
                end)
                vim.keymap.set({"n","x"}, "<leader><leader>w", function()
                    flash.jump({
                        search = { mode = "word" },
                        highlight = { backdrop = false },
                        labels = "asdfghjklqwertyuiopzxcvbnm",
                        multi_char = true,
                    })
                end)

                vim.keymap.set({"n","x"}, "<leader><leader>e", function()
                    flash.jump({
                        search = { mode = "word_end" },
                        highlight = { backdrop = false },
                        labels = "asdfghjklqwertyuiopzxcvbnm",
                        multi_char = true,
                    })
                end)

                vim.keymap.set({"n","x","o"}, "<leader><leader>s", function()
                    flash.jump({
                        search = { mode = "exact", max_length = 1 },
                        labels = "asdfghjklqwertyuiopzxcvbnm",
                        multi_char = true,
                    })
                end)
            end
      }
     })
