local cmp = require("cmp")
local config = require "nvchad.configs.cmp"

config.sorting = {
  comparators = {
    cmp.config.compare.offset,
    cmp.config.compare.exact,
    cmp.config.compare.recently_used,
    require("clangd_extensions.cmp_scores"),
    cmp.config.compare.kind,
    cmp.config.compare.sort_text,
    cmp.config.compare.length,
    cmp.config.compare.order,
  },
}

return config
