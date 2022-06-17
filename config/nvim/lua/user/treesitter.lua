local tree = require 'nvim-treesitter.configs'

tree.setup {
    ensure_installed = {"lua", "javascript", "bash", "css", "gdscript", "glsl", "go", "graphql", "html", "json", "typescript", "vim"},
    highlight = {enable = true, disable = {"javascript"}},
    indent = {enable = true},
    incremental_selection = {enable = true}
}
