local M = {}

local lazy_spec_properties = {
  "dir",
  "url",
  "name",
  "dev",
  "lazy",
  "enabled",
  "cond",
  "dependencies",
  "init",
  "opts",
  "config",
  "main",
  "build",
  "branch",
  "tag",
  "commit",
  "version",
  "pin",
  "submodules",
  "event",
  "cmd",
  "ft",
  "keys",
  "module",
  "priority",
  "optional",
}

local function load_plugin_spec_module(plugin_name)
  local slash_idx = string.find(plugin_name, "/")
  local base_name = string.sub(plugin_name, slash_idx + 1)
  return require("plugins." .. base_name)
end

local function assign_spec_properties(plugin_spec)
  local spec_table = {}
  for _, prop in ipairs(lazy_spec_properties) do
    if plugin_spec[prop] then
      spec_table[prop] = plugin_spec[prop]
    end
  end
  return spec_table
end

function M.get_plugin_spec_table(plugin_name)
  local spec = load_plugin_spec_module(plugin_name)
  local spec_table = assign_spec_properties(spec)
  spec_table[1] = plugin_name
  return spec_table
end

return M
