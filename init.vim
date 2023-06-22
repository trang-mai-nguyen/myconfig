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
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

" Plug 'rebelot/kanagawa.nvim'	" Colorscheme
Plug 'EdenEast/nightfox.nvim'	" Colorscheme
Plug 'windwp/nvim-autopairs'
Plug 'mhartington/formatter.nvim'

Plug 'lewis6991/gitsigns.nvim'	" Gitsigns
Plug 'tpope/vim-fugitive'		" Gig
Plug 'tpope/vim-surround'	
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-rails'

Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'kyazdani42/nvim-tree.lua'

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
set clipboard=unnamed " enable copy to clipboard
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

" Formatting
nnoremap <leader>f :lua vim.lsp.buf.format({ timeout_ms = 2000 })<CR>

" Git
nnoremap <leader>gb :Gitsigns toggle_current_line_blame<cr>	
nnoremap <leader>gd :Gvdiffsplit<cr>

" Moving between windows (will not work in tmux)
nmap <C-H> <C-W>h 
nmap <C-J> <C-W>j 
nmap <C-K> <C-W>k 
nmap <C-L> <C-W>l 

" Moving between windows (works in tmux)
nmap <leader>h <C-W>h
nmap <leader>j <C-W>j
nmap <leader>k <C-W>k
nmap <leader>l <C-W>l

" Vim Rails
" Find alternative (test file) 
nmap <leader>a :A<cr>
nmap <leader>av :AV<cr>

" NvimTree
nmap <leader>nt :NvimTreeToggle<cr>

" Telescope
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
" nnoremap <leader>ff :lua require('telescope.builtin').find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<cr>
nnoremap <leader>fw <cmd>lua require('telescope.builtin').live_grep()<cr>

" colorschme
colorscheme nightfox

" vim test
nmap <silent> <space>t :TestNearest<CR>
nmap <silent> <space>T :TestFile<CR>

lua << EOF
require('telescope').setup {
	pickers = {
		find_files = {
			find_command = {'rg', '--files', '--hidden', '-g', '!.git'},
			hidden = true
			}
		},
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

-- Set up nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
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

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

require('lspconfig')['solargraph'].setup {
		capabilities = capabilities,
		flags = {
			debounce_text_changes = 150,
		}
}

-- Set up nvim-autopairs
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on(
	'confirm_done',
	cmp_autopairs.on_confirm_done()
)


require('lspconfig')['tsserver'].setup {
		capabilities = capabilities,
		flags = {
			debounce_text_changes = 150,
		}
}

require("mason").setup()
require("nvim-autopairs").setup {}
require('indent_blankline').setup()
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
	filesystem = {
		filtered_items = {
      visible = true,
			hide_dotfiles = false,
      hide_gitignored = true 
		}
	}
})

EOF

