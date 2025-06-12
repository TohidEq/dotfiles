-- bootstrap lazy.nvim, LazyVim and your plugins
if vim.g.vscode then
  -- VSCode Neovim
  require("user.vscode_keymaps")
else
  -- Ordinary Neovim
  require("config.lazy")
end
