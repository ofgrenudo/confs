require 'nvim-treesitter.configs'.setup { 
  -- List of installed parsers
  ensure_installed = { "rust", "c", "cpp", "lua", "vim", "markdown" },

  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
  },
}
