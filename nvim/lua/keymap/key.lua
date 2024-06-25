local opts = { noremap = true, silent = true }

local key = {}

function key.nmap(key, action, desc)
	opts.desc = desc
	vim.keymap.set("n", key, action, opts)
end


function key.xmap(key, action, desc)
	opts.desc = desc
	vim.keymap.set("x", key, action, opts)
end

function key.tmap(key, action, desc)
	opts.desc = desc
	vim.keymap.set("t", key, action, opts)
end

function key.imap(key, action, desc)
	opts.desc = desc
	vim.keymap.set("i", key, action, opts)
end

function key.vmap(key, action, desc)
	opts.desc = desc
	vim.keymap.set("v", key, action, opts)
end

function key.omap(key, action, desc)
	opts.desc = desc
	vim.keymap.set("o", key, action, opts)
end

function key.cmap(key, action, desc)
	opts.desc = desc
	vim.keymap.set("c", key, action, opts)
end

return key
