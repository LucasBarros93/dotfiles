return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				-- Lua
				null_ls.builtins.formatting.stylua,

				-- Python
				null_ls.builtins.formatting.black,

                -- Bash
                null_ls.builtins.formatting.shfmt,

				-- C / C++
                null_ls.builtins.formatting.clang_format.with({
                    extra_args = { "--style=file", "--fallback-style=LLVM", "--assume-filename", vim.fn.expand("~/.config/nvim/clang-format") },
                }),
			},
		})

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
