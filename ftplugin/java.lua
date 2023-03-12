local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

--require("luasnip").setup().config()

--local workspace_dir = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')

local config = {
    -- The command that starts the language server
    -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
    cmd = {

        -- 💀
        'java', --'C:\\Program Files\\Java\\jdk-17\\bin\\java.exe', -- or '/path/to/java17_or_newer/bin/java'
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
        '--add-modules=ALL-SYSTEM',
        '-jar', 'C:\\Users\\karthik\\AppData\\Local\\nvim-data\\mason\\packages\\jdtls\\plugins\\org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',
        '-configuration', 'C:\\Users\\karthik\\AppData\\Local\\nvim-data\\mason\\packages\\jdtls\\config_win',
        --'-data', vim.fn.expand('C:\\Users\\karthik\\Documents') .. workspace_dir,
        '-data', 'C:\\Users\\karthik\\Documents\\jdtls-files',
    },
    root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'}),
    capabilities = capabilities,
    settings = {
        java = {
        }
    },
    init_options = {
        bundles = {}
    },
    vim.keymap.set('n', '<A-o>', "<Cmd>lua require('jdtls').organize_imports()<CR>"),
}
-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
require('jdtls').start_or_attach(config)

