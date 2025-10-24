local default_config = require("USX.config.defaults")

local M = {}

function M.setup(opts)
  local opts = vim.tbl_deep_extend("force", default_config, opts or {}) -- optsは lazy.nvim から渡されるテーブル

  local augroup = vim.api.nvim_create_augroup("UnrealDevFiletype", { clear = true })

  if opts.ftdetect.uproject then
    vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
      pattern = "*.uproject",
      group = augroup,
      callback = function()
        vim.bo.filetype = "json"
      end,
    })
  end

  if opts.ftdetect.ushader then
    vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
      pattern = { "*.ush", "*.usf" },
      group = augroup,
      callback = function()
        vim.bo.filetype = "ushader"
      end,
    })
  end
end

return M
