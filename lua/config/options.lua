-- Basic Settings
vim.opt.number = true         -- Line numbers
vim.opt.relativenumber = true -- Relative line numbers
vim.opt.cursorline = true     -- Highlight current line
vim.opt.scrolloff = 20        -- Keep 20 lines above/below cursor
vim.opt.sidescrolloff = 8     -- Keep 8 columns left/right of cursor
vim.opt.wrap = false          -- Do not wrap lines (can be manually set to true as needed)
vim.opt.cmdheight = 1         -- Command line height
vim.opt.spelllang = { "en" }  -- Set english for spellcheck

-- Tabbing / Indentation
vim.opt.tabstop = 4                -- Tab width
vim.opt.shiftwidth = 4             -- Indent width
vim.opt.softtabstop = 4            -- Soft tab stop
vim.opt.expandtab = false          -- Do not convert tabs to spaces
vim.opt.smartindent = true         -- Use smart auto-indenting
vim.opt.autoindent = true          -- Copy indent from current line
vim.opt.grepprg = "rg --vimgrep"   -- Use ripgrep if available
vim.opt.grepformat = "%f:%l:%c:%m" -- filename, line number, column, content

-- Search Settings
vim.opt.ignorecase = true -- Enable case-insensitive search
vim.opt.smartcase = true  -- Toggle case-sensitive search if uppercase letters are used
vim.opt.hlsearch = false  -- Do not highlight search results
vim.opt.incsearch = true  -- Show matches as you type

-- Visual Settings
vim.opt.termguicolors = true                      -- Enable 24-bit colors
vim.opt.signcolumn = "yes"                        -- Always enable sign column
vim.opt.colorcolumn = "100"                       -- Show column marker at 100 characters
vim.opt.showmatch = true                          -- Highlight matching brackets
vim.opt.matchtime = 1                             -- How long to highlight matching brackets
vim.opt.completeopt = "menuone,noinsert,noselect" -- Completion options
vim.opt.showmode = true                          -- Do not show mode in command line
vim.opt.pumheight = 10                            -- Popup menu height
vim.opt.pumblend = 10                             -- Popup menu transparency
vim.opt.winblend = 0                              -- Floating window transparency
-- vim.o.winborder = "rounded"                       -- Add borders to floating windows
vim.opt.conceallevel = 0                          -- Do not hide markup
vim.opt.concealcursor = ""                        -- Show markup, even on cursor line
vim.opt.maxmempattern = 20000                     -- Max memory used for pattern matching

-- File Handling
vim.opt.backup = false                       -- Do not create backup files
vim.opt.writebackup = false                  -- Do not back up before overwriting
vim.opt.swapfile = false                     -- Do not create swapfiles
vim.opt.undofile = true                      -- Enable persistent undo functionality
vim.opt.updatetime = 300                     -- Time in ms to trigger `CursorHold` for saving files
vim.opt.timeoutlen = 300                     -- Time in ms to wait for mapped sequence
vim.opt.ttimeoutlen = 0                      -- No wait for key code sequences
vim.opt.autoread = true                      -- Auto-reload file if changed outside Neovim
vim.opt.autowrite = false                    -- Do not auto-save files
vim.opt.diffopt:append("vertical")           -- Enable vertical diff splits
vim.opt.diffopt:append("algorithm:patience") -- Enable better diffing algorithm
vim.opt.diffopt:append("linematch:60")       -- Better diff highlighting w/ smart line matching

-- Undo Directory
local undodir = "~/.local/share/nvim/undodir" -- Undo directory path
vim.opt.undodir = vim.fn.expand(undodir)      -- Expand to full path
local undodir_path = vim.fn.expand(undodir)
if vim.fn.isdirectory(undodir_path) == 0 then
	vim.fn.mkdir(undodir_path, "p") -- Create directory if it does not exist
end

-- Behavior Settings
vim.opt.errorbells = false              -- Disable error sounds
vim.opt.backspace = "indent,eol,start"  -- Enable more natural backspace UX
vim.opt.autochdir = false               -- Prevent automatically changing directory
vim.opt.iskeyword:append("-")           -- Treat dash character as part of work (ex: `font-bold`)
vim.opt.path:append("**")               -- Search into subfolders with `gf`
vim.opt.mouse = "a"                     -- Enable mouse support
vim.opt.clipboard:append("unnamedplus") -- Link Neovim to system clipboard
vim.opt.wildmenu = true                 -- Enable command-line completion menu
vim.opt.wildmode = "longest:full,full"  -- Configure completion mode for command-line
vim.opt.wildignorecase = true           -- Case-insensitive tab-completion in commands


-- Folding Settings
-- NOTE: Most of these settings are in `lsp.lua`
vim.opt.foldlevel = 99 -- Keep all folds open by default

-- Split Behavior
vim.opt.splitbelow = true -- Horizontal splits open below
vim.opt.splitright = true -- Vertican splits open to the right
