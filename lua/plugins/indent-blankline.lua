local S = {}

-- TODO: see :help ibl.config to see all options & customize
S.opts = {
  indent = { char = "│", },
  -- TODO: integrate w/ rainbow-delimiters.nvim
  -- see: https://github.com/lukas-reineke/indent-blankline.nvim#rainbow-delimitersnvim-integration
}

S.config = true
S.main = "ibl"

S.event = "VeryLazy"

return S
