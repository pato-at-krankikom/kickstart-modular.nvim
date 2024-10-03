return {
  'goolord/alpha-nvim',
  dependencies = {
    'echasnovski/mini.icons',
    'nvim-lua/plenary.nvim',
  },
  config = function()
    local alpha = require 'alpha'
    local theme = require 'custom.themes.alpha.random'

    -- For a random banner
    alpha.setup(theme.config())

    -- Or for a specific banner
    -- alpha.setup(random_theme.config('godzilla'))
  end,
}
