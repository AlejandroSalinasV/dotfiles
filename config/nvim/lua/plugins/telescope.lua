local utils = require('utils')

require("telescope").setup {
    defaults = {
        vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case"
        },
        prompt_prefix = " ",
        selection_caret = " ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "descending",
        layout_strategy = "horizontal",
        layout_config={
            horizontal = {
                mirror = false,
            },
            vertical = {
                mirror = false
            },
            height = 0.50,
            width = 0.70,
        },
        file_sorter =  require'telescope.sorters'.get_fuzzy_file,
        file_ignore_patterns = {},
        generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
        -- path_display = {
            -- "tail",
            -- "absolute",
        -- },
        winblend = 0,
        border = {},
        borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
        color_devicons = true,
        use_less = true,
        set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
        file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
        grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
        qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
        -- Developer configurations: Not meant for general override
        buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
    },
    extensions = {
        media_files = {
            filetypes = {"png", "webp", "jpg", "jpeg"},
            find_cmd = "rg" -- find command (defaults to `fd`)
        }
    }
}

require("telescope").load_extension("media_files")

-- mappings
utils.map(
    "n",
    "<leader>fm",
    [[<Cmd>lua require('telescope').extensions.media_files.media_files()<CR>]])

utils.map("n", "<Leader>fb", [[<Cmd>lua require('telescope.builtin').buffers()<CR>]])
utils.map("n", "<Leader>ft", [[<Cmd>lua require('telescope.builtin').help_tags()<CR>]])
utils.map("n", "<Leader>fo", [[<Cmd>lua require('telescope.builtin').oldfiles()<CR>]])
utils.map('n', '<leader>fc', [[<cmd>lua require('telescope.builtin').builtin.commands()<CR>]])
utils.map('n', '<leader>ff', [[<cmd>lua require('telescope.builtin').find_files()<CR>]])
utils.map('n', '<leader>fg', [[<cmd>lua require('telescope.builtin').git_files()<CR>]])
utils.map('n', '<leader>f' , [[<cmd>lua require('telescope.builtin').file_browser()<CR>]])
utils.map('n', '<leader>fh', [[<cmd>lua require('telescope.builtin').command_history()<CR>]])
utils.map('n', '<leader>gt',  [[<Cmd>lua require('telescope.builtin').git_status()<CR>]])
utils.map('n', '<leader>g', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]])
utils.map('n', '<leader>gs', [[<cmd>lua require('telescope.builtin').grep_string()<CR>]])

-- highlights
local cmd = vim.cmd
cmd "hi TelescopeBorder   guifg=#2a2e36"
cmd "hi TelescopePromptBorder   guifg=#2a2e36"
cmd "hi TelescopeResultsBorder  guifg=#2a2e36"
cmd "hi TelescopePreviewBorder  guifg=#525865"