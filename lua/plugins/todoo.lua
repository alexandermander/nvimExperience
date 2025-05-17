return {
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      signs = true, -- show icons in the signs column
      sign_priority = 8, -- sign priority
      -- keywords recognized as todo comments
      keywords = {
        FIX = {
          icon = " ", -- icon used for the sign, and in search results
          color = "error", -- can be a hex color, or a named color (see below)
          alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- other keywords mapped to FIX
        },
				
				--BUG: this is a bug
				--WARN: this is bad
				--TODO: this is good
				--NOTE: this is a noteh
				--TEST:  this is a test

        TODO = { icon = " ", color = "info" },
        HACK = { icon = "🔥", color = "warning" },
        WARN = { icon = "⚠️", color = "warning", alt = { "WARNING", "XXX" } },
        PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } }, --
        NOTE = { icon = "", color = "hint", alt = { "INFO" } },
        TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
      },
      gui_style = {
        fg = "NONE", -- The gui style to use for the fg highlight group
        bg = "BOLD", -- The gui style to use for the bg highlight group
      },
      merge_keywords = true, -- merge custom keywords with defaults
      highlight = {
        multiline = true,
        multiline_pattern = "^.", -- match multiline comments
        multiline_context = 10,
        before = "", -- highlights before the keyword
        keyword = "wide", -- highlights keyword
        after = "fg", -- highlights after the keyword
        pattern = [[.*<(KEYWORDS)\s*:]], -- pattern to match keywords
        comments_only = true, -- only match in comments
        max_line_len = 400, -- ignore very long lines
        exclude = {}, -- filetypes to exclude
      },
      colors = {
        error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
        warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
        info = { "DiagnosticInfo", "#2563EB" },
        hint = { "DiagnosticHint", "#10B981" },
        default = { "Identifier", "#7C3AED" },
        test = { "Identifier", "#FF00FF" },
      },
      search = {
        command = "rg", -- ripgrep as the search tool
        args = {
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
        },
        pattern = [[\b(KEYWORDS):]], -- regex to match keywords
      },
    },
  }
}

