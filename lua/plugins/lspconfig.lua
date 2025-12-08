return {
    {
        "mason-org/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "mason-org/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "stylua",
                    "rust_analyzer",
                    "basedpyright",
                    "clangd",
                    "jdtls",
                    "ts_ls",
                    "html",
                    "cssls",
                },
                automatic_enable = false
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            --== Lua
            vim.lsp.config["lua_ls"].cmd = { "/usr/bin/lua-language-server" }
            vim.lsp.config["lua_ls"] = {
                capabilities = capabilities,
                settings = {
                    Lua = {
                        runtime = {
                            version = 'LuaJIT',
                        },
                        diagnostics = {
                            globals = {
                                'vim',
                                'require'
                            },
                        },
                        workspace = {
                            library = vim.api.nvim_get_runtime_file("", true),
                        },
                        telemetry = {
                            enable = false,
                        },
                    },
                },
            }
            vim.lsp.enable("lua_ls")
        end
    }
}
