local util = require("monokai-pro.util")
local M = {}

---@class Config
local default = {
  transparent_background = false,
  italic_comments = true,
  filter = "pro",
  inc_search = "background", -- underline | background
  background_clear = {
    -- "float_win",
    "toggleterm",
    "telescope",
    "which-key",
    "renamer",
  },
  diagnostic = {
    background = true,
  },
  plugins = {
    bufferline = {
      underline_selected = false,
      underline_visible = false,
      bold = true,
    },
    indent_blankline = {
      context_highlight = "default", -- default | pro
    },
    lualine = {
      float = false,
      colorful = false,
    },
  },
}

---@type Config
M.options = {}

---@param options Config|nil
M.setup = function(options)
  M.options = vim.tbl_deep_extend("force", {}, default, options or {})
end

---@param options Config|nil
M.extend = function(options)
  if util.is_empty(M.options) then
    local msg =
    "You need to setup monokai-pro before using extend options this colorscheme"
    local level = "warn"
    util.notify(msg, level)
    return
  end
  M.options =
  vim.tbl_deep_extend("force", {}, M.options or default, options or {})
end

return M
