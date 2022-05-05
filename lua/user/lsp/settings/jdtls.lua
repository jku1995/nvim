local M = {};

function M.setup()
-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.

-- If you started neovim within `~/dev/xy/project-1` this would resolve to `project-1`
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')

local workspace_dir = '$XDG_DATA_HOME/workspace-root/' .. project_name

local config = {
  -- The command that starts the language server
  -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
  cmd = {

    -- 💀
    'java', -- or '/path/to/java11_or_newer/bin/java'
            -- depends on if `java` is in your $PATH env variable and if it points to the right version.

    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xms1g',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',

    -- 💀
    '-jar', '$XDG_DATA_HOME/nvim-data/lsp_servers/jdtls/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',
         -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                                       ^^^^^^^^^^^^^^
         -- Must point to the                                                     Change this to
         -- eclipse.jdt.ls installation                                           the actual version


    -- 💀
    '-configuration', '$XDG_DATA_HOME/nvim-data/lsp_servers/jdtls/config_win',
                    -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        ^^^^^^
                    -- Must point to the                      Change to one of `linux`, `win` or `mac`
                    -- eclipse.jdt.ls installation            Depending on your system.


    -- 💀
    -- See `data directory configuration` section in the README
    '-data', workspace_dir
  },

  -- 💀
  -- This is the default if not provided, you can remove it. Or adjust as needed.
  -- One dedicated LSP server & client will be started per unique root_dir
  --root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'}),

  -- Here you can configure eclipse.jdt.ls specific settings
  -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
  -- for a list of options
  settings = {
  java = {
    home = "$JAVA_HOME",
    errors = {
      incompleteClasspath = {
        severity = "warning"
      }
    },
    configuration = {
      updateBuildConfiguration = "interactive",
      maven = {
        --maven settings
        userSettings = "C:/Users/bangsun/.m2/settings.xml"
      }
    },
    trace = {
      server = "verbose"
    },
    import = {
      gradle = {
        enabled = false
      },
      maven = {
        enabled = true
      },
      exclusions = { "**/node_modules/**", "**/.metadata/**", "**/archetype-resources/**", "**/META-INF/maven/**", "/**/test/**" }
    },
    referencesCodeLens = {
      enabled = false
    },
    signatureHelp = {
      enabled = false
    },
    implementationsCodeLens = {
      enabled = false
    },
    format = {
      enabled = true
    },
    saveActions = {
      organizeImports = true
    },
    contentProvider = {
      preferred = nil
    },
    autobuild = {
      enabled = false
    },
    completion = {
      favoriteStaticMembers = { "org.junit.Assert.*", "org.junit.Assume.*", "org.junit.jupiter.api.Assertions.*", "org.junit.jupiter.api.Assumptions.*", "org.junit.jupiter.api.DynamicContainer.*", "org.junit.jupiter.api.DynamicTest.*" },
      importOrder = { "java", "javax", "com", "org" }
    }
  }
},

  -- Language server `initializationOptions`
  -- You need to extend the `bundles` with paths to jar files
  -- if you want to use additional eclipse.jdt.ls plugins.
  --
  -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
  --
  -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
  init_options = {
    bundles = {}
  },
}
-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
require('jdtls').start_or_attach(config)
end
return M
