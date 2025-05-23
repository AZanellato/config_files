require("jabs").setup {
  width = 80, -- default 50
  height = 20, -- default 10
  border = 'double', -- none, single, double, rounded, solid, shadow, (or an array or
}
require('Navigator').setup()
require("gitsigns").setup()
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    always_show_tabline = false,
    globalstatus = false,
    refresh = {
      statusline = 100,
      tabline = 100,
      winbar = 100,
    }
  },
  sections = {
    lualine_a = {{'mode', fmt = function(str) return str:sub(1,1) end}},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'filetype'},
    lualine_y = {'progress'},
    lualine_z = {
      -- {
      --   "filename",
      --   path = 1,
      --   fmt = function(str)
      --     local sub_string = str:sub(3,-1)
      --     local index = sub_string:find("/") - 1
      --     return sub_string:sub(1, index)
      --   end,
      -- }
    }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {'branch'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'filetype'},
    lualine_y = {},
    lualine_z = {}
  },
  extensions = {"oil", "fugitive"}
}

local telescope = require("telescope")
telescope.setup(
  {
    defaults = {
      layout_config = {
        horizontal = { width = 0.85 }
      },
      path_display= { "filename_first" }
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
    auto_install = true,
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
          ["]c"] = "@class.outer",
        },
        goto_previous_end = {
          ["[f"] = "@function.outer",
          ["[}"] = "@block.outer",
          ["[c"] = "@class.outer",
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
        colorscheme kanagawa-wave
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
    max_buffers = 40,

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

require('faster').setup()
require("flexoki").setup({
    dim_inactive_windows = true
  })

require("dooing").setup({})
require('white-chocolate').setup()

local lspkind = require('lspkind')
local cmp = require('cmp')
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
  formatting = {
    format = lspkind.cmp_format({
        mode = 'symbol', -- show only symbol annotations
        maxwidth = {
          -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
          -- can also be a function to dynamically calculate max width such as
            -- menu = function() return math.floor(0.45 * vim.o.columns) end,
            menu = 50, -- leading text (labelDetails)
            abbr = 50, -- actual suggestion item
          },
          ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
          show_labelDetails = true, -- show labelDetails in menu. Disabled by default

          -- The function below will be called before any actual modifications from lspkind
            -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
            before = function (_, vim_item)
              return vim_item
            end
          })
      }
    })

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
require('lspconfig').ruby_lsp.setup { capabilities = capabilities }
require('lspconfig').ts_ls.setup { capabilities = capabilities }
-- capabilities.diagnostic.globals=["vim"]
require('lspconfig').lua_ls.setup {
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = {'vim'},  -- Recognize 'vim' as a global variable
      },
    },
  },
}
require('lint').linters_by_ft = {
  ruby = {'rubocop'},
}
local fmt_util = require "formatter.util"
require("formatter").setup {
  -- Enable or disable logging
  logging = true,
  -- Set the log level
  log_level = vim.log.levels.WARN,
  -- All formatter configurations are opt-in
  filetype = {
    ruby = {
      function()
        return {
          exe = "bundle exec rubocop",
          args = {
            "--autocorrect",
            "--stdin",
            fmt_util.escape_path(fmt_util.get_current_buffer_file_name()),
            "--format files",
            "| awk 'f; /^====================$/{f=1}'",
          },
          stdin = true,
        }
      end
    }
  }
}

-- folds!
vim.o.foldcolumn = '0' -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
local ufo = require('ufo')
local handler = function(virtText, lnum, endLnum, width, truncate)
    local newVirtText = {}
    local suffix = (' 󰁂 %d '):format(endLnum - lnum)
    local sufWidth = vim.fn.strdisplaywidth(suffix)
    local targetWidth = width - sufWidth
    local curWidth = 0
    for _, chunk in ipairs(virtText) do
        local chunkText = chunk[1]
        local chunkWidth = vim.fn.strdisplaywidth(chunkText)
        if targetWidth > curWidth + chunkWidth then
            table.insert(newVirtText, chunk)
        else
            chunkText = truncate(chunkText, targetWidth - curWidth)
            local hlGroup = chunk[2]
            table.insert(newVirtText, {chunkText, hlGroup})
            chunkWidth = vim.fn.strdisplaywidth(chunkText)
            -- str width returned from truncate() may less than 2nd argument, need padding
            if curWidth + chunkWidth < targetWidth then
                suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
            end
            break
        end
        curWidth = curWidth + chunkWidth
    end
    table.insert(newVirtText, {suffix, 'MoreMsg'})
    return newVirtText
end
ufo.setup({
    provider_selector = function(_, _, _)
        return {'treesitter', 'indent'}
    end,
    fold_virt_text_handler = handler,
    enable_get_fold_virt_text = true
})
vim.keymap.set('n', 'zR', ufo.openAllFolds)
vim.keymap.set('n', 'zM', ufo.closeAllFolds)
vim.keymap.set('n', 'zr', ufo.openFoldsExceptKinds)
vim.keymap.set('n', 'zm', ufo.closeFoldsWith)
vim.keymap.set('n', 'zp', ufo.peekFoldedLinesUnderCursor)

vim.diagnostic.config({ virtual_text = true })
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    -- try_lint without arguments runs the linters defined in `linters_by_ft` for the current filetype
    require("lint").try_lint()
  end,
})

vim.keymap.set({'n', 't'}, '<C-h>', '<CMD>NavigatorLeft<CR>')
vim.keymap.set({'n', 't'}, '<C-l>', '<CMD>NavigatorRight<CR>')
vim.keymap.set({'n', 't'}, '<C-k>', '<CMD>NavigatorUp<CR>')
vim.keymap.set({'n', 't'}, '<C-j>', '<CMD>NavigatorDown<CR>')
vim.keymap.set({'n', 't'}, '<C-p>', '<CMD>NavigatorPrevious<CR>')

vim.api.nvim_set_keymap("n", "<leader>ltn", "<cmd>:OtherTabNew<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>lp", "<cmd>:OtherSplit<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>lv", "<cmd>:OtherVSplit<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>lc", "<cmd>:OtherClear<CR>", { noremap = true, silent = true })

-- Context specific bindings
vim.api.nvim_set_keymap("n", "<leader>tv", "<cmd>:OtherVSplit test<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>fv", "<cmd>:OtherVSplit factories<CR>", { noremap = true, silent = true })

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
vim.keymap.set("n", "-", require("oil").open, { desc = "Open parent directory" })

vim.diagnostic.config({
    underline = true,
    signs = true,
    virtual_text = true,
    float = {
        show_header = true,
        source = 'if_many',
        border = 'rounded',
        focusable = false,
    },
    update_in_insert = false, -- default to false
    severity_sort = false, -- default to false
})
vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
