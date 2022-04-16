local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

local i = ls.insert_node
local f = ls.function_node
local s = ls.s
local c = ls.c
local types = require("luasnip.util.types")

ls.config.set_config({
  history = true,
  updateevents = "TextChanged,TextChangedI",
  delete_check_events = "TextChanged",
  ext_opts = {
    [types.choiceNode] = {
      active = {
        virt_text = { { "choiceNode", "Comment" } },
      },
    },
  },
  ext_base_prio = 300,
  enable_autosnippets = true,
  store_selection_keys = "<Tab>",
})

local title_case = function(index)
  return f(function(arg)
    return string.upper(string.sub(arg[1][1], 1, 1)) .. string.sub(arg[1][1], 2)
  end, { index })
end

ls.add_snippets("go", {
  s("ieif", fmt(
    [[
      if {}, {} := {}({}); {} != nil {{
          {}
      }}
      ]], { i(1, "res"), i(2, "err"), i(3, "func"), i(4, ""), rep(2), i(5, "") })),
  s("eif", fmt(
    [[
      {}, {} := {}({})
      if {} != nil {{
          {}
      }}
      ]], { i(1, "res"), i(2, "err"), i(3, "func"), i(4, ""), rep(2), i(5, "") })),
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
}, { key = "go", })

ls.add_snippets("rust", {
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
}, { key = "rust", })

ls.add_snippets("react", {
  s("use", fmt("const [{}, set{}] = React.useState({});", { i(1, ""), title_case(1), i(2, "") })),
  s("rfc", fmt([[
    export const {} = () => {{
      {}
      return (
        <>
          {}
        </>
      );
    }};
    ]], { i(1, ""), i(2, ""), i(3, "") })),
  s("rfcp", fmt([[

    type {}Props = {{
      {}
    }};

    export const {} = ({{ {} }}: {}Props) => {{
      {}
      return (
        <>{}</>
      );
    }};
    ]], { i(1, ""), i(2, ""), rep(1), i(3, ""), rep(1), i(4, ""), i(5, "") })),
}, { key = "react", })

ls.add_snippets("javascript", {
  s("import", fmt([[import {{ {} }} from "{}";]], { i(1, ""), i(2, "") })),
  s("if", fmt(
    [[
      if ({}) {{
        {}
      }}
    ]], { i(1, ""), i(2, "") }))
}, {
  key = "javascript",
})

ls.add_snippets("typescript", {
  s("type",
    fmt([[
    type {} = {{
      {}
    }};
    ]], { i(1, ""), i(2, "") })),
}, { key = "typescript", })

ls.add_snippets("lua", {
  s("snip", fmt([[s("{}", fmt({}), {{ {} }})]], { i(1, ""), i(2, ""), i(3, "") })),
  s("test", fmt([[{} {}]], { i(1, ""), title_case(1) })),
}, { key = "lua", })

ls.add_snippets("html", {
  s("<>", fmt([[<{} {}>{}</{}>]], { i(1, ""), c(2, {
    fmt([[ className="{}"]], { i(1, "") }),
    fmt([[ id="{}"]], { i(1, "") }),
    fmt([[ id="{}" className="{}"]], { i(1, ""), i(2, "") }),
  }), i(3, ""), rep(1) })),
}, { key = "html", })


ls.filetype_extend("javascriptreact", { "react", "javascript", "html", })
ls.filetype_extend("typescriptreact", { "react", "javascript", "html", })
ls.filetype_extend("typescript", { "javascript" })
ls.filetype_extend("javascript", { "javascript" })
