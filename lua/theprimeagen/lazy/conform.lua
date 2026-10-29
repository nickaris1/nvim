return {
	"stevearc/conform.nvim",
	opts = {
		formatters = {
			bun_fmt = {
				command = "bun",
				args = { "fmt", "--no-script", "--stdin-filepath", "$FILENAME" },
				stdin = true,
			},
		},
		formatters_by_ft = {
			css = { "bun_fmt" },
			javascript = { "bun_fmt" },
			javascriptreact = { "bun_fmt" },
			json = { "bun_fmt" },
			scss = { "bun_fmt" },
			typescript = { "bun_fmt" },
			typescriptreact = { "bun_fmt" },
			nginx = { "nginxfmt" },
			python = {
				"ruff",
				"ruff_organize_imports",
			},
		},
	},
	init = function()
		vim.api.nvim_create_user_command("Prettier", function()
			require("conform").format({ formatters = { "bun_fmt" }, async = false })
		end, { desc = "Format the current buffer with bun fmt" })
	end,
}
