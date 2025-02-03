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

require("jabs").setup {
  width = 80, -- default 50
  height = 20, -- default 10
  border = 'double', -- none, single, double, rounded, solid, shadow, (or an array or
}
require("gitsigns").setup({})

require("telescope").setup(
  {
    defaults = {
      layout_config = {
        horizontal = { width = 0.85 }
      },
      path_display= { "smart" } 
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

local telescope = require("telescope")
telescope.load_extension("fzf")
telescope.load_extension("undo")
telescope.load_extension("dir")

require("diffview").setup({})

require("twilight").setup({})

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


require("neoscroll").setup(
  {
    easing_function = "sine"
  }
)

require("goto-preview").setup {
    width = 120; -- Width of the floating window
    height = 15; -- Height of the floating window
    border = {"?", "?" ,"?", "?", "?", "?", "?", "?"}; -- Border characters of the floating window
    default_mappings = true; -- Bind default mappings
    debug = false; -- Print debug information
    opacity = nil; -- 0-100 opacity level of the floating window where 100 is fully transparent.
    post_open_hook = nil -- A function taking two arguments, a buffer and a window to be ran as a hook.
  }

require("Comment").setup()

require("kanagawa").setup({
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

require("catppuccin").setup({
    flavour = "auto", -- latte, frappe, macchiato, mocha
    background = { -- :h background
        light = "latte",
        dark = "mocha",
    },
    dim_inactive = {
        enabled = true, -- dims the background color of inactive window
        shade = "dark",
    },
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
          [")"] = "@function.outer",
          [">c"] = "@call.outer",
          ["]{"] = "@block.outer",
          ["]c"] = "@class.outer",
        },
        goto_previous_start = {
          ["("] = "@function.outer",
          ["[{"] = "@block.outer",
          ["[c"] = "@class.outer",
        },
        goto_next_end = {
          ["]f"] = "@function.outer",
          ["]}"] = "@block.outer",
          ["]C"] = "@class.outer",
        },
        goto_previous_end = {
          ["[f"] = "@function.outer",
          ["[}"] = "@block.outer",
          ["[C"] = "@class.outer",
        },
      },
    },
    matchup = {
      enable = false, -- mandatory, false will disable the whole extension
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
  }
)
require("ts_context_commentstring").setup()
require("git-conflict").setup()
require("mini.move").setup()
require("sibling-swap").setup({
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

require("spectre").setup({
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

require("eyeliner").setup({
  highlight_on_key = true, 
  dim = false,
  })

require("origami").setup ({
	keepFoldsAcrossSessions = false,
  })
vim.g.skip_ts_context_commentstring_module = true

local before = require('before')
before.setup()
vim.keymap.set('n', '<Left>', before.jump_to_last_edit, {})
vim.keymap.set('n', '<Right>', before.jump_to_next_edit, {})

require("auto-dark-mode").setup({
    update_interval = 5000,
    set_dark_mode = function()
      vim.cmd([[
        colorscheme kanagawa
        set background=dark 
        let g:airline_theme = 'catppuccin'
        ]])
    end,
    set_light_mode = function()
      vim.cmd([[
        set background=light
        let g:airline_theme = 'everforest'
        colorscheme everforest
        ]])
    end,
  })

require("buffer-vacuum").setup({
    -- The maximum number of buffers to keep (excluding modified buffer)
    max_buffers = 20,

    -- Change to True if you want pinned buffers to count to the
    -- maximum number buffers
    count_pinned_buffers = false,

    -- Enable notifications every time a buffer is pinned or deleted
    -- Default FALSE
    enable_messages = true,
})
require("spider").setup({
    skipInsignificantPunctuation = true,
    consistentOperatorPending = false, -- see "Consistent Operator-pending Mode" in the README
    subwordMovement = true,
    customPatterns = {}, -- check "Custom Movement Patterns" in the README for details
  })

vim.keymap.set(
	{ "n", "o", "x" },
	"w",
	"<cmd>lua require('spider').motion('w')<CR>",
	{ desc = "Spider-w" }
)
vim.keymap.set(
	{ "n", "o", "x" },
	"e",
	"<cmd>lua require('spider').motion('e')<CR>",
	{ desc = "Spider-e" }
)
vim.keymap.set(
	{ "n", "o", "x" },
	"b",
	"<cmd>lua require('spider').motion('b')<CR>",
	{ desc = "Spider-b" }
)

require('silicon').setup({
  -- font = 'FantasqueSansMono Nerd Font=16',
  -- theme = 'Monokai Extended',
})
require("other-nvim").setup({
	mappings = {
		"livewire",
		"angular",
		"laravel",
		"rails",
		"golang",
		"python",
        "react",
		"rust",
	},
})

vim.api.nvim_set_keymap("n", "<leader>ltn", "<cmd>:OtherTabNew<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>lp", "<cmd>:OtherSplit<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>lv", "<cmd>:OtherVSplit<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>lc", "<cmd>:OtherClear<CR>", { noremap = true, silent = true })

-- Context specific bindings
vim.api.nvim_set_keymap("n", "<leader>tv", "<cmd>:OtherVSplit test<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>fv", "<cmd>:OtherVSplit factories<CR>", { noremap = true, silent = true })

require('faster').setup()
require("flexoki").setup({
    dim_inactive_windows = true
  })

require("dooing").setup({})
require('white-chocolate').setup()



cmp = require('cmp')
cmp.setup({
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'buffer' },
      }),
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
  })

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require('lspconfig').ruby_lsp.setup { capabilities = capabilities }
require('lint').linters_by_ft = {
  ruby = {'rubocop'},
}
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    -- try_lint without arguments runs the linters defined in `linters_by_ft` for the current filetype
    require("lint").try_lint()
  end,
})
