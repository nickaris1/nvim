local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

ls.add_snippets("typescript", {
  s(
    "Service",
    fmt([[
import {{ContractBody}} from '@repo/contracts/makeController';
import {{sendAxios}} from '@repo/reactlib/services/contractSend';
import {{ {contract}  }} from '@repo/contracts/{path}';

export async function {path2}({input}: ContractBody<typeof {contract2}>) {{
  return sendAxios({contract3}, {{body: {input2}}}).catch(console.error);
}}
]],
      {
        contract = i(1, "GetUser"),
        contract2 = rep(1),
        contract3 = rep(1),
        path = i(2, "getUser"),
        path2 = rep(2),
        input = i(3, "input"),
        input2 = rep(3),
      }
    )
  ),
})

