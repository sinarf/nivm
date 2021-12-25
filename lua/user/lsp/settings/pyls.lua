local function lsp_provider(component)

    local clients = {}
    local icon = component.icon or ' '

    for _, client in pairs(vim.lsp.buf_get_clients()) do
        if client.name == "pyright" then
          -- Check if lsp was initialized with py_lsp
          if client.config.settings.python["pythonPath"] ~= nil then
            local venv_name = client.config.settings.python.venv_name
            clients[#clients+1] = icon .. client.name .. '('.. venv_name .. ')'
          end
        else
          clients[#clients+1] = icon .. client.name
        end
    end

    return table.concat(clients, ' ')
end
