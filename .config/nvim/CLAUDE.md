# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a Neovim configuration using **Neovim's native package manager** (`vim.pack`, introduced in Neovim 0.11+) and **native LSP** (`vim.lsp.enable()`). There are no third-party plugin managers (no lazy.nvim, packer, etc.) and no nvim-lspconfig.

## Directory Structure

- `init.lua` — Entry point: loads `lua/` modules and calls `vim.lsp.enable()` with a list of servers
- `lua/` — Core config modules, each `require()`d explicitly from `init.lua`
- `lsp/` — One file per LSP server; each returns a config table consumed by `vim.lsp.enable()`
- `plugin/` — Auto-sourced by Neovim on startup (no explicit `require()` needed); used for plugin setup and colorscheme

## Adding / Modifying Plugins

Plugins are declared with `vim.pack.add({ "https://github.com/..." })` in `plugin/utils.lua` (for utilities) or `plugin/colorscheme.lua` (for the theme). After adding a plugin, run `:PackUpdate` inside Neovim to install it. Lock file is `nvim-pack-lock.json`.

Two built-in packs are loaded via `vim.cmd("packadd ...")`: `nvim.undotree` and `nvim.difftool`.

## Adding a New LSP Server

1. Create `lsp/<servername>.lua` returning a config table (see existing files for examples)
2. Add the server name to the `vim.lsp.enable({...})` list in `init.lua`

The `lua/lsp.lua` file is intentionally empty — LSP attachment/keymaps are handled globally by Neovim's default LSP behavior.

## Key Plugins and Their Keymaps

| Plugin | Keymap |
|---|---|
| oil.nvim (file explorer) | `-` |
| fzf-lua files | `<leader>f` |
| fzf-lua global search | `<leader>e` |
| fzf-lua resume | `<leader>rr` |
| fzf-lua LSP symbols | `<leader>s` |
| smart-splits resize | `<A-h/j/k/l>` |
| LSP expand selection | `<C-Space>` / `<BS>` |
| ToggleTerm | `<C-t>` |

## Notable Keymap Remaps

- Leader: `<Space>`
- `jk` → `<Esc>` in insert mode
- `<Enter>` → `ciw` (change inner word) in normal/visual
- `H` / `L` → `^` / `g_` (line start/end)
- `j` / `k` → `gj` / `gk` (visual line movement)
- `U` → `<C-r>` (redo)
- `x` → black-hole delete (doesn't overwrite register)
- `<leader>p` → previous buffer

## Active LSP Servers

- `lua_ls` — Lua (lua-language-server)
- `ty` — Python type checking (Astral `ty`)
- `ruff` — Python linting/formatting
- `clangd` — C/C++/CUDA
- `yamlls` — YAML

## Diagnostics

Configured in `lua/diagnostics.lua`. Virtual text and virtual lines are both **disabled**; diagnostics appear only in the sign column (number highlight) and via float on demand.
