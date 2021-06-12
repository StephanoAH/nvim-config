local ts_config = require("nvim-treesitter.configs")

ts_config.setup {
   -- ensure_installed = {
   --     "javascript",
   --     "html",
   --     "css",
   --     "bash",
   --     "cpp",
   --     "rust",
   --     "lua"
   -- },
    ensure_installed = "maintained",
    highlight = {
        enable = true,
        use_languagetree = true
    },
    rainbow = {
    enable = true,
    extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
  }
}
