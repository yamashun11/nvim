local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local indent = '  '

return {
  s("module", {
    t('module '),
    i(1, 'name'),
    t({'', '  implicit none'}),
    t({'', '', 'contains'}),
    t({'', '', 'end module '}),
    rep(1)
  }),

  s("subroutine", {
    t('subroutine '),
    i(1, 'name'),
    t('('),
    i(2, 'args'),
    t({')', indent}),
    i(3, 'body'),
    t({'', '', 'end subroutine '}),
    rep(1)
  }),

  s("type", {
    t('type'),
    i(1),
    t(' :: '),
    i(2, 'name'),
    t({'', 'end type'})
  }),

  s("abstract interface", {
    t('abstract interface'),
    t({'', '  '}),
    i(1, 'body'),
    t({'', 'end interface'})
  }),

  s("do", {
    t('do '),
    i(1, 'index'),
    t(' = '),
    i(2, 'begin'),
    t(', '),
    i(3, 'end'),
    t({ '', indent}),
    i(4, 'body'),
    t({'', 'end do'}),
  }),

  s("deallocate", {
    t('if (allocated('),
    i(1, 'name'),
    t(')) deallocate ('),
    rep(1),
    t(')'),
  })
}
