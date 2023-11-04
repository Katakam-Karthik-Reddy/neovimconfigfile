------------------------------------------- keymaps -----------------------------------------------
vim.g.mapleader = " "
local keymap = vim.keymap

--main navigation
keymap.set("i", "jk", "<ESC>", {noremap=true})
keymap.set("v", "jk", "<ESC>", {noremap=true})

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
keymap.set("n", "<C-h>", "<C-w>h", {noremap=true})
keymap.set("n", "<C-j>", "<C-w>j", {noremap=true})
keymap.set("n", "<C-k>", "<C-w>k", {noremap=true})
keymap.set("n", "<C-l>", "<C-w>l", {noremap=true})

-- tab control
keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close the tab
keymap.set("n", "<leader>tn", ":tabn<CR>") -- go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") -- go to previous tab


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

-- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
-- find string in current working directory as you type
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") 
--keymap.set("n", "<C-p>", "<cmd>Telescope git_files<CR>")
-- find string under cursor in current working directory
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") 
keymap.set('n', '<leader>fb', "<cmd>buffers<CR>")
keymap.set('n', '<leader>fh', "<cmd>help_tags<CR>")



------------------------------------------------- options -----------------------------------

local opt = vim.opt


-- line numbers
opt.number = true
opt.relativenumber = true

-- tab and indentations
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

--undo dir
opt.undofile = true

-- for faster uptime
opt.updatetime = 50

--visual effect
opt.incsearch = true
opt.colorcolumn = "100"
-- scrolling
opt.scrolloff = 8 -- will have atleat 8lines below

--line warping
opt.wrap = false

-- colorscheme setting 
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

opt.cursorline = true



--------------------------------------------- lazy.nvim ---------------------------------

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    "folke/which-key.nvim",
    "folke/tokyonight.nvim",
}


local opts = {}
require("lazy").setup({
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme tokyonight]])
        end, 
        opts = {},
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 500
        end,
        opts = {}
    },
    {
        "nvim-tree/nvim-tree.lua",
        "nvim-telescope/telescope.nvim",
        "nvim-tree/nvim-web-devicons",
        "nvim-lualine/lualine.nvim",
        "sharkdp/fd",
        "nvim-treesitter/nvim-treesitter",
    },
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'BurntSushi/ripgrep'
        }
    },
    {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'neovim/nvim-lspconfig',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/nvim-cmp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-nvim-lua',
        'saadparwaiz1/cmp_luasnip',
        'L3MON4D3/LuaSnip',
        'rafamadriz/friendly-snippets',
        'onsails/lspkind.nvim',
    },
    {
        'akinsho/toggleterm.nvim', version = "*", config = true
    },
    {
        'numToStr/Comment.nvim',
        opts = {
            -- add any options here
        },
        lazy = false,
    }
})


-------------------------------------- nvim tree --------------------------------------------------

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- OR setup with some options
require("nvim-tree").setup({
    sort_by = "case_sensitive",
    view = {
        width = 30,
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = true,
    },
})

------------------------------------- web dev icons -----------------------------------------------

require'nvim-web-devicons'.setup {
    -- your personnal icons can go here (to override)
    -- you can specify color or cterm_color instead of specifying both of them
    -- DevIcon will be appended to `name`
    override = {
        zsh = {
            icon = "",
            color = "#428850",
            cterm_color = "65",
            name = "Zsh"
        }
    };
    -- globally enable different highlight colors per icon (default to true)
    -- if set to false all icons will have the default icon's color
    color_icons = true;
    -- globally enable default icons (default to false)
    -- will get overriden by `get_icons` option
    default = true;
    -- globally enable "strict" selection of icons - icon will be looked up in
    -- different tables, first by filename, and if not found by extension; this
    -- prevents cases when file doesn't have any extension but still gets some icon
    -- because its name happened to match some extension (default to false)
    strict = true;
    -- same as `override` but specifically for overrides by filename
    -- takes effect when `strict` is true
    override_by_filename = {
        [".gitignore"] = {
            icon = "",
            color = "#f1502f",
            name = "Gitignore"
        }
    };
    -- same as `override` but specifically for overrides by extension
    -- takes effect when `strict` is true
    override_by_extension = {
        ["log"] = {
            icon = "",
            color = "#81e043",
            name = "Log"
        }
    };
}


--------------------------------------- lualine ---------------------------------------------------

-- Eviline config for lualine
-- Author: shadmansaleh
-- Credit: glepnir
local lualine = require('lualine')

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
        return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
    end,
    hide_in_width = function()
        return vim.fn.winwidth(0) > 80
    end,
    check_git_workspace = function()
        local filepath = vim.fn.expand('%:p:h')
        local gitdir = vim.fn.finddir('.git', filepath .. ';')
        return gitdir and #gitdir > 0 and #gitdir < #filepath
    end,
}

-- Config
local config = {
    options = {
        -- Disable sections and component separators
        component_separators = '',
        section_separators = '',
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

ins_left {
    function()
        return '▊'
    end,
    color = { fg = colors.blue }, -- Sets highlighting of component
    padding = { left = 0, right = 1 }, -- We don't need space before this
}

ins_left {
    -- mode component
    function()
        return ''
    end,
    color = function()
        -- auto change color according to neovims mode
        local mode_color = {
            n = colors.red,
            i = colors.green,
            v = colors.blue,
            [''] = colors.blue,
            V = colors.blue,
            c = colors.magenta,
            no = colors.red,
            s = colors.orange,
            S = colors.orange,
            [''] = colors.orange,
            ic = colors.yellow,
            R = colors.violet,
            Rv = colors.violet,
            cv = colors.red,
            ce = colors.red,
            r = colors.cyan,
            rm = colors.cyan,
            ['r?'] = colors.cyan,
            ['!'] = colors.red,
            t = colors.red,
        }
        return { fg = mode_color[vim.fn.mode()] }
    end,
    padding = { right = 1 },
}

ins_left {
    -- filesize component
    'filesize',
    cond = conditions.buffer_not_empty,
}

ins_left {
    'filename',
    cond = conditions.buffer_not_empty,
    color = { fg = colors.magenta, gui = 'bold' },
}

ins_left { 'location' }

ins_left { 'progress', color = { fg = colors.fg, gui = 'bold' } }

ins_left {
    'diagnostics',
    sources = { 'nvim_diagnostic' },
    symbols = { error = ' ', warn = ' ', info = ' ' },
    diagnostics_color = {
        color_error = { fg = colors.red },
        color_warn = { fg = colors.yellow },
        color_info = { fg = colors.cyan },
    },
}

-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2
ins_left {
    function()
        return '%='
    end,
}

ins_left {
    -- Lsp server name .
    function()
        local msg = 'No Active Lsp'
        local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
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
    icon = ' LSP:',
    color = { fg = '#ffffff', gui = 'bold' },
}

-- Add components to right sections
ins_right {
    'o:encoding', -- option component same as &encoding in viml
    fmt = string.upper, -- I'm not sure why it's upper case either ;)
    cond = conditions.hide_in_width,
    color = { fg = colors.green, gui = 'bold' },
}

ins_right {
    'fileformat',
    fmt = string.upper,
    icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
    color = { fg = colors.green, gui = 'bold' },
}

ins_right {
    'branch',
    icon = '',
    color = { fg = colors.violet, gui = 'bold' },
}

ins_right {
    'diff',
    -- Is it me or the symbol for modified us really weird
    symbols = { added = ' ', modified = '󰝤 ', removed = ' ' },
    diff_color = {
        added = { fg = colors.green },
        modified = { fg = colors.orange },
        removed = { fg = colors.red },
    },
    cond = conditions.hide_in_width,
}

ins_right {
    function()
        return '▊'
    end,
    color = { fg = colors.blue },
    padding = { left = 1 },
}

-- Now don't forget to initialize lualine
lualine.setup(config)

--------------------------------------- treesitter ------------------------------------------------

require'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all" (the five listed parsers should always be installed)
    ensure_installed = {"typescript", "rust"},

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = true,

    ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
    -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

    highlight = {
        enable = true,


        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },
}

---------------------------------------- commenter ------------------------------------------------

require('Comment').setup(
{
    ---Add a space b/w comment and the line
    padding = true,
    ---Whether the cursor should stay at its position
    sticky = true,
    ---Lines to be ignored while (un)comment
    ignore = nil,
    ---LHS of toggle mappings in NORMAL mode
    toggler = {
        ---Line-comment toggle keymap
        line = 'gcc',
        ---Block-comment toggle keymap
        block = 'gbc',
    },
    ---LHS of operator-pending mappings in NORMAL and VISUAL mode
    opleader = {
        ---Line-comment keymap
        line = 'gc',
        ---Block-comment keymap
        block = 'gb',
    },
    ---LHS of extra mappings
    extra = {
        ---Add comment on the line above
        above = 'gcO',
        ---Add comment on the line below
        below = 'gco',
        ---Add comment at the end of line
        eol = 'gcA',
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

----------------------------------------- toggleterm ----------------------------------------------

require("toggleterm").setup({
  -- size can be a number or function which is passed the current terminal
  size = 20 ,
  open_mapping = [[<c-]>]],
  hide_numbers = true, -- hide the number column in toggleterm buffers
  shade_filetypes = {},
  shade_terminals = true, -- NOTE: this option takes priority over highlights specified so if you specify Normal highlights you should set this to false
  shading_factor = 2, -- the percentage by which to lighten terminal background, default: -30 (gets multiplied by -3 if background is light)
  start_in_insert = true,
  insert_mappings = true, -- whether or not the open mapping applies in insert mode
  persist_size = true,
  persist_mode = true, -- if set to true (default) the previous terminal mode will be remembered
  direction = 'float',
  close_on_exit = true, -- close the terminal window when the process exits
   -- Change the default shell. Can be a string or a function returning a string
  shell = 'pwsh',
  auto_scroll = true, -- automatically scroll to the bottom on terminal output
  -- This field is only relevant if direction is set to 'float'
  float_opts = {
    border = 'curved',
    -- like `size`, width and height can be a number or function which is passed the current terminal
    winblend = 0,
    highlights ={
        border = "Normal",
        background = "Normal",
    },
  },
  winbar = {
    enabled = false,
    name_formatter = function(term) --  term: Terminal
      return term.name
    end
  },
})

----------------------------------------- LSP -----------------------------------------------------

local has_words_before = function()
    unpack = unpack or table.unpack
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end


local luasnip = require("luasnip")
local cmp = require('cmp')
require("luasnip/loaders/from_vscode").lazy_load()

require('cmp').setup({
snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    end,
},
mapping = cmp.mapping.preset.insert({
    --['<C-K>'] = cmp.mapping.select_prev_item(),
    --['<C-J'] = cmp.mapping.select_next_item(),
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    --['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    --["<C-Space>"] = cmp.mapping(cmp.mapping.complete({
    --reason = cmp.ContextReason.Auto,
    --}), {"i", "c"}),
    vim.keymap.set('i', '<C-p>', "cmp.mapping.select_prev_item()"),
    vim.keymap.set('i', '<C-n>', "cmp.mapping.select_next_item()"),
    --vim.keymap.set('i', '<C-b>', "cmp.mapping.scroll_docs(-4)"),
    --vim.keymap.set('i', '<C-f>', "cmp.mapping.scroll_docs(4)"),
    vim.keymap.set('i', '<C-s>', function()
        cmp.mapping.complete({
            reason = cmp.ContextReason.Auto,
        })
        {"i","c"}
    end),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    --vim.keymap.set('i', '<CR>', function()
        --   cmp.mapping.confirm({ select = false})
        --end),
        vim.keymap.set('i', '<C-e>', "cmp.mapping.abort()"),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expandable() then
                luasnip.expand()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jumpable()
            else
                fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
            end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function()
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-2) then
                luasnip.jump(-2)
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
        { name = 'nvim_lsp' },
        { name = 'luasnip' }, -- For luasnip users.
        { name = 'nvim_lua' },
    }, {
        { name = 'path' },
        { name = 'buffer' },
    }),
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
        { name = 'buffer' },
    })
})
-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})
-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})

-- Set up lspconfig.
--local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
--require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
    -- capabilities = capabilities
    --  }
require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require("mason-lspconfig").setup()

local sign = function(opts)
    vim.fn.sign_define(opts.name, {
        texthl = opts.name,
        text = opts.text,
        numhl = ''
    })
end

sign({name = 'DiagnosticSignError', text = '✘'})
sign({name = 'DiagnosticSignWarn', text = '▲'})
sign({name = 'DiagnosticSignHint', text = '⚑'})
sign({name = 'DiagnosticSignInfo', text = ''})

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>d', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>x', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<space>Wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>Wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>Wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<space>f', function() vim.lsp.buk.format { async = true } end, bufopts)
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()
local workspace_dir = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')

local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
}
--lua
require('lspconfig').lua_ls.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    flags = lsp_flags,
}
--python
require('lspconfig').pyright.setup{
    capabilities = capabilities,
    on_attach = on_attach,
    flags = lsp_flags,
}
--html
require("lspconfig").html.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    flags = lsp_flags,
}
--css
require('lspconfig').cssls.setup{
    capabilities = capabilities,
    on_attach = on_attach,
    flags = lsp_flags,
}
--javascript, typescript
require('lspconfig').tsserver.setup{
    capabilities = capabilities,
    on_attach = on_attach,
    flags = lsp_flags,
}
--sql
require('lspconfig').sqlls.setup{
    capabilities = capabilities,
    on_attach = on_attach,
    flags = lsp_flags,
}
--diagnostics
require('lspconfig').diagnosticls.setup{
    capabilities = capabilities,
    on_attach = on_attach,
    flags = lsp_flags,
}
--enlint
require('lspconfig').eslint.setup{
    capabilities = capabilities,
    on_attach = on_attach,
    flags = lsp_flags,
}
--emmet_ls
require('lspconfig').emmet_ls.setup{
    capabilities = capabilities,
    on_attach = on_attach,
    flags = lsp_flags,
}

----------------------------------------- end -----------------------------------------------------
