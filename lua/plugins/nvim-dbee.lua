local S = {}

S.dependencies = {
  "MunifTanjim/nui.nvim",
}

S.build = function()
  -- Install tries to automatically detect the install method.
  -- if it fails, try calling it with one of these parameters:
  --    "curl", "wget", "bitsadmin", "go"
  require("dbee").install()
end

S.config = function()
  require("dbee").setup(--[[optional config]])
end

S.event = "VeryLazy"

return S
