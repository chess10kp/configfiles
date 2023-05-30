return function()
	require("decay").setup({
        style = 'dark',
        italics = {
    code = true,
    comments = false -- to disable italic comments, replace to true to enable
  },
        nvim_tree = {
            contrast = true,
        }
    })
    local core = require ('decay.core')
    local colors = core.get_colors('dark')
    print(colors.background)
end
