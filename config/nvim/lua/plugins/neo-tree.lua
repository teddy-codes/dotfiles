return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      filtered_items = {
        visible = true, -- Makes hidden items visible but grayed out
        hide_dotfiles = false, -- This shows hidden files
        hide_gitignored = false, -- This shows gitignored files
      },
    },
  },
}
