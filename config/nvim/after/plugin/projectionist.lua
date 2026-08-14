vim.g.projectionist_heuristics = {
	['*'] = {
		['*.c'] = { alternate = '{}.h' },
		['*.cpp'] = { alternate = '{}.h' },
		['*.cc'] = { alternate = '{}.h' },
		['*.h'] = { alternate = { '{}.c', '{}.cpp', '{}.cc' } },
	},
}
