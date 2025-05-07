vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.o.laststatus = 3
local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.local/share/nvim/plugged')

Plug('nvim-lua/plenary.nvim')
Plug('nvim-tree/nvim-web-devicons') -- optional, for icons
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

vim.g.neo_tree_remove_legacy_commands = 1

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


-- Load LuaSnip and friendly-snippets
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
    { name = 'luasnip' }, -- snippets from friendly-snippets
    { name = 'buffer' },  -- buffer words
  },
})

require('lualine').setup {
  options = {
    theme = 'horizon',
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },
  }
}


vim.keymap.set('n', '<C-n>', ':Neotree toggle<CR>', { desc = 'Toggle Neo-tree' })

vim.opt.termguicolors=true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.cmd('colorscheme github_dark_default')
vim.cmd('set relativenumber')
vim.keymap.set('i', 'kj', '<ESC>', { desc = 'Exit Insert mode with kj' })

vim.o.showmode = false
