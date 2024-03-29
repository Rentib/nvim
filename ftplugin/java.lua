local present, jdtls = pcall(require, "jdtls")
if not present then
  return
end

local home = os.getenv("HOME")
if vim.fn.has("unix") == 1 then
  WORKSPACE_PATH = home .. "/Desktop/workspace/"
  CONFIG = "linux"
else
  print("Unsupported system")
end

local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
local root_dir = require("jdtls.setup").find_root(root_markers)
if root_dir == "" then
  return
end

local extendedClientCapabilities = jdtls.extendedClientCapabilities
extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:t:t")
local workspace_dir = WORKSPACE_PATH .. project_name

local bundles = {}
local mason_path = vim.fn.glob(vim.fn.stdpath("data") .. "/mason/")

vim.list_extend(bundles, vim.split(vim.fn.glob(mason_path .. "packages/java-test/extension/server/*.jar"), "\n"))
-- vim.list_extend(bundles, vim.split(vim.fn.glob(mason_path .. "packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar"), "\n"))

local config = {
  cmd = {
    "java",

    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-javaagent:" .. home .. "/.local/share/nvim/mason/packages/jdtls/lombok.jar",
    "-Xms1g",
    "--add-modules=ALL-SYSTEM",
    "--add-opens",
    "java.base/java.util=ALL-UNNAMED",
    "--add-opens",
    "java.base/java.lang=ALL-UNNAMED",

    "-jar", vim.fn.glob(mason_path .. "packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"),

    "-configuration", mason_path .. "packages/jdtls/config_" .. CONFIG,

    "-data", workspace_dir,
  },

  capabilities = vim.lsp.protocol.make_client_capabilities(),
  root_dir = root_dir,

  settings = {
    java = {
      -- jdt = {
      --   ls = {
      --     vmargs = "-XX:+UseParallelGC -XX:GCTimeRatio=4 -XX:AdaptiveSizePolicyWeight=90 -Dsun.zip.disableMemoryMapping=true -Xmx1G -Xms100m"
      --   }
      -- },
      eclipse = { downloadSources = true, },
      configuration = { updateBuildConfiguration = "interactive", },
      maven = { downloadSources = true, },
      implementationsCodeLens = { enabled = true, },
      referencesCodeLens = { enabled = true, },
      references = { includeDecompiledSources = true, },
      inlayHints = { parameterNames = { enabled = "all", }, },
      format = { enabled = false, },
    },
    signatureHelp = { enabled = true },
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
    },
    contentProvider = { preferred = "fernflower" },
    extendedClientCapabilities = extendedClientCapabilities,
    sources = {
      organizeImports = { starThreshold = 9999, staticStarThreshold = 9999, }, },
    codeGeneration = {
      toString = { template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}", },
      useBlocks = true,
    },
  },

  flags = { allow_incremental_sync = true, },
  init_options = { bundles = bundles, },
}

config["on_attach"] = function(_, _)
  local _, _ = pcall(vim.lsp.codelens.refresh)
  -- require("jdtls.dap").setup_dap_main_class_configs()
  -- require("jdtls").setup_dap({ hotcoderplace = "auto" })
end

vim.api.nvim_create_user_command("Refresh", function() local _, _ = pcall(vim.lsp.codelens.refresh) end, {})

jdtls.start_or_attach(config)

local opts = { noremap = true, silent = true, nowait = true }

local mappings = {
  o = "<Cmd>lua require'jdtls'.organize_imports()<CR>",
  v = "<Cmd>lua require'jdtls'.extract_variable()<CR>",
  c = "<Cmd>lua require'jdtls'.extract_constant()<CR>",

  -- nvim-dap
  -- t = "<Cmd>lua require'jdtls'.dap.test_nearest_method()<CR>",
  -- T = "<Cmd>lua require'jdtls'.dap.test_class()<CR>",
}

for key, cmd in pairs(mappings) do
  vim.api.nvim_set_keymap("n", "<leader>j" .. key, cmd, opts)
end
