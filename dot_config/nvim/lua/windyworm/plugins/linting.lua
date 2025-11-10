return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")

		-- Define dotnet format linter
		lint.linters.dotnet_format = {
			cmd = "dotnet",
			stdin = false,
			append_fname = false,
			args = {
				"format",
				"--verify-no-changes",
				"--verbosity",
				"diagnostic",
			},
			stream = "both",
			ignore_exitcode = true,
			env = nil,
			parser = function(output, bufnr)
				local diagnostics = {}
				-- Parse dotnet format output
				for line in output:gmatch("[^\r\n]+") do
					local file, lnum, col, severity, message = line:match("(.+)%((%d+),(%d+)%):%s*(%w+)%s*(.+)")
					if file and lnum then
						table.insert(diagnostics, {
							lnum = tonumber(lnum) - 1,
							col = tonumber(col) - 1,
							severity = severity == "error" and vim.diagnostic.severity.ERROR
								or vim.diagnostic.severity.WARN,
							source = "dotnet-format",
							message = message,
						})
					end
				end
				return diagnostics
			end,
		}

		lint.linters_by_ft = {
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			svelte = { "eslint_d" },
			python = { "pylint" },
			cs = { "dotnet_format" },
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})

		vim.keymap.set("n", "<leader>cl", function()
			lint.try_lint()
		end, { desc = "Trigger linting for current file" })
	end,
}
