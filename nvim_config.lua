require('telescope').setup({
    defaults = {
      layout_config = {
        horizontal = { width = 0.85 }
      },
    },
  })

require("abbrev-man").setup({
	load_natural_dictionaries_at_startup = true,
	load_programming_dictionaries_at_startup = true,
	natural_dictionaries = {
		["nt_en"] = {
      ["copmany"] = "company",
      ["comapny"] = "company",
      ["trhough"] = "through",
      ["acess"] = "access"
    },
    ["nt_pt"] = {}
	},
})
require('telescope').load_extension('fzf')

require('diffview').setup({})

require('twilight').setup({})

require("nvim-gps").setup({})

require("focus").setup({
    excluded_filetypes = {"toggleterm", "vim"},
  })

require("indent_blankline").setup {
  buftype_exclude = {"terminal"}
}

require('nvim-treesitter.configs').setup({
    textobjects = {
      select = {
        enable = true,

        -- Automatically jump forward to textobj, similar to targets.vim 
        lookahead = true,

        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",
        },
      },
      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_next_start = {
          ["]]"] = "@function.outer",
          ["gb"] = "@block.outer",
        },
        goto_next_end = {
          ["]e"] = "@function.outer",
        },
        goto_previous_start = {
          ["[["] = "@function.outer",
          ["gB"] = "@block.outer",
        },
        goto_previous_end = {
          ["[e"] = "@function.outer",
        },
      },
    },
    matchup = {
      enable = true,              -- mandatory, false will disable the whole extension
      disable = {},  -- optional, list of language that will be disabled
    },
  })

require('nvim-treesitter.configs').setup({
    refactor = {
      smart_rename = {
        enable = true,
        keymaps = {
          smart_rename = "grr",
        },
      },
    },
  })

require'nvim-treesitter.configs'.setup {
  context_commentstring = {
    enable = true
  }
}
require('neoscroll').setup(
  {
    easing_function = "sine"
  }
)

require('goto-preview').setup {
    width = 120; -- Width of the floating window
    height = 15; -- Height of the floating window
    border = {"?", "?" ,"?", "?", "?", "?", "?", "?"}; -- Border characters of the floating window
    default_mappings = true; -- Bind default mappings
    debug = false; -- Print debug information
    opacity = nil; -- 0-100 opacity level of the floating window where 100 is fully transparent.
    post_open_hook = nil -- A function taking two arguments, a buffer and a window to be ran as a hook.
  }

require('Comment').setup()

-- require'shade'.setup({
--   overlay_opacity = 50,
--   opacity_step = 1,
--   keys = {
--     brightness_up    = '<C-Up>',
--     brightness_down  = '<C-Down>',
--     toggle           = '<F12>',
--   }
-- })

require('kanagawa').setup({
    undercurl = true,           -- enable undercurls
    commentStyle = "italic",
    functionStyle = "NONE",
    keywordStyle = "italic",
    statementStyle = "bold",
    typeStyle = "NONE",
    variablebuiltinStyle = "italic",
    specialReturn = true,       -- special highlight for the return keyword
    specialException = true,    -- special highlight for exception handling keywords 
    transparent = false,        -- do not set background color
    dimInactive = true,        -- dim inactive window `:h hl-NormalNC`
    colors = {},
    overrides = {},
})
require('nvim-treesitter.configs').setup {
    endwise = {
        enable = true,
    },
}

require("zen-mode").setup {}
