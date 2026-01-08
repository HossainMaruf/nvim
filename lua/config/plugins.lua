vim.opt.rtp:prepend(vim.fn.stdpath("data") .. "/lazy/lazy.nvim")

require("lazy").setup({

    -- Theme
    { 
     "folke/tokyonight.nvim",
     priority = 1000, -- load first
     config = function()
    vim.cmd.colorscheme("tokyonight")
     end, 
    },

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
        view = {width = 30, side = "left"},
        renderer = { icons = { show = { file = true, folder = true, folder_arrow = true, }, }, },
        -- git = { enable = true, ignore = true },
        filters = { git_ignored = false, dotfiles = false },
    })
    vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
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
    vim.keymap.set("n", "<leader>ff", require("telescope.builtin").find_files)
    vim.keymap.set("n", "<leader>fg", require("telescope.builtin").live_grep)
  end,
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
    "nvim-ts-autotag",
      config = function()
        require("nvim-ts-autotag").setup({
            opts = {
                enable_close = true, -- Auto close tags
                enable_rename = true, -- Auto rename pairs of tags
                enable_close_on_slash = false -- Auto close on trailing </
            },
            per_filetype = {
                
            }
        })
      end,
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
