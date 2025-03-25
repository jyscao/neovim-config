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
    -- put some options here or leave it empty to use default settings
  })

  -- set keymaps
  local keymap = require("utils.keymap")

  -- keymap.n("<leader>X",  "<Cmd>XcodebuildPicker<CR>",              { desc = "XcB: Show Actions" })
  keymap.n("<leader>xf", "<Cmd>XcodebuildProjectManager<CR>",         { desc = "XcB: Show Project Manager Actions" })

  keymap.n("<leader>xb", "<Cmd>XcodebuildBuild<CR>",                  { desc = "XcB: Build Project" })
  keymap.n("<leader>xB", "<Cmd>XcodebuildBuildForTesting<CR>",        { desc = "XcB: Build For Testing" })
  keymap.n("<leader>xr", "<Cmd>XcodebuildBuildRun<CR>",               { desc = "XcB: Build & Run Project" })

  keymap.n("<leader>xt", "<Cmd>XcodebuildTest<CR>",                   { desc = "XcB: Run Tests" })
  keymap.x("<leader>xt", "<Cmd>XcodebuildTestSelected<CR>",           { desc = "XcB: Run Selected Tests" })
  keymap.n("<leader>xT", "<Cmd>XcodebuildTestClass<CR>",              { desc = "XcB: Run Current Test Class" })
  keymap.n("<leader>x.", "<Cmd>XcodebuildTestRepeat<CR>",             { desc = "XcB: Repeat Last Test Run" })

  keymap.n("<leader>xl", "<Cmd>XcodebuildToggleLogs<CR>",             { desc = "XcB: Toggle Xcodebuild Logs" })
  keymap.n("<leader>xc", "<Cmd>XcodebuildToggleCodeCoverage<CR>",     { desc = "XcB: Toggle Code Coverage" })
  keymap.n("<leader>xC", "<Cmd>XcodebuildShowCodeCoverageReport<CR>", { desc = "XcB: Show Code Coverage Report" })
  keymap.n("<leader>xe", "<Cmd>XcodebuildTestExplorerToggle<CR>",     { desc = "XcB: Toggle Test Explorer" })
  keymap.n("<leader>xs", "<Cmd>XcodebuildFailingSnapshots<CR>",       { desc = "XcB: Show Failing Snapshots" })

  keymap.n("<leader>xp", "<Cmd>XcodebuildPreviewGenerateAndShow<CR>", { desc = "XcB: Generate Preview" })
  keymap.n("<leader>x<CR>", "<Cmd>XcodebuildPreviewToggle<CR>",       { desc = "XcB: Toggle Preview" })

  -- keymap.n("<leader>xd", "<Cmd>XcodebuildSelectDevice<CR>",        { desc = "XcB: Select Device" })
  keymap.n("<leader>xq", "<Cmd>Telescope quickfix<CR>",               { desc = "XcB: Show QuickFix List" })

  keymap.n("<leader>xx", "<Cmd>XcodebuildQuickfixLine<CR>",           { desc = "XcB: Quickfix Line" })
  keymap.n("<leader>xa", "<Cmd>XcodebuildCodeActions<CR>",            { desc = "XcB: Show Code Actions" })
end

S.ft = "swift"

return S
