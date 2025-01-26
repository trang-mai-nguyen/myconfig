local colorscheme = "nightfox"
-- local colorscheme = "base16-embers"
-- local colorscheme = "nordic"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
