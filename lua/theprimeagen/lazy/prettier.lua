return {
    "MunifTanjim/prettier.nvim",
    config = function()
        require("prettier").setup({
            bin = "prettierd",
            filetypes = {
                "css",
                "javascript",
                "json",
                "scss",
                "typescript",
                "typescriptreact",
                "lua",
            }
        })
    end
}
