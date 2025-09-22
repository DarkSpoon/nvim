return {
    -- Command and arguments to start the server.
    cmd = { 'gopls' },

    -- Filetypes to automatically attach to.
    filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
    -- Sets the "root directory" to the parent directory of the file in the
    -- current buffer that contains either a ".luarc.json" or a
    -- ".luarc.jsonc" file. Files that share a root directory will reuse
    -- the connection to the same LSP server.
    -- Nested lists indicate equal priority, see |vim.lsp.Config|.
    -- root_markers = { { '.luarc.json', '.luarc.jsonc' }, '.git' },
    root_markers = { { 'go.work', 'go.mod', '.git' } },

    -- Specific settings to send to the server. The schema for this is
    -- defined by the server. 
    settings = {
        gopls = {
            analyses = {
               unusedparams = true,
            },
            staticcheck = true,
                completeUnimported = true,
            usePlaceholders = true,
        },
    },
}
