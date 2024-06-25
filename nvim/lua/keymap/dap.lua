local nmap =  require('keymap.key').nmap

nmap('<M-c>', function () require("dap").continue() end ,  'debug: continue')
nmap('<M-s>', function () require("dap").step_over() end ,  'debug: step_over')
nmap('<M-i>', function () require("dap").step_into() end ,  'debug: step_into')
nmap('<M-t>', function () require("dap").toggle_breakpoint() end ,  'debug: toggle_breakpoint')
nmap('<M-u>', function () require('dap').step_out() end)
nmap('<M-r>', function () require('dap').repl.open() end)
nmap('<M-l>', function () 
  require("dap").terminate() 
end ,  'debug: terminate')
nmap('<M-a>', function ()
  require("dap.ui.widgets").hover()
end, "debug: hover")
