require("nvim-treesitter.configs").setup {
  highlight = {
      -- ...
  },
  -- ...
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    colors = {
        "#f6f6f6",
        "#ff7ab2",
        "#6bdfe6",
        "#82ffa1",
        "#ff8f86",
        "#79b8ff",
        "#c4b7ff",
        "#ffcda8",
        "#ff6c62",
    }, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  }
}
