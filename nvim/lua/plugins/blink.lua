return
{
    'saghen/blink.cmp',
    event = "InsertEnter",
    dependencies = { 'rafamadriz/friendly-snippets' },
    version = '1.*',
    opts = {
        keymap = { preset = 'enter' },
        appearance = {
            nerd_font_variant = 'mono'
        },
        fuzzy = { implementation = "prefer_rust_with_warning" },
        signature = { enabled = true },
        completion = {
            documentation = { auto_show = false },
            list = { selection = { preselect = false, auto_insert = true } },
            ghost_text = { enabled = true },
            menu = {
                border = 'single',
                draw = {
                    columns = { { "label" }, { "kind_icon", "kind", gap = 1 } }
                }
            },
            accept = {
                auto_brackets = {
                    enabled = true,
                    kind_resolution = { blocked_filetypes = {} }
                }
            }
        },
    },
}
