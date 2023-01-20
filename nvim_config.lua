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
local wilder = require('wilder')
wilder.setup({modes = {':'}})
wilder.set_option('use_python_remote_plugin', 0)

wilder.set_option('pipeline', {
  wilder.branch(
    wilder.cmdline_pipeline({
      fuzzy = 1,
      fuzzy_filter = wilder.lua_fzy_filter(),
    }),
    wilder.vim_search_pipeline()
  )
})


wilder.set_option('renderer', wilder.popupmenu_renderer(
    wilder.popupmenu_palette_theme({
        border = 'rounded',
        max_height = '65%',      -- max height of the palette
        min_height = 0,          -- set to the same as 'max_height' for a fixed height window
        prompt_position = 'bottom', -- 'top' or 'bottom' to set the location of the prompt
        reverse = 0,             -- set to 1 to reverse the order of the list, use in combination with 'prompt_position'
        highlighter = {
          wilder.lua_pcre2_highlighter(), -- requires `luarocks install pcre2`
          wilder.lua_fzy_highlighter(),   -- requires fzy-lua-native vim plugin found
        },
        pumblend = 20,
        highlights = {
          accent = wilder.make_hl('WilderAccent', 'Pmenu', {{a = 1}, {a = 1}, {foreground = '#f4468f'}}),
        },
      })
  ))

require('git-conflict').setup()
require('mini.move').setup()
require('sibling-swap').setup({
    use_default_keymaps = true,
    keymaps = {
      ['<space>ll'] = 'swap_with_right_with_opp',
      ['<space>hh'] = 'swap_with_left_with_opp',
    },
  })

require("oil").setup()
vim.keymap.set("n", "-", require("oil").open, { desc = "Open parent directory" })
require("mini.cursorword").setup()
