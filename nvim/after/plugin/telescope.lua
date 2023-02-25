local telescope = require("telescope") --enables hidden files
local telescopeConfig = require("telescope.config")

-- Clone the default Telescope configuration
 local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

 -- I want to search in hidden/dot files.
 table.insert(vimgrep_arguments, "--hidden")
 -- I don't want to search in the `.git` directory.
 table.insert(vimgrep_arguments, "--glob")
 table.insert(vimgrep_arguments, "!**/.git/*")
 

local previewers = require("telescope.previewers")
local Job = require("plenary.job")
local new_maker = function(filepath, bufnr, opts)
  filepath = vim.fn.expand(filepath)
  Job:new({
    command = "file",
    args = { "--mime-type", "-b", filepath },
    on_exit = function(j)
      local mime_type = vim.split(j:result()[1], "/")[1]
      if mime_type == "text" then
        previewers.buffer_previewer_maker(filepath, bufnr, opts)
      else
        -- maybe we want to write something to the buffer here
        vim.schedule(function()
          vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { "BINARY" })
        end)
      end
    end
  }):sync()
end

 telescope.setup({
         defaults = {
                 -- `hidden = true` is not supported in text grep commands.
                 vimgrep_arguments = vimgrep_arguments,
                 file_ignore_patterns = { "^./.git/", 
                 "^node_modules/", "^vendor/", "^.local/", "^.vscode/", "^.ssh", "^.rustup/","^.npm/", "^mozilla","^.mozilla/", "^.cargo/", "^cargo/", "^build/", "^.cache/","^.vim/" },
                 buffer_preview_maker = new_maker,
         },
         pickers = {
                 find_files = {
                         -- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
                         find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
                 },
         },
 })

 require("telescope").setup {  --telescope img viewer
 defaults = {
         preview = {
                 mime_hook = function(filepath, bufnr, opts)
                         local is_image = function(filepath)
                                 local image_extensions = {'png','jpg'}   -- Supported image formats
                                 local split_path = vim.split(filepath:lower(), '.', {plain=true})
                                 local extension = split_path[#split_path]
                                 return vim.tbl_contains(image_extensions, extension)
                         end
                         if is_image(filepath) then
                                 local term = vim.api.nvim_open_term(bufnr, {})
                                 local function send_output(_, data, _ )
                                         for _, d in ipairs(data) do
                                                 vim.api.nvim_chan_send(term, d..'\r\n')
                                         end
                                 end
                                 vim.fn.jobstart(
                                 {
                                         'catimg', filepath  -- Terminal image viewer command
                                 }, 
                                 {on_stdout=send_output, stdout_buffered=true, pty=true})
                         else
                                 require("telescope.previewers.utils").set_preview_message(bufnr, opts.winid, "Binary cannot be previewed")
                         end
                 end
         },
 }
 }


 --Keymaps
 
 local builtin = require('telescope.builtin')
 function nmap(key, action)
         return vim.keymap.set('n',key,action)
 end
 nmap('<leader>fg',builtin.live_grep, {})
 nmap('<leader>fb', builtin.buffers, {})
 nmap('<leader>fh', builtin.help_tags, {})
 nmap('<leader>ff', builtin.find_files, {})
