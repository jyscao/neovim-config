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

local function get_dot_pos(plugin_name)
  local dot_nvim_pos = string.find(plugin_name, "%.nvim")
  local dot_vim_pos = string.find(plugin_name, "%.vim")
  return dot_nvim_pos or dot_vim_pos or nil	-- NOTE: this implicitly assumes a plugin name does not have both .nvim and .vim simultaneously
end

local function get_plugin_stripped_name(plugin_name)
  local i = string.find(plugin_name, "/") + 1
  local dot_pos = get_dot_pos(plugin_name)
  local j = dot_pos and (dot_pos - 1) or -1
  return string.sub(plugin_name, i, j)
end

local function load_plugin_spec_module(plugin_name)
  local stripped_name = get_plugin_stripped_name(plugin_name)
  local plugin_spec_modname = "plugins." .. stripped_name
  local status, spec_module = pcall(require, plugin_spec_modname)
  if status then
    return spec_module
  else
    return require("plugins._default_spec")
  end
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

function M.list_contains(list, elem)
  for _, v in ipairs(list) do
    if v == elem then
    	return true
    end
  end
  return false
end

return M
