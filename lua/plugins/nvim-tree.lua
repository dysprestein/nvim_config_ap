return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = true,
  cmd = { "NvimTreeToggle", "NvimTreeFindFile" },
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local function my_on_attach(bufnr)
      local api = require "nvim-tree.api"

      local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      -- default mappings
      api.config.mappings.default_on_attach(bufnr)

      -- custom mappings
      vim.keymap.set('n', 'C', api.tree.change_root_to_node, opts('CD'))
      vim.keymap.set('n', 'v', api.node.open.vertical, opts('Open: Vertical Split'))
      vim.keymap.set('n', 's', api.node.open.horizontal, opts('Open: Horizontal Split'))
      vim.keymap.set('n', 'u', api.tree.change_root_to_parent, opts('Up'))
    end

    -- pass to setup along with your other options
    require("nvim-tree").setup {
      ---
      on_attach = my_on_attach,
      view = {
        width = 45,
      },
      actions = {
          change_dir = {
              global = true,
          }
      },
      ---
    }
  end,
}
