local augend = require("dial.augend")
require("dial.config").augends:register_group {
    -- default augends used when no group name is specified
    default = {
        augend.integer.alias.decimal_int,
        augend.integer.alias.hex,
        augend.date.alias["%d/%m/%Y"],
        augend.date.alias["%m/%d/%Y"],
        augend.date.alias["%H:%M"],
        augend.date.alias["%H:%M:%S"],
        augend.semver.alias.semver,
        augend.hexcolor.new { case = "lower" },
        augend.hexcolor.new { case = "upper" },
        augend.constant.new {
            elements = { "and", "or" },
            word = true,
            cyclic = true,
        },
        augend.constant.new {
            elements = { "true", "false" },
            word = true,
            cyclic = true,
        },
        augend.constant.new {
            elements = { "&&", "||" },
            word = false,
            cyclic = true,
        },
        augend.paren.alias.quote,
        augend.paren.alias.bracket,
        -- augend.case.new{
        --     types = { "snake_case", "PascalCase"}
        -- },
        -- augend.case.new("PascalCase", "snake_case", "camelCase"),
    },
}
-- 3.0.0
vim.keymap.set("n", "<C-a>", require("dial.map").inc_normal())
vim.keymap.set("n", "<C-d>", require("dial.map").dec_normal())
