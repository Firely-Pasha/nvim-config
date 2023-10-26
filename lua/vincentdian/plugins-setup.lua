-- auto install packer if not installed
local ensure_lazyvim = function()
	local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
	if not vim.loop.fs_stat(lazypath) then
		vim.fn.system({
			"git",
			"clone",
			"--filter=blob:none",
			"https://github.com/folke/lazy.nvim.git",
			"--branch=stable", -- latest stable release
			lazypath,
		})
	end
	vim.opt.rtp:prepend(lazypath)
end

local packer_bootstrap = ensure_lazyvim() -- true if packer was just installed

local status, lazy = pcall(require, "lazy")
if not status then
	return
end

lazy.setup("vincentdian.plugins")
