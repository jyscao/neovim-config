local M = {}

function M.list_contains(list, elem)
  for _, v in ipairs(list) do
    if v == elem then
      return true
    end
  end
  return false
end

return M
