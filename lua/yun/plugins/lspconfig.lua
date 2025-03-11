local lspconfig = require('lspconfig')

-- C/C++/C#
lspconfig.clangd.setup({
  cmd = { "/opt/homebrew/opt/llvm/bin/clangd"}, -- 確保你的 clangd 可執行
  filetypes = { "c", "cpp", "objc", "objcpp" },
  root_dir = lspconfig.util.root_pattern("compile_commands.json", ".git") or vim.loop.os_homedir(),
  settings = {
    clangd = {
      -- 自定義設置（可選）
    },
  },
})

-- Python
lspconfig.pyright.setup ({
    cmd = { "pyright-langserver", "--stdio" }, -- 確保此處命令正確
    settings = {
        python = {
            analysis = {
                typeCheckingMode = "basic",  -- 類型檢查模式（可選：off, basic, strict）
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
            },
        },
    },
})
-- JavaScript/TypeScript/HTML/CSS
--lspconfig.tsserver.setup {}
--lspconfig.html.setup {}
--lspconfig.cssls.setup {}

lspconfig.omnisharp.setup({
    cmd = { "omnisharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
    filetypes = { "cs" },
    root_dir = lspconfig.util.root_pattern("*.sln", "*.csproj", ".git"),
    settings = {
        ["omnisharp"] = {
            useModernNet = true,  -- 使用 .NET Core 版本（如果你的環境支援）
            enableRoslynAnalyzers = true,
            organizeImportsOnFormat = true,
            enableImportCompletion = true,
        },
    },
})
