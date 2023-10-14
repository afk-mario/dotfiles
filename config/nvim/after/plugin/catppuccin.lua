require("catppuccin").setup({
  highlight_overrides = {
    all = function(colors)
      return {
        ["@text.todo"] = { fg = colors.yellow, bg = colors.none },
        ["@text.todo.checked"] = { fg = colors.green },
        ["@text.todo.unchecked"] = { fg = colors.overlay1 },
        ["@text.note"] = { fg = colors.blue, bg = colors.none },
        ["@text.warning"] = { fg = colors.yellow, bg = colors.none, style = { "bold" } },
        ["@text.danger"] = { fg = colors.red, bg = colors.none, style = { "bold" } },
      }
    end
  }
})
