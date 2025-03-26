local S = {}

S.dependencies = {
  -- "nvim-telescope/telescope.nvim",
}

function S.config()
  -- FIXME: the `texthl=TSFunction` doesn't appear to work; OR
  -- have it not conflict w/ gitsigns, e.g. change marker colors to be the same as that of the signs on the same line
  require("elixir-extras").setup_multiple_clause_gutter()

  -- require("utils.keymap").n("<leader>se", "<Cmd>lua require('elixir-extras').elixir_view_docs({include_mix_libs=true})<CR>")
  -- require("elixir-extras").module_complete()
end

S.ft = {"elixir", "heex", }

return S
