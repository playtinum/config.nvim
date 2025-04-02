-- Configuration for git integration with neogit plugin
return {
  {
    -- Neogit plugin configuration
    'NeogitOrg/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim', -- required dependency
      'nvim-telescope/telescope.nvim', -- optional: for better UI in some operations
      'sindrets/diffview.nvim', -- optional: for improved diff view
    },
    -- Lazy load on VeryLazy event, command, or keymap
    event = 'VeryLazy',
    cmd = 'Neogit',
    keys = function()
      local neogit = require 'neogit'
      return {
        {
          '<leader>gg',
          function()
            neogit.open()
          end,
          desc = 'Open [g]it with [g]',
        },
        {
          '<leader>gc',
          function()
            neogit.open { 'commit' }
          end,
          desc = '[G]it [c]ommit',
        },
        {
          '<leader>gp',
          function()
            neogit.open { 'push' }
          end,
          desc = '[G]it [p]ush',
        },
        {
          '<leader>gl',
          function()
            neogit.open { 'pull' }
          end,
          desc = '[G]it [p]ull',
        },
      }
    end,
    -- Plugin initialization and configuration
    opts = {
      -- Configuration options
      integrations = {
        diffview = true, -- Use diffview.nvim for diff operations
        telescope = true, -- Use telescope.nvim for fuzzy finding
      },
      -- Customize UI
      kind = 'tab', -- open in new tab (alternatives: split, vsplit, floating)
      -- Disable certain features if needed
      disable_context_highlighting = false,
      disable_signs = false,
      disable_commit_confirmation = false,
      -- Customize git commands
      git_services = {
        ['github.com'] = {
          viewer = 'https://github.com/${owner}/${repo}/tree/${branch}/${relpath}?at=${commit}#L${line}',
          blame = 'https://github.com/${owner}/${repo}/blame/${branch}/${relpath}#L${line}',
        },
      },
      -- Auto refresh to reflect file changes automatically
      auto_refresh = true,
    },
    -- Additional configuration through init function if needed
    init = function()
      -- You can add any additional setup here
      vim.g.neogit_use_integrations = true
    end,
  },
}
