return function()
  require("ayu").setup({
    overrides = {
      LineNr = { bg = "None", fg = "#e6b450" },
      CmpItemMenu = { bg = "#0a0e14" },
      CmpItemKindDefault = { bg = "#0a0e14" },
      Pmenu = { bg = "#0a0e14" },
    },
  })
end

