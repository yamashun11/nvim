local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local indent = '  '

return {
  s("subroutine", {
    t('subroutine '),
    i(1, 'name'),
    t('('),
    i(2, 'args'),
    t({')', indent}),
    i(3, 'contents'),
    t({'', 'end subroutine '}),
    rep(1)
  }),

  s("do", {
    t('do '),
    i(1, 'index'),
    t(' = '),
    i(2, 'begin'),
    t(', '),
    i(3, 'end'),
    t({ '', indent}),
    i(4, 'contents'),
    t({'', 'end do'}),
  }),
}
