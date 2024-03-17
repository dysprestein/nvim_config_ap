-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    if opts.remap and not vim.g.vscode then
      opts.remap = nil
    end
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })

-- Resize window using <alt> hjkl keys
map("n", "<M-k>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<M-j>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<M-h>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<M-l>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Quick Write and quit
map({ "n" }, "<leader>q", ":q<CR>", { desc = "", silent = true })
map({ "n" }, "<leader>Q", ":qa<CR>", { desc = "", silent = true })
map({ "n" }, "<leader>w", ":w<CR>", { desc = "", silent = true })
map({ "n" }, "<leader>t", ":tabnew<CR>", { desc = "", silent = true })

-- Navigate buffers
map({ "n" }, "n", "nzzzv", { desc = "", silent = true })
map({ "n" }, "N", "Nzzzv", { desc = "", silent = true })
map({ "n" }, "~", "gT", { desc = "", silent = true })

-- Term Copy paste
map({ "v" }, "<leader>y", '"+y', { desc = "", silent = true })
map({ "v" }, "<leader>p", '"+p', { desc = "", silent = true })
map({ "n" }, "<leader>p", '"+p', { desc = "", silent = true })
map({ "v" }, "<leader>Y", '"zy', { desc = "", silent = true })
map({ "v" }, "<leader>P", '"zp', { desc = "", silent = true })
map({ "n" }, "<leader>P", '"zp', { desc = "", silent = true })
map({ "v" }, "<leader>r", 'y:%s@<C-r>"@')

-- Better paste
map({ "v" }, "p", '"_dP', { desc = "", silent = true })

-- blackhole delete
map({ "n" }, "<leader>d", 'V"_d', { desc = "", silent = true })
map({ "v" }, "<leader>d", '"_d', { desc = "", silent = true })

-- inserting lines above and below in normal mode
map({ "n" }, "<leader>o", "o<esc>", { desc = "", silent = true })
map({ "n" }, "<leader>O", "O<esc>", { desc = "", silent = true })

-- Folding
map({ "n" }, "<Space>", "za", { desc = "", silent = true })

-- Moving Lines
map({ "v" }, "J", ":m '>+1<CR>gv=gv", { desc = "", silent = true })
map({ "v" }, "K", ":m '<-2<CR>gv=gv", { desc = "", silent = true })

-- better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<esc>", { desc = "Escape", noremap = true })
map({ "i", "n" }, "<M-s>", "<cmd>noh<cr>", { desc = "Escape", noremap = true })

-- Saner asterisk and hash search
map({ "n", "x" }, "*", "*N", { desc = "Forward search word under cursor" })
map({ "n", "x" }, "#", "#N", { desc = "Backward search word under cursor" })

-- Quick wrap
map({ "n" }, "<leader>W", ":set wrap! wrap?<CR>", { desc = "", silent = true })

-- select all
map({ "n" }, "<leader>A", "ggVG", { desc = "", silent = true })

-- diff
map({ "n" }, "\\dt", ":diffthis<CR>", { desc = "", silent = true })
map({ "n" }, "\\do", ":diffoff<CR>", { desc = "", silent = true })

-- refresh
map({ "n" }, "<leader>e", ":e<CR>", { desc = "", silent = true })

-- Quick Find
map({ "v" }, "<leader>g", 'y/<C-r>"<CR>N', { desc = "", silent = true })

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Pounce
map({ "n" }, "s", "<cmd>Pounce<CR>", { desc = "", silent = true })
map({ "n" }, "S", "<cmd>Pounce<CR>", { desc = "", silent = true })
map({ "v" }, "s", "<cmd>Pounce<CR>", { desc = "", silent = true })

--Harpoon
map(
  { "n" },
  "<Leader>a",
  ':lua require("harpoon.mark").add_file()<cr>:echom "File added to Harpoon"<CR>',
  { desc = "", silent = true }
)
map({ "n" }, "<Leader>m", ':lua require("harpoon.ui").toggle_quick_menu()<cr>', { desc = "", silent = true })
map(
  { "n" },
  "<Leader>1",
  ':lua require("harpoon.ui").nav_file(1)<cr>:echom "File in Harpoon 1"<CR>',
  { desc = "", silent = true }
)
map(
  { "n" },
  "<Leader>2",
  ':lua require("harpoon.ui").nav_file(2)<cr>:echom "File in Harpoon 2"<CR>',
  { desc = "", silent = true }
)
map(
  { "n" },
  "<Leader>3",
  ':lua require("harpoon.ui").nav_file(3)<cr>:echom "File in Harpoon 3"<CR>',
  { desc = "", silent = true }
)
map(
  { "n" },
  "<Leader>4",
  ':lua require("harpoon.ui").nav_file(4)<cr>:echom "File in Harpoon 4"<CR>',
  { desc = "", silent = true }
)
map(
  { "n" },
  "<Leader>5",
  ':lua require("harpoon.ui").nav_file(5)<cr>:echom "File in Harpoon 5"<CR>',
  { desc = "", silent = true }
)
map(
  { "n" },
  "<Leader>6",
  ':lua require("harpoon.ui").nav_file(6)<cr>:echom "File in Harpoon 6"<CR>',
  { desc = "", silent = true }
)
map(
  { "n" },
  "<Leader>7",
  ':lua require("harpoon.ui").nav_file(7)<cr>:echom "File in Harpoon 7"<CR>',
  { desc = "", silent = true }
)
map(
  { "n" },
  "<Leader>8",
  ':lua require("harpoon.ui").nav_file(8)<cr>:echom "File in Harpoon 8"<CR>',
  { desc = "", silent = true }
)
map(
  { "n" },
  "<Leader>9",
  ':lua require("harpoon.ui").nav_file(9)<cr>:echom "File in Harpoon 9"<CR>',
  { desc = "", silent = true }
)

-- Window Maximizer
map({ "n" }, "<leader><leader>", ":MaximizerToggle<CR>", { desc = "", silent = true })

-- Fzf
map({ "n" }, "<C-f>", ":FzfLua files<CR>", { desc = "Find Files", silent = true, noremap = true })
map({ "n" }, "te", ":FzfLua<CR>", { desc = "Fzf Lua", silent = true })
map({ "n" }, "<leader>f", ":FzfLua live_grep<CR>", { desc = "Live Grep", silent = true })
map({ "n" }, "<leader>l", ":FzfLua lgrep_curbuf<CR>", { desc = "Grep Current Buf", silent = true })
map({ "n" }, "<leader>h", ":FzfLua oldfiles<CR>", { desc = "Recent Files", silent = true })
map({ "v" }, "<leader>f", "<ESC>:FzfLua grep_visual<CR>", { desc = "Grep With Selection", silent = true })
map({ "n" }, "<leader>F", ":FzfLua grep<CR>", { desc = "Grep With Seed", silent = true })

-- Nvimtree
map({ "n" }, "tt", ":NvimTreeToggle<CR>", { desc = "Nvimtree Toggle", silent = true })
map({ "n" }, "tf", ":NvimTreeFindFile<CR>", { desc = "Nvimtree Focus File", silent = true })

-- Disable/Override any default LazyVim keymaps
map("t", "<esc><esc>", "<C-c>", { desc = "Close terminal mode." })
map("t", "<esc>", "<C-c>", { desc = "Close terminal mode." })
