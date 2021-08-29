require('neogit').setup {
    disable_signs = false,
    disable_context_highlighting = true,
    signs = {section = {">", "v"}, item = {">", "v"}, hunk = {"", ""}},
    integrations = {diffview = true},
    mappings = {status = {["B"] = "BranchPopup", ["s"] = ""}}
}
