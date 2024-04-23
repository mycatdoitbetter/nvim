-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local discipline = require("craftzdog.discipline")
discipline.cowboy()

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

local discipline = require("craftzdog.discipline")

discipline.cowboy()

-- Open terminal using toggleterm split horizontal and vertical
keymap.set("n", "<S-t>", "<cmd>ToggleTerm<cr>", opts)

-- Delete a word backwards
keymap.set("n", "dw", 'vb"_d')

-- TSToolsOrganiz:e imports, remove unused imporsts etc.
keymap.set("n", "<C-A-o>", "<cmd>TSToolsRemoveUnusedImports<cr>", opts)

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")
keymap.set("n", "te", ":tabedit")

-- Map tab movements with Tab key
keymap.set("n", "<Tab>", "[b", opts)
keymap.set("n", "<S-Tab>", "]b", opts)

-- Copy line down and up
keymap.set("n", "<A-S-Down>", "yyp", opts)
keymap.set("n", "<A-S-Up>", "yykp", opts)

-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)
-- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")
-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")

keymap.set("n", "<C-w><down>", "<C-w>-")
keymap.set({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w | PrettierAsync<cr><esc>", { desc = "Save file" })

return {
  {
    "rest-nvim/rest.nvim",
    opts = {
      servers = {
        tsserver = {
          keys = {
            { "<leader>ht", "<Plug>RestNvim", desc = "Organize Imports" },
          },
        },
      },
    },
  },
}
