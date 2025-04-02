-- Minimal configuration for noice.nvim focused only on command line features

{
  'folke/noice.nvim',
  event = 'VeryLazy',
  dependencies = {
    -- Required dependencies
    'MunifTanjim/nui.nvim',
    'rcarriga/nvim-notify',
  },
  opts = {
    -- Completely disable all features except cmdline
    messages = {
      enabled = false, -- disable messages
    },
    popupmenu = {
      enabled = false, -- disable popupmenu
    },
    notify = {
      enabled = false, -- disable notify
    },
    lsp = {
      enabled = false, -- disable LSP progress
    },
    health = {
      checker = false, -- disable health checker
    },
    smart_move = {
      enabled = false, -- disable smart-move
    },
    presets = {
      bottom_search = false, -- use classic bottom cmdline for search
      command_palette = false, -- position the cmdline and popupmenu together
      long_message_to_split = false, -- long messages will be sent to a split
      inc_rename = false, -- enables an input dialog for inc-rename.nvim
      lsp_doc_border = false, -- add a border to hover docs and signature help
    },

    -- Enable only the cmdline
    cmdline = {
      enabled = true,
      view = 'cmdline_popup', -- view for the cmdline (cmdline, cmdline_popup)
      opts = {}, -- global options for the cmdline. See section on views
      format = {
        -- conceal: (default=true) This will hide the text in the cmdline that matches the pattern.
        -- view: (default is cmdline view)
        -- opts: any options passed to the view
        -- icon_hl_group: optional hl_group for the icon
        -- title: set to anything or empty string to hide
        cmdline = { pattern = '^:', icon = '', lang = 'vim' },
        search_down = { kind = 'search', pattern = '^/', icon = ' ', lang = 'regex' },
        search_up = { kind = 'search', pattern = '^%?', icon = ' ', lang = 'regex' },
        filter = { pattern = '^:%s*!', icon = '$', lang = 'bash' },
        lua = { pattern = { '^:%s*lua%s+', '^:%s*lua%s*=%s*', '^:%s*=%s*' }, icon = '', lang = 'lua' },
        help = { pattern = '^:%s*he?l?p?%s+', icon = '󰋖 ' },
        input = {}, -- Used by input()
      },
    },

    -- Enable routes only for cmdline
    routes = {
      {
        view = 'notify',
        filter = { event = 'msg_showmode' },
      },
    },
  },
  -- Add additional configuration or keymaps here if needed
  config = function(_, opts)
    local noice = require 'noice'
    noice.setup(opts)

    -- Hide default commandline since we using noice commandlin
    vim.opt.cmdheight = 0

    -- Optional: Add any additional configuration or keymaps below
    -- Example keymap to clear the noice message history
    vim.keymap.set('n', '<leader>nc', function()
      noice.cmd 'dismiss'
    end, { desc = 'Clear Noice Messages' })
  end,
}
