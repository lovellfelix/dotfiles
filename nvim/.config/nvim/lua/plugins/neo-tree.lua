return {
	"nvim-neo-tree/neo-tree.nvim",
	opts = {
		window = {
			position = "right",
			width = 30,
		},
		filesystem = {
			filtered_items = {
				visible = true,
				show_hidden_count = true,
				hide_dotfiles = false,
				hide_gitignored = true,
				hide_by_name = {
					"thumbs.db",
					"package-lock.json",
					"yarn.lock",
					"__pycache__",
					"node_modules",
				},
				never_show = { ".git", ".DS_Store", "node_modules", ".cache" },
			},
		},
		default_component_configs = {
			name = {
				use_git_status_colors = true,
				highlight = "NeoTreeFileIcon",
			},
			git_status = {
				symbols = {
					-- Change type
					added = "A",
					modified = "M",
					deleted = "D",
					renamed = "R",
					-- Status type
					untracked = "",
					ignored = "I",
					unstaged = "",
					staged = "",
					conflict = "C",
				},
			},
		},
	},
}
