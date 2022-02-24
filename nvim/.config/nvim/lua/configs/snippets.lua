local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

local i = ls.insert_node
local s = ls.s
local types = require("luasnip.util.types")

ls.config.set_config({
  history = true,
  updateevents = "TextChanged,TextChangedI",
  delete_check_events = "TextChanged",
  ext_opts = {
    [types.choiceNode] = {
      active = {
        virt_text = { { "<-", "Error" } },
      },
    },
  },
  ext_base_prio = 300,
  enable_autosnippets = true,
  store_selection_keys = "<Tab>",
})

ls.snippets = {
  go = {
    s("ieif", fmt(
      [[
      if {}, {} := {}({}); {} != nil {{
          {}
      }}
      ]], { i(1, "res"), i(2, "err"), i(3, "func"), i(4, ""), rep(2), i(5, "")})),
    s("eif", fmt(
      [[
      {}, {} := {}({})
      if {} != nil {{
          {}
      }}
      ]], { i(1, "res"), i(2, "err"), i(3, "func"), i(4, ""), rep(2), i(5, "")})),
    s("struct", fmt(
      [[
      type {} struct {{
          {}
      }}
      ]], { i(1, ""), i(2, "") })),
    s("meth", fmt(
      [[
      func ({}) {}({}) {} {{
          {}
      }}
      ]], { i(1, ""), i(2, "function"), i(3, ""), i(4, ""), i(5, "") })),
    s("func", fmt(
      [[
      func {}({}) {} {{
          {}
      }}
      ]], { i(1, "function"), i(2, ""), i(3, ""), i(4, "") })),
  },
  rust = {
    s("test", fmt(
      [[
      #[test]
      fn {}() {{
          {}
      }}
      ]], { i(1, ""), i(2, "") })),
    s("struct", fmt(
      [[
      #[derive(Debug)]
      struct {} {{
          {}
      }}
      ]], { i(1, ""), i(2, "") })),
    s("impl", fmt(
      [[
      impl {} {{
          {}
      }}
      ]], { i(1, ""), i(2, "") })),
    s("fn", fmt(
      [[
      fn {}({}) {} {{
          {}
      }}
      ]], { i(1, "function"), i(2, ""), i(3, ""), i(4, "") })),
  },
  react = {
    s("use", fmt("const [{}, set{}] = useState({});", { i(1, ""),  i(2, ""), i(3, "") })),
  },
  javascript = {
    s("import", fmt([[import {{ {} }} from "{}";]], { i(1, ""), i(2, "") })),
    s("if", fmt(
    [[
      if ({}) {{
        {}
      }}
    ]], { i(1, ""), i(2, "") }))
  },
  lua = {
    s("snip", fmt([[s("{}", fmt({}), {{ {} }})]], { i(1, ""), i(2, ""), i(3, "") })),
  }
}

ls.filetype_extend("javascriptreact", {"react", "javascript"})
ls.filetype_extend("typescriptreact", {"react", "javascript"})
ls.filetype_extend("typescript", {"javascript"})
ls.filetype_extend("javascript", {"javascript"})
