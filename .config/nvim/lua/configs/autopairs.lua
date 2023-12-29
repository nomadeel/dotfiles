local status_ok, autopairs = pcall(require, "nvim-autopairs")
if not status_ok then
  return
end

autopairs.setup {
  check_ts = true, -- treesitter integration
  disable_filetype = { "TelescopePrompt" },
}