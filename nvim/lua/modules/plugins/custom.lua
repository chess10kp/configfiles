local custom = {}

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
	config = function()
		require("session-lens").setup({})
	end,
}
custom["lervag/vimtex"] = {
	lazy = false,
}
custom["ggandor/leap.nvim"] = {
    lazy = false,
    config = function ()
        require('leap').add_default_mappings()
    end
}
return custom
