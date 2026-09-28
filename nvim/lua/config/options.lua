----------------------
---- Nvim options ----
----------------------

local o = vim.opt
local g = vim.g


---=== Numbers ===---
o.number = true
o.relativenumber = true
o.showmode = false


---=== Searching ===---
o.incsearch = true
o.ignorecase = true
o.smartcase = true


---=== Indent ===---
o.shiftwidth = 2
o.softtabstop = 2
o.tabstop = 2
o.expandtab = true
o.smartindent = true


---=== Leader ===---
g.mapleader = " "
g.maplocalleader = ","

o.updatetime = 500
o.title = true -----> nvim manages the buffer name, more in autocmds.lua


---=== Python3 provider ===---
g.python3_host_prog = "/usr/bin/python3"


---=== Deactivate spell-checking in comments ===---
vim.api.nvim_create_autocmd('Syntax', {
  pattern = '*',
  command = 'syntax cluster Spell remove=Comment',
})

---=== Longer indents for certain file types ===---
local four_space_filetypes = {
  "python", "c", "cpp", "rust", "go", "java", "json"
}

vim.api.nvim_create_autocmd("FileType", {
  pattern = four_space_filetypes,
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
  end
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "make" },
  callback = function()
    vim.opt_local.expandtab = false -- tabs reales
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
  end
})


---=== Language ===---
o.encoding = "utf-8"
o.clipboard:append('unnamedplus')


---=== If you use nvim on WSL ===---
if vim.fn.has('wsl') == 1 then
  vim.g.clipboard = {
    name = 'win32yank-wsl',
    copy = {
      ['+'] = 'win32yank.exe -i --crlf',
      ['*'] = 'win32yank.exe -i --crlf',
    },
    paste = {
      ['+'] = 'win32yank.exe -o --lf',
      ['*'] = 'win32yank.exe -o --lf',
    },
    cache_enabled = 0,
  }
end

return {
  opts = o,
  g = g,
}
