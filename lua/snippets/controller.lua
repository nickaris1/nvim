local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local c = ls.choice_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

ls.add_snippets("typescript", {
  s(
    "controller",
    fmt([[
import {{Controller, ControllerAuth}} from '@/services/util/makeController';

class {name}<B, C extends ControllerAuth> extends Controller<
  {{ {response_shape} }},
  B,
  C
> {{}}

export default new {name2}({{
  method: '{method}',
  path: '{path}',
  dependencies: req => ({{
    {dependencies}
  }}),
  async handler(req, res, {{{deps_args}}}) {{
    {handler_body}
  }},
  requiresAuth: ControllerAuth.{auth},
}});
]],
      {
        name = i(1, "GetSomething"),
        name2 = rep(1),
        method = c(2, { t("GET"), t("POST"), t("PUT"), t("DELETE") }),
        path = i(3, "/path"),
        response_shape = i(4, "result: string"),
        dependencies = i(5, "id: req.body.id as string"),
        deps_args = i(6, "id"),
        handler_body = i(7, [[res.status(200).json({ result });]]),
        auth = c(8, {
          t("REQUIRED"),
          t("NONE"),
          t("OPTIONAL"),
          t("API_KEY"),
        }),
      }
    )
  ),
})

