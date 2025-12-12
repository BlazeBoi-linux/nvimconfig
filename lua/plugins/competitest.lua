return {
    "xeluxee/competitest.nvim",
    dependencies = "MunifTanjim/nui.nvim",
    ft = { "cpp", "c", "java", "rust" }, -- only load for certain filetypes
    config = function()
        require("competitest").setup({
            compile_command = {
                cpp = { exec = "g++", args = { "-std=gnu++17", "-O2", "-Wall", "$(FNAME)", "-o", "$(FNOEXT)" } },
            },
        })

        -- Keymaps for competitive programming
        vim.keymap.set("n", "<leader>cr", "<CMD>CompetiTest run<CR>")
        vim.keymap.set("n", "<leader>cc", "<CMD>CompetiTest receive problem<CR>")
        vim.keymap.set("n", "<leader>ca", "<CMD>CompetiTest add_testcase<CR>")
        vim.keymap.set("n", "<leader>cd", "<CMD>CompetiTest delete_testcase<CR>")
        vim.keymap.set("n", "<leader>ce", "<CMD>CompetiTest edit_testcase<CR>")
    end,
}
