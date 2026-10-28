return {
	"nickaris1/tsc.nvim",
	-- dir = "~/tsc.nvim",
	-- name = "tsc.nvim",
	config = function()
		require("tsc").setup({
			bin_name = "bun",
			flags = { "check --no-script --no-pretty" },
		})
	end,
}
