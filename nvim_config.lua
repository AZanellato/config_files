require('telescope').setup({
    defaults = {
      layout_config = {
        horizontal = { width = 0.85 }
      },
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

require('shade').setup({
    overlay_opacity = 50,
    opacity_step = 1,
    keys = {
      toggle = '<F12>',
    }
  })

require('wlsample.airline')
-- Great idea, but doesnt work great for now
-- require('wlfloatline').setup() 

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
require("catppuccino").setup( 
    {
		colorscheme = "dark_catppuccino",
    integrations = {
			treesitter = true,
      }
    }
  )

require('neoscroll').setup(
  {
    easing_function = "sine"
  }
)
