--require "nvchad.mappings"

-- add yours here

--local map = vim.keymap.set

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
vim.cmd('noremap <C-b> :noh<cr>:call clearmatches()<cr>') -- clear matches Ctrl+b

function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function nmap(shortcut, command)
  map('n', shortcut, command)
end

function imap(shortcut, command)
  map('i', shortcut, command)
end

function vmap(shortcut, command)
  map('v', shortcut, command)
end

function cmap(shortcut, command)
  map('c', shortcut, command)
end

function tmap(shortcut, command)
  map('t', shortcut, command)
end

vim.cmd('nnoremap <leader>a :Git blame<cr>')

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- sane regexes
nmap('/', '/\\v')
vmap('/', '/\\v')

-- don't jump when using *
nmap('*', '*<c-o>')

-- keep search matches in the middle of the window
nmap('n', 'nzzzv')
nmap('N', 'Nzzzv')

-- Same when jumping around
nmap('g;', 'g;zz')
--nmap('g', 'g,zz') -- for some reason doesn't work well

-- Open a Quickfix window for the last search.
nmap("<leader>?", ":execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>")

-- Begining & End of line in Normal mode
nmap('H', '^')
nmap('L', 'g_')

-- more natural movement with wrap on
nmap('j', 'gj')
nmap('k', 'gk')
vmap('j', 'gj')
vmap('k', 'gk')

-- Easy buffer navigation
nmap('<C-h>', '<C-w>h')
nmap('<C-j>', '<C-w>j')
nmap('<C-k>', '<C-w>k')
nmap('<C-l>', '<C-w>l')

-- Reselect visual block after indent/outdent
vmap('<', '<gv')
vmap('>', '>gv')

-- home and end line in command mode
cmap('<C-a>', '<Home>')
cmap('<C-e>', '<End>')

-- Terminal
-- ESC to go to normal mode in terminal
tmap('<C-s>', '<C-\\><C-n>')
tmap('<Esc><Esc>', '<C-\\><C-n>')

-- Easy window split; C-w v -> vv, C-w - s -> ss
nmap('vv', '<C-w>v')
nmap('ss', '<C-w>s')
vim.o.splitbelow = true -- when splitting horizontally, move coursor to lower pane
vim.o.splitright = true -- when splitting vertically, mnove coursor to right pane

-- PLUGINS

-- Find files using Telescope command-line sugar.
nmap("<leader>fa", "<cmd>Telescope find_files<cr>")
nmap("<leader>ff", "<cmd>Telescope git_files<cr>")
nmap("<leader>fg", "<cmd>Telescope live_grep<cr>")
nmap("<leader>be", "<cmd>Telescope buffers<cr>")
nmap("<leader>hh", "<cmd>Telescope help_tags<cr>")

-- LSP
nmap('K', '<cmd>Lspsaga hover_doc<cr>')
imap('<C-k>', '<cmd>Lspsaga hover_doc<cr>')
nmap('gh', '<cmd>Lspsaga lsp_finder<cr>')
nmap('<C-e>', '<cmd>Lspsaga show_line_diagnostics<CR>')

-- git
nmap('<C-g>', '<cmd>GitMessenger<cr>')

-- oil to behave like vinegar
vim.keymap.set("n", "-", require("oil").open)

vim.cmd([[
function! BindingPry()
  call append(line('.')-1, '')
  call setline(line('.')-1, repeat(' ', indent('.')-1) . "require 'pry'; binding.pry")
endfunction

function! BindingRemotePry()
  call append(line('.')-1, '')
  call setline(line('.')-1, repeat(' ', indent('.')-1) . "require 'pry-remote'; binding.pry_remote")
endfunction

function! RunSpec(spec_path, spec_opts)
  let speccish = match(@%, '_spec.rb$') != -1
  if speccish
    "execute '!bundle exec rspec ' . a:spec_opts . ' ' . a:spec_path
    SendKeys("clear ENTER")
    SendKeys("'bundle exec rspec " . a:spec_opts ."' ENTER")
  else
    echo '<< WARNING >> RunSpec() can only be called from inside spec files!'
  endif
endfunction

function! TestContext()
  wall
  let [_, lnum, cnum, _] = getpos('.')
  RubyBlockSpecParentContext
  TestNearest
  call cursor(lnum, cnum)
endfunction

command! TestContext :call TestContext()

map <silent> <LocalLeader>rc :TestContext<CR>
map <silent> <LocalLeader>rb :wa<CR>:TestFile<CR>
map <silent> <LocalLeader>rf :wa<CR>:TestNearest<CR>
map <silent> <LocalLeader>rl :wa<CR>:TestLast<CR>
map <silent> <LocalLeader>rx :wa<CR>:VimuxCloseRunner<CR>
map <silent> <LocalLeader>ri :wa<CR>:VimuxInspectRunner<CR>
map <silent> <LocalLeader>rs :!ruby -c %<CR>
map <silent> <LocalLeader>AA   :A<CR>
map <silent> <LocalLeader>AV   :AV<CR>
map <silent> <LocalLeader>AS   :AS<CR>

" Restore vim-diff shortcuts
silent! unmap ]c
map <silent> ]C :RubyBlockSpecParentContext<CR>

map <LocalLeader>rd Orequire "pry"; binding.pry<ESC>

" Search for tag
nmap <silent> <LocalLeader>] :Tags '<C-R><C-W> <CR>

setlocal isk+=?
]])

nmap("<C-p>", "<cmd>Files<CR>")
nmap("<leader>to", "<cmd>tabnew<CR>")
nmap("<leader>tc", "<cmd>tabclose<CR>")

vim.cmd("noremap <silent> <Leader>rs :call RunSpec('spec', '-fp')<CR>")
vim.cmd("noremap <silent> <Leader>rd :call BindingPry()<CR>")
vim.cmd("noremap <silent> <Leader>rrd :call BindingRemotePry()<CR>")
vim.cmd("noremap <silent> <Leader>rb :call RunSpec(expand('%'), '-fd '. expand('%:p'))<CR>")
vim.cmd("noremap <silent> <Leader>rf :call RunSpec(expand('%'), '-fd '. expand('%:p') . ':' . line('.'))<CR>")

-- GitHubURL
vim.cmd("map <silent> <LocalLeader>gh :GitHubURL<CR>")

-- TComment
vim.cmd("map <silent> <LocalLeader>cc :TComment<CR>")
vim.cmd("map <silent> <LocalLeader>uc :TComment<CR>")

-- Pasting over a selection does not replace the clipboard
vim.cmd("xnoremap <expr> p 'pgv\"'.v:register.'y'")

nmap("<leader>gf", "<cmd>TSToolsGoToSourceDefinition sync<CR>")

vim.cmd("colorscheme catppuccin-frappe")
