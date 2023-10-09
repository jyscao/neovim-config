local M = {}

-- useful for debugging/viewing table contents (taken from: https://stackoverflow.com/a/41943392/5437918)
local function stringify_table(tbl, indent)
  if not indent then indent = 0 end
  local toprint = string.rep(" ", indent) .. "{\n"
  indent = indent + 2
  for k, v in pairs(tbl) do
    toprint = toprint .. string.rep(" ", indent)
    if (type(k) == "number") then
      toprint = toprint .. "[" .. k .. "] = "
    elseif (type(k) == "string") then
      toprint = toprint  .. k ..  "= "
    end
    if (type(v) == "number") then
      toprint = toprint .. v .. ",\n"
    elseif (type(v) == "string") then
      toprint = toprint .. "\"" .. v .. "\",\n"
    elseif (type(v) == "table") then
      toprint = toprint .. stringify_table(v, indent + 2) .. ",\n"
    else
      toprint = toprint .. "\"" .. tostring(v) .. "\",\n"
    end
  end
  toprint = toprint .. string.rep(" ", indent-2) .. "}"
  return toprint
end

function M.print_tbl(tbl)
  print(stringify_table(tbl))
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
