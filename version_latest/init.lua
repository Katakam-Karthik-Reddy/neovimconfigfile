-------------------------------- keymaps -------------------------------
vim.g.mapleader = " "
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

--main navigation
keymap.set("i", "lk", "<ESC>", opts)
keymap.set("v", "lk", "<ESC>", opts)

--delete without copying into register
keymap.set('n', "d", "\"ad", opts)
keymap.set('n', "x", '"_x', opts)

-- save and quit
keymap.set('n', "<leader>w", ":w<CR>", opts)
keymap.set('n', "<leader>q", ":q<CR>", opts)

-- clear search highlight
keymap.set('n', "<leader>nh", ":nohl<CR>", opts)

-- split window
keymap.set('n', "<leader>sv", "<C-w>v", opts) --split window into vertical
keymap.set('n', "<leader>sh", "<C-w>s", opts) --split window into horizontal
keymap.set('n', "<leader>se", "<C-w>=", opts) -- make the splits equal size
keymap.set('n', "<leader>sx", ":close<CR>", opts) -- close the window

-- window navigation
keymap.set('n', "<C-h>", "<C-w>h", opts) -- move the cursor to right window
keymap.set('n', "<C-j>", "<C-w>j", opts) -- move the cursor to down window
keymap.set('n', "<C-k>", "<C-w>k", opts) -- move the cursor to upper window
keymap.set('n', "<C-l>", "<C-w>l", opts) -- move the cursor to left window

-- tab control
keymap.set('n', "<leader>to", ":tabnew<CR>", opts) -- open new tab
keymap.set('n', "<leader>tx", ":bdelete!<CR>", opts) -- close the tab
-- keymap.set('n', "<leader>tn", ":tabn<CR>", opts) -- go to next tab
-- keymap.set('n', "<leader>tp", ":tabp<CR>", opts) -- go to previou-- Buffers
keymap.set('n', '<Tab>', ':bnext<CR>', opts)
keymap.set('n', '<S-Tab>', ':bprevious<CR>', opts)
-- keymap.set('n', '<leader>d', ':bdelete!<CR>', opts) -- close buffer
-- keymap.set('n', '<leader>b', '<cmd> enew <CR>', opts) -- new buffers tab

-- tab navigations
keymap.set('n', "<leader>1", "1gt", opts) -- go 1st tab and so on
keymap.set('n', "<leader>2", "2gt", opts)
keymap.set('n', "<leader>3", "3gt", opts)
keymap.set('n', "<leader>4", "4gt", opts)
keymap.set('n', "<leader>5", "5gt", opts)
keymap.set('n', "<leader>6", "6gt", opts)
keymap.set('n', "<leader>7", "7gt", opts)
keymap.set('n', "<leader>7", "8gt", opts)
keymap.set('n', "<leader>8", "8gt", opts)
keymap.set('n', "<leader>0", "0gt", opts)

--to move the block of code in visual mode
keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts) -- move the highlighted block of code down
keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts) -- move the highlighted block of code up

-- to make cursor to be in middle of the screen
keymap.set('n', "<C-d>", "<C-d>zz", opts) -- move the view part down by half screen
keymap.set('n', "<C-u>", "<C-u>zz", opts) -- move the view part up by half screen
keymap.set('n', 'n', "nzzzv", opts) -- find and center
keymap.set('n', 'n', "Nzzzv", opts) -- find and center

-- it paste the text after send the highlighted text into void register
keymap.set("x", "<leader>p", '"_dp', opts)

-- to copy to clipboard
keymap.set('n', "<leader>y", '"+y', opts)
keymap.set("v", "<leader>y", '"+y', opts)
keymap.set('n', "<leader>Y", '"+Y', opts)

-- warp lines
vim.keymap.set('n', '<leader>lw', '<cmd>set wrap!<CR>', opts)

--to resize the window
keymap.set('n', "<C-Left>", ":vertical resize +3<CR>", opts) -- resize the buffer
keymap.set('n', "<C-Right>", ":vertical resize -3<CR>", opts) -- resize the buffer
keymap.set('n', "<C-Up>", ":resize +3<CR>", opts) -- resize the buffer
keymap.set('n', "<C-Down>", ":resize -3<CR>", opts) -- resize the buffer

-- indent and stay in visual mode
keymap.set('v', '<', '<gv', opts)
keymap.set('v', '>', '>gv', opts)

-- keymap.set('n', '<leader>fm', vim.lsp.buf.format) -- formating

------------------------------------ end of keymaps -----------------------------------------------
------------------------------------ start of options ---------------------------------------------

local opt = vim.opt

opt.conceallevel = 1 -- So that `` is visible in markdown files (default: 1)
opt.number = true  -- Make line numbers default (default: false)
opt.relativenumber = true -- Set relative numbered lines (default: false)
opt.tabstop = 4 -- Insert n spaces for a tab (default: 8)
opt.shiftwidth = 4  -- The number of spaces inserted for each indentation (default: 8)
opt.softtabstop = 4 -- The number of space to delete (default :8)
opt.expandtab = true -- Convert tabs to spaces (default: false)
opt.autoindent = true -- Copy indent from current line when starting new one (default: true)
opt.showtabline = 2 -- Always show tabs (default: 1)
opt.ignorecase = true -- Case-insensitive searching UNLESS \C or capital in search (default: false)
opt.smartcase = true -- Smart case (default: false)
opt.smartindent = true -- Make indenting smarter again (default: false)
opt.undofile = true -- Save undo history (default: false)
opt.updatetime = 200 -- -- Decrease update time (default: 4000)
opt.backup = false -- Creates a backup file (default: false)
opt.incsearch = true -- highlighting the words while searching
opt.colorcolumn = "100" -- guide line on the right side to stop writing to long lines
opt.scrolloff = 10 -- will have atleat 10 lines below
opt.wrap = false -- Display lines as one long line (default: true)
opt.linebreak = true -- Companion to wrap, don't split words (default: false)
opt.termguicolors = false -- Set termguicolors to enable highlight groups (default: false)
opt.background = "dark" -- to the backgrond as dark or light
opt.signcolumn = "yes" -- Keep signcolumn on by default (default: 'auto')
opt.swapfile = true -- create a swapfile (default : true)
opt.cursorline = false -- -- Highlight the current line (default: false)
opt.spell = true -- enables the spell checking 
opt.spelllang = { "en_us" } -- checks the spelling language as english
opt.clipboard = 'unnamedplus' -- Sync clipboard between OS and Neovim. (default: '')
opt.splitbelow = true -- Force all horizontal splits to go below current window (default: false)
opt.splitright = true -- Force all vertical splits to go to the right of current window (default: false)
opt.hlsearch = true -- Set highlight on search (default: true)
opt.showmode = false -- We don't need to see things like -- INSERT -- anymore (default: true)
opt.whichwrap = 'bs<>[]hl' -- Which "horizontal" keys are allowed to travel to prev/next line (default: 'b,s')
opt.numberwidth = 4 -- Set number column width to 2 {default 4} (default: 4)
opt.backspace = 'indent,eol,start' -- Allow backspace on (default: 'indent,eol,start')
opt.pumheight = 10 -- Pop up menu height (default: 0)
-- opt.fileencoding = 'utf-8' -- The encoding written to a file (default: 'utf-8')
opt.cmdheight = 1 -- More space in the Neovim command line for displaying messages (default: 1)
opt.breakindent = true -- Enable break indent (default: false)
opt.timeoutlen = 300 -- Time to wait for a mapped sequence to complete (in milliseconds) (default: 1000)
-- opt.writebackup = false -- If a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited (default: true)
opt.completeopt = 'menuone,noselect' -- Set completeopt to have a better completion experience (default: 'menu,preview')
opt.shortmess:append 'c' -- Don't give |ins-completion-menu| messages (default: does not include 'c')
opt.iskeyword:append '-' -- Hyphenated words recognized by searches (default: does not include '-')
opt.formatoptions:remove { 'c', 'r', 'o' } -- Don't insert the current comment leader automatically for auto-wrapping comments using 'textwidth', hitting <Enter> in insert mode, or hitting 'o' or 'O' in normal mode. (default: 'croql')
-- opt.runtimepath:remove '/usr/share/vim/vimfiles' -- Separate Vim plugins from Neovim in case Vim still in use (default: includes this path if Vim is installed)
--

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-------------------------------------- end of options ---------------------------------------------
-------------------------------------- loading the plugins ----------------------------------------

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end
vim.opt.rtp:prepend(lazypath)
require('lazy').setup({
    {
        'projekt0n/github-nvim-theme', 
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
    },
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
    },
    {
        'echasnovski/mini.nvim', version = '*'
    },
    -- lazy.nvim
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
        },
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            "rcarriga/nvim-notify",
        }
    },
    {
        'akinsho/bufferline.nvim',
        dependencies = {
            'moll/vim-bbye',
            'nvim-tree/nvim-web-devicons',
        },
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    {
        'nvim-treesitter/nvim-treesitter',
    },
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 500
		end,
		opts = {},
	},
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
            "BurntSushi/ripgrep",
            { 
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'make',
                cond = function()
                    return vim.fn.executable 'make' == 1
                end,
            },
            { 
                'nvim-telescope/telescope-ui-select.nvim' 
            },
            { 
                'nvim-tree/nvim-web-devicons', 
                enabled = vim.g.have_nerd_font 
            },
            { 
				"nvim-telescope/telescope-live-grep-args.nvim" ,
				-- This will not install any breaking changes.
				-- For major updates, this must be adjusted manually.
				version = "^1.0.0",
			},
        },
        config = function()
            local telescope = require("telescope")
            -- then load the extension
            telescope.load_extension("live_grep_args")
        end
    },
    {
        'nvim-lua/plenary.nvim',
        'ThePrimeagen/harpoon'
    },
    {
        'lewis6991/gitsigns.nvim',
        opts = {
            signs = {
                add = { text = '+' },
                change = { text = '~' },
                delete = { text = '_' },
                topdelete = { text = '‾' },
                changedelete = { text = '~' },
            },
            signs_staged = {
                add = { text = '+' },
                change = { text = '~' },
                delete = { text = '_' },
                topdelete = { text = '‾' },
                changedelete = { text = '~' },
            },
        },
    },
    {
        "akinsho/toggleterm.nvim",
    },
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
        'WhoIsSethDaniel/mason-tool-installer.nvim'
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
	{
		"epwalsh/obsidian.nvim",
		version = "*",  -- recommended, use latest release instead of latest commit
		lazy = true,
		ft = "markdown",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
  	},
    {
        'tpope/vim-fugitive',
        'tpope/vim-rhubarb',
    },
    {
        'windwp/nvim-autopairs',
        event = 'InsertEnter' ,
        config = true,
        opts ={}
    },
    {
        'folke/todo-comments.nvim',
        event = 'VimEnter',
        dependencies = { 'nvim-lua/plenary.nvim' },
        opts = {
            -- signs = false,
            -- background_colour = "#000001"
        },
    },
})

--------------------------------------- github theme ------------------------------------------

require('github-theme').setup({
  options = {
    -- Compiled file's destination location
    compile_path = vim.fn.stdpath('cache') .. '/github-theme',
    compile_file_suffix = '_compiled', -- Compiled file suffix
    hide_end_of_buffer = true, -- Hide the '~' character at the end of the buffer for a cleaner look
    hide_nc_statusline = true, -- Override the underline style for non-active statuslines
    transparent = true,       -- Disable setting bg (make neovim's background transparent)
    terminal_colors = true,    -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
    dim_inactive = false,      -- Non focused panes set to alternative background
    module_default = true,     -- Default enable value for modules
    styles = {                 -- Style to be applied to different syntax groups
      comments = 'NONE',       -- Value is any valid attr-list value `:help attr-list`
      functions = 'NONE',
      keywords = 'NONE',
      variables = 'NONE',
      conditionals = 'NONE',
      constants = 'NONE',
      numbers = 'NONE',
      operators = 'NONE',
      strings = 'NONE',
      types = 'NONE',
    },
    inverse = {                -- Inverse highlight for different types
      match_paren = false,
      visual = false,
      search = false,
    },
    darken = {                 -- Darken floating windows and sidebar-like windows
      floats = true,
      sidebars = {
        enable = true,
        list = {},             -- Apply dark background to specific windows
      },
    },
    modules = {                -- List of various plugins and additional options
      -- ...
    },
  },
  palettes = {},
  specs = {},
  groups = {},
})

vim.cmd('colorscheme github_dark_default')

-- toggling the background transparency
local transparency = true
vim.keymap.set("n", "<leader>bg", function()
    require("github-theme").setup({
        options = {
            transparent = not transparency,
        }
    })
    transparency = not transparency
    vim.cmd('colorscheme github_dark_default')
end)

-------------------------------------- ui tweaks ------------------------------------------------

require("noice").setup({
  lsp = {
    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
    },
  },
  -- you can enable a preset for easier configuration
  presets = {
    bottom_search = true, -- use a classic bottom cmdline for search
    command_palette = true, -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long messages will be sent to a split
    inc_rename = false, -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = false, -- add a border to hover docs and signature help
  },
})
keymap.set('n', '<leader>nd', '<cmd>NoiceDismiss<CR>', { desc = "dismiss the message"})

require("notify").setup({
    background_colour = "#1a1b26",
})

-------------------------------------- web devicon ------------------------------------------------

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

-------------------------------------- nvim tree --------------------------------------------------
local sign = function(opts)
  vim.fn.sign_define(opts.name, {
    texthl = opts.name,
    text = opts.text,
    numhl = ''
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
    keymap.set('n', "<leader>e", ":NvimTreeToggle<CR>", opts) -- open the nvim tree file manager
})

-------------------------------------- buffer line ------------------------------------------------

require('bufferline').setup {
  options = {
    mode = 'buffers', -- set to "tabs" to only show tabpages instead
    themable = true, -- allows highlight groups to be overriden i.e. sets highlights as default
    numbers = 'none', -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
    close_command = 'Bdelete! %d', -- can be a string | function, see "Mouse actions"
    buffer_close_icon = '✗',
    close_icon = '✗',
    path_components = 1, -- Show only the file name without the directory
    modified_icon = '●',
    left_trunc_marker = '',
    right_trunc_marker = '',
    max_name_length = 30,
    max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
    tab_size = 21,
    diagnostics = false,
    diagnostics_update_in_insert = false,
    color_icons = true,
    show_buffer_icons = true,
    show_buffer_close_icons = true,
    show_close_icon = true,
    persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
    separator_style = { '│', '│' }, -- | "thick" | "thin" | { 'any', 'any' },
    enforce_regular_tabs = true,
    always_show_bufferline = true,
    show_tab_indicators = false,
    indicator = {
      -- icon = '▎', -- this should be omitted if indicator style is not 'icon'
      style = 'none', -- Options: 'icon', 'underline', 'none'
    },
    icon_pinned = '󰐃',
    minimum_padding = 1,
    maximum_padding = 5,
    maximum_length = 15,
    sort_by = 'insert_at_end',
  },
  highlights = {
    separator = {
      fg = '#434C5E',
    },
    buffer_selected = {
      bold = true,
      italic = false,
    },
    -- separator_selected = {},
    -- tab_selected = {},
    -- background = {},
    -- indicator_selected = {},
    -- fill = {},
  },
}

--------------------------------------lueline ------------------------------------------------

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

-- ins_left({
-- 	function()
-- 		return "▊"
-- 	end,
-- 	color = { fg = colors.blue }, -- Sets highlighting of component
-- 	padding = { left = 0, right = 1 }, -- We don't need space before this
-- })

ins_left({
	-- mode component
	function()
        return "▊"
	end, 
	color = function()
		-- auto change color according to neovims mode
		local mode_color = {
			n = colors.blue,
			i = colors.green,
			v = colors.red,
			[""] = colors.red,
			V = colors.red,
			c = colors.magenta,
			no = colors.blue,
			s = colors.orange,
			S = colors.orange,
			[""] = colors.orange,
			ic = colors.yellow,
			R = colors.violet,
			Rv = colors.violet,
			cv = colors.blue,
			ce = colors.blue,
			r = colors.cyan,
			rm = colors.cyan,
			["r?"] = colors.cyan,
			["!"] = colors.blue,
			t = colors.blue,
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

-------------------------------------- treesitter ------------------------------------------------
require('nvim-treesitter.configs').setup({
    ensure_installed = {
      'lua',
      'python',
      'vimdoc',
      'vim',
      'regex',
      'toml',
      'json',
      'java',
      'go',
      'gitignore',
      'yaml',
      'make',
      'cmake',
      'markdown',
      'markdown_inline',
      'bash',
      'c',
    },
    -- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,
    -- Autoinstall languages that are not installed
    auto_install = true,
    highlight = {
      enable = true,
      disable = function(lang, buf)
			local max_filesize = 10000000 * 1024 -- 100 KB
			local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
			if ok and stats and stats.size > max_filesize then
				return true
			end
		end,
      additional_vim_regex_highlighting = false
    },
})


-------------------------------------- telescope ------------------------------------------------

require('telescope').setup {
    defaults = {
        mappings = {
            i = {
                ['<C-k>'] = require('telescope.actions').move_selection_previous, -- move to prev result
                ['<C-j>'] = require('telescope.actions').move_selection_next, -- move to next result
                ['<C-l>'] = require('telescope.actions').select_default, -- open file
            },
        },
    },
    pickers = {
        find_files = {
            file_ignore_patterns = { 'node_modules', '.git', '.venv' },
            hidden = true,
        },
    },
    live_grep = {
        file_ignore_patterns = { 'node_modules', '.git', '.venv' },
        additional_args = function(_)
        return { '--hidden' }
        end,
    },
    extensions = {
        ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
        },
    },
}

-- Enable Telescope extensions if they are installed
pcall(require('telescope').load_extension, 'fzf')
pcall(require('telescope').load_extension, 'ui-select')

-- See `:help telescope.builtin`
local builtin = require 'telescope.builtin'
vim.keymap.set('n', "<leader>ff", "<cmd>lua require('telescope.builtin').find_files({ layout_config={ width=0.99, height=0.99}})<CR>", { desc = '[S]earch [F]iles' })
vim.keymap.set('n', "<leader>fs", "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find({ previewer=false, layout_config={ width=0.99, height=0.99}})<CR>", {desc = '[/] Fuzzily search in current buffer'})
-- vim.keymap.set('n', "<leader>fds", "<cmd>lua require('telescope.builtin').live_grep({ layout_config={ width=0.99, height=0.99}})<CR>", {desc = '[S]earch by [G]rep'})
-- vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
-- vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
-- vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
vim.keymap.set('n', '<leader>gb', builtin.buffers, { desc = '[ ] Find existing buffers' })

vim.keymap.set("n", "<leader>fc", "<cmd>lua require('telescope.builtin').commands({ layout_config={ width=0.99, height=0.99}})<CR>", {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
-- vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })

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
-------------------------------------- harpoon ------------------------------------------------

keymap.set("n", "<C-b>", ":lua require('harpoon.mark').add_file()<CR>", { noremap = true })
keymap.set("n", "<C-q>", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", { noremap = true })
keymap.set("n", "<C-n>", ":lua require('harpoon.ui').nav_next()<CR>", { noremap = true })
keymap.set("n", "<C-p>", ":lua require('harpoon.ui').nav_prev()<CR>", { noremap = true })

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

---------------------------------------- mason tool installer ------------------------------------
require('mason-tool-installer').setup({
    ensure_installed = {
        'bash-language-server',
        'vim-language-server',
        'lua-language-server',
        'stylua',
        'diagnostic-languageserver',
        'pyright',
        'clangd',
        -- 'cpptools',
        'jdtls',
        'perlnavigator',
        'yamlfix',
    },
    auto_update = true,
    run_on_start = true,
    start_delay = 3000, -- 3 second delay
    debounce_hours = 5, -- at least 5 hours between attempts to install/update
    integrations = {
        ['mason-lspconfig'] = true,
        -- ['mason-null-ls'] = true,
        -- ['mason-nvim-dap'] = true,
    },
})

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
require("lspconfig").vimls.setup({
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
-- require("lspconfig").html.setup({
-- 	capabilities = capabilities,
-- 	on_attach = on_attach,
-- 	flags = lsp_flags,
-- })
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
require("lspconfig").pylsp.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	flags = lsp_flags,
})
-- require("lspconfig").ts_ls.setup({
-- 	capabilities = capabilities,
-- 	on_attach = on_attach,
-- 	flags = lsp_flags,
-- })
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
-- require("lspconfig").cssmodules_ls.setup({
-- 	capabilities = capabilities,
-- 	on_attach = on_attach,
-- 	flags = lsp_flags,
-- })
-- require("lspconfig").rust_analyzer.setup({
-- 	capabilities = capabilities,
-- 	on_attach = on_attach,
-- 	flags = lsp_flags,
-- })
require("lspconfig").clangd.setup({
	capabilities = capabilities,
	on_attach = on_attach,
        cmd={
            "C:/Users/karthik/.utils/llvm-mingw/bin/clangd.exe",
            -- "--offset-encoding=utf-8",
        },
	flags = lsp_flags,
})
-- require("lspconfig").cpptools.setup({
-- 	capabilities = capabilities,
-- 	on_attach = on_attach,
-- 	flags = lsp_flags,
-- })
require("lspconfig").zls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	flags = lsp_flags,
})

require("lspconfig").marksman.setup({
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
        -- { name = "nvim_lua" },
		{ name = "luasnip" }, -- For luasnip users.
		-- { name = "vsnip" },
		-- { name = "snippy" },
	}, {
		{ name = "buffer" },
		{ name = "path" },
		{ name = "dictionary" },
		-- { name = "spell" },
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

-------------------------------------- toggleterm ---------------------------------------------

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
        height = 40,
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

-------------------------------------- comment ---------------------------------------------

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
	-- extra = {
	-- 	---Add comment on the line above
	-- 	above = "gcO",
	-- 	---Add comment on the line below
	-- 	below = "gco",
	-- 	---Add comment at the end of line
	-- 	eol = "gcA",
	-- },
	---Enable keybindings
	---NOTE: If given `false` then the plugin won't create any mappings
	-- mappings = {
	-- 	---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
	-- 	basic = true,
	-- 	---Extra mapping; `gco`, `gcO`, `gcA`
	-- 	extra = true,
	-- },
	---Function to call before (un)comment
	pre_hook = nil,
	---Function to call after (un)comment
	post_hook = nil,
})

-------------------------------------- obsidian ---------------------------------------------
require('obsidian').setup({
    -- A list of workspace names, paths, and configuration overrides.
    -- If you use the Obsidian app, the 'path' of a workspace should generally be
    -- your vault root (where the `.obsidian` folder is located).
    -- When obsidian.nvim is loaded by your plugin manager, it will automatically set
    -- the workspace to the first workspace in the list whose `path` is a parent of the
    -- current markdown file being edited.
    workspaces = {
        {
          name = "personal",
          path = "g:\\my drive\\obsidian",
        },
    },

    -- alternatively - and for backwards compatibility - you can set 'dir' to a single path instead of
    -- 'workspaces'. for example:
    -- dir = "~/vaults/work",

    -- optional, if you keep notes in a specific subdirectory of your vault.
    notes_subdir = "6 - main notes",

    -- optional, set the log level for obsidian.nvim. this is an integer corresponding to one of the log
    -- levels defined by "vim.log.levels.*".
    log_level = vim.log.levels.info,

    daily_notes = {
        -- optional, if you keep daily notes in a separate directory.
        folder = "7 - dairy",
        -- optional, if you want to change the date format for the id of daily notes.
        date_format = "%y-%m-%d",
        -- optional, if you want to change the date format of the default alias of daily notes.
        alias_format = "%b %-d, %y",
        -- optional, default tags to add to each new daily note created.
        default_tags = { "dairy" },
        -- optional, if you want to automatically insert a template from your template directory like 'daily.md'
        template = "5 - template\\dairy template.md"
    },

    -- optional, completion of wiki links, local markdown links, and tags using nvim-cmp.
    completion = {
        -- set to false to disable completion.
        nvim_cmp = true,
        -- trigger completion at 2 chars.
        min_chars = 1
    },

    -- optional, configure key mappings. these are the defaults. if you don't want to set any keymappings this
    -- way then set 'mappings = {}'.
    mappings = {
        -- overrides the 'gf' mapping to work on markdown/wiki links within your vault.
        ["gf"] = {
            action = function()
                return require("obsidian").util.gf_passthrough()
            end,
            opts = { noremap = false, expr = true, buffer = true },
        },
        -- toggle check-boxes.
        ["<leader>ch"] = {
            action = function()
                return require("obsidian").util.toggle_checkbox()
            end,
            opts = { buffer = true },
        },
        -- smart action depending on context, either follow link or toggle checkbox.
        ["<cr>"] = {
            action = function()
                return require("obsidian").util.smart_action()
            end,
            opts = { buffer = true, expr = true },
        }
    },

    -- where to put new notes. valid options are
    --  * "current_dir" - put new notes in same directory as the current buffer.
    --  * "notes_subdir" - put new notes in the default notes subdirectory.
    new_notes_location = "6 - main notes",

    -- optional, customize how note ids are generated given an optional title.
    ---@param title string|?
    ---@return string
    note_id_func = function(title)
    -- create note ids in a zettelkasten format with a timestamp and a suffix.
    -- in this case a note with the title 'my new note' will be given an id that looks
    -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
        -- local suffix = ""
        -- if title ~= nil then
        --   -- if title is given, transform it into valid file name.
        --   suffix = title:gsub(" ", "-"):gsub("[^a-za-z0-9-]", ""):lower()
        -- else
        --   -- if title is nil, just add 4 random uppercase letters to the suffix.
        --   for _ = 1, 4 do
        --     suffix = suffix .. string.char(math.random(65, 90))
        --   end
        -- end
    -- return tostring(os.time()) .. "-" .. suffix
        local suffix = ""
        if title ~= nil then
          -- if title is given, transform it into valid file name.
          suffix = title:gsub("", ""):lower()
        else
          -- if title is nil, just add 4 random uppercase letters to the suffix.
          for _ = 1, 4 do
            suffix = suffix .. string.char(math.random(65, 90))
          end
        end
        return suffix
    end,

    -- optional, customize how note file names are generated given the id, target directory, and title.
    ---@param spec { id: string, dir: obsidian.path, title: string|? }
    ---@return string|obsidian.path the full path to the new note.
    note_path_func = function(spec)
        -- this is equivalent to the default behavior.
        local path = spec.dir / tostring(spec.id)
            return path:with_suffix(".md")
        end,

        -- optional, customize how wiki links are formatted. you can set this to one of:
        --  * "use_alias_only", e.g. '[[foo bar]]'
        --  * "prepend_note_id", e.g. '[[foo-bar|foo bar]]'
        --  * "prepend_note_path", e.g. '[[foo-bar.md|foo bar]]'
        --  * "use_path_only", e.g. '[[foo-bar.md]]'
        -- or you can set it to a function that takes a table of options and returns a string, like this:
        wiki_link_func = function(opts)
            return require("obsidian.util").wiki_link_id_prefix(opts)
        end,

        -- optional, customize how markdown links are formatted.
        markdown_link_func = function(opts)
            return require("obsidian.util").markdown_link(opts)
        end,

        -- either 'wiki' or 'markdown'.
        preferred_link_style = "wiki",

        -- optional, boolean or a function that takes a filename and returns a boolean.
        -- `true` indicates that you don't want obsidian.nvim to manage frontmatter.
        disable_frontmatter = true,

        -- optional, alternatively you can customize the frontmatter data.
        ---@return table
        note_frontmatter_func = function(note)
            -- add the title of the note as an alias.
            if note.title then
              note:add_alias(note.title)
        end

        local out = { id = note.id, aliases = note.aliases, tags = note.tags }

        -- `note.metadata` contains any manually added fields in the frontmatter.
        -- so here we just make sure those fields are kept in the frontmatter.
        if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
            for k, v in pairs(note.metadata) do
                out[k] = v
            end
        end

        return out
    end,

    -- optional, for templates (see below).
    templates = {
        folder = "5 - template",
        date_format = "%y-%m-%d",
        time_format = "%h:%m",
        -- a map for custom variables, the key should be the variable and the value a function
        substitutions = {},
    },

    -- optional, by default when you use `:obsidianfollowlink` on a link to an external
    -- url it will be ignored but you can customize this behavior here.
    ---@param url string
    follow_url_func = function(url)
        -- open the url in the default web browser.
        -- vim.fn.jobstart({"open", url})  -- mac os
        -- vim.fn.jobstart({"xdg-open", url})  -- linux
        vim.cmd(':silent exec "!start ' .. url .. '"') -- windows
        -- vim.ui.open(url) -- need neovim 0.10.0+
    end,

    -- optional, by default when you use `:obsidianfollowlink` on a link to an image
    -- file it will be ignored but you can customize this behavior here.
    ---@param img string
    follow_img_func = function(img)
        vim.fn.jobstart { "qlmanage", "-p", img }  -- mac os quick look preview
        -- vim.fn.jobstart({"xdg-open", url})  -- linux
        -- vim.cmd(':silent exec "!start ' .. url .. '"') -- windows
    end,

    -- optional, set to true if you use the obsidian advanced uri plugin.
    -- https://github.com/vinzent03/obsidian-advanced-uri
    use_advanced_uri = false,

    -- optional, set to true to force ':obsidianopen' to bring the app to the foreground.
    open_app_foreground = false,

    picker = {
        -- set your preferred picker. can be one of 'telescope.nvim', 'fzf-lua', or 'mini.pick'.
        name = "telescope.nvim",
        -- optional, configure key mappings for the picker. these are the defaults.
        -- not all pickers support all mappings.
        note_mappings = {
          -- create a new note from your query.
          new = "<c-x>",
          -- insert a link to the selected note.
          insert_link = "<c-l>",
        },
        tag_mappings = {
          -- add tag(s) to current note.
          tag_note = "<c-x>",
          -- insert a tag at the current location.
          insert_tag = "<c-l>",
        },
    },

    -- optional, sort search results by "path", "modified", "accessed", or "created".
    -- the recommend value is "modified" and `true` for `sort_reversed`, which means, for example,
    -- that `:obsidianquickswitch` will show the notes sorted by latest modified time
    sort_by = "modified",
    sort_reversed = true,

    -- set the maximum number of lines to read from notes on disk when performing certain searches.
    search_max_lines = 1000,

    -- optional, determines how certain commands open notes. the valid options are:
    -- 1. "current" (the default) - to always open in the current window
    -- 2. "vsplit" - to open in a vertical split if there's not already a vertical split
    -- 3. "hsplit" - to open in a horizontal split if there's not already a horizontal split
    open_notes_in = "current",

    -- optional, define your own callbacks to further customize behavior.
    callbacks = {
        -- runs at the end of `require("obsidian").setup()`.
        ---@param client obsidian.client
        post_setup = function(client) end,

        -- runs anytime you enter the buffer for a note.
        ---@param client obsidian.client
        ---@param note obsidian.note
        enter_note = function(client, note) end,

        -- runs anytime you leave the buffer for a note.
        ---@param client obsidian.client
        ---@param note obsidian.note
        leave_note = function(client, note) end,

        -- runs right before writing the buffer for a note.
        ---@param client obsidian.client
        ---@param note obsidian.note
        pre_write_note = function(client, note) end,

        -- runs anytime the workspace is set/changed.
        ---@param client obsidian.client
        ---@param workspace obsidian.workspace
        post_set_workspace = function(client, workspace) end,
    },

    -- optional, configure additional syntax highlighting / extmarks.
    -- this requires you have `conceallevel` set to 1 or 2. see `:help conceallevel` for more details.
    ui = {
        enable = true,  -- set to false to disable all additional syntax features
        update_debounce = 200,  -- update delay after a text change (in milliseconds)
        max_file_length = 5000,  -- disable ui features for files with more than this many lines
        -- define how various check-boxes are displayed
        checkboxes = {
              -- note: the 'char' value has to be a single character, and the highlight groups are defined below.
              [" "] = { char = "󰄱", hl_group = "obsidiantodo" },
              ["x"] = { char = "", hl_group = "obsidiandone" },
              [">"] = { char = "", hl_group = "obsidianrightarrow" },
              ["~"] = { char = "󰰱", hl_group = "obsidiantilde" },
              ["!"] = { char = "", hl_group = "obsidianimportant" },
              -- replace the above with this if you don't have a patched font:
              -- [" "] = { char = "☐", hl_group = "obsidiantodo" },
              -- ["x"] = { char = "✔", hl_group = "obsidiandone" },

              -- you can also add more custom ones...
        },
        -- use bullet marks for non-checkbox lists.
        bullets = { char = "•", hl_group = "obsidianbullet" },
        external_link_icon = { char = "", hl_group = "obsidianextlinkicon" },
        -- replace the above with this if you don't have a patched font:
        -- external_link_icon = { char = "", hl_group = "obsidianextlinkicon" },
        reference_text = { hl_group = "obsidianreftext" },
        highlight_text = { hl_group = "obsidianhighlighttext" },
        tags = { hl_group = "obsidiantag" },
        block_ids = { hl_group = "obsidianblockid" },
        hl_groups = {
          -- the options are passed directly to `vim.api.nvim_set_hl()`. see `:help nvim_set_hl`.
          obsidiantodo = { bold = true, fg = "#f78c6c" },
          obsidiandone = { bold = true, fg = "#89ddff" },
          obsidianrightarrow = { bold = true, fg = "#f78c6c" },
          obsidiantilde = { bold = true, fg = "#ff5370" },
          obsidianimportant = { bold = true, fg = "#d73128" },
          obsidianbullet = { bold = true, fg = "#89ddff" },
          obsidianreftext = { underline = true, fg = "#c792ea" },
          obsidianextlinkicon = { fg = "#c792ea" },
          obsidiantag = { italic = true, fg = "#89ddff" },
          obsidianblockid = { italic = true, fg = "#89ddff" },
          obsidianhighlighttext = { bg = "#75662e" },
        },
    },

    -- specify how to handle attachments.
    attachments = {
        -- the default folder to place images in via `:obsidianpasteimg`.
        -- if this is a relative path it will be interpreted as relative to the vault root.
        -- you can always override this per image by passing a full path to the command instead of just a filename.
        img_folder = "assets/imgs",  -- this is the default

        -- optional, customize the default name or prefix when pasting images via `:obsidianpasteimg`.
        ---@return string
        img_name_func = function()
          -- prefix image names with timestamp.
          return string.format("%s-", os.time())
        end,

        -- a function that determines the text to insert in the note when pasting an image.
        -- it takes two arguments, the `obsidian.client` and an `obsidian.path` to the image file.
        -- this is the default implementation.
        ---@param client obsidian.client
        ---@param path obsidian.path the absolute path to the image file
        ---@return string
        img_text_func = function(client, path)
            path = client:vault_relative_path(path) or path
            return string.format("![%s](%s)", path.name, path)
        end,
    },
})

-------------------------------------- obsidian keymap ---------------------------------------------

keymap.set('n', "<leader>\\", ":ObsidianNew<CR>", opts) -- Create a new node or file
keymap.set('n', "<leader>\\", ":ObsidianTemplate<CR>", opts) -- insert templete
keymap.set('n', "<leader>\\", ":ObsidianNewFromTemplate<CR>", opts) -- Create new node or file with template
