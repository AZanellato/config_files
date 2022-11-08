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

require("zen-mode").setup({})

require('jabs').setup {
  width = 80, -- default 50
  height = 20, -- default 10
  border = 'double', -- none, single, double, rounded, solid, shadow, (or an array or
}
require('gitsigns').setup({})

require('telescope').setup(
  {
    defaults = {
      layout_config = {
        horizontal = { width = 0.85 }
      },
    },
  }
)

require('telescope').load_extension('fzf')

require('diffview').setup({})

require('twilight').setup({})

require("focus").setup({
    excluded_filetypes = {"toggleterm"},
  }
)

require("indent_blankline").setup(
  {
    buftype_exclude = {"terminal"}
  }
)


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

require('kanagawa').setup({
    dimInactive = true,        -- dim inactive window `:h hl-NormalNC`
})

require('catppuccin').setup({
  dim_inactive = {
    enabled = true,
    shade = "dark",
    percentage = 0.0,
  },
  styles = {
		comments = { "italic" },
  },
  integrations = {
		coc_nvim = true,
		gitgutter = true,
		gitsigns = true,
		lightspeed = true,
		lsp_saga = false,
		lsp_trouble = false,
		markdown = true,
		symbols_outline = false,
		telescope = true,
		treesitter = true,
		treesitter_context = true,
		indent_blankline = {
			enabled = true,
			colored_indent_levels = false,
		},
	},
})

require('nightfox').setup(
  {
    options = {
      styles = {
        comments = "italic",
      }
    },
    dim_inactive = true
  }
)

require('nvim-treesitter.configs').setup(
  {
    endwise = {
        enable = true,
    },
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
    refactor = {
      smart_rename = {
        enable = true,
        keymaps = {
          smart_rename = "grr",
        },
      },
    },
    highlight = { 
      enable = true
    },
    context_commentstring = {
      enable = true
    }
  }
)
require('nvim-tundra').setup({
  transparent_background = false,
  syntax = {
    booleans = { bold = true, italic = true },
    comments = { bold = true, italic = true },
    constants = { bold = true },
    numbers = { bold = true },
    operators = { bold = true },
    types = { italic = true },
  },
  plugins = {
    lsp = true,
    treesitter = true,
    cmp = true,
    context = true,
    gitsigns = true,
    telescope = true,
  },
  dim_inactive_windows = {
    enabled = true,
    color = require('nvim-tundra.palette.arctic').gray._800,
  }
})

