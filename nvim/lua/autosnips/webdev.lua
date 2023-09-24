local ls = require("luasnip")

ls.filetype_extend("typescriptreact", {"javascriptreact", "javascript", "typescript"})
ls.filetype_extend("typescript", {"javascriptreact", "javascript", "typescriptreact"})
ls.filetype_extend("javascriptreact", {"javascript", "typescript", "typescriptreact"})

