-- general
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "gruvbox"

-- vim options
vim.opt.relativenumber = true
vim.opt.smartindent = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.hlsearch = true
-- vim.opt.tabstop = 4
-- vim.opt.softtabstop = 4
-- vim.opt.shiftwidth = 4
vim.opt.scrolloff = 8
vim.opt.fileformat = "unix"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
-- code folding
vim.opt.foldmethod = "indent"
vim.opt.foldlevel = 99
vim.opt.colorcolumn = "80"
-- vim.g.switch_custom_definitions = []

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
-- lvim.keys.normal_mode["<Leader>s"] = ":wa<cr>"

lvim.keys.insert_mode["<C-h>"] = "<left>"
lvim.keys.insert_mode["<C-j>"] = "<down>"
lvim.keys.insert_mode["<C-k>"] = "<up>"
lvim.keys.insert_mode["<C-l>"] = "<right>"
lvim.keys.normal_mode["y"] = "y" -- must fix vim-fugitive stupid key bindings
-- unmp a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = ""
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

  -- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
  -- lvim.builtin.telescope.on_config_done = function()
  --   local actions = require "telescope.actions"
  --   -- for input mode
  --   lvim.builtin.telescope.defaults.mappings.i["<C-j>"] = actions.move_selection_next
  --   lvim.builtin.telescope.defaults.mappings.i["<C-k>"] = actions.move_selection_previous
  --   lvim.builtin.telescope.defaults.mappings.i["<C-n>"] = actions.cycle_history_next
  --   lvim.builtin.telescope.defaults.mappings.i["<C-p>"] = actions.cycle_history_prev
  --   -- for normal mode
  --   lvim.builtin.telescope.defaults.mappings.n["<C-j>"] = actions.move_selection_next
--   lvim.builtin.telescope.defaults.mappings.n["<C-k>"] = actions.move_selection_previous
-- end

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["s"] = {":wa<CR>", "Save all"}
lvim.builtin.which_key.mappings["S"] = { 
  name = "+Search",
  b = {"<Cmd>Telescope git_branches<CR>", "Checkout branch"},
  C = {"<Cmd>Telescope commands<CR>", "Commands"},
  c = {"<Cmd>Telescope colorscheme<CR>", "Colorscheme"},
  t = {"<Cmd>Telescope live_grep<CR>", "Text"},
  p = {"<Cmd>lua require('telescope.builtin.internal').colorscheme({enable_preview = true})<CR>", "Colorscheme with Preview"},
  h = {"<Cmd>Telescope help_tags<CR>", "Find help"},
  k = {"<Cmd>Telescope keymaps<CR>", "Keymaps"},
  f = {"<Cmd>Telescope find_files<CR>", "Find files"},
  r = {"<Cmd>Telescope oldfiles<CR>", "Open Recent File" },
  M = {"<Cmd>Telescope man_pages<CR>", "Man Pages"},
  R = {"<Cmd>Telescope registers<CR>", "Registers"},
}
lvim.builtin.which_key.mappings.g.l = { "<cmd>lua require 'gitsigns'.blame_line(true)<cr>", "Blame"}
lvim.builtin.which_key.mappings.y = { "", ""}
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnostics" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnostics" },
-- }

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.dap.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.side = "left"
lvim.builtin.nvimtree.show_icons.git = 1
lvim.builtin.lualine.active = true
-- lvim.builtin.lualine.options 
-- lvim.builtin.bufferline.active = true

-- Other Plugins
-- lvim.plugins = {
--   {"gruvbox-community/gruvbox"}
-- }

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = "maintained"
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true
-- generic LSP settings
-- you can set a custom on_attach function that will be used for all the language servers
-- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
lvim.lang.vue.lsp.setup.init_options.config.vetur.completion.tagCasing = "Camel"
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end
-- you can overwrite the null_ls setup table (useful for setting the root_dir function)
-- lvim.lsp.null_ls.setup = {
--   root_dir = require("lspconfig").util.root_pattern("Makefile", ".git", "node_modules"),
-- }
-- or if you need something more advanced
-- lvim.lsp.null_ls.setup.root_dir = function(fname)
--   if vim.bo.filetype == "javascript" then
--     return require("lspconfig/util").root_pattern("Makefile", ".git", "node_modules")(fname)
--       or require("lspconfig/util").path.dirname(fname)
--   elseif vim.bo.filetype == "php" then
--     return require("lspconfig/util").root_pattern("Makefile", ".git", "composer.json")(fname) or vim.fn.getcwd()
--   else
--     return require("lspconfig/util").root_pattern("Makefile", ".git")(fname) or require("lspconfig/util").path.dirname(fname)
--   end
-- end

-- set a formatter if you want to override the default lsp one (if it exists)
lvim.lang.python.formatters = {
  {
    exe = "black",
  }
}
-- set an additional linter
lvim.lang.python.linters = {
  {
    exe = "flake8",
  }
}
-- j
-- Additional Plugins
lvim.plugins = {
  --     {"folke/tokyonight.nvim"},
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  {"gruvbox-community/gruvbox"},
  {"tpope/vim-fugitive"},
  {"AndrewRadev/switch.vim",
  },
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- }
lvim.autocommands._general_settings = {
  { "TextYankPost","*", "lua require('vim.highlight').on_yank({higroup = 'Search', timeout = 1000})"},
}

lvim.autocommands.custom_groups = {
  {"BufWinEnter", "*", ""}
}
