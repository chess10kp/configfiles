local telescope = require("telescope") --enables hidden files

 -- I want to search in hidden/dot files.
 -- I don't want to search in the `.git` directory.

 telescope.setup({
         defaults = {
                 -- `hidden = true` is not supported in text grep commands.
                 vimgrep_arguments = vimgrep_arguments,
                 file_ignore_patterns = { "^./.git/",
                 "^node_modules/", "^vendor/", "^.local/", "^.vscode/", "^.ssh", "^.rustup/","^.npm/", "^mozilla","^.mozilla/", "^Pictures/", "^Music/","^.cargo/", "^cargo/", "^build/", "^.cache/","^.vim/",
                "^zsh-autosuggestions/"},
                 buffer_preview_maker = new_maker,
         },
         pickers = {
                 find_files = {
                         -- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
                         find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
                 },
         },
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
         extensions = {
                 file_browser = {
                         hijack_netrw = true,
                                          },
         },
 })




require("telescope").load_extension "file_browser"
