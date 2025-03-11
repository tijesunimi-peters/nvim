--require "nvchad.options"

-- add yours here!

--local o         =vim.o
--HOME            =os.getenv("HOME")

--o.cursorlineopt ='both'                   -- to enable cursorline!
--o.nocompatible  =true
--o.number        =true
--o.encoding      ='utf-8'
--o.termguicolors =true

--o.autoindent    =true                     -- Indent according to previous line.
--o.expandtab     =true                     -- Use spaces instead of tabs.
--o.softtabstop   =2                        -- Tab key indents by 2 spaces.
--o.shiftwidth    =2                        -- >> indents by 2 spaces.
--o.shiftround    =true                     -- >> indents to next multiple of 'shiftwidth'.

--o.backspace     ='indent,eol,start'       -- Make backspace work as you would expect.
--o.hidden        =true                     -- Switch between buffers without having to save first.
--o.laststatus    =2                        -- Always show statusline.
--o.display       ='lastline'               -- Show as much as possible of the last line.

--o.showmode      =true                     -- Show current mode in command-line.
--o.showcmd       =true                     -- Show already typed keys when more are expected.

--o.incsearch     =true                     -- Highlight while searching with / or ?.
--o.hlsearch      =true                     -- Keep matches highlighted.

--o.ttyfast       =true                     -- Faster redrawing.
--o.lazyredraw    =true                     -- Only redraw when necessary.

--o.splitbelow    =true                     -- Open new windows below the current window.
--o.splitright    =true                     -- Open new windows right of the current window.

---- o.cursorline                           -- Find the current line quickly.
--o.wrapscan      =true                     -- Searches wrap around end-of-file.
--o.report        =0                        -- Always report changed lines.
--o.synmaxcol     =200                      -- Only highlight the first 200 columns.
--o.mouse         ='a'
--o.ruler         =true

--o.list          =true                     -- Show non-printable characters.

--o.backup        =true
--o.wrirebackup   =false
--o.backupdir     =HOME .. '/.vim/files/backup/'
----o.backupext   =HOME .. '/.vim/files/backup/'
----o.backupskip  =true
--o.directory     ='/.vim/files/swap/'
----o.updatecount =100
--o.undofile      =true
--o.undodir       =HOME .. '/.vim/files/undo/'
---- o.viminfo     = '100,n' .. HOME .. '/.vim/files/info/viminfo'

HOME = os.getenv("HOME")

vim.g.mapleader = '\\'
vim.g.maplocalleader = ','

-- basic settings
vim.opt.encoding = "utf-8"
vim.opt.backspace = "indent,eol,start" -- backspace works on every char in insert mode
vim.opt.completeopt = 'menuone,noselect'
vim.opt.history = 1000
vim.opt.dictionary = '/usr/share/dict/words'
vim.opt.startofline = true

-- Mapping waiting time
vim.opt.timeout = false
vim.opt.ttimeout = true
vim.opt.ttimeoutlen = 100

-- Display
vim.opt.showmatch  = true -- show matching brackets
vim.opt.scrolloff = 3 -- always show 3 rows from edge of the screen
vim.opt.synmaxcol = 300 -- stop syntax highlight after x lines for performance
vim.opt.laststatus = 2 -- always show status line

vim.opt.list = false -- do not display white characters
vim.opt.foldenable = false
vim.opt.foldlevel = 4 -- limit folding to 4 levels
vim.opt.foldmethod = 'syntax' -- use language syntax to generate folds
vim.opt.wrap = false --do not wrap lines even if very long
vim.opt.eol = false -- show if there's no eol char
vim.opt.showbreak= '↪' -- character to show when line is broken

-- Sidebar
vim.opt.number = true -- line number on the left
vim.opt.numberwidth = 3 -- always reserve 3 spaces for line number
vim.opt.signcolumn = 'yes' -- keep 1 column for coc.vim  check
vim.opt.modelines = 0
vim.opt.showcmd = true -- display command in bottom bar

-- Search
vim.opt.incsearch = true -- starts searching as soon as typing, without enter needed
vim.opt.ignorecase = true -- ignore letter case when searching
vim.opt.smartcase = true -- case insentive unless capitals used in search

vim.opt.matchtime = 2 -- delay before showing matching paren
vim.opt.mps = vim.o.mps .. ",<:>"

-- White characters
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.tabstop = 2 -- 1 tab = 2 spaces
vim.opt.shiftwidth = 2 -- indentation rule
vim.opt.formatoptions = 'qnj1' -- q  - comment formatting; n - numbered lists; j - remove comment when joining lines; 1 - don't break after one-letter word
vim.opt.expandtab = true -- expand tab to spaces

-- Backup files
vim.opt.backup = true -- use backup files
vim.opt.writebackup = false
vim.opt.swapfile = false -- do not use swap file
vim.opt.undodir = HOME .. '/.vim/tmp/undo//'     -- undo files
vim.opt.backupdir = HOME .. '/.vim/tmp/backup//' -- backups
vim.opt.directory = '/.vim/tmp/swap//'   -- swap files

vim.cmd([[
  au FileType python                  set ts=4 sw=4
  au BufRead,BufNewFile *.md          set ft=mkd tw=80 syntax=markdown
  au BufRead,BufNewFile *.ppmd        set ft=mkd tw=80 syntax=markdown
  au BufRead,BufNewFile *.markdown    set ft=mkd tw=80 syntax=markdown
  au BufRead,BufNewFile *.slimbars    set syntax=slim
  au BufRead,BufNewFile *.vue         set syntax=vue
]])

-- Commands mode
vim.opt.wildmenu = true -- on TAB, complete options for system command
vim.opt.wildignore = 'deps,.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,.DS_Store,*.aux,*.out,*.toc'

-- Only show cursorline in the current window and in normal mode.
vim.cmd([[
  augroup cline
      au!
      au WinLeave * set nocursorline
      au WinEnter * set cursorline
      au InsertEnter * set nocursorline
      au InsertLeave * set cursorline
  augroup END
]])

vim.opt.background = 'dark'
--vim.cmd('colorscheme Tomorrow-Night')
vim.g.material_style = "palenight"
--vim.cmd("colorscheme catppuccin")

vim.g.python3_host_prog = "/Users/grzegorz/.asdf/shims/python3"
vim.g.python_host_prog = "/Users/grzegorz/.asdf/shims/python2"

vim.g.auto_save = 1
