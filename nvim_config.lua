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
  pickers = {
        live_grep = {
            mappings = {
                i = { ["<c-f>"] = require('telescope.actions').to_fuzzy_refine },
            },
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

require("ibl").setup(
  {
    indent = { char = { "▏", "¦", "┆", "┊" } },
    whitespace = { highlight = { "Whitespace", "NonText" } },
    scope = { exclude = { language = { "lua" } } },

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
    colors = {
      theme = {
        all = {
          ui = {
            bg_gutter = "none"
          }
        }
      }
    },
    overrides = function(colors)
      local theme = colors.theme
      return {
        NormalFloat = { bg = "none" },
        FloatBorder = { bg = "none" },
        FloatTitle = { bg = "none" },

        -- Save an hlgroup with dark background and dimmed foreground
        -- so that you can use it where your still want darker windows.
        -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
        NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

        -- Popular plugins that open floats will link to NormalFloat by default;
        -- set their background accordingly if you wish to keep them dark and borderless
        LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
        MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
    }
  end,
  })

require('nvim-treesitter.configs').setup(
  {
    -- indent = {
    --   enable = true
    -- },
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
        goto_previous_start = {
          ["[["] = "@function.outer",
          ["gB"] = "@block.outer",
        },
        goto_next_end = {
          ["]e"] = "@function.outer",
        },
        goto_previous_end = {
          ["[e"] = "@function.outer",
        },
      },
    },
    matchup = {
      enable = true, -- mandatory, false will disable the whole extension
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
require('git-conflict').setup()
require('mini.move').setup()
require('sibling-swap').setup({
    use_default_keymaps = true,
    keymaps = {
      ['<space>ll'] = 'swap_with_right_with_opp',
      ['<space>hh'] = 'swap_with_left_with_opp',
    },
  })

require("oil").setup({
    use_default_keymaps = false,
    keymaps = {
      ["g?"] = "actions.show_help",
      ["<CR>"] = "actions.select",
      ["<C-s>"] = "actions.select_vsplit",
      ["<C-x>"] = "actions.select_split",
      ["<C-t>"] = "actions.select_tab",
      ["<C-p>"] = "actions.preview",
      ["<C-c>"] = "actions.close",
      ["<C-r>"] = "actions.refresh",
      ["-"] = "actions.parent",
      ["_"] = "actions.open_cwd",
      ["`"] = "actions.cd",
      ["~"] = "actions.tcd",
      ["g."] = "actions.toggle_hidden",
    },
  })
vim.keymap.set("n", "-", require("oil").open, { desc = "Open parent directory" })
require("mini.cursorword").setup()

require('spectre').setup({
    open_cmd = 'new',
    mapping={
      ['toggle_line'] = {
        map = "D",
        cmd = "<cmd>lua require('spectre').toggle_line()<CR>",
        desc = "toggle current item"
      },
    }
  })

require("NeoColumn").setup({
  NeoColumn = "120",
  always_on = true,
  custom_NeoColumn = {},
  excluded_ft = { "text", "markdown" },
  })

require'eyeliner'.setup({
  highlight_on_key = true, 
  dim = false,
  })
