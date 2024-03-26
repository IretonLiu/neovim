local dap = require('dap')
require('dap.ext.vscode').load_launchjs()

dap.configurations.python = {
    {
        -- The first three options are required by nvim-dap
        type = 'python', -- the type here established the link to the adapter definition: `dap.adapters.python`
        request = 'launch',
        name = "Launch file",

        -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

        program = "${file}", -- This configuration will launch the current file if used.
        pythonPath = function()
            -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
            -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
            -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
            local cwd = vim.fn.getcwd()
            if vim.fn.executable(cwd .. '/env/bin/python') == 1 then
                print('found env')
                return cwd .. '/env/bin/python'
            elseif vim.fn.executable(cwd .. '/.env/bin/python') == 1 then
                return cwd .. '/.env/bin/python'
            else
                print('found conda')
                return os.getenv('CONDA_PREFIX') .. '/bin/python'
            end
        end,
    },
}