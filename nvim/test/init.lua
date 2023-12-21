function search_by_string()
  local input  = vim.fn.input("find by string: ")
  print(input)
end

search_by_string()
