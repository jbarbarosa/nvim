local jdk21_path =vim.fn.system("asdf where java openjdk-21"):gsub("\n", "")
local jdk17_path =vim.fn.system("asdf where java openjdk-17.0.2"):gsub("\n", "")

return {
  -- https://github.com/mfussenegger/nvim-jdtls
  'mfussenegger/nvim-jdtls',
  ft = 'java', -- Enable only on .java file extensions
  config = function()
    -- JDTLS (Java LSP) configuration
    local home = vim.env.HOME -- Get the home directory
    local jdtls = require("jdtls")
    local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
    local workspace_dir = home .. "/jdtls-workspace/" .. project_name
    local system_os = ""
    if vim.fn.has("mac") == 1 then
      system_os = "mac"
    else
      system_os = "linux"
    end

    -- Needed for debugging
    local bundles = {
      vim.fn.glob(home .. "/.local/share/nvim/mason/share/java-debug-adapter/com.microsoft.java.debug.plugin.jar"),
    }

    -- Needed for running/debugging unit tests
    vim.list_extend(bundles, vim.split(vim.fn.glob(home .. "/.local/share/nvim/mason/share/java-test/*.jar", true), "\n"))

    -- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
    local config = {
      -- The command that starts the language server
      -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
      cmd = {
        "java",
        "-Declipse.application=org.eclipse.jdt.ls.core.id1",
        "-Dosgi.bundles.defaultStartLevel=4",
        "-Declipse.product=org.eclipse.jdt.ls.core.product",
        "-Dlog.protocol=true",
        "-Dlog.level=ALL",
        "-javaagent:" .. home .. "/.local/share/nvim/mason/share/jdtls/lombok.jar",
        "-Xmx4g",
        "--add-modules=ALL-SYSTEM",
        "--add-opens",
        "java.base/java.util=ALL-UNNAMED",
        "--add-opens",
        "java.base/java.lang=ALL-UNNAMED",

        -- Eclipse jdtls location
        "-jar",
        home .. "/.local/share/nvim/mason/share/jdtls/plugins/org.eclipse.equinox.launcher.jar",
        "-configuration",
        home .. "/.local/share/nvim/mason/packages/jdtls/config_" .. system_os,
        "-data",
        workspace_dir,
      },

      -- This is the default if not provided, you can remove it. Or adjust as needed.
      -- One dedicated LSP server & client will be started per unique root_dir
      root_dir = require("jdtls.setup").find_root({ ".git" }),

      -- Here you can configure eclipse.jdt.ls specific settings
      -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
      settings = {
        java = {
          -- TODO Replace this with the absolute path to your main java version (JDK 17 or higher)
          home = jdk21_path,
          eclipse = {
            downloadSources = true,
          },
          configuration = {
            updateBuildConfiguration = "interactive",
            runtimes = {
                {
                    name = "JavaSE-17",
                    path = jdk17_path
                },
            },
          },
          maven = {
            downloadSources = true,
          },
          implementationsCodeLens = {
            enabled = true,
          },
          referencesCodeLens = {
            enabled = true,
          },
          references = {
            includeDecompiledSources = true,
          },
          signatureHelp = { enabled = true },
          format = {
            enabled = true,
            -- Formatting works by default, but you can refer to a specific file/URL if you choose
            -- settings = {
            --   url = "https://github.com/google/styleguide/blob/gh-pages/intellij-java-google-style.xml",
            --   profile = "GoogleStyle",
            -- },
          },
          completion = {
            favoriteStaticMembers = {
              "org.hamcrest.MatcherAssert.assertThat",
              "org.hamcrest.Matchers.*",
              "org.hamcrest.CoreMatchers.*",
              "org.junit.jupiter.api.Assertions.*",
              "java.util.Objects.requireNonNull",
              "java.util.Objects.requireNonNullElse",
              "org.mockito.Mockito.*",
            },
            importOrder = {
              "java",
              "javax",
              "com",
              "org",
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
            useBlocks = true,
          },
        },
      },
      -- Needed for auto-completion with method signatures and placeholders
      capabilities = require("cmp_nvim_lsp").default_capabilities(),
      flags = {
        allow_incremental_sync = true,
      },
      init_options = {
        -- References the bundles defined above to support Debugging and Unit Testing
        bundles = bundles,
        extendedClientCapabilities = jdtls.extendedClientCapabilities,
      },
    }

    -- Needed for debugging
    config["on_attach"] = function(_, _)
      jdtls.setup_dap({ config_overrides = { hotcodereplace = "auto" } })
      require("jdtls.dap").setup_dap_main_class_configs()
    end

    -- This starts a new client & server, or attaches to an existing client & server based on the `root_dir`.
    jdtls.start_or_attach(config)
  end
}
