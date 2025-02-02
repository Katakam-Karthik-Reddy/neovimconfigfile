vim.g.mapleader = " "

local keymap = vim.keymap

-- main
keymap.set('i', 'jk', '<ESC>', { noremap = true })
--keymap.set('i', 'JK', '<ESE>', { noremap = true })
--keymap.set('i', 'jK', '<ESE>', { noremap = true })
--keymap.set('i', 'Jk', '<ESE>', { noremap = true })
keymap.set('v', 'jk', '<ESC>', { noremap = true })
--keymap.set('v', 'JK', '<ESE>', { noremap = true })
--keymap.set('v', 'jK', '<ESE>', { noremap = true })
--keymap.set('v', 'jK', '<ESE>', { noremap = true })

-- save and quit
keymap.set('n', '<leader>w', ':w<CR>')
keymap.set('n', '<leader>q', ':q<CR>')

--clear search highlight
keymap.set('n', '<leader>nh', ':nohl<CR>')

--cursor moving in insert mode
--keymap.set('i', '<C-l>', '<right>')
--keymap.set('i', '<C-j>', '<down>')
--keymap.set('i', '<C-h>', '<left>')
--keymap.set('i', '<C-k>', '<up>')

--split window
keymap.set('n', '<leader>sv', '<C-w>v') -- split window into vertical
keymap.set('n', '<leader>sh', '<C-w>s') -- split window into vertical
keymap.set('n', '<leader>se', '<C-w>=') -- split window into vertical
keymap.set('n', '<leader>sx', ':close<CR>') -- close the window

--window navigations
keymap.set('n', "<C-h>", '<C-w>h', { noremap = true } )
keymap.set('n', "<C-j>", '<C-w>j', { noremap = true } )
keymap.set('n', "<C-k>", '<C-w>k', { noremap = true } )
keymap.set('n', "<C-l>", '<C-w>l', { noremap = true } )

-- tab controll
keymap.set('n', '<leader>to', ':tabnew<CR>')
keymap.set('n', '<leader>tx', ':tabclose<CR>')
keymap.set('n', '<leader>tn', ':tabn<CR>')
keymap.set('n', '<leader>tp', ':tabp<CR>')

-- tab navigations
keymap.set('n', '<leader>1', '1gt')
keymap.set('n', '<leader>2', '2gt')
keymap.set('n', '<leader>3', '3gt')
keymap.set('n', '<leader>4', '4gt')
keymap.set('n', '<leader>5', '5gt')
keymap.set('n', '<leader>6', '6gt')
keymap.set('n', '<leader>7', '7gt')
keymap.set('n', '<leader>7', '8gt')
keymap.set('n', '<leader>8', '8gt')
keymap.set('n', '<leader>0', '0gt')


--to move the block of code in visual mode
keymap.set('v', "J", ":m '>+1<CR>gv=gv")
keymap.set('v', "K", ":m '<-2<CR>gv=gv")

-- to make cursor to be in middle of the screen
keymap.set('n', '<C-d>', '<C-d>zz')
keymap.set('n', '<C-u>', '<C-u>zz')
keymap.set('n', 'n', 'nzzzv')
keymap.set('n', 'N', 'Nzzzv')

-- it paste the text after send the highlighted text into void register
keymap.set('x', '<leader>p', "\"_dp")

-- to copy to clipborad
keymap.set('n', '<leader>y', "\"+y")
keymap.set('v', '<leader>y', "\"+y")
keymap.set('n', '<leader>Y', "\"+Y")


--nvim tree
keymap.set('n', '<leader>e', ":NvimTreeToggle<CR>")


keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<C-p>", "<cmd>Telescope git_files<CR>")
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory


