local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local actions = require "telescope.actions"

telescope.setup {
  defaults = {
    path_display = { "absolute" },
    file_ignore_patterns = { ".git/" },
    borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
    find_files = {
      find_command = { "fd", "-t=f", "-a"},
    },
    preview = false,
    wrap_results = true,
    mappings = {
      i = {
        ["<Down>"] = actions.cycle_history_next,
        ["<Up>"] = actions.cycle_history_prev,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      },
      n = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      }
    },
  },
}

telescope.load_extension('fzf')
