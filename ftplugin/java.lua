local config = {
  cmd = { vim.fn.stdpath 'data' .. '/mason/bin/jdtls' },
  root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw' }, { upward = true })[1]),

  settings = {
    java = {
      configuration = {
        runtimes = {
          {
            name = 'JavaSE-8',
            path = '/usr/lib/jvm/java-8-openjdk/',
          },
          {
            name = 'JavaSE-21',
            path = '/usr/lib/jvm/java-21-openjdk/',
          },
        },
      },
    },
  },
  -- This is currently required to have the server read the settings,
  -- In a future neovim build this may no longer be required
  on_init = function(client)
    client.notify('workspace/didChangeConfiguration', { settings = client.config.settings })
  end,
}

require('jdtls').start_or_attach(config)
