return {
  -- the colorscheme should be available when starting Neovim
	--
	
	{
  "navarasu/onedark.nvim",
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    require('onedark').setup {
      style = 'deep', -- 'deep', 'darker', 'cool', 'warm', 'warmer', 'light'
    }


    --require('onedark').load()
  end
},
  {
    "folke/tokyonight.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme tokyonight]])
    end,
  }

}
