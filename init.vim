runtime macros/matchit.vim
" Plugins
call plug#begin('~/.vim/plugged')

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' } " Fuzzy finder for telescope

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'vim-test/vim-test'	" Running tests

Plug 'williamboman/mason.nvim'
Plug 'neovim/nvim-lspconfig'	
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/nvim-cmp'

Plug 'rebelot/kanagawa.nvim'	" Colorscheme
Plug 'jiangmiao/auto-pairs'
Plug 'mhartington/formatter.nvim'

Plug 'lewis6991/gitsigns.nvim'	" Gitsigns
Plug 'tpope/vim-fugitive'		" Gigt
Plug 'tpope/vim-surround'	

call plug#end()

set nocompatible	" Disable compatibility to old time vi
set nohidden
set relativenumber 	" Relative line numbers
set number			" Also show current absolute line
"set autoindent
set encoding=utf-8
set ignorecase		" case insensitive
set hlsearch		" highlight search
set noswapfile		" disable creating swap files
" set updatetime=300
" set scrolloff=4		" Keep at least 4 lines below cursor
syntax on			" syntax highlight
set visualbell noerrorbells " No visual and errorbells
set history=500		" Set number of command + search history to 500

" Use wide tabs
set tabstop=2		" number of columns occupied by a tab
set softtabstop=2	" Control how many columns Vim uses when you hit tab key
set shiftwidth=2
set expandtab
set smarttab		" Affects how tab key presses are interpreted
set tabstop=2
set noexpandtab

" Spell check
set spell

" Mapping 
nmap 0 ^	" Begin of the line 
nmap - $	" End of the line
let mapleader = " "
nnoremap <leader>so :source $MYVIMRC<cr>
imap jk <esc>	" Escape in insert mode
nnoremap <leader>f :lua vim.lsp.buf.format({ timeout_ms = 2000 })<CR>
" Git
nnoremap <leader>gb :Gitsigns toggle_current_line_blame<cr>	
nnoremap <leader>gd :Gvdiffsplit<cr>

" Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>

nnoremap <silent><C-p> :lua require('telescope.builtin').find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<cr>
nnoremap <silent><C-f> <cmd>lua require('telescope.builtin').live_grep()<cr>

lua << EOF
require('telescope').setup {
    defaults = {
        file_ignore_patterns = { "%.rbi", "%.keep" },
        layout_strategy = "vertical",
        sorting_strategy = "ascending",
        color_devicons = true,
        selection_strategy = "reset",
        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
    },
    extensions = {
        fzf = {
          fuzzy = true,                    -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true,     -- override the file sorter
          case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                           -- the default case_mode is "smart_case"
        }
    }
}
require('telescope').load_extension('fzf')

require('gitsigns').setup()

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require('lspconfig')['solargraph'].setup {
		capabilities = capabilities,
		flags = {
			debounce_text_changes = 150,
		}
}

require('lspconfig')['tsserver'].setup {
		capabilities = capabilities,
		flags = {
			debounce_text_changes = 150,
		}
}

require("mason").setup()

EOF

" Color scheme
colorscheme kanagawa

" Vim test 
nmap <silent> <space>t :TestNearest<CR>
nmap <silent> <space>T :TestFile<CR>


