# `dotfiles`

This is a hosted version of my typical configuration for development
environments. It is built on some opinionated ideals for software and very
particular choices of tools. Plus, sharing configuration with over developers
and potentially inspiring them with new ideas sparks joy.

## Core Components

### Shell: `fish`

I was a long-time proponent of `bash` for its rugged stability and its utter
ubiquity across almost all \*nix systems. However, at some point during 2024, I
decided to give `fish` a try. I appreciated its batteries-included approach to
many of the features that I wanted: rich auto-completions based on command
history, syntax highlighting on the input line, etc. I made my switch long-term,
and now it's effectively permanent.

### Editor: `nvim`

I began using `vim` when I was in college. Some employers encouraged me to make
use of IntelliJ for brief stints as a Java IDE (which I did). However, the need
to make use of a keyboard-focused editor reared its head in my early 30s as the
strain of a decade of development work began to take its toll on my wrists.
Luckily, Neovim had already come onto the scene by that point, and Microsoft and
the open source community had poured endless dollars and man-hours into building
these fancy Language Servers to make the transition effectively seamless.

I favor building my configuration on top of [`LazyVim`][lazyvim] because, well,
I am lazy. :) This doesn't come without headaches; updates to the framework
occasionally break my workflow or force me to re-examine my configuration, but I
find that the experience is overall a net positive compared to spinning it all
from scratch.

### Terminal Emulator: `kitty`

I've used countless terminal emulators over the years and have never found
myself strongly tied to any of them. `kitty` is my current choice because I put
a high valuation on personalizing my working environment by easily-replicable
configuration. `kitty` has no competition as a terminal emulator in this regard;
no other offering is as powerful, fast, modular, and seamless to work with.

Historically, I've leaned on `tmux` as a multiplexer. However, recently I've
been attempting to break this dependency due to some perceived performance
issues with startup of new terminals. Luckily, `kitty` comes with built-in
multiplexing features. As such, I've started using `kitty` itself as my
multiplexer, implementing some `tmux`-like features on top of it with my
preferred keybinds for splits, layout management, and integration with `nvim`.

### Environment Management: `mise`

Lately, I've been replacing individual tools for managing versioned toolchains
for Ruby, Python, Node, and Java with `mise` as a single drop-in. I am still
quite new to `mise` and have yet to fully explore some of its more powerful
features as a task runner, but the promises are exciting and the interfaces are
beautiful.

### Modern Core Utilities

- `bat` - A drop-in replacement for `cat` and `less` with syntax-highlighting
  and pagination. I also have it configured as the pager for `man` and `git`.
- `eza` - Replaces `ls`. Includes some additional features such as automatic
  coloring and icon-assignments, etc.
- `ripgrep` - Replaces `grep`, and includes some additional features such as
  automatic file-ignores based on version control. The automatic directory
  recursion was what convinced me at first, and I've only found more things to
  like about it.
- `z` - Replaces `cd`, somewhat. I use this to quickly jump around through
  commonly-accessed directories using simple keywords. Specifically, I use [this
  reimplementation][fish-z] of it as a `fish` plugin.

[fish-z]: https://github.com/jethrokuan/z
[lazyvim]: https://github.com/LazyVim/LazyVim

## Linux-Specific

### Wayland Compositor: `niri`

I'm trying out `niri` this year as a scrolling compositor.

Some additional dotfiles for my specific desktop environment are included for:

- `fontconfig` - Default system fonts
- `noctalia` - My `quickshell` implementation
- `wallpaper` - Just my wallpaper 😁
