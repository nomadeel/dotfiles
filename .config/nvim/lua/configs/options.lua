-- Misc
vim.g.mapleader = " "

-- Colours
vim.opt.syntax = enable
vim.opt.termguicolors = true
vim.cmd [[colorscheme nord]]

-- UI
vim.opt.autoindent = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.laststatus = 3 -- to allow telescope to also have a line
vim.opt.fileencoding = "utf-8"

-- Editing
vim.opt.conceallevel = 0
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.updatetime = 300 -- faster update times
vim.opt.clipboard = "unnamedplus"

vim.api.nvim_create_autocmd("BufWritePost", {
  group = vim.api.nvim_create_augroup("FormatGroup", { clear = true }),
  callback = function ()
    vim.cmd("%s/\\s\\+$//e")
  end,
})
