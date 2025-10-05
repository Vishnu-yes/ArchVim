-- -------------------------
-- Keymaps DAP
-- -------------------------
local km = vim.keymap.set
km("n", "<leader>db", dap.toggle_breakpoint)
km("n", "<leader>dB", function() dap.set_breakpoint(vim.fn.input("Condition: ")) end)
km("n", "<leader>dl", function() dap.set_breakpoint(nil, nil, vim.fn.input("Log point: ")) end)
km("n", "<leader>dc", dap.continue)
km("n", "<leader>do", dap.step_over)
km("n", "<leader>di", dap.step_into)
km("n", "<leader>du", dap.step_out)
km("n", "<leader>dr", dap.repl.open)
km("n", "<leader>de", dapui.eval)
km("v", "<leader>de", dapui.eval)


-- -------------------------
-- Keymaps Dressing
-- -------------------------

-- Input prompt (floating)
vim.api.nvim_set_keymap(
  "n",
  "<leader>di",  -- "dressing input"
  ":lua vim.ui.input({ prompt = 'Enter something: ' }, function(input) print('You typed:', input) end)<CR>",
  opts
)

-- Selection menu (floating)                                                                                                                              vim.api.nvim_set_keymap(
  "n",
  "<leader>ds",  -- "dressing select"
  ":lua vim.ui.select({'Option 1', 'Option 2', 'Option 3'}, { prompt = 'Pick an option:' }, function(choice) print('You chose:', choice) end)<CR>",
  opts
)

-- Combined demo: input + select
vim.api.nvim_set_keymap(
  "n",
  "<leader>dd",  -- "dressing demo"
  ":lua vim.ui.input({ prompt = 'Enter value: ' }, function(val) vim.ui.select({'A', 'B', 'C'}, { prompt = 'Pick one:' }, function(choice) print('Input:'>
  opts
)


-- -------------------------
-- Keymaps Windows
-- -------------------------

vim.keymap.set("n", "<leader>ft", ":FocusToggle<CR>", { desc = "Toggle Focus (auto-resize splits)" })
vim.keymap.set("n", "<leader>fe", ":FocusEqualise<CR>", { desc = "Equalise splits" })
vim.keymap.set("n", "<leader>fm", ":FocusMaximise<CR>", { desc = "Maximise current split" })
vim.keymap.set("n", "<leader>fc", ":FocusSplitCycle<CR>", { desc = "Cycle split layouts" })

-- -------------------------
-- Keymaps Noice 
-- -------------------------

local keymap = vim.keymap.set

keymap("n", "<leader>nh", "<cmd>Noice history<CR>", { desc = "Noice: Message history", silent = true })
keymap("n", "<leader>nl", "<cmd>Noice last<CR>", { desc = "Noice: Last message", silent = true })
keymap("n", "<leader>nd", "<cmd>Noice dismiss<CR>", { desc = "Noice: Dismiss all", silent = true })
keymap("n", "<leader>ne", "<cmd>Noice errors<CR>", { desc = "Noice: Show errors", silent = true })
keymap("n", "<leader>nD", "<cmd>Noice disable<CR>", { desc = "Noice: Disable", silent = true })
keymap("n", "<leader>nE", "<cmd>Noice enable<CR>", { desc = "Noice: Enable", silent = true })


-- ═══════════════════════════════════════════════════════════
-- KEYBINDINGS - UI interaction shortcuts
-- ═══════════════════════════════════════════════════════════
local keymap = vim.keymap.set

-- Notification keybindings
keymap("n", "<leader>sn", function()
  snacks.notifier.show_history()
end, { desc = "Snacks: Show notification history", silent = true })

keymap("n", "<leader>sd", function()
  snacks.notifier.hide()
end, { desc = "Snacks: Dismiss notifications", silent = true })

keymap("n", "<leader>sD", function()
  snacks.notifier.hide_history()
end, { desc = "Snacks: Close notification history", silent = true })

-- Buffer picker
keymap("n", "<leader>sb", function()
  snacks.picker.buffers()
end, { desc = "Snacks: Buffer picker", silent = true })

-- File picker (if you want a simple file picker)
keymap("n", "<leader>sf", function()
  snacks.picker.files()
end, { desc = "Snacks: File picker", silent = true })

-- Recent files picker
keymap("n", "<leader>sr", function()
  snacks.picker.recent()
end, { desc = "Snacks: Recent files", silent = true })

-- Grep picker
keymap("n", "<leader>sg", function()
  snacks.picker.grep()
end, { desc = "Snacks: Grep picker", silent = true })

-- Input prompt example (custom usage)
keymap("n", "<leader>si", function()
  snacks.input({
    prompt = "Enter text: ",
    default = "",
  }, function(value)
    if value then
      vim.notify("You entered: " .. value, vim.log.levels.INFO)
    end
  end)
end, { desc = "Snacks: Input prompt", silent = true })

-- Progress example (for testing)
keymap("n", "<leader>sp", function()
  local progress = snacks.progress({
    title = "Loading",
    message = "Processing...",
  })

  vim.defer_fn(function()
    progress:update({ percentage = 50, message = "Half way..." })
  end, 1000)

  vim.defer_fn(function()
    progress:update({ percentage = 100, message = "Complete!" })
    progress:close()
  end, 2000)
end, { desc = "Snacks: Test progress", silent = true })

-- Word highlighting toggle
keymap("n", "<leader>sw", function()
  snacks.words.toggle()
end, { desc = "Snacks: Toggle word highlighting", silent = true })

-- Search highlighting toggle
keymap("n", "<leader>sh", "<cmd>set hlsearch!<CR>",
  { desc = "Snacks: Toggle search highlighting", silent = true })

-- Clear search highlight
keymap("n", "<Esc>", "<cmd>nohlsearch<CR>",
  { desc = "Clear search highlighting", silent = true })

-- Big file info
keymap("n", "<leader>sB", function()
  local buf = vim.api.nvim_get_current_buf()
  local size = vim.api.nvim_buf_line_count(buf)
  vim.notify(string.format("Buffer has %d lines", size), vim.log.levels.INFO)
end, { desc = "Snacks: Buffer info", silent = true })

-- ═══════════════════════════════════════════════════════════
-- AUTO-COMMANDS - Enhanced behavior
-- ═══════════════════════════════════════════════════════════

-- Show notification when big file is opened
vim.api.nvim_create_autocmd("User", {
  pattern = "BigFileDetected",
  callback = function()
    vim.notify("Big file detected! Some features disabled for performance.", vim.log.levels.WARN)
  end,
})

-- Welcome notification on startup (optional)
vim.api.nvim_create_autocmd("VimEnter", {
  once = true,
  callback = function()
    vim.defer_fn(function()
      snacks.notifier.notify("Welcome to Neovim! 🚀", vim.log.levels.INFO, {
        title = "Snacks",
        timeout = 2000,
      })
    end, 100)
  end,
})

-- -------------------------
-- Keymaps Bufferline 
-- -------------------------

    -- =====================================================
    -- AUTO-REFRESH ON COLORSCHEME CHANGE
    -- =====================================================
    vim.api.nvim_create_autocmd("ColorScheme", {
      group = vim.api.nvim_create_augroup("BufferlineColors", { clear = true }),
      callback = function()
        -- Wait a bit for theme to fully load
        vim.defer_fn(function()
          -- Simply reload the bufferline module to apply new theme colors
          package.loaded["bufferline"] = nil
          require("bufferline")                                                                                                                  vim.notify("Bufferline colors updated", vim.log.levels.INFO, { title = "Bufferline" })
        end, 100)
      end,
    })

    -- =====================================================
    -- ENHANCED KEYMAPS WITH YOUR EXISTING FUNCTIONS
    -- =====================================================
    local map = vim.keymap.set
    local opts = { noremap = true, silent = true }

    -- Jump to buffer 1-9 with visual feedback
    for i = 1, 9 do
      map("n", "<leader>" .. i, function()
        local buffers = vim.fn.getbufinfo({ buflisted = 1 })
        if buffers[i] then
          vim.api.nvim_set_current_buf(buffers[i].bufnr)
          vim.notify("Switched to buffer " .. i, vim.log.levels.INFO, { title = "Bufferline" })
        else
          vim.notify("Buffer " .. i .. " not found", vim.log.levels.WARN, { title = "Bufferline" })
        end
      end, vim.tbl_extend("force", opts, { desc = "Jump to buffer " .. i }))
    end

    -- Enhanced cycle buffer function
    local function cycle_buffer(next)
      local buffers = vim.fn.getbufinfo({ buflisted = 1 })
      if #buffers == 0 then return end

      local current = vim.api.nvim_get_current_buf()
      local idx = 1
      for i, b in ipairs(buffers) do
        if b.bufnr == current then
          idx = i
          break
        end
      end

      local target = next and (idx % #buffers + 1) or ((idx - 2) % #buffers + 1)
      vim.api.nvim_set_current_buf(buffers[target].bufnr)
    end

    -- Cycle buffers
    map("n", "<A-l>", function() cycle_buffer(true) end, vim.tbl_extend("force", opts, { desc = "Next buffer" }))                          map("n", "<A-h>", function() cycle_buffer(false) end, vim.tbl_extend("force", opts, { desc = "Previous buffer" }))

    -- Additional useful keymaps
    map("n", "<leader>bp", "<cmd>BufferLinePick<cr>", vim.tbl_extend("force", opts, { desc = "Pick buffer" }))
    map("n", "<leader>bc", "<cmd>BufferLinePickClose<cr>", vim.tbl_extend("force", opts, { desc = "Pick close buffer" }))
    map("n", "<leader>bh", "<cmd>BufferLineCloseLeft<cr>", vim.tbl_extend("force", opts, { desc = "Close left buffers" }))                 map("n", "<leader>bl", "<cmd>BufferLineCloseRight<cr>", vim.tbl_extend("force", opts, { desc = "Close right buffers" }))
    map("n", "<leader>bo", "<cmd>BufferLineCloseOthers<cr>", vim.tbl_extend("force", opts, { desc = "Close other buffers" }))
    map("n", "<leader>bD", "<cmd>BufferLineSortByDirectory<cr>", vim.tbl_extend("force", opts, { desc = "Sort by directory" }))
    map("n", "<leader>bE", "<cmd>BufferLineSortByExtension<cr>", vim.tbl_extend("force", opts, { desc = "Sort by extension" }))

    -- Enhanced buffer picker with telescope-style UI
    map("n", "<leader>bb", function()
      local buffers = vim.fn.getbufinfo({ buflisted = 1 })
      local items = {}

      for i, b in ipairs(buffers) do
        local name = b.name ~= "" and vim.fn.fnamemodify(b.name, ":t") or "[No Name]"
        local path = b.name ~= "" and vim.fn.fnamemodify(b.name, ":~:.") or ""                                                                 local modified = vim.bo[b.bufnr].modified and "● " or "  "

        table.insert(items, {
          text = string.format("%s%d: %s", modified, i, name),
          detail = path,
          bufnr = b.bufnr,
        })
      end

      vim.ui.select(items, {
        prompt = "📂 Switch to buffer:",
        format_item = function(item)
          return item.text .. (item.detail ~= "" and " (" .. item.detail .. ")" or "")
        end,
      }, function(choice)
        if choice then
          vim.api.nvim_set_current_buf(choice.bufnr)
        end
      end)
    end, vim.tbl_extend("force", opts, { desc = "Pick buffer to switch" }))

    -- Enhanced buffer close picker
    map("n", "<leader>bk", function()
      local buffers = vim.fn.getbufinfo({ buflisted = 1 })

      if #buffers == 0 then
        vim.notify("No buffers to close", vim.log.levels.WARN, { title = "Bufferline" })
        return

      local items = {}
      for i, b in ipairs(buffers) do
        local name = b.name ~= "" and vim.fn.fnamemodify(b.name, ":t") or "[No Name]"
        local path = b.name ~= "" and vim.fn.fnamemodify(b.name, ":~:.") or ""
        local modified = vim.bo[b.bufnr].modified and "● " or "  "

        table.insert(items, {
          text = string.format("%s%d: %s", modified, i, name),
          detail = path,
          bufnr = b.bufnr,
        })
      end

      vim.ui.select(items, {
        prompt = "🗑️  Close buffer:",
        format_item = function(item)
          return item.text .. (item.detail ~= "" and " (" .. item.detail .. ")" or "")
        end,
      }, function(choice)                                                                                                                      if choice then
          local modified = vim.bo[choice.bufnr].modified
          if modified then
            vim.ui.select({ "Yes", "No" }, {
              prompt = "Buffer has unsaved changes. Close anyway?",
            }, function(confirm)
              if confirm == "Yes" then
                vim.api.nvim_buf_delete(choice.bufnr, { force = true })
                vim.notify("Buffer closed (force)", vim.log.levels.INFO, { title = "Bufferline" })
              end
            end)
          else
            vim.api.nvim_buf_delete(choice.bufnr, { force = false })
            vim.notify("Buffer closed", vim.log.levels.INFO, { title = "Bufferline" })
          end
        end
      end)
    end, vim.tbl_extend("force", opts, { desc = "Pick buffer to close" }))

    -- Close current buffer intelligently
    map("n", "<leader>bd", function()
      local bufnr = vim.api.nvim_get_current_buf()
      local buffers = vim.fn.getbufinfo({ buflisted = 1 })

      -- If more than one buffer, switch to next before closing
      if #buffers > 1 then
        cycle_buffer(true)
      end

      vim.api.nvim_buf_delete(bufnr, { force = false })
    end, vim.tbl_extend("force", opts, { desc = "Close current buffer" }))

    -- Force close current buffer
    map("n", "<leader>bD", function()
      local bufnr = vim.api.nvim_get_current_buf()
      local buffers = vim.fn.getbufinfo({ buflisted = 1 })

      if #buffers > 1 then
        cycle_buffer(true)
      end

      vim.api.nvim_buf_delete(bufnr, { force = true })
      vim.notify("Buffer force closed", vim.log.levels.WARN, { title = "Bufferline" })
    end, vim.tbl_extend("force", opts, { desc = "Force close current buffer" }))

    -- Move buffer position
    map("n", "<leader>b>", "<cmd>BufferLineMoveNext<cr>", vim.tbl_extend("force", opts, { desc = "Move buffer right" }))
    map("n", "<leader>b<", "<cmd>BufferLineMovePrev<cr>", vim.tbl_extend("force", opts, { desc = "Move buffer left" }))

    -- Toggle pin buffer
    map("n", "<leader>bP", "<cmd>BufferLineTogglePin<cr>", vim.tbl_extend("force", opts, { desc = "Toggle pin buffer" }))

--- ==============
--- Theme
--- ==============
-- Quick theme switcher
function M.switch_theme()
  local theme_names = vim.tbl_keys(M.themes)
  table.sort(theme_names)

  vim.ui.select(theme_names, {
    prompt = "Select Theme:",
    format_item = function(item)
      local current = vim.g.current_theme == item and " (current)" or ""
      return item:gsub("^%l", string.upper) .. current                                                end,                                                                                            }, function(choice)
    if choice then
      local ok = M.set_theme(choice)
      if ok then
        vim.notify("Theme changed to: " .. choice, vim.log.levels.INFO)
      end
    end
  end)
end

# ==================
#  Autorelaod 
# ==================

-- ~/.config/nvim/lua/user/Basics/autoreload.lua
local M = {}

-- 🔁 Full config reload (manual)
function M.reload_config()
    -- Clear all "user.*" modules
    for name, _ in pairs(package.loaded) do
        if name:match("^user") then
            package.loaded[name] = nil
        end
    end

    -- Reset lazy.nvim if running
    if package.loaded["lazy"] then
        require("lazy").reload()
    end

    -- Reload init.lua
    dofile(vim.fn.stdpath("config") .. "/init.lua")
    vim.notify("✅ Full config reloaded!", vim.log.levels.INFO, { title = "Nvim Config" })
end

-- ⚡ Smart reload on save (auto) for **every buffer**
vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "*", -- Trigger for all files
    callback = function(opts)
        local file = opts.file

        -- Only attempt to reload Lua files
        if not file:match("%.lua$") then return end

        -- Compute module name if it's under ~/.config/nvim/lua/
        local config_lua_path = vim.fn.stdpath("config") .. "/lua/"
        if file:sub(1, #config_lua_path) ~= config_lua_path then return end

        local relpath = file:sub(#config_lua_path + 1)
        local modname = relpath:gsub("%.lua$", ""):gsub("/", ".")

        -- Clear cache and reload
        package.loaded[modname] = nil
        local ok, err = pcall(require, modname)
        if ok then
            vim.notify("🔄 Reloaded " .. modname, vim.log.levels.INFO, { title = "Nvim Config" })
        else
            vim.notify("❌ Error reloading " .. modname .. "\n\n" .. err, vim.log.levels.ERROR, { title = "Nvim Config" })
        end
    end,
})

return M


# ==================
# Mappings Works well Mostly
# ==================

--=========================
--Custom Command
--=========================
vim.api.nvim_create_user_command("Tldr", function()
    vim.cmd("Trouble diagnostics toggle")
end, {})


-- ======================
-- Move Line Up or down
-- ======================
-- Normal mode: move current line up/down
-- Visual Line mode: move selected lines up/down
vim.keymap.set("n", "<C-k>", ":m .-2<CR>==", { noremap = true, silent = true })
vim.keymap.set("n", "<C-j>", ":m .+1<CR>==", { noremap = true, silent = true })

-- Visual Line mode: move selected lines up/down (repeatable)
vim.keymap.set("x", "<C-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("x", "<C-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- Keep selection after shifting with < or >                                                                                                              vim.keymap.set("v", "<", "<gv", { noremap = true, silent = true })
vim.keymap.set("v", ">", ">gv", { noremap = true, silent = true })

-- Ctrl-based mappings (example: Ctrl-h and Ctrl-l)
vim.keymap.set("v", "<C-h>", "<gv", { noremap = true, silent = true })
vim.keymap.set("v", "<C-l>", ">gv", { noremap = true, silent = true })


-- Interactice replace word from two lines
function _G.SubstituteRange()                                                                                                                               local start_line = vim.fn.input("Start line: ")
  local end_line = vim.fn.input("End line: ")
  local old = vim.fn.input("Find: ")
  local new = vim.fn.input("Replace with: ")
  vim.cmd(start_line .. "," .. end_line .. "s/" .. old .. "/" .. new .. "/g")
end

vim.keymap.set("n", "<leader>rs", ":lua SubstituteRange()<CR>", { desc = "Range substitute" })

-- Whole Buffer , select 1 and last line
function _G.SubstituteAll()
  local old = vim.fn.input("Find: ")
  local new = vim.fn.input("Replace with: ")
  local last_line = vim.api.nvim_buf_line_count(0)
  vim.cmd("1," .. last_line .. "s/" .. old .. "/" .. new .. "/g")
end

vim.keymap.set("n", "<leader>ra", ":lua SubstituteAll()<CR>", { desc = "Replace in whole file" })

-- Visual Mode Select as much as as you want.
vim.keymap.set("v", "<leader>rs", ":s///g<Left><Left>", { desc = "Replace in selection" })

-- Pattern Based
function _G.SubstituteMatchingLines()
  local pattern = vim.fn.input("Line contains: ")
  local old = vim.fn.input("Find: ")
  local new = vim.fn.input("Replace with: ")
  vim.cmd("g/" .. pattern .. "/s/" .. old .. "/" .. new .. "/g")
end

vim.keymap.set("n", "<leader>rm", ":lua SubstituteMatchingLines()<CR>", { desc = "Replace in matching lines" })

-- ####################
-- Keymaps Overlapping
-- ####################
local function find_leader_overlaps()
    local seen = {}
    local found_overlap = false

    for _, map in ipairs(vim.api.nvim_get_keymap("n")) do
        if map.lhs:match("^<leader>") then
            if seen[map.lhs] then
                found_overlap = true
                vim.notify(
                    string.format("Overlap detected: %s -> %s AND %s", map.lhs, seen[map.lhs], map.rhs),
                    vim.log.levels.WARN
                )
            else
                seen[map.lhs] = map.rhs
            end
        end
    end

    if not found_overlap then
        vim.notify("No leader key overlaps detected", vim.log.levels.INFO)
    end
end

-- Run the check
find_leader_overlaps()

-- ###################
-- Move to Destiny
-- ###################
-- Move selected block of lines to a target line number
-- Works with visual line mode (V), visual mode (v), and visual block mode (Ctrl-v)
local function move_block_to_line()
  -- Get the visual selection range
  local start_line = vim.fn.line("'<")
  local end_line = vim.fn.line("'>")

  -- Prompt for target line number
  local target = vim.fn.input("Move to line: ")
  target = tonumber(target)

  if not target then
    print("\nInvalid line number")
    return
  end

  -- Get the lines to move
  local lines = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false)
  local num_lines = #lines

  -- Delete the selected lines
  vim.api.nvim_buf_set_lines(0, start_line - 1, end_line, false, {})

  -- Adjust target line if needed (if target is after deleted lines)
  local adjusted_target = target
  if target > start_line then
    adjusted_target = target - num_lines
  end

  -- Insert lines at target position
  -- If target is at the end, we need to handle it differently
  local total_lines = vim.api.nvim_buf_line_count(0)
  if adjusted_target > total_lines then
    adjusted_target = total_lines
  end

  vim.api.nvim_buf_set_lines(0, adjusted_target, adjusted_target, false, lines)

  -- Move cursor to the moved block
  vim.api.nvim_win_set_cursor(0, {adjusted_target + 1, 0})

  print(string.format("\nMoved %d lines to line %d", num_lines, adjusted_target + 1))
end                                                                                                                                                       
-- Create a user command for easier access
vim.api.nvim_create_user_command('MoveBlock', move_block_to_line, { range = true })

-- Set up keymapping (optional - you can change this)
-- In visual mode, press <leader>m to move selected block
vim.keymap.set('v', '<leader>m', ':MoveBlock<CR>', { noremap = true, silent = false, desc = 'Move block to line' })

-- Alternative: Quick move with just `:M <line_number>`
vim.api.nvim_create_user_command('M', move_block_to_line, { range = true })

# ============================
# Options.lua



--Your all definded options mustbbe added here.
-- Options are those that changes default behavior to something you want.
-- E.g vim.o.tabstop = 4
-- =====================
-- (1).Basic editor settings
-- =====================
local o = vim.o
vim.o.number = true
vim.o.relativenumber = false
o.cursorline = true
o.termguicolors = true
o.signcolumn = "yes"
o.expandtab = true
o.shiftwidth = 4
o.tabstop = 4
o.smartindent = true
o.clipboard = "unnamedplus"
vim.cmd("filetype plugin indent on")                                                                                                   -- Minimal custom tabline: show current file + indicator for more tabs
vim.o.showtabline = 2
vim.o.tabline = "%!v:lua.MyTabline()"

-- ======================
-- Session Requirements                                                                                                                -- ======================
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- ------------------
-- Truecolor                                                                                                                           -- -----------------
vim.opt.termguicolors = true
-- =====================
-- (2) Leader keys                                                                                                                     -- =====================
vim.g.mapleader = " "
vim.g.maplocalleader = "'"

-- ======================
-- Provider set to Zero
-- ======================
-- Disable unused language providers to remove health warnings
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0

# ========================
# AutoCompletion Related
-- Map local leader + c to toggle cmp docs
vim.api.nvim_set_keymap(
    'n',
    '<localleader>c',
    [[:lua _G.toggle_cmp_docs()<CR>]],
    { noremap = true, silent = true }
)

# ========================
# Neoscroll Mappings


-- Neoscroll config
require('neoscroll').setup({
  -- All these are defaulted; we can tweak for small screens
  mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>', '<C-y>', '<C-e>', 'zt', 'zz', 'zb'},
  hide_cursor = true,        -- Hide cursor while scrolling
  stop_eof = true,           -- Stop at end of file
  respect_scrolloff = true,  -- Respect 'scrolloff'
  cursor_scrolls_alone = true,
  easing_function = "sine",  -- Smooth but not too slow
  pre_hook = nil,
  post_hook = nil,
})

-- Map scrolling keys with smaller step for small screens
local t = {}
t['<C-u>'] = {'scroll', {'-5', 'true', '250'}}  -- scroll up 5 lines
t['<C-d>'] = {'scroll', {'5', 'true', '250'}}   -- scroll down 5 lines
t['<C-b>'] = {'scroll', {'-10', 'true', '300'}} -- page up
t['<C-f>'] = {'scroll', {'10', 'true', '300'}}  -- page down
t['<C-y>'] = {'scroll', {'-1', 'false', '100'}} -- 1 line up
t['<C-e>'] = {'scroll', {'1', 'false', '100'}}  -- 1 line down

require('neoscroll.config').set_mappings(t)


# =====================
# Nvim Tree

-- Keymap to toggle nvim-tree
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle File Explorer" })
vim.keymap.set("n", "<leader>re", ":NvimTreeRefresh<CR>", { desc = "Refresh File Explorer" })
vim.keymap.set("n", "<leader>ne", ":NvimTreeFindFile<CR>", { desc = "Find Current File in Explorer" })

  -- Extra keymaps
  vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
  vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close Directory"))
  vim.keymap.set("n", "v", api.node.open.vertical, opts("Open: Vertical Split"))


# ===================
# Sessions

-- Project/Workspace related
map("n", "<leader>pw", ":WorkspacesOpen<CR>", { desc = "Open Workspaces" })
map("n", "<leader>pa", ":WorkspacesAdd<CR>",  { desc = "Add Current Dir as Workspace" })
map("n", "<leader>pr", ":WorkspacesRemove<CR>", { desc = "Remove Workspace" })

-- Session management
map("n", "<leader>ps", ":SessionSave<CR>",   { desc = "Save Session" })
map("n", "<leader>pl", ":SessionRestore<CR>", { desc = "Load Last Session" })
map("n", "<leader>pd", ":SessionDelete<CR>", { desc = "Delete Session" })


# ====================
# Telescope

-- 🔹 Builtin Telescope Pickers
vim.api.nvim_set_keymap('n', '<leader>ff', ":lua require('telescope.builtin').find_files()<CR>", opts)
vim.api.nvim_set_keymap('n', '<leader>fg', ":lua require('telescope.builtin').live_grep()<CR>", opts)
vim.api.nvim_set_keymap('n', '<leader>fb', ":lua require('telescope.builtin').buffers()<CR>", opts)
vim.api.nvim_set_keymap('n', '<leader>fh', ":lua require('telescope.builtin').help_tags()<CR>", opts)

-- 🔹 File Browser
vim.api.nvim_set_keymap('n', '<leader>fe', ":lua require('telescope').extensions.file_browser.file_browser()<CR>", opts)

-- 🔹 Undo History
vim.api.nvim_set_keymap('n', '<leader>fu', ":lua require('telescope').extensions.undo.undo()<CR>", opts)

-- 🔹 Projects                                                                                                                                            vim.api.nvim_set_keymap('n', '<leader>fp', ":lua require('telescope').extensions.projects.projects()<CR>", opts)

-- 🔹 Zoxide (Quick directory navigation)
vim.api.nvim_set_keymap('n', '<leader>fz', ":lua require('telescope').extensions.zoxide.list()<CR>", opts)

-- 🔹 Lazy.nvim (Plugin manager)
vim.api.nvim_set_keymap(
    'n', '<leader>fl',
    ":lua require('telescope.builtin').find_files({ cwd = vim.fn.stdpath('data') .. '/lazy' })<CR>",
    { noremap = true, silent = true }
)

-- 🔹 Telescope keymaps

-- Lazy.nvim directory (plugins installed by lazy.nvim)
local lazy_dir = vim.fn.stdpath("data") .. "/lazy"

-- 1️⃣ Lazy.nvim - Files
vim.api.nvim_set_keymap(
  'n', '<leader>lf',
  ":lua require('telescope.builtin').find_files({ cwd = '"..lazy_dir.."', prompt_title='Lazy Plugins' })<CR>",
  opts
)

-- 2️⃣ Lazy.nvim - Live Grep
vim.api.nvim_set_keymap(
  'n', '<leader>lg',
  ":lua require('telescope.builtin').live_grep({ cwd = '"..lazy_dir.."', prompt_title='Lazy Grep' })<CR>",
  opts
)

-- 3️⃣ Lazy.nvim - Grep String (current word)
vim.api.nvim_set_keymap(
  'n', '<leader>lw',
  ":lua require('telescope.builtin').grep_string({ cwd = '"..lazy_dir.."', prompt_title='Lazy Word' })<CR>",
  opts
)

-- 4️⃣ Neovim config folder (~/.config/nvim) - Files
vim.api.nvim_set_keymap(
  'n', '<leader>lc',
  ":lua require('telescope.builtin').find_files({ cwd = '~/.config/nvim', prompt_title='NVim Config' })<CR>",
  opts
)

-- 🔹 Optional: other general Telescope pickers
vim.api.nvim_set_keymap('n', '<leader>ff', ":lua require('telescope.builtin').find_files()<CR>", opts)
vim.api.nvim_set_keymap('n', '<leader>fg', ":lua require('telescope.builtin').live_grep()<CR>", opts)
vim.api.nvim_set_keymap('n', '<leader>fb', ":lua require('telescope.builtin').buffers()<CR>", opts)
vim.api.nvim_set_keymap('n', '<leader>fe', ":lua require('telescope').extensions.file_browser.file_browser()<CR>", opts)
vim.api.nvim_set_keymap('n', '<leader>fu', ":lua require('telescope').extensions.undo.undo()<CR>", opts)
vim.api.nvim_set_keymap('n', '<leader>fp', ":lua require('telescope').extensions.projects.projects()<CR>", opts)
vim.api.nvim_set_keymap('n', '<leader>fz', ":lua require('telescope').extensions.zoxide.list()<CR>", opts)
-- 🔹 UI-Select is automatically used by plugins and LSP; no mapping needed

# ===================
# Toggle Term (Not that much used)

-- ⌨️ Keymaps (buffer local)
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { buffer = 0 })   -- manual escape
vim.keymap.set("t", "<C-q>", [[<C-\><C-n>:q<CR>]], { buffer = 0 }) -- quit terminal

# ==================
# Workspace (Used Very Less)

vim.keymap.set("n", "<leader>ps", ":SessionSave<CR>", { desc = "Save Session" })
vim.keymap.set("n", "<leader>pr", ":SessionRestore<CR>", { desc = "Restore Session" })


# ===================
# Lsp 

-- 1. on_attach: keymaps
local function on_attach(_, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }
    local map = vim.keymap.set
    map("n", "gd", vim.lsp.buf.definition, opts)
    map("n", "K", vim.lsp.buf.hover, opts)
    map("n", "gr", vim.lsp.buf.references, opts)                                                      map("n", "<leader>rn", vim.lsp.buf.rename, opts)
    map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    map("n", "<leader>f_", function() vim.lsp.buf.format { async = true } end, opts)
end


# ==================
# Harpoon 


local harpoon = require("harpoon")

-- UI
vim.keymap.set("n", "<C-e>", function()
    harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "Harpoon: Toggle menu" })

-- Add current file
vim.keymap.set("n", "<C-a>", function()
    harpoon:list():add()
end, { desc = "Harpoon: Add file" })

# ==========================
# Refactoring ? I never used


-- Refactoring.nvim setup
require('refactoring').setup({})

-- Keymaps for refactoring
local opts = { noremap = true, silent = true, desc = "Refactor" }

-- Open refactor menu (visual mode)
vim.keymap.set("v", "<leader>rr", require('refactoring').select_refactor, opts)

-- Common refactors
vim.keymap.set("v", "<leader>re", function()
    require('refactoring').refactor("Extract Function")
end, { desc = "Extract Function" })

vim.keymap.set("v", "<leader>rv", function()
    require('refactoring').refactor("Extract Variable")
end, { desc = "Extract Variable" })

vim.keymap.set("n", "<leader>ri", function()
    require('refactoring').refactor("Inline Variable")
end, { desc = "Inline Variable" })

# =========================
# Snipe
    mappings = {
        open_menu = "<leader>gb",      -- Open buffer menu
        close_menu = "<Esc>",          -- Close buffer menu
        select_item = "<CR>",          -- Select buffer
        next_item = "<Tab>",           -- Navigate down in menu
        prev_item = "<S-Tab>",         -- Navigate up in menu                                                                   delete_item = "<leader>bd",    -- Delete buffer from menu
    },

    -- Open Snipe buffer menu
map("n", "<leader>gb", snipe.open_buffer_menu, vim.tbl_extend("force", opts, { desc = "Snipe: Open buffer menu" }))

-- Quickly jump to recent buffers (numbers 1-5)
for i = 1, 5 do
    map("n", "<leader>g" .. i, function()
        snipe.open_buffer_menu()
        snipe.select_item(i)
    end, vim.tbl_extend("force", opts, { desc = "Snipe: Jump to buffer " .. i }))
end

map("n", "<leader>gD", function()
    snipe.open_buffer_menu()
end, vim.tbl_extend("force", opts, { desc = "Snipe: Open buffer menu to delete" }))



# ========================
# Todo

    highlight = {
        before = "", -- no extra highlight before keyword
        keyword = "wide", -- highlight the keyword and following text
        after = "fg", -- highlight text after keyword
        pattern = [[.*<(KEYWORDS)\s*:]], -- match "TODO:", "FIX:", etc.
    },
    search = {
        command = "rg",
        args = { "--color=never", "--no-heading", "--with-filename", "--line-number", "--column" },
        pattern = [[\b(KEYWORDS):]], -- ripgrep pattern
    },
})

-- Keymaps
local map = vim.keymap.set
map("n", "]t", function() require("todo-comments").jump_next() end, { desc = "Next todo comment" })
map("n", "[t", function() require("todo-comments").jump_prev() end, { desc = "Previous todo comment" })
map("n", "<leader>xt", ":TodoQuickFix<CR>", { desc = "List todos in quickfix" })
map("n", "<leader>st", ":TodoTelescope<CR>", { desc = "Search todos with Telescope" })



# ==========================================
# Trouble , It is necessary to Many points

-- 🔹 Keymaps (v3 API)
local map = vim.keymap.set

-- Diagnostics                                                                                                                         map("n", "<leader>ld", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", { desc = "Document Diagnostics" })
map("n", "<leader>lw", "<cmd>Trouble diagnostics toggle<CR>", { desc = "Workspace Diagnostics" })

-- Quickfix & References                                                                                                               map("n", "<leader>lq", "<cmd>Trouble qflist toggle<CR>", { desc = "Quickfix List" })
map("n", "<leader>lr", "<cmd>Trouble lsp toggle focus=false win.position=right<CR>", { desc = "LSP References" })

-- 🔹 Navigation (inside Trouble)
map("n", "[q", function() require("trouble").prev({ skip_groups = true, jump = true }) end,
  { desc = "Previous Trouble item" })
map("n", "]q", function() require("trouble").next({ skip_groups = true, jump = true }) end,
  { desc = "Next Trouble item" })


# ===================================================
# Vim Visual Multi by Mg779 is Operating on Defaults


# =====================
# From Legendary.lua

local legendary = require("legendary")

legendary.setup({
    -- UI customization
    include_builtin = true,
    include_legendary_cmds = true,
                                                                                                                                                              -- Theme-aware styling
    extensions = {
        lazy_nvim = true,
        which_key = {
            auto_register = true,
            do_binding = false,
        },
    },

    -- Sort items intelligently
    sort = {
        frecency = {
            db_root = vim.fn.stdpath("data") .. "/legendary/",
            max_timestamps = 10,
        },
    },

    -- Custom UI settings
    select_prompt = " Command Palette",
    select_opts = {
        prompt = " Legendary",
    },

    -- Fancy icons configuration
    icons = {
        keymap = "🔑",
        command = "⚡",
        fn = "🔧",
        itemgroup = "📦",
    },

    -- Keymaps for legendary
    keymaps = {
        -- Open legendary command palette
        { "<C-p>", "<cmd>Legendary<cr>", description = "🎯 Open Command Palette" },
        { "<leader>lc", "<cmd>Legendary commands<cr>", description = "📋 Commands" },
        { "<leader>lk", "<cmd>Legendary keymaps<cr>", description = "🔑 Keymaps" },
        { "<leader>lf", "<cmd>Legendary functions<cr>", description = "🔧 Functions" },
        { "<leader>la", "<cmd>Legendary autocmds<cr>", description = "⚙️ Autocmds" },

        -- ===================================
        -- 🔍 FIND / TELESCOPE
        -- ===================================
        {
            itemgroup = "🔍 Find",
            description = "Telescope & Search Operations",
            icon = "🔍",
            keymaps = {
                { "<leader>ff", "<cmd>Telescope find_files<cr>", description = "📄 Find Files" },
                { "<leader>fg", "<cmd>Telescope live_grep<cr>", description = "🔎 Live Grep" },
                { "<leader>fb", "<cmd>Telescope buffers<cr>", description = "📋 Buffers" },
                { "<leader>fh", "<cmd>Telescope help_tags<cr>", description = "❓ Help Tags" },
                { "<leader>fr", "<cmd>Telescope oldfiles<cr>", description = "🕒 Recent Files" },
                { "<leader>fw", "<cmd>Telescope grep_string<cr>", description = "🔤 Grep Word" },
                { "<leader>fc", "<cmd>Telescope commands<cr>", description = "⚡ Commands" },
                { "<leader>fk", "<cmd>Telescope keymaps<cr>", description = "🔑 Keymaps" },
                { "<leader>fs", "<cmd>Telescope symbols<cr>", description = "🎨 Symbols" },
                { "<leader>fp", "<cmd>Telescope projects<cr>", description = "📁 Projects" },
                { "<leader>fm", "<cmd>Telescope marks<cr>", description = "🔖 Marks" },
                { "<leader>fj", "<cmd>Telescope jumplist<cr>", description = "🦘 Jumplist" },
            },
        },

        -- ===================================
        -- ⚙️ CONFIG
        -- ===================================
        {
            itemgroup = "⚙️ Config",
            description = "Neovim Configuration",
            icon = "⚙️",
            keymaps = {
                { "<leader>cr", "<cmd>source $MYVIMRC<cr>", description = "🔄 Reload Config" },
                { "<leader>ce", "<cmd>edit $MYVIMRC<cr>", description = "✏️ Edit Config" },
                { "<leader>cu", "<cmd>Lazy update<cr>", description = "⬆️ Update Plugins" },
                { "<leader>cs", "<cmd>Lazy sync<cr>", description = "🔄 Sync Plugins" },
                { "<leader>ci", "<cmd>LspInfo<cr>", description = "ℹ️ LSP Info" },
                { "<leader>cm", "<cmd>Mason<cr>", description = "🔧 Mason" },
                { "<leader>cl", "<cmd>Lazy<cr>", description = "💤 Lazy" },
                { "<leader>ch", "<cmd>checkhealth<cr>", description = "🏥 Check Health" },
            },
        },

        -- ===================================
        -- 📁 FILE
        -- ===================================
        {
            itemgroup = "📁 File",
            description = "File Operations",
            icon = "📁",
            keymaps = {
                { "<leader>w", "<cmd>w<cr>", description = "💾 Save" },
                { "<leader>q", "<cmd>q<cr>", description = "❌ Quit" },
                { "<leader>wa", "<cmd>wa<cr>", description = "💾 Save All" },
                { "<leader>qa", "<cmd>qa<cr>", description = "❌ Quit All" },
                { "<leader>wq", "<cmd>wq<cr>", description = "💾 Save & Quit" },
                { "<leader>fn", "<cmd>enew<cr>", description = "📄 New File" },
            },
        },
        -- ===================================
        -- 💻 CODE / LSP
        -- ===================================
        {
            itemgroup = "💻 Code",
            description = "LSP & Code Actions",
            icon = "💻",
            keymaps = {
                { "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", description = "⚡ Code Action" },
                { "<leader>cr", "<cmd>lua vim.lsp.buf.rename()<cr>", description = "✏️ Rename" },
                { "<leader>cf", "<cmd>lua vim.lsp.buf.format({ async = true })<cr>", description = "🎨 Format" },
                { "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", description = "🎯 Go to Definition" },
                { "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", description = "📋 Go to Declaration" },
                { "gr", "<cmd>Telescope lsp_references<cr>", description = "🔗 References" },
                { "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", description = "🔨 Implementation" },
                { "K", "<cmd>lua vim.lsp.buf.hover()<cr>", description = "❓ Hover Info" },
                { "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<cr>", description = "✍️ Signature Help" },
                { "<leader>cd", "<cmd>lua vim.diagnostic.open_float()<cr>", description = "🔍 Show Diagnostics" },
                { "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", description = "⬆️ Prev Diagnostic" },
                { "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", description = "⬇️ Next Diagnostic" },
            },
        },

        -- ===================================
        -- 🐛 DEBUG
        -- ===================================
        {
            itemgroup = "🐛 Debug",
            description = "DAP Debugging",
            icon = "🐛",
            keymaps = {
                { "<leader>db", "<cmd>DapToggleBreakpoint<cr>", description = "🔴 Toggle Breakpoint" },
                { "<leader>dc", "<cmd>DapContinue<cr>", description = "▶️ Continue" },
                { "<leader>di", "<cmd>DapStepInto<cr>", description = "⬇️ Step Into" },
                { "<leader>do", "<cmd>DapStepOver<cr>", description = "➡️ Step Over" },
                { "<leader>dO", "<cmd>DapStepOut<cr>", description = "⬆️ Step Out" },
                { "<leader>dr", "<cmd>DapToggleRepl<cr>", description = "💬 Toggle REPL" },
                { "<leader>du", "<cmd>lua require('dapui').toggle()<cr>", description = "🖼️ Toggle UI" },
                { "<leader>dt", "<cmd>DapTerminate<cr>", description = "⏹️ Terminate" },
            },
        },

        -- ===================================
        -- 📝 BUFFER
        -- ===================================
        {
            itemgroup = "📝 Buffer",
            description = "Buffer Management",
            icon = "📝",
            keymaps = {
                { "<leader>bn", "<cmd>bnext<cr>", description = "➡️ Next Buffer" },
                { "<leader>bp", "<cmd>bprevious<cr>", description = "⬅️ Previous Buffer" },
                { "<leader>bd", "<cmd>bdelete<cr>", description = "❌ Delete Buffer" },
                { "<leader>bw", "<cmd>bwipeout<cr>", description = "🗑️ Wipeout Buffer" },
                { "<leader>bs", "<cmd>w<cr>", description = "💾 Save Buffer" },
                { "<leader>ba", "<cmd>%bd|e#<cr>", description = "❌ Delete All Others" },
            },
        },

        -- ===================================
        -- 🪟 WINDOW
        -- ===================================
        {
            itemgroup = "🪟 Window",
            description = "Window Management",
            icon = "🪟",
            keymaps = {
                { "<leader>wh", "<cmd>split<cr>", description = "➖ Horizontal Split" },
                { "<leader>wv", "<cmd>vsplit<cr>", description = "➗ Vertical Split" },
                { "<leader>wc", "<cmd>close<cr>", description = "❌ Close Window" },
                { "<leader>wo", "<cmd>only<cr>", description = "🎯 Only This Window" },
                { "<C-h>", "<C-w>h", description = "⬅️ Focus Left" },
                { "<C-j>", "<C-w>j", description = "⬇️ Focus Down" },
                { "<C-k>", "<C-w>k", description = "⬆️ Focus Up" },
                { "<C-l>", "<C-w>l", description = "➡️ Focus Right" },
            },
        },

        -- ===================================
        -- 🌲 GIT
        -- ===================================
        {
            itemgroup = "🌲 Git",
            description = "Git Operations",
            icon = "🌲",
            keymaps = {
                { "<leader>gs", "<cmd>Git status<cr>", description = "📊 Status" },
                { "<leader>gc", "<cmd>Git commit<cr>", description = "💬 Commit" },
                { "<leader>gp", "<cmd>Git push<cr>", description = "⬆️ Push" },
                { "<leader>gP", "<cmd>Git pull<cr>", description = "⬇️ Pull" },
                { "<leader>gb", "<cmd>Git blame<cr>", description = "👤 Blame" },
                { "<leader>gd", "<cmd>Git diff<cr>", description = "🔍 Diff" },
                { "<leader>gl", "<cmd>Git log<cr>", description = "📜 Log" },
                { "<leader>gh", "<cmd>Gitsigns preview_hunk<cr>", description = "👁️ Preview Hunk" },
                { "<leader>gr", "<cmd>Gitsigns reset_hunk<cr>", description = "♻️ Reset Hunk" },
            },
        },                                                                                                                                                
        -- ===================================                                                                                                                    -- 📦 TAB
        -- ===================================
        {                                                                                                                                                             itemgroup = "📦 Tab",
            description = "Tab Management",
            icon = "📦",                                                                                                                                              keymaps = {
                { "<leader>tn", "<cmd>tabnew<cr>", description = "➕ New Tab" },
                { "<leader>tc", "<cmd>tabclose<cr>", description = "❌ Close Tab" },                                                                                      { "<leader>to", "<cmd>tabonly<cr>", description = "🎯 Only This Tab" },
                { "gt", "<cmd>tabnext<cr>", description = "➡️ Next Tab" },
                { "gT", "<cmd>tabprevious<cr>", description = "⬅️ Previous Tab" },
            },
        },

        -- ===================================
        -- 🔧 TERMINAL
        -- ===================================
        {
            itemgroup = "🔧 Terminal",
            description = "ToggleTerm",
            icon = "🔧",
            keymaps = {
                { "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", description = "☁️ Float Terminal" },
                { "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", description = "➖ Horizontal Terminal" },
                { "<leader>tv", "<cmd>ToggleTerm direction=vertical<cr>", description = "➗ Vertical Terminal" },
                { "<leader>tt", "<cmd>ToggleTerm direction=tab<cr>", description = "📑 Tab Terminal" },
            },
        },

        -- ===================================
        -- 🎨 UI
        -- ===================================
        {
            itemgroup = "🎨 UI",
            description = "UI Toggles",
            icon = "🎨",
            keymaps = {
                { "<leader>un", "<cmd>set number!<cr>", description = "🔢 Toggle Line Numbers" },
                { "<leader>ur", "<cmd>set relativenumber!<cr>", description = "📊 Toggle Relative Numbers" },
                { "<leader>us", "<cmd>set spell!<cr>", description = "✏️ Toggle Spell Check" },
                { "<leader>uw", "<cmd>set wrap!<cr>", description = "📜 Toggle Wrap" },
                { "<leader>uc", "<cmd>set cursorline!<cr>", description = "➖ Toggle Cursorline" },
                { "<leader>uz", "<cmd>ZenMode<cr>", description = "🧘 Zen Mode" },
                { "<leader>ut", "<cmd>Twilight<cr>", description = "🌙 Twilight" },
                { "<leader>ue", "<cmd>NvimTreeToggle<cr>", description = "🌲 Toggle Explorer" },
            },
        },

        -- ===================================
        -- 📋 SESSION
        -- ===================================
        {
            itemgroup = "📋 Session",
            description = "Session Management",
            icon = "📋",
            keymaps = {
                { "<leader>ss", "<cmd>SessionSave<cr>", description = "💾 Save Session" },
                { "<leader>sl", "<cmd>SessionLoad<cr>", description = "📂 Load Session" },
                { "<leader>sd", "<cmd>SessionDelete<cr>", description = "🗑️ Delete Session" },
                { "<leader>sr", "<cmd>SessionRestore<cr>", description = "♻️ Restore Session" },
            },
        },
    },

    -- Custom commands
    commands = {
        {
            ":LegendaryRepeat",
            function()
                require("legendary").find({ filters = { require("legendary.filters").current_mode() } })
            end,
            description = "🔄 Repeat last Legendary search",                                                                                                      },
    },                                                                                                                                                    
    -- Custom functions
    funcs = {                                                                                                                                                     {
            function()
                vim.notify("✨ Legendary.nvim is awesome!", vim.log.levels.INFO)                                                                                      end,
            description = "✨ Show awesome message",
        },                                                                                                                                                    },

    -- Scratchpad configuration (IDE-like)
    scratchpad = {
        view = "float",
        results_view = "float",
        keep_contents = true,
    },
                                                                                                                                                              -- Theme-aware float window configuration
    float_border = "rounded",
    col_separator_char = "│",
})

-- Set up highlights to match your theme
vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = function()
        -- Make legendary blend with your theme
        vim.api.nvim_set_hl(0, "LegendaryNormal", { link = "NormalFloat" })
        vim.api.nvim_set_hl(0, "LegendaryBorder", { link = "FloatBorder" })
    end,
})


# ==============================
#  This is from Whichkey.lua 


local wk = require("which-key")

-- Modern, theme-aware setup with fancy UI
wk.setup({
  preset = "modern",
  delay = 300,

  -- Fancy window configuration
  win = {
    border = "rounded",
    padding = { 1, 2 },
    title = true,
    title_pos = "center",
    zindex = 1000,

    -- Modern styling
    wo = {
      winblend = 10, -- Slight transparency for modern look
    },
  },

  -- Layout configuration
  layout = {
    width = { min = 20, max = 50 },
    spacing = 3,
    align = "left",
  },

  -- Enhanced icons
  icons = {
    breadcrumb = "»",
    separator = "➜",
    group = "+",
    ellipsis = "…",

    -- Fancy mappings with better icons
    mappings = true,
    rules = {},
    colors = true,
    keys = {
      Up = " ",
      Down = " ",
      Left = " ",
      Right = " ",
      C = "󰘴 ",
      M = "󰘵 ",
      D = "󰘳 ",
      S = "󰘶 ",
      CR = "󰌑 ",
      Esc = "󱊷 ",
      ScrollWheelDown = "󱕐 ",
      ScrollWheelUp = "󱕑 ",
      NL = "󰌑 ",
      BS = "󰁮",
      Space = "󱁐 ",
      Tab = "󰌒 ",
      F1 = "󱊫",
      F2 = "󱊬",
      F3 = "󱊭",
      F4 = "󱊮",
      F5 = "󱊯",
      F6 = "󱊰",
      F7 = "󱊱",
      F8 = "󱊲",
      F9 = "󱊳",
      F10 = "󱊴",
      F11 = "󱊵",
      F12 = "󱊶",
    },                                                                                                                                                      },

  -- Show help and command preview
  show_help = true,
  show_keys = true,

  -- Disable for certain filetypes                                                                                                                          disable = {
    ft = {},
    bt = {},
  },

  -- Enhanced documentation
  triggers = {
    { "<auto>", mode = "nixsotc" },
    { "<leader>", mode = { "n", "v" } },
  },
})

-- ═══════════════════════════════════════════════════════════════
-- 🔍 FIND CATEGORY - Telescope & Search Operations
-- ═══════════════════════════════════════════════════════════════

-- ═══════════════════════════════════════════════════════════════
-- 🔍 FIND CATEGORY - Telescope & Search Operations
-- ═══════════════════════════════════════════════════════════════
wk.add({
  { "<leader>f", group = "🔍 Find", icon = "󰈞" },

  -- Core File/Buffer Finding
  { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files", icon = "󰈞" },
  { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers", icon = "󰓩" },
  { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent Files", icon = "󰋚" },
  { "<leader>fe", "<cmd>Telescope file_browser<cr>", desc = "File Browser", icon = "󰉋" },

  -- Text Search
  { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep", icon = "󰱼" },
  { "<leader>fw", "<cmd>Telescope grep_string<cr>", desc = "Find Word", icon = "󰬶" },

  -- LSP & Symbols
  { "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document Symbols", icon = "󰊕" },
  { "<leader>fS", "<cmd>Telescope lsp_workspace_symbols<cr>", desc = "Workspace Symbols", icon = "󰊕" },
  { "<leader>fd", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics", icon = "󰒡" },

  -- Navigation & History
  { "<leader>fj", "<cmd>Telescope jumplist<cr>", desc = "Jumplist", icon = "󰑊" },
  { "<leader>fm", "<cmd>Telescope marks<cr>", desc = "Marks", icon = "󰃀" },
  { "<leader>fq", "<cmd>Telescope quickfix<cr>", desc = "Quickfix", icon = "󰁨" },
  { "<leader>fR", "<cmd>Telescope registers<cr>", desc = "Registers", icon = "󰅍" },
  { "<leader>fu", "<cmd>Telescope undo<cr>", desc = "Undo History", icon = "󰕌" },

  -- Project & Directory
  { "<leader>fp", "<cmd>Telescope projects<cr>", desc = "Projects", icon = "󰉋" },
  { "<leader>fz", "<cmd>Telescope zoxide list<cr>", desc = "Zoxide (directories)", icon = "󰉋" },
  { "<leader>fl", "<cmd>Telescope lazy<cr>", desc = "Lazy Plugins", icon = "󰒲" },

  -- Vim Commands & Help
  { "<leader>fc", "<cmd>Telescope commands<cr>", desc = "Commands", icon = "󰘳" },
  { "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps", icon = "󰌌" },
  { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help Tags", icon = "󰋖" },
  { "<leader>ft", "<cmd>Telescope colorscheme<cr>", desc = "Themes", icon = "󰏘" },

  -- Search History
  { "<leader>f/", "<cmd>Telescope search_history<cr>", desc = "Search History", icon = "󰋚" },
  { "<leader>f:", "<cmd>Telescope command_history<cr>", desc = "Command History", icon = "󰋚" },

  -- Format (fits the "find/fix" pattern)
  { "<leader>f_", function() vim.lsp.buf.format { async = true } end, desc = "Format Buffer", icon = "󰉠" },
})

-- ═══════════════════════════════════════════════════════════════
-- 🪟 FOCUS CATEGORY - Window Management & Splits
-- ═══════════════════════════════════════════════════════════════
wk.add({
  { "<leader>F", group = "🪟 Focus", icon = "󱂬" },
  { "<leader>Ft", "<cmd>FocusToggle<cr>", desc = "Toggle Focus (auto-resize)", icon = "󱂬" },
  { "<leader>Fe", "<cmd>FocusEqualise<cr>", desc = "Equalise Splits", icon = "󰹳" },
  { "<leader>Fm", "<cmd>FocusMaximise<cr>", desc = "Maximise Split", icon = "󰊓" },
  { "<leader>Fc", "<cmd>FocusSplitCycle<cr>", desc = "Cycle Split Layouts", icon = "󰑖" },
})

-- ═══════════════════════════════════════════════════════════════
-- ⚙️  CONFIG CATEGORY - Configuration Management
-- ═══════════════════════════════════════════════════════════════
wk.add({
  { "<leader>c", group = "⚙️  Config", icon = "󰒓" },
  { "<leader>cr", "<cmd>source $MYVIMRC<cr>", desc = "Reload Config", icon = "󰑓" },
  { "<leader>ce", "<cmd>edit $MYVIMRC<cr>", desc = "Edit init.lua", icon = "󰈮" },
  { "<leader>cp", "<cmd>Lazy<cr>", desc = "Plugin Manager", icon = "󰏖" },
  { "<leader>cu", "<cmd>Lazy update<cr>", desc = "Update Plugins", icon = "󰚰" },
  { "<leader>cs", "<cmd>Lazy sync<cr>", desc = "Sync Plugins", icon = "󰓦" },
  { "<leader>cc", "<cmd>Lazy clean<cr>", desc = "Clean Plugins", icon = "󰃢" },
  { "<leader>ch", "<cmd>checkhealth<cr>", desc = "Check Health", icon = "󰓙" },
  { "<leader>ci", "<cmd>LspInfo<cr>", desc = "LSP Info", icon = "󰋼" },
  { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason", icon = "󰢱" },
  { "<leader>cl", "<cmd>Lazy log<cr>", desc = "Plugin Logs", icon = "󰦪" },
  { "<leader>co", "<cmd>options<cr>", desc = "Options", icon = "󰒓" },
  { "<leader>ck", "<cmd>WhichKey<cr>", desc = "Show Keymaps", icon = "󰌌" },
})
                                                                                                                                                          -- ═══════════════════════════════════════════════════════════════
-- 📁 FILE CATEGORY - File Operations
-- ═══════════════════════════════════════════════════════════════
wk.add({
  { "<leader>w", "<cmd>w<cr>", desc = "💾 Save File", icon = "󰆓" },
  { "<leader>W", "<cmd>wa<cr>", desc = "Save All", icon = "󰆓" },
  { "<leader>q", "<cmd>q<cr>", desc = "Quit", icon = "󰩈" },                                                                                                 { "<leader>Q", "<cmd>qa!<cr>", desc = "Quit All (Force)", icon = "󰩈" },
})

-- ═══════════════════════════════════════════════════════════════
-- 💻 CODE CATEGORY - LSP & Coding Operations
-- ═══════════════════════════════════════════════════════════════
wk.add({
  { "<leader>l", group = "💻 LSP/Code", icon = "󰘦" },
  { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action", icon = "󰌵" },
  { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename", icon = "󰑕" },
  { "<leader>lf", "<cmd>lua vim.lsp.buf.format()<cr>", desc = "Format", icon = "󰉢" },
  { "<leader>ld", "<cmd>lua vim.lsp.buf.definition()<cr>", desc = "Go to Definition", icon = "󰳽" },
  { "<leader>lD", "<cmd>lua vim.lsp.buf.declaration()<cr>", desc = "Go to Declaration", icon = "󰳽" },
  { "<leader>li", "<cmd>lua vim.lsp.buf.implementation()<cr>", desc = "Implementation", icon = "󰳽" },
  { "<leader>lt", "<cmd>lua vim.lsp.buf.type_definition()<cr>", desc = "Type Definition", icon = "󰳽" },
  { "<leader>lR", "<cmd>lua vim.lsp.buf.references()<cr>", desc = "References", icon = "󰈇" },
  { "<leader>lh", "<cmd>lua vim.lsp.buf.hover()<cr>", desc = "Hover Doc", icon = "󰋼" },
  { "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<cr>", desc = "Signature Help", icon = "󰋼" },
  { "<leader>lw", group = "Workspace", icon = "󰉋" },
  { "<leader>lwa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>", desc = "Add Folder", icon = "󰉋" },
  { "<leader>lwr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>", desc = "Remove Folder", icon = "󰉋" },
  { "<leader>lwl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>", desc = "List Folders", icon = "󰉋" },
})

-- ═══════════════════════════════════════════════════════════════
-- 🐛 DEBUG CATEGORY - Debugging Operations
-- ═══════════════════════════════════════════════════════════════
wk.add({
  { "<leader>d", group = "🐛 Debug", icon = "󰃤" },
  { "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", desc = "Toggle Breakpoint", icon = "󰃤" },
  { "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", desc = "Continue", icon = "󰐊" },
  { "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", desc = "Step Into", icon = "󰆹" },
  { "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", desc = "Step Over", icon = "󰆸" },
  { "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", desc = "Step Out", icon = "󰆷" },
  { "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", desc = "Toggle REPL", icon = "󰞷" },
  { "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", desc = "Run Last", icon = "󰑮" },
  { "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", desc = "Toggle UI", icon = "󰕮" },
  { "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", desc = "Terminate", icon = "󰓛" },
})
-- ═══════════════════════════════════════════════════════════════
-- 📝 BUFFER CATEGORY - Buffer Management
-- ═══════════════════════════════════════════════════════════════
wk.add({
    { "<leader>b", group = "󰓩 Buffer" },  -- nf-md-tab
  { "<leader>bAD", "<cmd>%bd|e#|bd#<cr>", desc = "Delete All But Current", icon = "󰆴" },
  { "<leader>bn", "<cmd>bnext<cr>", desc = "Next Buffer", icon = "󰒭" },
  { "<leader>bp", "<cmd>bprevious<cr>", desc = "Previous Buffer", icon = "󰒮" },
  { "<leader>bf", "<cmd>bfirst<cr>", desc = "First Buffer", icon = "󰒮" },
  { "<leader>bl", "<cmd>blast<cr>", desc = "Last Buffer", icon = "󰒭" },
  { "<leader>bs", "<cmd>w<cr>", desc = "Save Buffer", icon = "󰆓" },
  { "<leader>bw", "<cmd>bwipeout<cr>", desc = "Wipeout Buffer", icon = "󰆴" },

  -- Buffer group

  -- Quick jump to buffers 1-9
  { "<leader>1", desc = "󰓩 Jump to buffer 1" },
  { "<leader>2", desc = "󰓩 Jump to buffer 2" },
  { "<leader>3", desc = "󰓩 Jump to buffer 3" },
  { "<leader>4", desc = "󰓩 Jump to buffer 4" },
  { "<leader>5", desc = "󰓩 Jump to buffer 5" },
  { "<leader>6", desc = "󰓩 Jump to buffer 6" },
  { "<leader>7", desc = "󰓩 Jump to buffer 7" },
  { "<leader>8", desc = "󰓩 Jump to buffer 8" },
  { "<leader>9", desc = "󰓩 Jump to buffer 9" },

  -- Cycle buffers
  { "<A-h>", desc = "󰁍 Previous buffer" },  -- nf-fa-arrow_left
  { "<A-l>", desc = "󰁔 Next buffer" },      -- nf-fa-arrow_right

  -- Buffer pickers
  { "<leader>bb", desc = "󰓩 Pick buffer to switch" },
  { "<leader>bp", desc = "󰓩 BufferLine pick (labels)" },
  { "<leader>bk", desc = "󰅙 Pick buffer to close" },   -- nf-fa-times_circle
  { "<leader>bc", desc = "󰅚 BufferLine pick close" },

  -- Close buffers
  { "<leader>bd", desc = "󰅚 Close current buffer" },
  { "<leader>bD", desc = "󰗖 Force close current buffer" }, -- nf-mdi-close_thick
  { "<leader>bh", desc = "󰅙 Close left buffers" },
  { "<leader>bl", desc = "󰅙 Close right buffers" },
  { "<leader>bo", desc = "󰅙 Close other buffers" },

  -- Move buffers
  { "<leader>b>", desc = "󰁔 Move buffer right" },
  { "<leader>b<", desc = "󰁍 Move buffer left" },

  -- Sort buffers
  { "<leader>bS", group = "󰒓 Sort buffers" }, -- nf-md-sort
  { "<leader>bSd", "<cmd>BufferLineSortByDirectory<cr>", desc = "󰉋 Sort by directory" },
  { "<leader>bSe", "<cmd>BufferLineSortByExtension<cr>", desc = "󰡛 Sort by extension" },
  { "<leader>bSr", "<cmd>BufferLineSortByRelativeDirectory<cr>", desc = "󰉓 Sort by relative dir" },
  { "<leader>bSt", "<cmd>BufferLineSortByTabs<cr>", desc = "󰓩 Sort by tabs" },

  -- Pin buffers
  { "<leader>bP", desc = "󰐃 Toggle pin buffer" }, -- nf-md-pin

  -- Buffer groups (v3 feature)
  { "<leader>bg", group = "󰓩 Buffer groups" },
  { "<leader>bgg", "<cmd>BufferLineGroupClose<cr>", desc = "󰅙 Close current group" },
  { "<leader>bgt", "<cmd>BufferLineGroupToggle<cr>", desc = "󰓩 Toggle group" },
  { "<leader>bgp", "<cmd>BufferLineGroupClose ungrouped<cr>", desc = "󰅙 Close ungrouped" },
  { "<leader>bgP", "<cmd>BufferLineGroupClose pinned<cr>", desc = "󰅙 Close pinned group" },

  -- Cycle through groups
  { "<leader>b[", "<cmd>BufferLineCyclePrev<cr>", desc = "󰁍 Cycle prev buffer" },
  { "<leader>b]", "<cmd>BufferLineCycleNext<cr>", desc = "󰁔 Cycle next buffer" },

  -- Go to buffer by position
  { "<leader>bj", "<cmd>BufferLineGoToBuffer 1<cr>", desc = "󰓩 Go to buffer 1" },
  { "<leader>bf", "<cmd>BufferLineGoToBuffer -1<cr>", desc = "󰓩 Go to last buffer" },
})

-- ═══════════════════════════════════════════════════════════════
-- 🪟 WINDOW CATEGORY - Window Management
-- ═══════════════════════════════════════════════════════════════
wk.add({
  { "<leader>v", group = "🪟 Window", icon = "󰖯" },
  { "<leader>vs", "<cmd>split<cr>", desc = "Horizontal Split", icon = "󰤼" },
  { "<leader>vv", "<cmd>vsplit<cr>", desc = "Vertical Split", icon = "󰤻" },
  { "<leader>vc", "<cmd>close<cr>", desc = "Close Window", icon = "󰖭" },
  { "<leader>vo", "<cmd>only<cr>", desc = "Close Other Windows", icon = "󰖯" },
  { "<leader>vh", "<C-w>h", desc = "Go Left", icon = "󰜱" },
  { "<leader>vj", "<C-w>j", desc = "Go Down", icon = "󰜮" },
  { "<leader>vk", "<C-w>k", desc = "Go Up", icon = "󰜷" },
  { "<leader>vl", "<C-w>l", desc = "Go Right", icon = "󰜴" },
  { "<leader>v=", "<C-w>=", desc = "Equal Size", icon = "󰖯" },
  { "<leader>v_", "<C-w>_", desc = "Maximize Height", icon = "󰖯" },
  { "<leader>v|", "<C-w>|", desc = "Maximize Width", icon = "󰖯" },
})

-- ═══════════════════════════════════════════════════════════════
-- 🌲 GIT CATEGORY - Git Operations (if using gitsigns/fugitive)
-- ═══════════════════════════════════════════════════════════════
wk.add({
  { "<leader>g", group = "🌲 Git", icon = "󰊢" },
  { "<leader>gs", "<cmd>Git status<cr>", desc = "Status", icon = "󰊢" },
  { "<leader>gc", "<cmd>Git commit<cr>", desc = "Commit", icon = "󰜘" },
  { "<leader>gp", "<cmd>Git push<cr>", desc = "Push", icon = "󰐖" },
  { "<leader>gP", "<cmd>Git pull<cr>", desc = "Pull", icon = "󰐗" },
  { "<leader>gb", "<cmd>Git blame<cr>", desc = "Blame", icon = "󰊢" },
  { "<leader>gd", "<cmd>Gitsigns diffthis<cr>", desc = "Diff", icon = "󰦓" },
  { "<leader>gl", "<cmd>Git log<cr>", desc = "Log", icon = "󰦪" },
  { "<leader>gh", group = "Hunk", icon = "󰊢" },
  { "<leader>ghs", "<cmd>Gitsigns stage_hunk<cr>", desc = "Stage Hunk", icon = "󰐖" },
  { "<leader>ghr", "<cmd>Gitsigns reset_hunk<cr>", desc = "Reset Hunk", icon = "󰦓" },
  { "<leader>ghu", "<cmd>Gitsigns undo_stage_hunk<cr>", desc = "Undo Stage", icon = "󰕌" },
  { "<leader>ghp", "<cmd>Gitsigns preview_hunk<cr>", desc = "Preview Hunk", icon = "󰋼" },
  { "<leader>ghn", "<cmd>Gitsigns next_hunk<cr>", desc = "Next Hunk", icon = "󰒭" },
  { "<leader>ghN", "<cmd>Gitsigns prev_hunk<cr>", desc = "Previous Hunk", icon = "󰒮" },
})

-- ═══════════════════════════════════════════════════════════════
-- 📦 TAB CATEGORY - Tab Management
-- ═══════════════════════════════════════════════════════════════
wk.add({
  { "<leader>t", group = "📦 Tab", icon = "󰓩" },
  { "<leader>tn", "<cmd>tabnew<cr>", desc = "New Tab", icon = "󰓩" },
  { "<leader>tc", "<cmd>tabclose<cr>", desc = "Close Tab", icon = "󰅖" },
  { "<leader>to", "<cmd>tabonly<cr>", desc = "Close Other Tabs", icon = "󰓩" },
  { "<leader>t]", "<cmd>tabnext<cr>", desc = "Next Tab", icon = "󰒭" },
  { "<leader>t[", "<cmd>tabprevious<cr>", desc = "Previous Tab", icon = "󰒮" },
  { "<leader>tf", "<cmd>tabfirst<cr>", desc = "First Tab", icon = "󰒮" },
  { "<leader>tl", "<cmd>tablast<cr>", desc = "Last Tab", icon = "󰒭" },
})

-- ═══════════════════════════════════════════════════════════════
-- 🔧 TERMINAL CATEGORY - Terminal Operations
-- ═══════════════════════════════════════════════════════════════
wk.add({
  { "<leader>T", group = "🔧 Terminal", icon = "󰆍" },
  { "<leader>Tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Float Terminal", icon = "󰆍" },
  { "<leader>Th", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "Horizontal Terminal", icon = "󰆍" },
  { "<leader>Tv", "<cmd>ToggleTerm direction=vertical<cr>", desc = "Vertical Terminal", icon = "󰆍" },
  { "<leader>Tt", "<cmd>ToggleTerm direction=tab<cr>", desc = "Tab Terminal", icon = "󰆍" },
})

-- ═══════════════════════════════════════════════════════════════
-- 🎨 UI CATEGORY - UI Toggles & Utilities
-- ═══════════════════════════════════════════════════════════════
wk.add({
  { "<leader>u", group = "🎨 UI", icon = "󰙵" },
  { "<leader>un", "<cmd>set number!<cr>", desc = "Toggle Line Numbers", icon = "󰔡" },
  { "<leader>ur", "<cmd>set relativenumber!<cr>", desc = "Toggle Relative Numbers", icon = "󰔡" },
  { "<leader>us", "<cmd>set spell!<cr>", desc = "Toggle Spell Check", icon = "󰓆" },
  { "<leader>uw", "<cmd>set wrap!<cr>", desc = "Toggle Line Wrap", icon = "󰖶" },
  { "<leader>uc", "<cmd>set cursorline!<cr>", desc = "Toggle Cursor Line", icon = "󰞽" },
  { "<leader>uh", "<cmd>nohlsearch<cr>", desc = "Clear Highlights", icon = "󰹐" },
  { "<leader>uz", "<cmd>ZenMode<cr>", desc = "Zen Mode", icon = "󰰶" },
  { "<leader>ut", "<cmd>Twilight<cr>", desc = "Twilight", icon = "󰛨" },
  { "<leader>ui", "<cmd>IndentBlanklineToggle<cr>", desc = "Toggle Indent Lines", icon = "󰞓" },
  { "<leader>ue", "<cmd>NvimTreeToggle<cr>", desc = "Toggle Explorer", icon = "󰙅" },
  { "<leader>um", "<cmd>MinimapToggle<cr>", desc = "Toggle Minimap", icon = "󰘎" },
})

-- ═══════════════════════════════════════════════════════════════
-- 🔎 SEARCH/REPLACE CATEGORY
-- ═══════════════════════════════════════════════════════════════
wk.add({
  { "<leader>s", group = "🔎 Search/Replace", icon = "󰬶" },
  { "<leader>ss", "<cmd>Telescope live_grep<cr>", desc = "Search Text", icon = "󰬶" },
  { "<leader>sr", ":%s/\\<<C-r><C-w>\\>//g<Left><Left>", desc = "Replace Word", icon = "󰛔" },
  { "<leader>sR", ":%s//g<Left><Left>", desc = "Replace All", icon = "󰛔" },
  { "<leader>sf", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Find in Buffer", icon = "󰬶" },
})

-- ═══════════════════════════════════════════════════════════════
-- 📋 SESSION CATEGORY - Session Management
-- ═══════════════════════════════════════════════════════════════
wk.add({
  { "<leader>S", group = "📋 Session", icon = "󰆔" },
  { "<leader>Ss", "<cmd>SessionSave<cr>", desc = "Save Session", icon = "󰆓" },
  { "<leader>Sl", "<cmd>SessionLoad<cr>", desc = "Load Session", icon = "󰑐" },
  { "<leader>Sd", "<cmd>SessionDelete<cr>", desc = "Delete Session", icon = "󰆴" },
  { "<leader>Sr", "<cmd>SessionRestore<cr>", desc = "Restore Session", icon = "󰦛" },
})

-- ═══════════════════════════════════════════════════════════════
-- 🎯 MISCELLANEOUS CATEGORY
-- ═══════════════════════════════════════════════════════════════
wk.add({
  { "<leader>m", group = "🎯 Misc", icon = "󰘵" },
  { "<leader>mn", "<cmd>enew<cr>", desc = "New File", icon = "󰈔" },
  { "<leader>my", "<cmd>%y+<cr>", desc = "Yank All", icon = "󰆏" },
  { "<leader>mp", '"+p', desc = "Paste from Clipboard", icon = "󰆒" },
  { "<leader>mP", '"+P', desc = "Paste Before from Clipboard", icon = "󰆒" },
  { "<leader>mc", "<cmd>cd %:p:h<cr>", desc = "CD to File Dir", icon = "󰉋" },
  { "<leader>ml", "<cmd>Lazy<cr>", desc = "Lazy Plugin Manager", icon = "󰏖" },
  { "<leader>mm", "<cmd>messages<cr>", desc = "Show Messages", icon = "󰍡" },
  { "<leader>mh", "<cmd>Telescope notify<cr>", desc = "Notification History", icon = "󰍡" },
})


###### I know That this all ia Pain to do and Impossible for a human 





