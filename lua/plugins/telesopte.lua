return
{
	 -- Fuzzy Finder (files, lsp, etc)
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { -- If encountering errors, see telescope-fzf-native README for installation instructions
        'nvim-telescope/telescope-fzf-native.nvim',

        build = 'make',

        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },

      -- Useful for getting pretty icons, but requires a Nerd Font.
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },
    config = function()
      require('telescope').setup {
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
        },
      }

      -- Enable Telescope extensions if they are installed
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')

      local builtin = require 'telescope.builtin'
      --make the ff so the node_modules are ignored
	vim.keymap.set('n', '<leader>ff', function()
  builtin.find_files({
    -- Exclude the 'node_modules' directory
    find_command = { 'rg', '--files', '--glob', '!.git/', '--glob', '!node_modules/**' }
  })
end, { desc = "Find files while ignoring node_modules" })

      vim.keymap.set('n', '<leader>fs', builtin.live_grep, {})
      vim.keymap.set('n', '<leader>te', builtin.registers, {})


    end,

}
