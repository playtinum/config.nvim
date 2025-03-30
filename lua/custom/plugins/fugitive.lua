-- Configure git integration for Neovim using vim-fugitive

return {
  'tpope/vim-fugitive',
  cmd = {
    'G',
    'Git',
    'Gdiffsplit',
    'Gread',
    'Gwrite',
    'Ggrep',
    'GMove',
    'GDelete',
    'GBrowse',
  },
  keys = {
    -- Basic git commands
    { '<leader>gs', '<cmd>Git<cr>', desc = '[G]it [s]tatus' },
    { '<leader>gcm', '<cmd>Git commit<cr>', desc = '[G]it [c]ommit with [c]essage' },
    { '<leader>gca', '<cmd>Git commit<cr>', desc = '[G]it [c]ommit with [a]mend' },
    { '<leader>gp', '<cmd>Git push<cr>', desc = '[G]it [p]ush' },
    { '<leader>gP', '<cmd>Git pull<cr>', desc = '[G]it [P]ull' },
    { '<leader>gf', '<cmd>Git fetch --all<cr>', desc = '[G]it [f]etch all' },

    -- Branch operations
    { '<leader>gbr', '<cmd>Git branch<cr>', desc = '[G]it [b]ranch l[i]st' },
    { '<leader>gco', '<cmd>Git checkout ', desc = '[G]it [c]heck[o]ut (requires branch name)' },
    { '<leader>gcb', '<cmd>Git checkout -b ', desc = '[G]it [c]reate [b]ranch (requires name)' },

    -- Diff and merge
    { '<leader>gd', '<cmd>Gdiffsplit<cr>', desc = '[G]it [D]iff' },
    { '<leader>gm', '<cmd>Git mergetool<cr>', desc = '[G]it [M]erge tool' },

    -- File operations
    { '<leader>ga', '<cmd>Git add %<cr>', desc = '[G]it [a]dd current file' },
    { '<leader>gA', '<cmd>Git add .<cr>', desc = '[G]it [a]dd all files' },
    { '<leader>gu', '<cmd>Git reset -q %<cr>', desc = '[G]it [u]nstage current file' },

    -- Log and blame
    { '<leader>gbl', '<cmd>Git blame<cr>', desc = '[G]it [bl]ame' },
    { '<leader>glo', '<cmd>Git log<cr>', desc = '[G]it [lo]g' },
    { '<leader>glf', '<cmd>Git log --follow %<cr>', desc = '[G]it [l]og [f]ile history' },
  },
  config = function()
    -- Optional: Custom git log format
    vim.g.fugitive_log_format = '%C(yellow)%h%Cred%d %Creset%s %Cgreen(%ar) %C(bold blue)<%an>%Creset'

    -- Create user command for showing abbreviated git status
    vim.api.nvim_create_user_command('Gst', function()
      vim.cmd 'Git status -s'
    end, {})

    -- Optional: Create custom highlights for git status buffer
    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'fugitive',
      callback = function()
        -- Optional: Additional buffer-local mappings specific to fugitive buffers
        vim.keymap.set('n', 'cc', '<cmd>Git commit<CR>', { buffer = true, desc = 'Git commit' })
        vim.keymap.set('n', 'ca', '<cmd>Git commit --amend<CR>', { buffer = true, desc = 'Git commit --amend' })
        vim.keymap.set('n', 'P', '<cmd>Git push<CR>', { buffer = true, desc = 'Git push' })
        vim.keymap.set('n', 'p', '<cmd>Git pull<CR>', { buffer = true, desc = 'Git pull' })
      end,
    })
  end,
}
