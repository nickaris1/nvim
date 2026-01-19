local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("typescript", {
  s(
    "contract",
    fmt([[
import zod from 'zod';

const bodyValidator = zod.undefined()

const responseValidator = zod.undefined();

export const {NAME} = {{
  path: '{path}',
  method: '{method}',
  bodyValidator,
  responseValidator,
}} as const;
]],
      {
        NAME = i(1, "ExampleService"),
        path = i(2, "/example/path"),
        method = i(3, "GET"),
      }
    )
  ),
})
