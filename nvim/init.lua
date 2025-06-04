require("config.lazy")

---@diagnostic disable: inject-field
local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.asciidoc = {
    install_info = {
        url = "https://github.com/cathaysia/tree-sitter-asciidoc.git",
        files = {
          "tree-sitter-asciidoc/src/parser.c",
          "tree-sitter-asciidoc/src/scanner.c"
        },
        branch = "master",
        generate_requires_npm = false,
        requires_generate_from_grammar = false,
    },
}
parser_config.asciidoc_inline = {
    install_info = {
        url = "https://github.com/cathaysia/tree-sitter-asciidoc.git",
        files = {
          "tree-sitter-asciidoc_inline/src/parser.c",
          "tree-sitter-asciidoc_inline/src/scanner.c",
        },
        branch = "master",
        generate_requires_npm = false,
        requires_generate_from_grammar = false,
    },
}
