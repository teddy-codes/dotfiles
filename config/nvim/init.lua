-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.api.nvim_create_autocmd("UIEnter", {
  once = true,
  callback = function()
    if vim.fn.argc() == 0 then
      -- Close any remaining dashboard buffer
      vim.cmd("silent! bdelete")
      -- Open file finder
      require("telescope.builtin").find_files()
    end
  end,
})
