-- Installing Plugins, add more plugins as you want
local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/AppData/Local/nvim/plugged')
Plug('nvim-lua/plenary.nvim')
Plug('nvim-tree/nvim-web-devicons')
Plug('MunifTanjim/nui.nvim')
Plug('nvim-neo-tree/neo-tree.nvim', { ['branch'] = 'v3.x' })
Plug('hrsh7th/cmp-buffer')
Plug('hrsh7th/nvim-cmp')
Plug('L3MON4D3/LuaSnip')
Plug('saadparwaiz1/cmp_luasnip')
Plug('rafamadriz/friendly-snippets')
Plug('projekt0n/github-nvim-theme')
Plug('nvim-lualine/lualine.nvim')
vim.call('plug#end')

-- Configuring plugins, tweak these as you want
vim.g.neo_tree_remove_legacy_commands = 1
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.o.laststatus = 3
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
require('lualine').setup {
  options = {
    theme = 'horizon',
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },
  }
}

-- Configuring Keymaps, tweak these as you want
vim.keymap.set('n', '<C-n>', ':Neotree toggle<CR>', {silent=true, desc = 'Toggle Neo-tree'})
vim.keymap.set('i', 'kj', '<ESC>', {silent=true, desc = 'Exit Insert mode with kj'})
vim.keymap.set('n', '<Tab>', ':bnext<CR>', {silent = true, desc = "Next buffer"})
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', {silent = true, desc = "Previous buffer"})


-- Configuring general Nvim settings, tweak these as you want
vim.opt.termguicolors=true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.cmd('colorscheme github_dark_default')
vim.cmd('set relativenumber')
vim.o.showmode = false