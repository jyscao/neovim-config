local S = {}

-- function S.init()
-- end

S.dependencies = {
  "nvim-telescope/telescope.nvim",
  "MunifTanjim/nui.nvim",
  "stevearc/oil.nvim",                -- (optional) to manage project files
  "nvim-treesitter/nvim-treesitter",  -- (optional) for Quick tests support (required Swift parser)
}

-- S.opts = {
-- }

function S.config()
  require("xcodebuild").setup({
  })

  -- set keymaps
  local keymap = require("utils.keymap")

  keymap.n("<leader>xf", "<Cmd>XcodebuildProjectManager<CR>",         { desc = "Show Project Manager Actions" })

  keymap.n("<leader>xb", "<Cmd>XcodebuildBuild<CR>",                  { desc = "Build Project" })
  keymap.n("<leader>xB", "<Cmd>XcodebuildBuildForTesting<CR>",        { desc = "Build For Testing" })
  keymap.n("<leader>xr", "<Cmd>XcodebuildBuildRun<CR>",               { desc = "Build & Run Project" })

  keymap.n("<leader>xt", "<Cmd>XcodebuildTest<CR>",                   { desc = "Run Tests" })
  keymap.x("<leader>xt", "<Cmd>XcodebuildTestSelected<CR>",           { desc = "Run Selected Tests" })
  keymap.n("<leader>xT", "<Cmd>XcodebuildTestClass<CR>",              { desc = "Run Current Test Class" })
  keymap.n("<leader>x.", "<Cmd>XcodebuildTestRepeat<CR>",             { desc = "Repeat Last Test Run" })

  keymap.n("<leader>xl", "<Cmd>XcodebuildToggleLogs<CR>",             { desc = "Toggle Xcodebuild Logs" })
  keymap.n("<leader>xc", "<Cmd>XcodebuildToggleCodeCoverage<CR>",     { desc = "Toggle Code Coverage" })
  keymap.n("<leader>xC", "<Cmd>XcodebuildShowCodeCoverageReport<CR>", { desc = "Show Code Coverage Report" })
  keymap.n("<leader>xe", "<Cmd>XcodebuildTestExplorerToggle<CR>",     { desc = "Toggle Test Explorer" })
  keymap.n("<leader>xs", "<Cmd>XcodebuildFailingSnapshots<CR>",       { desc = "Show Failing Snapshots" })

  keymap.n("<leader>xp", "<Cmd>XcodebuildPreviewGenerateAndShow<CR>", { desc = "Generate Preview" })
  keymap.n("<leader>x<CR>", "<Cmd>XcodebuildPreviewToggle<CR>",       { desc = "Toggle Preview" })

  keymap.n("<leader>xq", "<Cmd>Telescope quickfix<CR>",               { desc = "Show QuickFix List" })

  keymap.n("<leader>xx", "<Cmd>XcodebuildQuickfixLine<CR>",           { desc = "Quickfix Line" })
  keymap.n("<leader>xa", "<Cmd>XcodebuildCodeActions<CR>",            { desc = "Show Code Actions" })
end

S.ft = "swift"

return S
