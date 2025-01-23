require("nvim-tree").setup({
	sync_root_with_cwd = true,
	update_focused_file = {
		enable = true,
		update_root = true
	},
	respect_buf_cwd = true,
  sort_by = "case_sensitive",
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
		exclude = { ".env"}
  }
})
