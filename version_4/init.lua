-------------------------------- keymaps -------------------------------
vim.g.mapleader = " "
local keymap = vim.keymap

--main navigation
keymap.set("i", "jk", "<ESC>", { noremap = true })
keymap.set("v", "jk", "<ESC>", { noremap = true })

--delete without copying into register
-- keymap.set("n", "d", "\"_d")
keymap.set("n", "d", "\"ad")

-- save and quit
keymap.set("n", "<leader>w", ":w<CR>")
keymap.set("n", "<leader>q", ":q<CR>")

-- clear search highlight
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- split window
keymap.set("n", "<leader>sv", "<C-w>v") --split window into vertical
keymap.set("n", "<leader>sh", "<C-w>s") --split window into horizontal
keymap.set("n", "<leader>se", "<C-w>=")
keymap.set("n", "<leader>sx", ":close<CR>") -- close the window

-- window navigation
keymap.set("n", "<C-h>", "<C-w>h", { noremap = true })
keymap.set("n", "<C-j>", "<C-w>j", { noremap = true })
keymap.set("n", "<C-k>", "<C-w>k", { noremap = true })
keymap.set("n", "<C-l>", "<C-w>l", { noremap = true })

-- tab control
keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close the tab
keymap.set("n", "<leader>tn", ":tabn<CR>") -- go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") -- go to previous tab

-- tab navigations
keymap.set("n", "<leader>1", "1gt")
keymap.set("n", "<leader>2", "2gt")
keymap.set("n", "<leader>3", "3gt")
keymap.set("n", "<leader>4", "4gt")
keymap.set("n", "<leader>5", "5gt")
keymap.set("n", "<leader>6", "6gt")
keymap.set("n", "<leader>7", "7gt")
keymap.set("n", "<leader>7", "8gt")
keymap.set("n", "<leader>8", "8gt")
keymap.set("n", "<leader>0", "0gt")

--to move the block of code in visual mode
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- to make cursor to be in middle of the screen
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- it paste the text after send the highlighted text into void register
keymap.set("x", "<leader>p", '"_dp')

-- to copy to clipboard
keymap.set("n", "<leader>y", '"+y')
keymap.set("v", "<leader>y", '"+y')
keymap.set("n", "<leader>Y", '"+Y')

--nvim tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

--to resize the window
keymap.set("n", "<C-Left>", ":vertical resize +3<CR>")
keymap.set("n", "<C-Right>", ":vertical resize -3<CR>")
keymap.set("n", "<C-Up>", ":resize +3<CR>")
keymap.set("n", "<C-Down>", ":resize -3<CR>")

-- formatting
-- keymap.set('n', '<leader>fm', vim.lsp.buf.format)

------------------------------------------------- options -----------------------------------

local opt = vim.opt

-- line numbers
opt.number = true
opt.relativenumber = true

-- tab and indentations
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

--undo dir
opt.undofile = true


opt.updatetime = 20

--visual effect
opt.incsearch = true
opt.colorcolumn = "100"

-- scrolling
opt.scrolloff = 10 -- will have atleat 10lines below

--line warping
opt.wrap = false

-- colorscheme setting
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

opt.cursorline = true

opt.spell = true
opt.spelllang = { "en_us" }
-- clipboard
opt.clipboard = 'unnamedplus'

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
--------------------------------------------- lazy.nvim ---------------------------------

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

local opts = {}
require("lazy").setup({
	-- {
	--     "folke/tokyonight.nvim",
	--     lazy = false,
	--     priority = 1000,
	--     config = function()
	--         vim.cmd([[colorscheme tokyonight]])
	--     end,
	--     opts = {},
	-- },
	--theme
	{
		'projekt0n/github-nvim-theme',
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
		require('github-theme').setup({
		})
	
		vim.cmd('colorscheme github_dark_default')
		end,
	}, 
	--whichkey
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 500
		end,
		opts = {},
	},
	--telescope
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"BurntSushi/ripgrep",
		},
	},
    {
        "nvim-telescope/telescope.nvim",
            dependencies = {
                { 
                    "nvim-telescope/telescope-live-grep-args.nvim" ,
                    -- This will not install any breaking changes.
                    -- For major updates, this must be adjusted manually.
                    version = "^1.0.0",
                },
            },
        config = function()
            local telescope = require("telescope")

            -- first setup telescope
            telescope.setup({
                -- your config
            })

            -- then load the extension
            telescope.load_extension("live_grep_args")
        end
    },
	---common
	{
		"ThePrimeagen/harpoon",
		"nvim-tree/nvim-web-devicons",
		"nvim-tree/nvim-tree.lua",
		"nvim-lualine/lualine.nvim",
		"akinsho/toggleterm.nvim",
	},
        {
            'echasnovski/mini.nvim', version = '*'
        },
	--commenter
	{
		"numToStr/Comment.nvim",
		opts = {
			-- add any options here
		},
		lazy = false,
	},
	--lsp
	{
		"neovim/nvim-lspconfig",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},
	--tree sitter
	{
		"nvim-treesitter/nvim-treesitter",
	},
	--completion
	{
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"saadparwaiz1/cmp_luasnip",
		"L3MON4D3/LuaSnip",
		"dcampos/nvim-snippy",
		"dcampos/cmp-snippy",
		"hrsh7th/cmp-vsnip",
		"hrsh7th/vim-vsnip",
		"onsails/lspkind.nvim",
		"uga-rosa/cmp-dictionary",
		"f3fora/cmp-spell",
	},
	--formatter
	{
		"stevearc/conform.nvim",
	},
        {
          "epwalsh/obsidian.nvim",
          version = "*",  -- recommended, use latest release instead of latest commit
          lazy = true,
          ft = "markdown",
          -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
          -- event = {
          --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
          --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
          --   -- refer to `:h file-pattern` for more examples
          --   "BufReadPre path/to/my-vault/*.md",
          --   "BufNewFile path/to/my-vault/*.md",
          -- },
          dependencies = {
            -- Required.
            "nvim-lua/plenary.nvim",

            -- see below for full list of optional dependencies 👇
          },
          opts = {
                workspaces = {
                  {
                    name = "personal",
                    path = "~/vaults/personal",
                  },
                  {
                    name = "work",
                    path = "~/vaults/work",
                  },
                },
            }
        }

	-- {
	-- 	"ray-x/go.nvim",
	-- 	dependencies = { -- optional packages
	-- 		"ray-x/guihua.lua",
	-- 		"neovim/nvim-lspconfig",
	-- 		"nvim-treesitter/nvim-treesitter",
	-- 	},
	-- 	config = function()
	-- 		require("go").setup()
	-- 	end,
	-- 	event = { "CmdlineEnter" },
	-- 	ft = { "go", "gomod" },
	-- 	build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
	-- },
})

--------------------------------------- mini icons -------------------------------------------------
-- No need to copy this inside `setup()`. Will be used automatically.
require("mini.icons").setup({
  -- Icon style: 'glyph' or 'ascii'
  style = 'glyph',

  -- Customize per category. See `:h MiniIcons.config` for details.
  default   = {},
  directory = {},
  extension = {},
  file      = {},
  filetype  = {},
  lsp       = {},
  os        = {},

  -- Control which extensions will be considered during "file" resolution
  use_file_extension = function(ext, file) return true end,
})

--------------------------------------- telescope -------------------------------------------------

local telescope = require("telescope")

local actions = require("telescope.actions")

telescope.setup({
	defaults = {
        sorting_strategy = "ascending",
		prompt_prefix = " ",
		selection_caret = " ",
		path_display = { "smart" },
        layout_config = {
            prompt_position = "top",
        },
		mappings = {
			i = {
				["<esc>"] = actions.cycle_history_next,
				["<C-p>"] = actions.cycle_history_prev,

				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,

				["<C-c>"] = actions.close,

				["<Down>"] = actions.move_selection_next,
				["<Up>"] = actions.move_selection_previous,

				["<CR>"] = actions.select_default,
				["<C-x>"] = actions.select_horizontal,
				["<C-v>"] = actions.select_vertical,
				["<C-t>"] = actions.select_tab,

				["<C-u>"] = actions.preview_scrolling_up,
				["<C-d>"] = actions.preview_scrolling_down,

				["<PageUp>"] = actions.results_scrolling_up,
				["<PageDown>"] = actions.results_scrolling_down,

				["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
				["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
				["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
				["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
				["<C-l>"] = actions.complete_tag,
				["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
			},

			n = {
				["<esc>"] = actions.close,
				["<CR>"] = actions.select_default,
				["<C-x>"] = actions.select_horizontal,
				["<C-v>"] = actions.select_vertical,
				["<C-t>"] = actions.select_tab,

				["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
				["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
				["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
				["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

				["j"] = actions.move_selection_next,
				["k"] = actions.move_selection_previous,
				["H"] = actions.move_to_top,
				["M"] = actions.move_to_middle,
				["L"] = actions.move_to_bottom,

				["<Down>"] = actions.move_selection_next,
				["<Up>"] = actions.move_selection_previous,
				["gg"] = actions.move_to_top,
				["G"] = actions.move_to_bottom,

				["<C-u>"] = actions.preview_scrolling_up,
				["<C-d>"] = actions.preview_scrolling_down,

				["<PageUp>"] = actions.results_scrolling_up,
				["<PageDown>"] = actions.results_scrolling_down,

				["?"] = actions.which_key,
			},
		},
	},
})

-----keymaps

vim.keymap.set("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files({ layout_config={ width=0.99, height=0.99}})<CR>", {})
-- vim.keymap.set( "n", "<leader>fds", "<cmd>lua require('telescope.builtin').live_grep({layout_config={ width=0.99, height=0.99}})<CR>", {})
vim.keymap.set("n", "<leader>fg", "<cmd>lua require('telescope.builtin').git_files({ layout_config={ width=0.99, height=0.99}})<CR>", {})
vim.keymap.set( "n", "<leader>fs", "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find({ previewer=false, layout_config={ width=0.99, height=0.99}})<CR>", {})
vim.keymap.set("n", "<leader>gh", "<cmd>lua require('telescope.builtin').search_history({ layout_config={ width=0.99, height=0.99}})<CR>", {})
vim.keymap.set("n", "<leader>fdd", "<cmd>lua require('telescope.builtin').diagnostics({ layout_config={ width=0.99, height=0.99}})<CR>", {})
-- vim.keymap.set('n', '<leader>fds', "<cmd>lua require('telescope.builtin').
--vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set("n", "<leader>fc", "<cmd>lua require('telescope.builtin').commands({ layout_config={ width=0.99, height=0.99}})<CR>", {})
vim.keymap.set("n", "<leader>fH", "<cmd>lua require('telescope.builtin').help_tags({ layout_config={ width=0.99, height=0.99}})<CR>", {})


keymap.set("n", "<C-b>", ":lua require('harpoon.mark').add_file()<CR>", { noremap = true })
keymap.set("n", "<C-q>", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", { noremap = true })
keymap.set("n", "<C-n>", ":lua require('harpoon.ui').nav_next()<CR>", { noremap = true })
keymap.set("n", "<C-p>", ":lua require('harpoon.ui').nav_prev()<CR>", { noremap = true })


------------------------------------- telescope-args -----------------------------------------------
local telescope = require("telescope")
local lga_actions = require("telescope-live-grep-args.actions")

telescope.setup {
  extensions = {
    live_grep_args = {
      auto_quoting = true, -- enable/disable auto-quoting
      -- define mappings, e.g.
      -- mappings = { -- extend mappings
      --   i = {
      --     ["<C-k>"] = lga_actions.quote_prompt(),
      --     ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
      --     -- freeze the current list and start a fuzzy search in the frozen list
      --     ["<C-space>"] = actions.to_fuzzy_refine,
      --   },
      -- },
      -- ... also accepts theme settings, for example:
      -- theme = "dropdown", -- use dropdown theme
      -- theme = { }, -- use own theme spec
      -- layout_config = { mirror=true }, -- mirror preview pane
    }
  }
}

-- don't forget to load the extension
telescope.load_extension("live_grep_args")
keymap.set("n", "<leader>fds", ":lua require('telescope').extensions.live_grep_args.live_grep_args({layout_config={ width=0.99, height=0.99}})<CR>")
------------------------------------- web dev icons -----------------------------------------------

require("nvim-web-devicons").setup({
	-- your personal icons can go here (to override)
	-- you can specify color or cterm_color instead of specifying both of them
	-- DevIcon will be appended to `name`
	override = {
		pwsh = {
			icon = "",
			color = "#428850",
			cterm_color = "65",
			name = "pwsh",
		},
	},
	-- globally enable different highlight colors per icon (default to true)
	-- if set to false all icons will have the default icon's color
	color_icons = true,
	-- globally enable default icons (default to false)
	-- will get overridden by `get_icons` option
	default = true,
	-- globally enable "strict" selection of icons - icon will be looked up in
	-- different tables, first by filename, and if not found by extension; this
	-- prevents cases when file doesn't have any extension but still gets some icon
	-- because its name happened to match some extension (default to false)
	strict = true,
	-- same as `override` but specifically for overrides by filename
	-- takes effect when `strict` is true
	override_by_filename = {
		[".gitignore"] = {
			icon = "",
			color = "#f1502f",
			name = "Gitignore",
		},
	},
	-- same as `override` but specifically for overrides by extension
	-- takes effect when `strict` is true
	override_by_extension = {
		["log"] = {
			icon = "",
			color = "#81e043",
			name = "Log",
		},
	},
})

-------------------------------------- nvim tree --------------------------------------------------

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- OR setup with some options
require("nvim-tree").setup({
	sort_by = "case_sensitive",
	view = {
		width = 40,
	},
	renderer = {
		group_empty = true,
	},
	filters = {
		dotfiles = true,
	},
})

--------------------------------------- lualine ---------------------------------------------------

-- Eviline config for lualine
-- Author: shadmansaleh
-- Credit: glepnir
local lualine = require("lualine")

-- Color table for highlights
-- stylua: ignore
local colors = {
    bg       = '#202328',
    fg       = '#bbc2cf',
    yellow   = '#ECBE7B',
    cyan     = '#008080',
    darkblue = '#081633',
    green    = '#98be65',
    orange   = '#FF8800',
    violet   = '#a9a1e1',
    magenta  = '#c678dd',
    blue     = '#51afef',
    red      = '#ec5f67',
}

local conditions = {
	buffer_not_empty = function()
		return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
	end,
	hide_in_width = function()
		return vim.fn.winwidth(0) > 80
	end,
	check_git_workspace = function()
		local filepath = vim.fn.expand("%:p:h")
		local gitdir = vim.fn.finddir(".git", filepath .. ";")
		return gitdir and #gitdir > 0 and #gitdir < #filepath
	end,
}

-- Config
local config = {
	options = {
		-- Disable sections and component separators
		component_separators = "",
		section_separators = "",
		theme = {
			-- We are going to use lualine_c an lualine_x as left and
			-- right section. Both are highlighted by c theme .  So we
			-- are just setting default looks o statusline
			normal = { c = { fg = colors.fg, bg = colors.bg } },
			inactive = { c = { fg = colors.fg, bg = colors.bg } },
		},
	},
	sections = {
		-- these are to remove the defaults
		lualine_a = {},
		lualine_b = {},
		lualine_y = {},
		lualine_z = {},
		-- These will be filled later
		lualine_c = {},
		lualine_x = {},
	},
	inactive_sections = {
		-- these are to remove the defaults
		lualine_a = {},
		lualine_b = {},
		lualine_y = {},
		lualine_z = {},
		lualine_c = {},
		lualine_x = {},
	},
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
	table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x at right section
local function ins_right(component)
	table.insert(config.sections.lualine_x, component)
end

ins_left({
	function()
		return "▊"
	end,
	color = { fg = colors.blue }, -- Sets highlighting of component
	padding = { left = 0, right = 1 }, -- We don't need space before this
})

ins_left({
	-- mode component
	function()
		return ""

	end, 
	color = function()
		-- auto change color according to neovims mode
		local mode_color = {
			n = colors.red,
			i = colors.green,
			v = colors.blue,
			[""] = colors.blue,
			V = colors.blue,
			c = colors.magenta,
			no = colors.red,
			s = colors.orange,
			S = colors.orange,
			[""] = colors.orange,
			ic = colors.yellow,
			R = colors.violet,
			Rv = colors.violet,
			cv = colors.red,
			ce = colors.red,
			r = colors.cyan,
			rm = colors.cyan,
			["r?"] = colors.cyan,
			["!"] = colors.red,
			t = colors.red,
		}
		return { fg = mode_color[vim.fn.mode()] }
	end,
	padding = { right = 1 },
})

ins_left({
	-- filesize component
	"filesize",
	cond = conditions.buffer_not_empty,
})

ins_left({
	"filename",
    file_status = true,
    path = 2,
	cond = conditions.buffer_not_empty,
	color = { fg = colors.magenta, gui = "bold" },
})

ins_left({ "location" })

ins_left({ "progress", color = { fg = colors.fg, gui = "bold" } })

ins_left({
	"diagnostics",
	sources = { "nvim_diagnostic" },
	symbols = { error = " ", warn = " ", info = " " },
	diagnostics_color = {
		color_error = { fg = colors.red },
		color_warn = { fg = colors.yellow },
		color_info = { fg = colors.cyan },
	},
})

-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2
ins_left({
	function()
		return "%="
	end,
})

ins_left({
	-- Lsp server name .
	function()
		local msg = "No Active Lsp"
		local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
		local clients = vim.lsp.get_active_clients()
		if next(clients) == nil then
			return msg
		end
		for _, client in ipairs(clients) do
			local filetypes = client.config.filetypes
			if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
				return client.name
			end
		end
		return msg
	end,
	icon = " LSP:",
	color = { fg = "#ffffff", gui = "bold" },
})

-- Add components to right sections
ins_right({
	"o:encoding", -- option component same as &encoding in viml
	fmt = string.upper, -- I'm not sure why it's upper case either ;)
	cond = conditions.hide_in_width,
	color = { fg = colors.green, gui = "bold" },
})

ins_right({
	"fileformat",
	fmt = string.upper,
	icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
	color = { fg = colors.green, gui = "bold" },
})

ins_right({
	"branch",
	icon = "",
	color = { fg = colors.violet, gui = "bold" },
})

ins_right({
	"diff",
	-- Is it me or the symbol for modified us really weird
	symbols = { added = " ", modified = "󰝤 ", removed = " " },
	diff_color = {
		added = { fg = colors.green },
		modified = { fg = colors.orange },
		removed = { fg = colors.red },
	},
	cond = conditions.hide_in_width,
})

ins_right({
	function()
		return "▊"
	end,
	color = { fg = colors.blue },
	padding = { left = 1 },
})

-- Now don't forget to initialize lualine
lualine.setup(config)

----------------------------------------- toggleterm ----------------------------------------------

require("toggleterm").setup({
	-- size can be a number or function which is passed the current terminal
	size = 20,
	open_mapping = [[<c-]>]],
	hide_numbers = true, -- hide the number column in toggleterm buffers
	shade_filetypes = {},
	shade_terminals = true, -- NOTE: this option takes priority over highlights specified so if you specify Normal highlights you should set this to false
	shading_factor = 2, -- the percentage by which to lighten terminal background, default: -30 (gets multiplied by -3 if background is light)
	start_in_insert = true,
	insert_mappings = true, -- whether or not the open mapping applies in insert mode
	persist_size = true,
	persist_mode = true, -- if set to true (default) the previous terminal mode will be remembered
	direction = "float",
	close_on_exit = true, -- close the terminal window when the process exits
	-- Change the default shell. Can be a string or a function returning a string
	shell = "pwsh",
	auto_scroll = true, -- automatically scroll to the bottom on terminal output
	-- This field is only relevant if direction is set to 'float'
	float_opts = {
		border = "curved",
		-- like `size`, width and height can be a number or function which is passed the current terminal
		winblend = 0,
		width = 230,
        height = 61,
		highlights = {
			border = "Normal",
			background = "Normal",
		},
	},
	winbar = {
		enabled = false,
		name_formatter = function(term) --  term: Terminal
			return term.name
		end,
	},
})

---------------------------------------- commenter ------------------------------------------------

require("Comment").setup({
	---Add a space b/w comment and the line
	padding = true,
	---Whether the cursor should stay at its position
	sticky = true,
	---Lines to be ignored while (un)comment
	ignore = nil,
	---LHS of toggle mappings in NORMAL mode
	toggler = {
		---Line-comment toggle keymap
		line = "gcc",
		---Block-comment toggle keymap
		block = "gbc",
	},
	---LHS of operator-pending mappings in NORMAL and VISUAL mode
	opleader = {
		---Line-comment keymap
		line = "gc",
		---Block-comment keymap
		block = "gb",
	},
	---LHS of extra mappings
	extra = {
		---Add comment on the line above
		above = "gcO",
		---Add comment on the line below
		below = "gco",
		---Add comment at the end of line
		eol = "gcA",
	},
	---Enable keybindings
	---NOTE: If given `false` then the plugin won't create any mappings
	mappings = {
		---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
		basic = true,
		---Extra mapping; `gco`, `gcO`, `gcA`
		extra = true,
	},
	---Function to call before (un)comment
	pre_hook = nil,
	---Function to call after (un)comment
	post_hook = nil,
})

---------------------------------------- tree-sitter ------------------------------------------

require("nvim-treesitter.configs").setup({
	-- A list of parser names, or "all" (the five listed parsers should always be installed)
	ensure_installed = {
		-- "c",
		-- "lua",
		-- "vim",
		-- "vimdoc",
		-- "bash",
		-- "html",
		-- "css",
		-- "csv",
		-- "cmake",
		-- "dockerfile",
		-- "java",
		-- "javascript",
		-- "json",
		-- "make",
		-- "markdown",
		-- "python",
		-- "rust",
		-- "regex",
		-- -- "perl",
		-- "xml",
		-- "yaml",
		-- "zig",
		-- "go",
	},

	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,
	-- Automatically install missing parsers when entering buffer
	-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
	auto_install = true,

	-- List of parsers to ignore installing (or "all")
	-- ignore_install = { "javascript" },

	---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
	-- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

	highlight = {
		enable = true,

		-- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
		-- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
		-- the name of the parser)
		-- list of language that will be disabled
		-- disable = { "c", "rust" },
		-- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
		disable = function(lang, buf)
			local max_filesize = 10000000 * 1024 -- 100 KB
			local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
			if ok and stats and stats.size > max_filesize then
				return true
			end
		end,

		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = false,
	},
})

---------------------------------------- mason ------------------------------------------------

require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})
require("mason-lspconfig").setup()

---------------------------------------- lsp ------------------------------------------------

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
-- require'lspconfig'.clangd.setup{}
local on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr}
	vim.keymap.set("n", "gD", '<cmd>lua vim.lsp.buf.declaration()<CR>', bufopts)
	vim.keymap.set("n", "gd", '<cmd>lua vim.lsp.buf.definition()<CR>', bufopts)
	vim.keymap.set("n", "K", '<cmd>lua vim.lsp.buf.hover()<CR>', bufopts)
	vim.keymap.set("n", "gi", '<cmd>lua vim.lsp.buf.implementation()<CR>', bufopts)
	vim.keymap.set("n", "<c-s>", '<cmd>lua vim.lsp.buf.signature_help()<CR>', bufopts)
	vim.keymap.set("n", "<space>D", '<cmd>lua vim.lsp.buf.type_definition()<CR>', bufopts)
	vim.keymap.set("n", "<space>rn", '<cmd>lua vim.lsp.buf.rename()<CR>', bufopts)
	vim.keymap.set("n", "<space>ca", '<cmd>lua vim.lsp.buf.code_action()<CR>', bufopts)
	vim.keymap.set("n", "gr", '<cmd>lua vim.lsp.buf.references()<CR>', bufopts)
	vim.keymap.set("n", "<space>Wa", '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', bufopts)
end

-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local workspace_dir = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local lsp_flags = {
	-- This is the default in Nvim 0.7+
	debounce_text_changes = 150,
}

require("lspconfig").lua_ls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	flags = lsp_flags,
})

require("lspconfig").bashls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	flags = lsp_flags,
})
require("lspconfig").diagnosticls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	flags = lsp_flags,
})
-- require("lspconfig").emmet_ls.setup({
-- 	capabilities = capabilities,
-- 	on_attach = on_attach,
-- 	flags = lsp_flags,
-- })
require("lspconfig").html.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	flags = lsp_flags,
})
require("lspconfig").perlnavigator.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	flags = lsp_flags,
})
require("lspconfig").powershell_es.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	flags = lsp_flags,
})
require("lspconfig").pyright.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	flags = lsp_flags,
})
require("lspconfig").ts_ls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	flags = lsp_flags,
})
require("lspconfig").yamlls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	flags = lsp_flags,
})
require("lspconfig").lemminx.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	flags = lsp_flags,
})
require("lspconfig").cmake.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	flags = lsp_flags,
})
require("lspconfig").cssmodules_ls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	flags = lsp_flags,
})
require("lspconfig").rust_analyzer.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	flags = lsp_flags,
})
require("lspconfig").clangd.setup({
	capabilities = capabilities,
	on_attach = on_attach,
        cmd={
            "C:/Users/karthik/.utils/llvm-mingw/bin/clangd.exe",
            -- "--offset-encoding=utf-8",
        },
	flags = lsp_flags,
})
require("lspconfig").zls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	flags = lsp_flags,
})

local sign = function(opts)
	vim.fn.sign_define(opts.name, {
		texthl = opts.name,
		text = opts.text,
		numhl = "",
	})
end

sign({ name = "DiagnosticSignError", text = "✘" })
sign({ name = "DiagnosticSignWarn", text = "▲" })
sign({ name = "DiagnosticSignHint", text = "⚑" })
sign({ name = "DiagnosticSignInfo", text = "" })

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<space>d", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<space>x", vim.diagnostic.setloclist, opts)

---------------------------------------- completion ----------------------------------------------
local cmp = require("cmp")
require("luasnip/loaders/from_vscode").lazy_load()

require("cmp").setup({
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
			-- vim.fn["vsnip#anonymous"](args.body)
			-- require("snippy").expand_snippet(args.body) -- For `luasnip` users.
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-e>"] = cmp.mapping.abort(),
		vim.keymap.set("i", "<C-p>", "cmp.mapping.select_prev_item()"),
		vim.keymap.set("i", "<C-n>", "cmp.mapping.select_next_item()"),
		vim.keymap.set("i", "<C-s>", function()
			cmp.mapping.complete({
				reason = cmp.ContextReason.Auto,
			})({ "i", "c" })
		end),
		["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		vim.keymap.set("i", "<C-e>", "cmp.mapping.abort()"),

		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif require("luasnip").expandable() then
				require("luasnip").expand()
			elseif require("luasnip").expand_or_jumpable() then
				require("luasnip").expand_or_jumpable()
			else
				fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
			end
		end, { "i", "s" }),

		["<S-Tab>"] = cmp.mapping(function()
			if cmp.visible() then
				cmp.select_prev_item()
			elseif require("luasnip").jumpable(-2) then
				require("luasnip").jump(-2)
			else
				fallback()
			end
		end, { "i", "s" }),
	}),

	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = function(entry, vim_item)
			local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
			local strings = vim.split(kind.kind, "%s", { trimempty = true })
			kind.kind = " " .. (strings[1] or "") .. " "
			kind.menu = "    (" .. (strings[2] or "") .. ")"

			return kind
		end,
	},
	sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "nvim_lua" },
		{ name = "luasnip" }, -- For luasnip users.
		{ name = "vsnip" },
		{ name = "snippy" },
	}, {
		{ name = "buffer" },
		{ name = "path" },
		{ name = "dictionary" },
		{ name = "spell" },
	}),

	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
})

-- Set configuration for specific filetype.
cmp.setup.filetype("gitcommit", {
	sources = cmp.config.sources({
		{ name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
	}, {
		{ name = "buffer" },
	}),
})
-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ "/", "?" }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})
-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})
---------------------------------------- formatter ----------------------------------------------

local conform = require("conform")
conform.setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "autopep8" },
		javascript = { { "prettierd", "prettier" } },
		typescript = { { "prettierd", "prettier" } },
		javascriptreact = { { "prettierd", "prettier" } },
		typescriptreact = { { "prettierd", "prettier" } },
		json = { { "prettierd", "prettier" } },
		java = { "google-java-format" },
		markdown = { { "prettierd", "prettier" } },
		html = { "htmlbeautifier" },
		bash = { "beautysh" },
		rust = { "rustfmt" },
		yaml = { "yamlfix" },
		css = { { "prettierd", "prettier" } },
		sh = { { "shellcheck" } },
		perl = { { "perlimports", "perltidy", "latexindent" } },
		go = { { "asmfmt", "goimports" } },
		c = { "clang-format" },
		cpp = { "clang-format" },
		spsql = { "pg_format" },
		xml = { "xmlformat" },
		["*"] = { "typos" },
		["_"] = { "trim_whitespace" },
	},
	vim.keymap.set({ "n", "v" }, "<leader>fm", function()
		conform.format({
			lsp_fallback = true,
			async = false,
			timeout_ms = 100000,
		})
	end, { desc = "Format file or range (in visual mode)" }),
})

---please install the following server using the mason ":Mason"
-- autopep8, diagnostic-languageserver, emmet-ls, html-lsp,
-- lua-language-server, perlnavigator, powershell-editor-services,
-- prettier, prettierd, pylint, stylua, typescript-language-server,
-- xmlformatter, yaml-language-server, bash-language-server
