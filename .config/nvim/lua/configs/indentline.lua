local status_ok, indent_blankline = pcall(require, "ibl")
if not status_ok then
  return
end

-- indent_blankline.setup {
--   indent = { char = "▏" },
--   show_trailing_blankline_indent = false,
--   show_first_indent_level = true,
--   use_treesitter = true,
--   exclude = {
--     buftype = { "terminal", "nofile" },
--     filetype = {
--       "help",
--       "packer",
--       "NvimTree",
--     },
--   }
-- }

indent_blankline.setup()
