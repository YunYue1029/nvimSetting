-- 加載 nvim-autopairs
require('nvim-autopairs').setup({
  check_ts = true, -- 支援 Tree-sitter，提升語法智能
  disable_filetype = { "TelescopePrompt" }, -- 禁用於特定文件類型
})

-- 與 nvim-cmp 集成（如果使用 nvim-cmp）
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)
