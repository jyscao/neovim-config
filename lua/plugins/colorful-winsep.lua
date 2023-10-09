local S = {}

S.opts = {
  no_exec_files = {
    "lazy",
    -- "packer",
    "TelescopePrompt",
    "mason",
    -- "CompetiTest",
    -- "NvimTree",
    "ctrlspace",
  },
}

S.config = true
S.event = "WinNew"

return S
