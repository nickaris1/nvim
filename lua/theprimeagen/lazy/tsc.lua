return {
	"nickaris1/tsc.nvim",
	-- dir = "~/tsc.nvim",
	-- name = "tsc.nvim",
	config = function()
		require("tsc").setup({
      -- bin_name = "tsgo"
    })
	end,
}
