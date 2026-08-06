local ls = require('luasnip')
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets('all', {
	s('sec', {
		t({ '////////////////////////////////', '//~ afk: ' }),
		i(1, 'name of the section'),
	}),
})
