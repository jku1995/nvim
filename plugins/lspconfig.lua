-- custom.plugins.lspconfig
local lsp_config = require("plugins.configs.lspconfig");
local capabilities = lsp_config.capabilities

local lspconfig = require "lspconfig"
--local servers = { "html", "cssls", "clangd", "jsonls", "tsserver", 'tailwindcss' , 'bashls' }
--lua_ls在nvchad中已配置,此处如果添加则会覆盖原有配置
local servers = { "clangd", "jsonls", "bashls", "rust_analyzer", "jdtls" }

--自定义lsp配置
local java = require "custom.lsp.java"
lspconfig.jdtls.setup(java)

local on_attach = function(client, bufnr)
  lsp_config.on_attach(client, bufnr)
  if client.name == "jdtls" then
    local jdtls = require "jdtls"
    jdtls.setup_dap { hotcodereplace = "auto" }
    jdtls.setup.add_commands()
    -- 自动检查Main方法和设置dap配置
    require("jdtls.dap").setup_dap_main_class_configs {
      config_overrides = {
        vmArgs = "-Dspring.profiles.active=local",
      },
    }
  end
end

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
