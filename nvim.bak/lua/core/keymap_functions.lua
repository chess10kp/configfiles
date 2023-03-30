function nmap(key, action)
        return vim.keymap.set('n',key,action)
end
function imap(key, action)
        return vim.keymap.set('i',key,action)
end
function vmap(key, action)
        return vim.keymap.set('v',key,action)
end
function tmap(key, action)
        return vim.keymap.set('t',key,action)
end

function map(mode, key, remap, opts)
        local options = {noremap = true}
        if opts then
                options = vim.tbl_extend("force", options, opts)
        end
        vim.api.nvim_set_keymap(mode,key,remap,options)
end

