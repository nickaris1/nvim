vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", "<cmd>NvimTreeToggle<cr>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<C-s>", vim.cmd.write)
vim.keymap.set("i", "<C-s>", vim.cmd.write)

vim.keymap.set("i", "<C-z>", "<C-o>u")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>ff", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>ee", "oif err != nil {<CR>}<Esc>Oreturn err<Esc>")

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/theprimeagen/packer.lua<CR>")
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>")

vim.keymap.set("n", "<leader>|", "<cmd>vsplit<cr>")
vim.keymap.set("n", "<leader>-", "<cmd>split<cr>")

vim.keymap.set("n", "<A-Left>", "<C-w>h")
vim.keymap.set("n", "<A-Right>", "<C-w>l")
vim.keymap.set("n", "<A-Up>", "<C-w>k")
vim.keymap.set("n", "<A-Down>", "<C-w>j")

vim.keymap.set("n", "<A-S-Left>", "<cmd>vertical resize -5<cr>")
vim.keymap.set("n", "<A-S-Right>", "<cmd>vertical resize +5<cr>")
vim.keymap.set("n", "<A-S-Up>", "<cmd>resize -5<cr>")
vim.keymap.set("n", "<A-S-Down>", "<cmd>resize +5<cr>")

vim.keymap.set("n", "<leader>lf", function()
	local file_path = vim.fn.expand("%:p")
	if file_path == "" then
		vim.notify("No file path found for current buffer", vim.log.levels.WARN)
		return
	end

	local file_dir = vim.fs.dirname(file_path)
	local pkg = vim.fs.find("package.json", { path = file_dir, upward = true })[1]
	local cwd = pkg and vim.fs.dirname(pkg) or vim.fn.getcwd()
	local target = file_path
	if vim.startswith(file_path, cwd .. "/") then
		target = file_path:sub(#cwd + 2)
	end

	local result = vim.system({ "yarn", "eslint", "--fix", target }, { cwd = cwd, text = true }):wait()
	if result.code == 0 then
		vim.notify("eslint --fix completed", vim.log.levels.INFO)
    vim.cmd("edit") -- Reload the current buffer to reflect changes
	else
		vim.notify(result.stderr ~= "" and result.stderr or "eslint --fix failed", vim.log.levels.ERROR)
	end
end, { desc = "[Lint] fix" })
