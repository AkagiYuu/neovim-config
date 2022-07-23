;; Keywords
(("return"   @keyword) (#set! conceal ""))

(("local"    @keyword) (#set! conceal "~"))

(("if"       @keyword) (#set! conceal "?"))
(("else"     @keyword) (#set! conceal "!"))
(("elseif"   @keyword) (#set! conceal "¿"))
;; (("function" @keyword) (#set! conceal "ﬦ"))
(("function" @keyword) (#set! conceal ""))
(("for"      @keyword) (#set! conceal ""))

(("and"      @keyword) (#set! conceal "▼"))
(("end"      @keyword) (#set! conceal "–"))
(("then"     @keyword) (#set! conceal "↙"))
(("do"       @keyword) (#set! conceal ""))

(("comment_start"    @comment) (#set! conceal ""))

;; Function names
((function_call name: (identifier) @TSFuncBuiltin (#eq? @TSFuncBuiltin "require")) (#set! conceal ""))
((function_call name: (identifier) @TSFunction (#eq? @TSFunction "map")) (#set! conceal ""))
((function_call name: (identifier) @TSFuncBuitin (#eq? @TSFuncBuitin "print"  )) (#set! conceal ""))
((function_call name: (identifier) @TSFuncBuitin (#eq? @TSFuncBuitin "pairs"  )) (#set! conceal "P"))
((function_call name: (identifier) @TSFuncBuitin (#eq? @TSFuncBuitin "ipairs" )) (#set! conceal "I"))

;; table.
((dot_index_expression table: (identifier) @keyword  (#eq? @keyword  "math" )) (#set! conceal ""))

;; break_statement
(((break_statement) @keyword) (#set! conceal "ﰈ"))

;; vim.*
(((dot_index_expression) @field (#eq? @field "vim.cmd"     )) (#set! conceal ""))
(((dot_index_expression) @field (#eq? @field "vim.api"     )) (#set! conceal ""))
(((dot_index_expression) @field (#eq? @field "vim.fn"      )) (#set! conceal "#"))
(((dot_index_expression) @field (#eq? @field "vim.g"       )) (#set! conceal "G"))
(((dot_index_expression) @field (#eq? @field "vim.schedule")) (#set! conceal ""))
(((dot_index_expression) @field (#eq? @field "vim.opt"     )) (#set! conceal "S"))
(((dot_index_expression) @field (#eq? @field "vim.env"     )) (#set! conceal "$"))
(((dot_index_expression) @field (#eq? @field "vim.o"       )) (#set! conceal "O"))
(((dot_index_expression) @field (#eq? @field "vim.bo"      )) (#set! conceal "B"))
(((dot_index_expression) @field (#eq? @field "vim.wo"      )) (#set! conceal "W"))

(((dot_index_expression) @field (#eq? @field "vim.keymap.set")) (#set! conceal ""))
