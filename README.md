# `dotfiles`

This is a hosted version of my typical configuration for development
environments. It is built on some opinionated ideals for software and very
particular choices of tools. Plus, sharing configuration with over developers
and potentially inspiring them with new ideas sparks joy.

## Core Utilities

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
myself strongly tied to any of them. `kitty` just happens to be the one that I
currently use.

I am curious about `wezterm`, but have not had time to spin up configuration and
integrate it into my usual workflow.

### Multiplexer: `tmux`

It comes on every server, and is functionally ubiquitous in the \*nix world. I
can't live without it (at least until I eventually spin up `wezterm`).

[lazyvim]: https://github.com/LazyVim/LazyVim

## Linux-Specific

### Wayland Compositor: `hyprland`

I started using this when I spun up an Arch machine and haven't found a strong
reason to switch to a different compositor.
