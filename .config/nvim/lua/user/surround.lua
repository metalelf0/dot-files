require("surround").setup({
  mappings_style = "surround",
  space_on_closing_char = true,
  pairs = {
    nestable = {
      b = { "(", ")" },
      s = { "[", "]" },
      B = { "{", "}" },
      a = { "/", "/" },
      A = { "*", "*" },
    },
    linear = { 
      q = { "'", "'" },
      t = { "`", "`" },
      d = { '"', '"' },
      F = { '```', '```'}
    },
  },
})
