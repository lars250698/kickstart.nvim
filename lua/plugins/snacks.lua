return {
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      bigfile = { enabled = true },
      dashboard = {
        enabled = true,
        sections = {
          { section = 'header' },
          { section = 'keys', gap = 1, padding = 1 },
          { pane = 2, icon = ' ', title = 'Recent Files', section = 'recent_files', indent = 2, padding = 1 },
          { pane = 2, icon = ' ', title = 'Projects', section = 'projects', indent = 2, padding = 1 },
          {
            pane = 2,
            icon = ' ',
            title = 'Git Status',
            section = 'terminal',
            enabled = function()
              return Snacks.git.get_root() ~= nil
            end,
            cmd = 'git status --short --branch --renames',
            height = 5,
            padding = 1,
            ttl = 5 * 60,
            indent = 3,
          },
          { section = 'startup' },
        },
      },
      indent = { enabled = true },
      quickfile = { enabled = true },
      scroll = { enabled = true },
      words = { enabled = true },
      scroll = {
        animate = {
          duration = { step = 15, total = 250 },
          easing = 'linear',
        },
        -- faster animation when repeating scroll after delay
        animate_repeat = {
          delay = 100, -- delay in ms before using the repeat animation
          duration = { step = 5, total = 50 },
          easing = 'linear',
        },
        -- what buffers to animate
        filter = function(buf)
          return vim.g.snacks_scroll ~= false and vim.b[buf].snacks_scroll ~= false and vim.bo[buf].buftype ~= 'terminal'
        end,
      },
    },
    keys = {
      {
        '<leader>bd',
        function()
          Snacks.bufdelete()
        end,
        desc = 'Delete Buffer',
      },
      {
        '<leader>bo',
        function()
          Snacks.bufdelete.other()
        end,
        desc = 'Delete all Buffers except Current',
      },
    },
  },
}
