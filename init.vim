" Plugins
call plug#begin('~/.vim/plugged')
" Plug 'ctrlpvim/ctrlp.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' } " Fuzzy finder for telescope
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'vim-test/vim-test'	" Running tests
Plug 'neovim/nvim-lspconfig'	
Plug 'williamboman/mason.nvim'	" Manage external editor tooling (LSP, linters, formatters)
Plug 'williamboman/mason-lspconfig.nvim' " For nvim-lspconfig and mason 

Plug 'rebelot/kanagawa.nvim'	" Colorscheme
Plug 'jiangmiao/auto-pairs'
Plug 'mhartington/formatter.nvim'

call plug#end()

set nocompatible	" Disable compatibility to old time vi
set relativenumber 	" Relative line numbers
set number			" Also show current absolute line
set autoindent
set encoding=utf-8
set ignorecase		" case insensitive
set hlsearch		" highlight search
set noswapfile		" disable creating swap files
set updatetime=300
set scrolloff=4		" Keep at least 4 lines below cursor
syntax on			" syntax highlight
set visualbell noerrorbells " No visual and errorbells
set history=500		" Set number of command + search history to 500

" Use wide tabs
set tabstop=4		" number of columns occupied by a tab
set softtabstop=4	" Control how many columns Vim uses when you hit tab key
set smarttab		" Affects how tab key presses are interpreted
set tabstop=4
set noexpandtab

" Spell check
set spell

" Mapping 
nmap 0 ^	" Begin of the line 
nmap 9 $	" End of the line
let mapleader = " "
nnoremap <leader>so :source $MYVIMRC<cr>
imap jk <esc>	" Escape in insert mode

" Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
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
	mapping = {
		i = {
			}
		}
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

EOF

" Color scheme
colorscheme kanagawa

" Vim test 
nmap <silent> <space>t :TestNearest<CR>
nmap <silent> <space>T :TestFile<CR>

" LSP and Mason 
lua << EOF
require("mason").setup()
require("mason-lspconfig").setup()
EOF

for f in split(glob('~/.config/nvim/configs/*.vim'), '\n')
   exe 'source' f
endfor
