vim.g.mapleader = " "

local keymap = vim.keymap

--main
keymap.set('i', 'jk', '<ESC>', { noremap = true })
keymap.set('v', 'jk', '<ESC>', { noremap = true })

-- clear search highlighs 
keymap.set('n', '<leader>nh', ':nohl<CR>')

--save and quit
keymap.set('n', '<leader>w', ':w<CR>')
keymap.set('n', '<leader>q', ':q<CR>')


--indent and opposite
-- keymap.set('v', '<', '<C ->>', { noremap = true, silent = false })
-- keymap.set('v', '>', '<C -< >', { noremap = true, silent = false })

-- changing arrow keys for nevigation in insertion mode
keymap.set('i', '<A-h>', '<up>')
--commenting
-- keymap.set('n', '<leader>z', 'gcc', {noremap = true, silent = false})
-- deletes character but don't copy it to register
-- keymap.set('n', 'x', '_x')

-- increase and decrease the numbers
keymap.set('n', '<leader>+' , '<C-a>')
keymap.set('n', '<leader>-' , '<C-x>')

-- split windows
keymap.set('n', '<leader>sv', '<C-w>v') -- splits window into vertical mode
keymap.set('n', '<leader>sh', '<C-w>s') -- splits window into horizontal mode
keymap.set('n', '<leader>se', '<C-w>=') -- sets width or height equal
keymap.set('n', '<leader>sx', ':close<CR>') -- closes the split window

-- tab controll
keymap.set('n', '<leader>to', ':tabnew<CR>')
keymap.set('n', '<leader>tx', ':tabclose<CR>')
keymap.set('n', '<leader>tn', ':tabn<CR>')
keymap.set('n', '<leader>tp', ':tabp<CR>')

-- to maximize and to previous size
keymap.set('n', '<leader>sm', ':MaximizerToggle<CR>')

-- nvim-tree
keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>')


-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>")
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>")
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")

-- diagnostics
vim.api.nvim_set_keymap('n', '<leader>do', '<cmd>lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>d[', '<cmd>lua vim.diagnostic.goto_prev()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>d]', '<cmd>lua vim.diagnostic.goto_next()<CR>', { noremap = true, silent = true })
-- The following command requires plug-ins "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim", and optionally "kyazdani42/nvim-web-devicons" for icon support
vim.api.nvim_set_keymap('n', '<leader>dd', '<cmd>Telescope diagnostics<CR>', { noremap = true, silent = true })
-- If you don't want to use the telescope plug-in but still want to see all the errors/warnings, comment out the telescope line and uncomment this:
-- vim.api.nvim_set_keymap('n', '<leader>dd', '<cmd>lua vim.diagnostic.setloclist()<CR>', { noremap = true, silent = true })
