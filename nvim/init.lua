-- Bootstrap lazy.nvim if not installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", 
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Installing Plugins, add more plugins as you want
require("lazy").setup({
  { 'nvim-lua/plenary.nvim' },
  { 'nvim-tree/nvim-web-devicons' },
  { 'MunifTanjim/nui.nvim' },
  { 'nvim-neo-tree/neo-tree.nvim', branch = 'v3.x' },
  { 'hrsh7th/cmp-buffer' },
  { 'hrsh7th/nvim-cmp' },
  { 'L3MON4D3/LuaSnip' },
  { 'saadparwaiz1/cmp_luasnip' },
  { 'rafamadriz/friendly-snippets' },
  { 'nvim-lualine/lualine.nvim' },
  { 'ibhagwan/fzf-lua' },
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
  { 
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
  },
  { 'rcarriga/nvim-notify' },
  { 'folke/noice.nvim' },
  { 'akinsho/bufferline.nvim', version = "*", dependencies = { 'nvim-tree/nvim-web-devicons' }},
})

-- Configuring plugins, tweak these as you want
vim.g.neo_tree_remove_legacy_commands = 1
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.o.laststatus = 3
vim.opt.shortmess:append("I")

require('neo-tree').setup({
  close_if_last_window = true,
  popup_border_style = "rounded",
  enable_git_status = true,
  enable_diagnostics = true,
  filesystem = {
    filtered_items = {
      visible = true,
      hide_dotfiles = false,
      hide_gitignored = false,
    },
    follow_current_file = {
      enabled = true,
    },
  },
  window = {
    position = "left",
    width = 30,
  },
})

require("luasnip.loaders.from_vscode").lazy_load()

local cmp = require'cmp'
local luasnip = require'luasnip'
cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<Tab>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
    ['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = {
    { name = 'luasnip' }, 
    { name = 'buffer' },  
  },
})

require('tokyonight').setup({
  style = "night",
  transparent = false,
  terminal_colors = true,
  styles = {
    comments = { italic = false },
    keywords = { italic = false },
  },
  sidebars = "dark",
  floats = "dark",
})

require('lualine').setup {
  options = {
    theme = 'tokyonight',
    --section_separators = { left = '', right = '' }, 
    --component_separators = { left = '', right = '' },
     section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },
  }
}

require('nvim-treesitter.configs').setup {
  ensure_installed = { "lua", "python", "javascript", "cpp"},
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = false,
  },
}

vim.opt.foldenable = false

vim.notify = require("notify")
require("notify").setup({
  stages = "fade",
})

require("noice").setup({
  notify = { enabled = true },
  lsp = {
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
  },
  presets = {
    bottom_search = false,
    command_palette = true,
    long_message_to_split = true,
    inc_rename = false,
    lsp_doc_border = false,
  },
  views = {
    cmdline_popup = {
      position = { row = 5, col = "50%" },
      size = { width = 60, height = "auto" },
      border = { style = "rounded", padding = { 1, 2 } },
      win_options = { winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" } },
    },
    popupmenu = {
      relative = "editor",
      position = { row = 8, col = "50%" },
      size = { width = 60, height = 10 },
      border = { style = "rounded", padding = { 0, 1 } },
      win_options = { winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" } },
    },
  },
})

vim.api.nvim_set_hl(0, "BufferLineFill", { bg = "#1c1f2e" })
require("bufferline").setup({
 
  options = {
    offsets = {
       {
          filetype = "neo-tree",
          seperator=false
       }
    },
    separator_style = { "|", "|" },
    show_close_icon = true,
    show_buffer_close_icons = true,
    always_show_bufferline=false,
    diagnostics = "nvim_lsp",
    underline_selected = true,
  },
})

-- Configuring Keymaps, tweak these as you want
local opts = {noremap = true, silent = true}

vim.keymap.set("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

vim.keymap.set('i', '<C-h>', '<Left>', opts)
vim.keymap.set('i', '<C-j>', '<Down>', opts)
vim.keymap.set('i', '<C-k>', '<Up>', opts)
vim.keymap.set('i', '<C-l>', '<Right>', opts)
vim.keymap.set('i', 'kj', '<ESC>', opts)
vim.keymap.set('i', '<C-s>', '<ESC>:w<CR>i', opts)

vim.keymap.set('n', '<Leader>f', ':FzfLua files<CR>', opts)
vim.keymap.set('n', '<Leader>e', ':Neotree toggle<CR>', opts)
vim.keymap.set('n', '<Leader>w', ':w<CR>', opts)
vim.keymap.set('n', '<Leader>l', ':Lazy<CR>', opts)  

-- Configuring general nvim settings, tweak these as you want
vim.opt.termguicolors = true
vim.opt.autoindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.cmd.colorscheme("tokyonight")
vim.cmd('set number')
vim.o.showmode = false
vim.o.showtabline = 2

