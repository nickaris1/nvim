return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			nginx = { "nginxfmt" },
			python = {
        "ruff",
				"ruff_organize_imports",
			},
		},
	},
}
