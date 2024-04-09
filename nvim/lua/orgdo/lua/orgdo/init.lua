local Menu = require("orgdo")

local menu = Menu:new()

menu:showMenu({
  title = "My Menu",
  menuItems = {"Option 1", "Option 2", "Option 3"},
  selectedCallback = function(selection)
    print("Selected:", selection)
  end
})
