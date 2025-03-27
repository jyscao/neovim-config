local S = {}

S.version = "*"

S.dependencies = {
  "nvim-lua/plenary.nvim",
}

function S.config()
  local elixir = require("elixir")

  elixir.setup {
    nextls        = { enable = false},
    elixirls      = { enable = false},
  }
end

S.ft = {"elixir", "heex", }

return S
