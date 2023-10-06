local pickers = require'telescope.pickers'
local finders = require'telescope.finders'
local conf = require'telescope.config'.values
local actions = require'telescope.actions'
local action_state = require'telescope.actions.state'
local previewers = require'telescope.previewers'
local ts_utils = require'telescope.utils'
local defaulter = ts_utils.make_default_callable

local uv = vim.loop
local api = vim.api
local scnvim = require'scnvim'

local M = {}

local scnvim_class_definitions = function(opts)
  opts = opts or {}
  local path = require "scnvim/path".get_plugin_root_dir()
  local tagsPath = require "scnvim/path".get_cache_dir() .. "/tags"
  local tagsFile = io.open(tagsPath)
  local tagPaths = {}

  for line in tagsFile:lines() do
    local tagname, tagpath, _, _ = line:match("%s*(.-)\t%s*(.-)\t%s*(.-)\t%s*(.-)")
    tagPaths[tostring(tagname)] = tagpath
  end

  tagsFile:close()

  local tagKeys = {}

  for key, _ in pairs(tagPaths) do
    table.insert(tagKeys, key)
  end

  -- Run a telescope finder that searches through the tagKeys, and when one is chosen, it will open a new file tab with the chosen path
  require("telescope.pickers").new({}, {
    prompt_title = "SuperCollider class definitions",
    finder = require("telescope.finders").new_table({
      results = tagKeys
    }),
    sorter = require("telescope.config").values.generic_sorter(opts),
    -- Add a previewer that shows the file in question
    -- FIXME: This doesn't work yet
    previewer = require("telescope.previewers").cat.new(opts),
    attach_mappings = function(prompt_bufnr, map)
      local open_class = function()
        local selection = require("telescope.actions.state").get_selected_entry()
        require("telescope.actions").close(prompt_bufnr)

        -- Open the file in a new tab
        vim.cmd("tabnew " .. tagPaths[selection.value])
      end

      map("i", "<CR>", open_class)
      map("n", "<CR>", open_class)

      return true
    end,

  }):find()
end

M.scnvim_class_definitions = scnvim_class_definitions

return M
