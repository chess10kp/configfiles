local custom = {}

custom["ibhagwan/fzf-lua"] = {
  enabled = false,
	lazy = true,
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		-- calling `setup` is optional for customization
		require("fzf-lua").setup({})
	end,
}
custom["elkowar/yuck.vim"] = {
	lazy = true,
}
custom["folke/todo-comments.nvim"] = {
	lazy = true,
	event = "BufRead",
	config = require("custom.todo-comments"),
}
custom["rmagatti/session-lens"] = {
	lazy = false,
  enabled = false,
	config = function()
		require("session-lens").setup({})
	end,
}
custom["lervag/vimtex"] = {
	lazy = true,
  ft = "tex"
}
custom["ggandor/leap.nvim"] = {
	lazy = false,
	config = function()
		require("leap").add_default_mappings()
	end,
}
custom["kylechui/nvim-surround"] = {
	event = "VeryLazy",
	config = function()
		require("nvim-surround").setup({})
	end,
}
custom["windwp/nvim-autopairs"] = {
	lazy = true,
	event = "InsertEnter",
	opts = {},
	config = require("editor.nvim-autopairs"),
}
custom["folke/neodev.nvim"] = {
	lazy = true,
	ft = "lua",
	config = require("lang.neodev"),
}

custom["glacambre/firenvim"] = {
	lazy = not vim.g.started_by_firenvim,
	build = function()
		vim.fn["firenvim#install"](0)
	end,
}
custom["nvim-orgmode/orgmode"] = {
  dependencies = { 'nvim-treesitter/nvim-treesitter', lazy = true },
  lazy = true , 
  ft = "org", 
  config = function()
    require('orgmode').setup_ts_grammar()
    require('orgmode').setup({
      org_agenda_files = '~/projects/school//',
      org_default_notes_file = '~/projects/school//'
    })
  end
}
custom[ "akinsho/org-bullets.nvim"] = {
lazy = true , 
  ft = "org", 
dependencies = {"nvim-orgmode/orgmode"}, 
  config  = function()
  require('org-bullets').setup {
    concealcursor = false, -- If false then when the cursor is on a line underlying characters are visible
    symbols = {
      -- list symbol
      list = "•",
      -- headlines can be a list
      headlines = { "◉", "○", "✸", "✿" },
      -- or a function that receives the defaults and returns a list
      checkboxes = {
        half = { "", "OrgTSCheckboxHalfChecked" },
        done = { "✓", "OrgDone" },
        todo = { "˟", "OrgTODO" },
      },
    }
  }
  end
}

return custom
