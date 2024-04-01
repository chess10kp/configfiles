local lang = {}

lang["fatih/vim-go"] = {
  enabled = true,
  lazy = true,
  ft = "go",
  build = ":GoInstallBinaries",
  config = require("lang.vim-go"),
}
lang["simrat39/rust-tools.nvim"] = {
  lazy = true,
  ft = "rust",
  enabled = true,
  config = require("lang.rust-tools"),
  dependencies = { "nvim-lua/plenary.nvim" },
}
lang["Saecki/crates.nvim"] = {
  lazy = true,
  enabled = false,
  event = "BufReadPost Cargo.toml",
  config = require("lang.crates"),
  dependencies = { "nvim-lua/plenary.nvim" },
}
lang["iamcco/markdown-preview.nvim"] = {
  lazy = true,
  enabled = true,
  ft = "markdown",
  build = ":call mkdp#util#install()",
}
lang["chrisbra/csv.vim"] = {
  enabled = true,
  lazy = true,
  ft = "csv",
}
lang["pmizio/typescript-tools.nvim"] = {
  lazy = true,
  ft = { "javascript", "typescript", "typescriptreact", "javascriptreact" },
  dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  opts = {},
  config = require("lang.typescript-tools"),
}
lang["mrcjkb/haskell-tools.nvim"] = {
  enabled = true,
  lazy = true,
  ft = { "haskell", "cabal", "lhaskell", "cabalproject" },
  dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  config = require("lang.haskell-tools"),
  branch = "1.1.0",
}
lang["nvim-orgmode/orgmode"] = {
  dependencies = { "nvim-treesitter/nvim-treesitter", lazy = true },
  lazy = true,
  ft = "org",
  config = function()
    require("orgmode").setup_ts_grammar()
    require("orgmode").setup({
      org_agenda_files = "~/projects/school//",
      org_default_notes_file = "~/projects/school//",
    })
  end,
}
lang["akinsho/org-bullets.nvim"] = {
  lazy = true,
  ft = "org",
  dependencies = { "nvim-orgmode/orgmode" },
  config = function()
    require("org-bullets").setup({
      concealcursor = false, -- If false then when the cursor is on a line underlying characters are visible
      symbols = {
        -- list symbol
        list = "•",
        -- headlines can be a list
        headlines = { "◉", "○", "✸", "✿" },
        -- or a function that receives the defaults and returns a list
        checkboxes = {
          half = { "", "OrgTSCheckboxHalfChecked" },
          done = { "✓", "OrgDone" },
          todo = { "˟", "OrgTODO" },
        },
      },
    })
  end,
}
return lang
