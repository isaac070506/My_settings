---------------------
---- Treesitter -----
---------------------

-- Treesitter.nvim: Install, update and remove Treesitter parsers
-- URL: https://github.com/nvim-treesitter/nvim-treesitter

return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  version = false,
  build = ":TSUpdate",
  -- Highlighting and autoinstall parsers in /config/autocmds.lua
}
