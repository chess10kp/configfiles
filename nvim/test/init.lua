local function search_by_string()
  local input  = vim.fn.input("find by string: ")
  require("telescope.builtin").grep_string({ search = input })
end

search_by_string()
