local S = {}

-- function S.init()
-- end

S.dependencies = {
  "nvim-lua/plenary.nvim",
  "hrsh7th/nvim-cmp",
  "nvim-telescope/telescope.nvim",
}

S.opts = {
  -- Required, the path to your vault directory.
  dir = "~/Documents/Jethro's Thoughts",

  note_id_func = function()
    local id_gen_py = "~/programming/zettelkasten-id-gen/main.py"
    return io.popen(id_gen_py):read("*a")
  end,

  note_frontmatter_func = function(note)
    -- This is equivalent to the default frontmatter function.
    local out = { Title = "", Date = "%A, %m %d, %Y %H:%M", Tags = note.tags, }
    -- `note.metadata` contains any manually added fields in the frontmatter.
    -- So here we just make sure those fields are kept in the frontmatter.
 --    if note.metadata ~= nil and require("obsidian").util.table_length(note.metadata) > 0 then
 --      for k, v in pairs(note.metadata) do
	-- out[k] = v
 --      end
 --    end
    return out
  end,
}

S.event = {
  -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
  "BufReadPre " .. vim.fn.expand("~") .. "/Documents/Jethro's Thoughts/**.md",
  "BufNewFile " .. vim.fn.expand("~") .. "/Documents/Jethro's Thoughts/**.md",
}

return S
