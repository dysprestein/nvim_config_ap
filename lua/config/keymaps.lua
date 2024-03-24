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

local function unmap(mode, lhs)
    -- Check if the mapping exists
    if vim.fn.maparg(lhs, mode) ~= '' then
        -- If the mapping exists, unmap it
        vim.keymap.del(mode, lhs, {})
    end
end
--
-- Disable any default LazyVim keymaps
unmap("t", "<esc><esc>")
unmap("n", "<leader>qq")
unmap("n", "<leader>qs")
unmap("n", "<leader>ql")
unmap("n", "<leader>qd")
unmap("n", "<leader>ww")
unmap("n", "<leader>wd")
unmap("n", "<leader>w-")
unmap("n", "<leader>w|")
unmap("n", "<leader>-")
unmap("n", "<leader>|")

-- Resize window using <alt> hjkl keys
map("n", "<M-k>", ":call TmuxResize('k', 4)<CR>", { desc = "Increase window height downward" })
map("n", "<M-j>", ":call TmuxResize('j', 4)<CR>", { desc = "Increase window height upward" })
map("n", "<M-h>", ":call TmuxResize('h', 4)<CR>", { desc = "Increase window width leftward" })
map("n", "<M-l>", ":call TmuxResize('l', 4)<CR>", { desc = "Increase window width rightward" })

-- Quick Write and quit
map({ "n" }, "<leader>q", ":q<CR>", { desc = ":q", silent = true })
map({ "n" }, "<leader>Q", ":qa<CR>", { desc = ":qa", silent = true })
map({ "n" }, "<leader>w", ":w<CR>", { desc = ":w", silent = true })

-- Search navigation
map({ "n" }, "n", "nzzzv", { desc = "Go to next highlighted instance and centre on screen", silent = true })
map({ "n" }, "N", "Nzzzv", { desc = "Go to previous highlighted instance and centre on screen", silent = true })

-- Tab navigation
map({ "n" }, "<S-h>", ":tabnext<CR>", { desc = "Cycle tab leftward", silent = true })
map({ "n" }, "<S-l>", ":tabnext<CR>", { desc = "Cycle tab rightward", silent = true })
map({ "n" }, "<leader>t", ":tabnew<CR>", { desc = "New tab", silent = true })

-- Term Copy paste
map({ "v" }, "<leader>y", '"+y', { desc = "\"+y", silent = true })
map({ "v" }, "<leader>p", '"+p', { desc = "\"+p", silent = true })
map({ "n" }, "<leader>p", '"+p', { desc = "\"+p", silent = true })
map({ "v" }, "<leader>Y", '"zy', { desc = "\"zy", silent = true })
map({ "v" }, "<leader>P", '"zp', { desc = "\"zp", silent = true })
map({ "n" }, "<leader>P", '"zp', { desc = "\"zp", silent = true })
map({ "v" }, "<leader>r", 'y:%s@<C-r>"@', { desc = "Start substitution command for selection" })

-- Better paste
map({ "v" }, "p", '"_dP', { desc = "Avoids cutting the selection and modifiying the clipboard before pasting", silent = true })

-- blackhole delete
map({ "n" }, "<leader>d", 'V"_d', { desc = "Delete without modifiying the clipboard", silent = true })
map({ "v" }, "<leader>d", '"_d', { desc = "Delete without modifiying the clipboard", silent = true })

-- inserting lines above and below in normal mode
map({ "n" }, "<leader>o", "o<esc>", { desc = "Insert empty line below", silent = true })
map({ "n" }, "<leader>O", "O<esc>", { desc = "Insert empty line above", silent = true })

-- Folding
map({ "n" }, "<Space>", "za", { desc = "za", silent = true })

-- Moving Lines
map({ "v" }, "J", ":m '>+1<CR>gv=gv", { desc = "Move down", silent = true })
map({ "v" }, "K", ":m '<-2<CR>gv=gv", { desc = "Move up", silent = true })

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<esc>", { desc = "Escape", noremap = true })
map({ "i", "n" }, "<M-s>", "<cmd>noh<cr>", { desc = "Escape", noremap = true })

-- Saner asterisk and hash search
map({ "n", "x" }, "*", "*N", { desc = "Forward search word under cursor" })
map({ "n", "x" }, "#", "#N", { desc = "Backward search word under cursor" })

-- Quick wrap
map({ "n" }, "<leader>W", ":set wrap! wrap?<CR>", { desc = "Toggle text wrapping", silent = true })

-- select all
map({ "n" }, "<leader>A", "ggVG", { desc = "Select all", silent = true })

-- diff
map({ "n" }, "\\dt", ":diffthis<CR>", { desc = "", silent = true })
map({ "n" }, "\\do", ":diffoff<CR>", { desc = "", silent = true })

-- refresh
map({ "n" }, "<leader>e", ":e<CR>", { desc = ":e", silent = true })

-- Quick Find
map({ "v" }, "<leader>g", 'y/<C-r>"<CR>N', { desc = "Highlight without very-magic mode", silent = true })

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
for i = 1, 9 do
  map(
    { "n" },
    "<Leader>" .. i,
    ':lua require("harpoon.ui").nav_file(' .. i .. ')<cr>:echom "File in Harpoon ' .. i .. '"<CR>',
    { desc = "", silent = true }
  )
end

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
