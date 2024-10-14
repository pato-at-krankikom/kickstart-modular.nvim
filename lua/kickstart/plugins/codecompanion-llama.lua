return {
  'olimorris/codecompanion.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
    'hrsh7th/nvim-cmp',
    'nvim-telescope/telescope.nvim',
    { 'stevearc/dressing.nvim', opts = {} },
  },
  config = function()
    require('codecompanion').setup {
      adapters = {
        local_llama = function()
          return require('codecompanion.adapters').extend('ollama', {
            name = 'local_llama',
            schema = {
              model = {
                default = 'deepseeker-code',
              },
            },
          })
        end,
      },
    }
  end,
}
