return {
  'sindrets/diffview.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  cmd = { 'DiffviewOpen', 'DiffviewClose', 'DiffviewFileHistory' },
  keys = {
    { '<leader>gd', '<cmd>DiffviewOpen<cr>',          desc = '[G]it [D]iffview (working tree)' },
    {
      '<leader>gb',
      function()
        local base = vim.fn.system('git rev-parse --abbrev-ref origin/HEAD 2>/dev/null'):gsub('%s+', '')
        if base == '' or base:match('^fatal') then
          for _, candidate in ipairs({ 'origin/main', 'origin/master' }) do
            local result = vim.fn.system('git rev-parse --verify ' .. candidate .. ' 2>/dev/null'):gsub('%s+', '')
            if result ~= '' and not result:match('^fatal') then
              base = candidate
              break
            end
          end
        end
        vim.cmd('DiffviewOpen ' .. base .. '...HEAD')
      end,
      desc = '[G]it diff [B]ranch vs base',
    },
    { '<leader>gD', '<cmd>DiffviewClose<cr>',         desc = '[G]it [D]iffview close' },
    { '<leader>gf', '<cmd>DiffviewFileHistory %<cr>', desc = '[G]it [F]ile history' },
    { '<leader>gl', '<cmd>DiffviewFileHistory<cr>',   desc = '[G]it [L]og (branch)' },
  },
  config = function()
    require('diffview').setup {}
    vim.api.nvim_set_hl(0, 'DiffAdd',    { bg = '#1e3a2a' })
    vim.api.nvim_set_hl(0, 'DiffDelete', { bg = '#3a1e1e' })
    vim.api.nvim_set_hl(0, 'DiffChange', { bg = '#1e2a3a' })
    vim.api.nvim_set_hl(0, 'DiffText',   { bg = '#2a3d55', bold = true })
  end,
}
