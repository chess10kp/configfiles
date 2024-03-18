return function()
  local format_on_save_set = require('core.settings').format_on_save
	local conform = require("conform")
	conform.setup({
		formatters_by_ft = {
			javascript = { "prettier" },
			typescript = { "prettier" },
			javascriptreact = { "prettier" },
			typescriptreact = { "prettier" },
			css = { "prettier" },
			html = { "prettier" },
			markdown = { "prettier" },
			graphql = { "prettier" },
      python = {"isort", "black"},
      lua = { "stylua"},
		},
    function ()
      if format_on_save_set then
        format_on_save = {
        timeout_ms = 1000, 
        lsp_fallback = false,
        async = true
    }
      end
    end
	})
end
