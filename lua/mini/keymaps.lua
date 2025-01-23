function _G.ReloadConfig()
  for name, _ in pairs(package.loaded) do
    if name:match('^mini') and not name:match('nvim-tree') then
      package.loaded[name] = nil
    end
  end

  dofile(vim.env.MYVIMRC)
  vim.notify("Nvim configuration reloaded!", vim.log.levels.INFO)
end

local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Reload source file
keymap("n", "<leader>so", "<cmd>lua ReloadConfig()<cr>", opts)

-- Moving between windows (works in tmux)
keymap("n", "<leader>h", "<C-W>h", opts)
keymap("n", "<leader>j", "<C-W>j", opts)
keymap("n", "<leader>k", "<C-W>k", opts)
keymap("n", "<leader>l", "<C-W>l", opts)

-- Resize with arrows / doesn't seem to work for me
-- keymap("n", "<C-Up>", ":resize +2<CR>", opts)
-- keymap("n", "<C-Down>", ":resize -2<CR>", opts)
-- keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
-- keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Telescope --
keymap('n', '<leader>fb', "<cmd>Telescope buffers<cr>", {})
keymap('n', '<leader>ff', "<cmd>Telescope find_files<cr>", { desc = 'Telescope find files' })
keymap('n', '<leader>fw', "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>", opts)

-- Git
keymap("n", "<leader>gb", "<cmd>Gitsigns toggle_current_line_blame<CR>", opts) --gitsigns
keymap("n", "<leader>gd", "<cmd>Gvdiffsplit<CR>", opts) --git fugitive 

-- Rails
keymap("n", "<leader>a", "<cmd>A<CR>", opts) -- vim-rails
keymap("n", "<leader>av", "<cmd>AV<CR>", opts) -- vim-rails

-- Running tests
keymap("n", "<space>t", "<cmd>w<CR> <cmd>TestNearest<CR>", opts)
keymap("n", "<space>T", "<cmd>w<CR> <cmd>TestFile<CR>", opts)

-- Leap
keymap("n", "q", "<Plug>(leap-forward)", opts)
keymap("n", "Q", "<Plug>(leap-backward)", opts)

-- File explorer
keymap("n", "<leader>e", ":Lex 30<cr>", opts)
keymap("n", "<leader>nt", "<cmd>NvimTreeToggle<cr>", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down / I don't use this
-- keymap("v", "<A-j>", ":m .+1<CR>==", opts)
-- keymap("v", "<A-k>", ":m .-2<CR>==", opts)

-- Not copy the deleted text
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down / I don't use this
-- keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
-- keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
-- keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
-- keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
