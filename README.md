# ibus-switcher.nvim

This plugin switch IM engine automatically when you leave insert mode, helping
you input in Neovim.

## The Problem

While using an IME on a keyboard-driven editor such as Neovim, it's inconvenient
to manually switch to a English IME or so-called ASCII mode.

## Limitation

Key bindings under insert mode aren't available.  For example, many people use
`jk` to exit insert mode, but the `jk` will still be sent to IME.

## Installation

With [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
{
    "lumynou5/ibus-switcher.nvim",
    config = true,
}
```

## Configuration

This is the default configuration:

```lua
{
	-- The engine to be used under normal mode.
	normal_engine = "xkb:us::eng",
	-- The engine to be automatically switched to when enters insert mode.
	default_engine = "xkb:us::eng",
	-- Memorize the last active engine under insert mode if `true`,
    -- overrides the default engine.
	enable_memory = true,
}
```

You can get the name of engine you're using by `ibus engine` command.
