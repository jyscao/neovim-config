local S = {}

S.dependencies = {
  "nvim-telescope/telescope.nvim",
}

function S.config()
  require("utils.keymap").n("<leader>se", "<Cmd>lua require('elixir-extras').elixir_view_docs({include_mix_libs=true})<CR>")
end

S.ft = {"elixir", "heex", }

return S
