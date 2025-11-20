---@type vim.lsp.Config

local git_dir = vim.fs.find(".git", { upward = true })[1]
if git_dir then
	print(vim.fs.dirname(git_dir))
else
	print("Not inside a git repo")
end

return {
	cmd = { "tailwindcss-language-server", "--stdio" },
	filetypes = {
		"html",
		"css",
		"javascript",
		"typescript",
		"javascriptreact",
		"typescriptreact",
		"vue",
		"svelte",
		"astro",
	},

	settings = {
		tailwindCSS = {
			validate = true,
			experimental = {
				configFile = vim.fs.dirname(git_dir) .. "/packages/reactlib/global.css",
			},
		},
	},
}
