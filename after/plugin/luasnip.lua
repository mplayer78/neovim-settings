if vim.g.snippets == "luasnip" then
    return
end

local ls = require "luasnip"
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local l = require("luasnip.extras").lambda
local rep = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local types = require("luasnip.util.types")
local conds = require("luasnip.extras.conditions")
local conds_expand = require("luasnip.extras.conditions.expand")
local parse = require("luasnip.util.parser").parse_snippet

ls.config.set_config {
    history = true,
    updateevents = "TextChanged, TextChanged!",
    enable_autosnippets = true,
    ext_opts = {
        [types.choiceNode] = {
            active = {
                virt_text = { { "←", "Error" } },
            }
        }
    }
}

vim.keymap.set({ "i", "s" }, "<c-k>", function()
    if ls.expand_or_jumpable() then
        ls.expand_or_jump()
    end
end, { silent = true })

vim.keymap.set("i", "<c-l>", function()
    if ls.choice_active() then
        ls.change_choice(1)
    end
end)

ls.add_snippets("all", {
	s("ternary", {
		-- equivalent to "${1:cond} ? ${2:then} : ${3:else}"
		i(1, "cond"), t(" ? "), i(2, "then"), t(" : "), i(3, "else")
	})
})

ls.add_snippets("lua", {
    parse("lf", "local $1 = function($2)\n  $0\nend"),
    s("req", fmt("local {} = require('{}')", { i(1), rep(1)}), {
        repeat_duplicates = true
    })
})

ls.add_snippets("javascript", {
    s("clo", fmt("console.log(`{}`, {})", { i(1, "variable"), rep(1)})),
})

ls.add_snippets("vue", {
    s("vsfc", fmt([[
<template>
    {}
</template>

<script setup lang={}>
</script>

<style lang={} scoped>
</style>
    ]], {
        i(3, 'body'),
        i(1, 'ts'),
        i(2, 'scss')
    }))
})

ls.filetype_extend("typescript", {"javascript"})

ls.filetype_extend("vue", {"typescript", "javascript"})

ls.add_snippets("go", {
    s("iferr", fmta("if err != nil {\n  <>\n}"
    , {
        i(1, 'panic(err)')
    }))
})
