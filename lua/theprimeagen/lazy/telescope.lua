return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},

	opts = {
		defaults = {
			mappings = {
				i = {
					["<C-c>"] = function(prompt_bufnr)
						vim.cmd("stopinsert")
					end,
				},
			},
		},
		pickers = {
			find_files = {
				hidden = true,
				file_ignore_patterns = {
					".git/.*",
					".env.example",
					".env",
				},
			},
			buffers = {
				sort_lastused = true,
				mappings = {
					n = {
						["dd"] = "delete_buffer",
					},
				},
			},
			live_grep = {
				additional_args = function(opts)
					return { "--hidden", "--glob", "!*lock.json", "--glob", "!*.lock" }
				end,
			},
		},
	},

	keys = function()
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
		vim.keymap.set("n", "<C-p>", builtin.git_files, {})
		vim.keymap.set("n", "<leader>pws", function()
			local word = vim.fn.expand("<cword>")
			builtin.grep_string({ search = word })
		end)
		vim.keymap.set("n", "<leader>pWs", function()
			builtin.grep_string({ search = "" })
		end)
		vim.keymap.set("n", "<leader>ps", function()
			builtin.grep_string({ search = vim.fn.input("Grep > ") })
		end)
		vim.keymap.set("n", "<leader>vh", builtin.help_tags, {})
		vim.keymap.set("n", "<leader>tgb", builtin.git_branches, {})
		vim.keymap.set("n", "<leader>w", builtin.buffers, {})

		vim.keymap.set("n", "<leader>fr", builtin.resume)
		vim.keymap.set("n", "<leader>fd", builtin.diagnostics)
		vim.keymap.set("n", "<leader>fg", builtin.live_grep)
		vim.keymap.set("v", "<leader>fg", "\"zy<cmd>exec 'Telescope live_grep default_text=' . escape(@z, ' ')<cr>")
	end,
}
