---@type vim.lsp.Config

local git_dir = vim.fs.find(".git", { upward = true })[1]
local config_file = nil

if git_dir then
	print(vim.fs.dirname(git_dir))

  local path = vim.fs.dirname(git_dir) .. "/packages/reactlib/global.css"

  if vim.loop.fs_stat(path) then
  	config_file = path
  else
  	print("Config file does not exist: " .. path)
  end
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
			experimental = config_file and { configFile = config_file } or nil,
		},
	},
}
