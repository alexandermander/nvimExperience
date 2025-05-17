return {
    {
        "seblj/roslyn.nvim",
        ft = "cs", -- Only load for C# files
        opts = {
            config = {
                -- Pass in options to `vim.lsp.start`
                -- See `:h vim.lsp.ClientConfig` for details
            },
            exe = {
                "dotnet",
                vim.fs.joinpath(vim.fn.stdpath("data"), "roslyn", "Microsoft.CodeAnalysis.LanguageServer.dll"),
            },
            args = {
                "--logLevel=Information",
                "--extensionLogDirectory=" .. vim.fs.dirname(vim.lsp.get_log_path()),
            },
            filewatching = true,
            choose_sln = nil, -- Optional: Customize if needed
            ignore_sln = nil, -- Optional: Customize if needed
            broad_search = false,
            lock_target = false,
        },
    },
}

