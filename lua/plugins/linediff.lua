local S = {}

function S.init()
  vim.g.linediff_first_buffer_command   = 'leftabove new'
  vim.g.linediff_further_buffer_command = 'rightbelow vertical new'
  vim.g.linediff_modify_statusline = 1  -- TODO/FIXME: show diff source info (b:differ.description) on status-line

  -- TODO: tweak plugin options (see `:h linediff`)
  -- g:linediff_indent
  -- g:linediff_buffer_type
  -- g:linediff_diffopt
  -- g:linediff_sign_highlight_group
end

function S.config()
  local keymap = require("utils.keymap")

  -- set keymaps
  keymap._map('x', '<leader>xd', ":Linediff<CR>")
  keymap.n('<leader>xd', "<Cmd>LinediffReset<CR>")

  -- set convenient exit keymap
  vim.api.nvim_create_autocmd('User', {
    callback = function()
      keymap.n('q', '<Cmd>LinediffReset<CR>:e<CR>', { buffer = true })
      -- NOTE: the extra `:e<CR>` is to workaround Linediff's exiting behavior not triggering the
      -- WinEnter event, and thus does not activate our custom FocusedWindow autocmd group w/o it
    end,
    group = require("utils.augroup-defs").easy_quit_key_group,
    pattern = 'LinediffBufferReady',
  })

  -- TODO: config Linediff to show >2 selections; see `:LinediffAdd` & `:LinediffShow`
  -- TODO: config Linediff for assisting w/ resolving merge conflicts; see `:LinediffMerge` & `:LinediffPick`
  -- TODO: config Linediff operator for motion & text-objects; see `:h linediff-mappings`
end

S.event = "VeryLazy"

return S
