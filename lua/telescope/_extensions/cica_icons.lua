local action_state = require("telescope.actions.state")
local actions = require("telescope.actions")
local conf = require("telescope.config").values
local entry_display = require("telescope.pickers.entry_display")
local finders = require("telescope.finders")
local icons = require("telescope-cica-icons").icons
local pickers = require("telescope.pickers")

local function action(icon)
  vim.api.nvim_put({ icon.value }, "c", true, true)
end

local function search(opts)
  local displayer = entry_display.create({
    separator = " ",
    items = {
      { width = 8 },
      { width = 16 },
      { width = 24 },
      { remaining = true },
    },
  })
  local make_display = function(entry)
    return displayer({
      entry.value,
      entry.unicode,
      entry.category,
      entry.tag,
    })
  end

  pickers.new(opts, {
    prompt_title = "Cica Icons",
    sorter = conf.generic_sorter(opts),
    finder = finders.new_table({
      results = icons,
      entry_maker = function(icon)
        return {
          ordinal = icon.unicode .. icon.category .. icon.tag,
          display = make_display,
          unicode = icon.unicode,
          value = icon.icon,
          category = icon.category,
          tag = icon.tag,
        }
      end,
    }),

    attach_mappings = function(prompt_bufnr)
      actions.select_default:replace(function()
        local icon = action_state.get_selected_entry()
        actions.close(prompt_bufnr)
        action(icon)
      end)
      return true
    end,
  }):find()
end

return require("telescope").register_extension({
  setup = function(config)
    action = config.action or action
  end,
  exports = {
    cica_icons = search,
  },
})
