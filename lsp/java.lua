local M = {}
-- Determine OS
local home = os.getenv "HOME"
if vim.fn.has "mac" == 1 then
  WORKSPACE_PATH = home .. "/workspace/"
  CONFIG = "mac"
elseif vim.fn.has "unix" == 1 then
  WORKSPACE_PATH = home .. "/workspace/"
  CONFIG = "linux"
else
  print "Unsupported system"
end

INSTALL_ROOT_PATH = os.getenv "HOME" .. "/.local/share/nvim/mason"
LSP_ROOT_PATH = INSTALL_ROOT_PATH .. "/packages"
local _jdtls, jdtls = pcall(require, "jdtls")
if not _jdtls then
  return
end

local function on_init(client)
  if client.config.settings then
    client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
  end
end

local share_dir = os.getenv "HOME" .. "/.local/share"
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = share_dir .. "/eclipse/" .. project_name
-- 设置java可执行文件
local java_cmd = "/usr/bin/java"
-- ms-debug相关
local bundles = {
  vim.fn.glob(
    share_dir
      .. "/nvim/debug_extensions/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar"
  ),
}

vim.list_extend(
  bundles,
  vim.split(vim.fn.glob(share_dir .. "/nvim/debug_extensions/vscode-java-test/server/*.jar"), "\n")
)
M.config = {
  cmd = {
    java_cmd,
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-javaagent:" .. home .. "/.local/share/nvim/mason/packages/jdtls/lombok.jar",
    "-Xms256m",
    "-Xmx2048m",
    "--add-modules=ALL-SYSTEM",
    "--add-opens",
    "java.base/java.util=ALL-UNNAMED",
    "--add-opens",
    "java.base/java.lang=ALL-UNNAMED",
    "-jar",
    LSP_ROOT_PATH .. "/jdtls/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar",
    "-configuration",
    LSP_ROOT_PATH .. "/jdtls/config_linux",
    "-data",
    workspace_dir,
  },
  flags = {
    debounce_text_changes = 150,
    allow_incremental_sync = true,
  },
  --root_dir = require("jdtls.setup").find_root({"build.gradle", "pom.xml", ".git"}),
  -- Using .metadata dir (Eclipse workspace) as reference for setting root dir
  root_dir = jdtls.setup.find_root { ".metadata", "pom.xml", ".git" },
  on_init = on_init,
  init_options = {
    bundles = bundles,
  },
  settings = {
    java = {
      signatureHelp = {
        enabled = true,
      },
      saveActions = {
        organizeImports = true,
      },
      completion = {
        maxResults = 20,
        favoriteStaticMembers = {
          "org.hamcrest.MatcherAssert.assertThat",
          "org.hamcrest.Matchers.*",
          "org.hamcrest.CoreMatchers.*",
          "org.junit.jupiter.api.Assertions.*",
          "java.util.Objects.requireNonNull",
          "java.util.Objects.requireNonNullElse",
          "org.mockito.Mockito.*",
        },
      },
      sources = {
        organizeImports = {
          starThreshold = 9999,
          staticStarThreshold = 9999,
        },
      },
      codeGeneration = {
        toString = {
          template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
        },
      },
    },
  },
}
vim.opt_local.shiftwidth = 2
vim.opt_local.tabstop = 2
vim.opt_local.cmdheight = 2 -- more space in the neovim command line for displaying messages

-- Find root of project
--local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
-- config = {
--   settings = {
--     java = {
--       eclipse = {
--         downloadSources = true,
--       },
--       configuration = {
--         updateBuildConfiguration = "interactive",
--       },
--       maven = {
--         downloadSources = true,
--       },
--       implementationsCodeLens = {
--         enabled = true,
--       },
--       referencesCodeLens = {
--         enabled = true,
--       },
--       references = {
--         includeDecompiledSources = true,
--       },
--       inlayHints = {
--         parameterNames = {
--           enabled = "all", -- literals, all, none
--         },
--       },
--       format = {
--         enabled = false,
--       },
--     },
--     signatureHelp = { enabled = true },
--     completion = {
--       favoriteStaticMembers = {
--         "org.hamcrest.MatcherAssert.assertThat",
--         "org.hamcrest.Matchers.*",
--         "org.hamcrest.CoreMatchers.*",
--         "org.junit.jupiter.api.Assertions.*",
--         "java.util.Objects.requireNonNull",
--         "java.util.Objects.requireNonNullElse",
--         "org.mockito.Mockito.*",
--       },
--     },
--     contentProvider = { preferred = "fernflower" },
--     extendedClientCapabilities = extendedClientCapabilities,
--     sources = {
--       organizeImports = {
--         starThreshold = 9999,
--         staticStarThreshold = 9999,
--       },
--     },
--     codeGeneration = {
--       toString = {
--         template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
--       },
--       useBlocks = true,
--     },
--   },
--
--   flags = {
--     allow_incremental_sync = true,
--   },
-- }
-- jdtls.start_or_attach(config)
--
-- require("jdtls").setup_dap()
-- require("jdtls.setup").add_commands()

vim.cmd "command! -buffer -nargs=? -complete=custom,v:lua.require'jdtls'._complete_compile JdtCompile lua require('jdtls').compile(<f-args>)"
vim.cmd "command! -buffer -nargs=? -complete=custom,v:lua.require'jdtls'._complete_set_runtime JdtSetRuntime lua require('jdtls').set_runtime(<f-args>)"
vim.cmd "command! -buffer JdtUpdateConfig lua require('jdtls').update_project_config()"
-- vim.cmd "command! -buffer JdtJol lua require('jdtls').jol()"
vim.cmd "command! -buffer JdtBytecode lua require('jdtls').javap()"
-- vim.cmd "command! -buffer JdtJshell lua require('jdtls').jshell()"

-- local opts = { noremap = true, silent = true }
-- local map = vim.api.nvim_set_keymap

-- map("n", "<A-j>", "<Cmd>Lspsaga diagnostic_jump_next<CR>", opts)
-- map("n", "K", "<Cmd>Lspsaga hover_doc<CR>", opts)
-- map("n", "sd", "<Cmd>Lspsaga lsp_finder<CR>", opts)
-- map("i", "<A-k>", "<Cmd>Lspsaga signature_help<CR>", opts)
-- map("n", "sp", "<Cmd>Lspsaga preview_definition<CR>", opts)
-- map("n", "sr", "<Cmd>Lspsaga rename<CR>", opts)
-- map("n", "<leader>la", "<Cmd>lua require('jdtls').code_action()<CR>", { silent = true })
return M;
