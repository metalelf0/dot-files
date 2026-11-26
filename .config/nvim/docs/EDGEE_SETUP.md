# CodeCompanion.nvim + Edgee Setup

## Installation

CodeCompanion plugin configured with Edgee adapter. Credentials auto-loaded from `~/.config/edgee/credentials.toml` (created by `edgee` CLI).

### 1. Install Edgee CLI (if not already)
```bash
brew install edgee-ai/tap/edgee
edgee login
```

This creates `~/.config/edgee/credentials.toml` with your API key.

### 2. Start using CodeCompanion

Run nvim:
```bash
nvim
```

Command:
```vim
:CodeCompanionChat
```

Select `edgee` as adapter when prompted.

### 3. Optional: Set as default adapter

In `lua/user/plugins/code-companion.lua`:
```lua
strategies = {
  chat = "edgee",
  inline = "edgee",
}
```

## Files Modified

- `lua/user/plugins/code-companion.lua` — Edgee adapter config
- `lua/user/plugins/edgee-setup.lua` — Parse credentials.toml
- `init.lua` — Load edgee-setup before lazy

## Usage

```vim
:CodeCompanionChat       " Open chat
:CodeCompanionInline     " Inline completion
```

Add keymaps to `lua/user/keymaps.lua`:
```lua
vim.keymap.set("n", "<leader>Ac", "<cmd>CodeCompanionChat<cr>")
vim.keymap.set("n", "<leader>Ai", "<cmd>CodeCompanionInline<cr>")
```

## Troubleshooting

**Credentials not found:**
```bash
cat ~/.config/edgee/credentials.toml
```

If missing, run `edgee login`.

**Check env vars loaded in nvim:**
```vim
:echo vim.env.EDGEE_API_KEY
```

**Enable debug logs:**
In `code-companion.lua`:
```lua
opts = {
  log_level = "DEBUG",
}
```

Check logs:
```bash
tail -f ~/.local/share/nvim/CodeCompanion.log
```

**Model unavailable:**
Verify available models in your Edgee account:
```bash
edgee models list
```

Change default in `code-companion.lua` `schema.model.default`.

