return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },
    config = function()
      local builtin = require("telescope.builtin")
      -- Search files in the current directory
      vim.keymap.set('n', '<leader>pf', function()
        builtin.find_files({
          hidden = true,
          layout_config = { prompt_position = "bottom" }
        })
      end)

      -- Search files in the neovim config
      vim.keymap.set('n', '<leader>en', function()
        builtin.find_files({
          cwd = vim.fn.stdpath('config'),
          hidden = true,
          layout_config = { prompt_position = "bottom" }
        })
      end)

      vim.keymap.set('n', '<leader>fh', builtin.help_tags)

      vim.keymap.set('n', '<leader>ps', function()
        builtin.grep_string({ search = vim.fn.input("Grep > ") });
      end, {})
    end,
  }
}
