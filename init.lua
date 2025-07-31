--vim.opt.guicursor = ""
vim.g.mapleader = " "
vim.opt.textwidth = 100
vim.opt.nu = true
vim.opt.relativenumber = true


--vim.g.loaded_netrw = 1
--vim.g.loaded_netrwPlugin = 1


vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.opt.smartindent = true

vim.opt.swapfile = false


-- help me crewaet a togal that togal the :se hlsearch with <leader>h
--
vim.keymap.set("n", "<leader>h", function()
	if vim.opt.hlsearch:get() then
		vim.opt.hlsearch = false
	else
		vim.opt.hlsearch = true
	end
end)

vim.keymap.set("v", "<leader>q", function()
  vim.cmd('normal! ""y')
  local selected_text = vim.fn.getreg('"'):gsub("\n", " ")  -- flatten to single line
  selected_text = vim.fn.shellescape(selected_text)
  local cmd = "edge-playback --rate=+25% -v \"en-US-AvaMultilingualNeural\" --text " .. selected_text
  vim.fn.jobstart(cmd, { detach = true })

  vim.notify("Speaking selected text...", vim.log.levels.INFO)
end, { desc = "Text-to-Speech with edge-playback", silent = true })

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "tex", "plaintex", "bib" },
  callback = function()
	vim.cmd("set spell")
	vim.opt_local.spelllang = "da"
	vim.cmd.colorscheme("desert")


	-- add a leader 
	
    vim.notify("TeX file detected")  -- optional debug
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
    vim.opt_local.textwidth = 70
    vim.opt_local.colorcolumn = "70"
    vim.opt_local.formatoptions:append("t")
  end
})



-- if the fikle type is .glsl then the colorcolumn onedark
vim.api.nvim_create_autocmd("FileType", {
  pattern = { ".glsl" },
	-- add this leader>r # python shadertoy-render.py .\first.glsl --size=655x1030
	vim.keymap.set("n", "<leader>r", function()
		local file = vim.fn.expand("%:p")
		local cmd = "python shadertoy-render.py " .. file .. " --size=655x1030"
		vim.fn.jobstart(cmd, { detach = false })
		vim.notify("Rendering shader: " .. file, vim.log.levels.INFO)
	end, { desc = "Render ShaderToy shader", silent = true }),

  callback = function()
	vim.cmd.colorscheme("onedark")
  end
})

-- set undo to 1000 leves
-- set save history to 1000 entries
vim.opt.undolevels = 1000
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")


vim.keymap.set("n","<leader>fh",vim.cmd.Ex)
vim.keymap.set("n","<leader>qt",vim.cmd.q)

vim.keymap.set("v","<leader>y", '"+y')
vim.keymap.set("n","<leader>y", '"+y')
vim.keymap.set("n","<leader>w", ':w<CR>')

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.opt.wrap = true

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
	{ import = "plugins" },

})
