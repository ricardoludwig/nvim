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
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

vim.cmd('set spell')
vim.cmd([[
    autocmd BufNewFile,BufRead *.md setlocal spelllang=en,pt_br
]])

require("rludwig.set")
require("rludwig.remap")

require("lazy").setup({
    'github/copilot.vim',
    'rose-pine/neovim', name = 'rose-pine',
    'nvim-treesitter/nvim-treesitter-context',
    'theprimeagen/harpoon',
    'mbbill/undotree',
    'tpope/vim-fugitive',
    'folke/zen-mode.nvim',
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'VonHeikemen/lsp-zero.nvim', branch = 'v3.x',
    'neovim/nvim-lspconfig',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/nvim-cmp',
    'L3MON4D3/LuaSnip',
    'fatih/vim-go',
    {'scalameta/nvim-metals', dependencies = { 'nvim-lua/plenary.nvim' } },
    {'nvim-treesitter/nvim-treesitter', build = ':TSUpdate'},
    { 'nvim-telescope/telescope.nvim', tag = '0.1.4',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    { 
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            icons = false,
            fold_open = "v", -- icon used for open folds
            fold_closed = ">", -- icon used for closed folds
            indent_lines = false, -- add an indent guide below the fold icons
            signs = {
                -- -- icons / text used for a diagnostic
                error = "error",
                warning = "warn",
                hint = "hint",
                information = "info"
            },
            use_diagnostic_signs = false -- enabling this will use the signs defined in your lsp client
        }
    },
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
    }
})

