local Config = {};

function Config.getRootPath()
  local lsptools = require("lspconfig.util");
  return lsptools.find_git_ancestor(vim.fn.getcwd()) or vim.fn.getcwd();
end

function Config.getLocalConfig()
  local rootDir = Config.getRootPath();
  local filename = '.nvim.conf';
  local configPath = rootDir .. '/' .. filename;

  local file = io.open(configPath, 'r');

  if not file then
    return {};
  end

  local config = {};

  for line in file:lines() do
    local key, value = line:match('^%s*([%w_]+)%s*=%s*["\'](.-)["\']%s*$')

    if key and value then
      config[key] = value;
    end
  end

  file:close();
  return config;
end


return Config;
