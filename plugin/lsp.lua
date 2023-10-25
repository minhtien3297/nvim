local status_lsp_zero, lsp_zero = pcall(require, "lsp-zero")
local status_lspconfig, lspconfig = pcall(require, "lspconfig")
local status_mason, mason = pcall(require, "mason")
local status_mason_lspconfig, mason_lspconfig = pcall(require, "mason-lspconfig")

if not status_lsp_zero then
    return
end
if not status_lspconfig then
    return
end
if not status_mason then
    return
end
if not status_mason_lspconfig then
    return
end

lsp_zero.on_attach(function(client, bufnr)
    lsp_zero.default_keymaps({ buffer = bufnr })
    lsp_zero.buffer_autoformat()
end)

lsp_zero.set_sign_icons({
    error = " ✘",
    warn = " ▲",
    hint = " ⚑",
    info = " »",
})

mason.setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
        },
    },
})

local servers = {
    "lua_ls",
    "grammarly",
    "html",
    "cssls",
    "cssmodules_ls",
    "tailwindcss",
    "vuels",
    "volar",
    "stylelint_lsp",
    "eslint",
    "emmet_language_server",
    "tsserver",
    "jsonls",
    "taplo",
}

local function organize_imports()
    local params = {
        command = "_typescript.organizeImports",
        arguments = { vim.api.nvim_buf_get_name(0) },
    }

    vim.lsp.buf.execute_command(params)
end

mason_lspconfig.setup({
    ensure_installed = servers,
    automatic_installation = true,

    handlers = {
        lsp_zero.default_setup,

        ["tsserver"] = function()
            lspconfig.tsserver.setup({
                commands = {
                    OrganizeImports = {
                        organize_imports,
                        description = "Organize Imports",
                    },
                },
            })
        end,
    },
})
