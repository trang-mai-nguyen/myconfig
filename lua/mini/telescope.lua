local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local actions = require "telescope.actions"
local lga_actions = require "telescope-live-grep-args.actions"

telescope.setup {
  defaults = {
    file_ignore_patterns = { "%.rbi", "%.keep" },
    layout_strategy = "vertical",
    sorting_strategy = "ascending",
    color_devicons = true,
    selection_strategy = "reset",
    mappings = {
      i = {
        -- ["<C-n>"] = actions.move_selection_next,
        -- ["<C-p>"] = actions.move_selection_previous,

        -- ["<C-c>"] = actions.close,

        -- ["<Down>"] = actions.move_selection_next,
        -- ["<Up>"] = actions.move_selection_previous,

        -- ["<CR>"] = actions.select_default,
        -- ["<C-x>"] = actions.select_horizontal,
        -- ["<C-v>"] = actions.select_vertical,
        -- ["<C-t>"] = actions.select_tab,

        -- ["<C-u>"] = actions.preview_scrolling_up,
        -- ["<C-d>"] = actions.preview_scrolling_down,
        -- ["<C-f>"] = actions.preview_scrolling_left,
        -- ["<C-k>"] = actions.preview_scrolling_right,

        -- ["<PageUp>"] = actions.results_scrolling_up,
        -- ["<PageDown>"] = actions.results_scrolling_down,
        -- ["<M-f>"] = actions.results_scrolling_left,
        -- ["<M-k>"] = actions.results_scrolling_right,

        -- ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        -- ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        -- ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        -- ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
        -- ["<C-l>"] = actions.complete_tag,
        -- ["<C-/>"] = actions.which_key,
        -- ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
        -- ["<C-w>"] = { "<c-s-w>", type = "command" },
        -- ["<C-r><C-w>"] = actions.insert_original_cword,
        -- ["<C-r><C-a>"] = actions.insert_original_cWORD,
        -- ["<C-r><C-f>"] = actions.insert_original_cfile,
        -- ["<C-r><C-l>"] = actions.insert_original_cline,

        -- -- disable c-j because we dont want to allow new lines #2123
        -- ["<C-j>"] = actions.nop,
      },
      n = {
        ["jk"] = actions.close,
        -- ["<CR>"] = actions.select_default,
        -- ["<C-x>"] = actions.select_horizontal,
        -- ["<C-v>"] = actions.select_vertical,
        -- ["<C-t>"] = actions.select_tab,

        -- ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        -- ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        -- ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        -- ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

        -- -- TODO: This would be weird if we switch the ordering.
        -- ["j"] = actions.move_selection_next,
        -- ["k"] = actions.move_selection_previous,
        -- ["H"] = actions.move_to_top,
        -- ["M"] = actions.move_to_middle,
        -- ["L"] = actions.move_to_bottom,

        -- ["<Down>"] = actions.move_selection_next,
        -- ["<Up>"] = actions.move_selection_previous,
        -- ["gg"] = actions.move_to_top,
        -- ["G"] = actions.move_to_bottom,

        -- ["<C-u>"] = actions.preview_scrolling_up,
        -- ["<C-d>"] = actions.preview_scrolling_down,
        -- ["<C-f>"] = actions.preview_scrolling_left,
        -- ["<C-k>"] = actions.preview_scrolling_right,

        -- ["<PageUp>"] = actions.results_scrolling_up,
        -- ["<PageDown>"] = actions.results_scrolling_down,
        -- ["<M-f>"] = actions.results_scrolling_left,
        -- ["<M-k>"] = actions.results_scrolling_right,

        -- ["?"] = actions.which_key,
      }
    }
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    fzf = {
      fuzzy = true,                   -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true,    -- override the file sorter
      case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    },
    live_grep_args = {
      auto_quoting = true, -- enable/disable auto-quoting
      -- define mappings, e.g.
      mappings = {         -- extend mappings
        i = {
          ["<C-k>"] = lga_actions.quote_prompt(),
          ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
        },
      },
      -- ... also accepts theme settings, for example:
      -- theme = "dropdown", -- use dropdown theme
      -- theme = { }, -- use own theme spec
      -- layout_config = { mirror=true }, -- mirror preview pane
    }
  }
}
telescope.load_extension("fzf")
telescope.load_extension("live_grep_args")
