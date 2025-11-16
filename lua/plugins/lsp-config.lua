return {
    {
        "williamboman/mason.nvim",
        config = function()
            -- setup mason with default properties
            require("mason").setup({
                ui = {
                    border = "rounded"
                }
            })
        end,
    },
    -- mason lsp config utilizes mason to automatically ensure lsp servers you want installed are installed
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            -- ensure that we have lua language server, typescript language server, java language server, and java test language server are installed
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "ts_ls", "jdtls", "cssls" },
            })
        end,
    },
    -- mason nvim dap utilizes mason to automatically ensure debug adapters you want installed are installed, mason-lspconfig will not automatically install debug adapters for us
    {
        "jay-babu/mason-nvim-dap.nvim",
        config = function()
            -- ensure the java debug adapter is installed
            require("mason-nvim-dap").setup({
                ensure_installed = { "java-debug-adapter", "java-test" },
            })
        end,
    },
    -- utility plugin for configuring the java language server for us
    {
        "mfussenegger/nvim-jdtls",
        dependencies = {
            "mfussenegger/nvim-dap",
            "ray-x/lsp_signature.nvim"
        },
    },
    {
        "ray-x/lsp_signature.nvim",
        config = function()
            require "lsp_signature".setup()
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local icons = require("config.icons")

              -- get access to the lspconfig plugins functions
            --local lspconfig = require("lspconfig")
            local lspconfig = vim.lsp.config["*"]

            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            -- setup the lua language server
            lspconfig.luals.setup({
                capabilities = capabilities,
            })

        end,
    },
}

