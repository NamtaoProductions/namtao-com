# MOC Navigation

An alternative navigation for [Digital Garden](https://github.com/oleeskild/digitalgarden) sites: instead of a folder tree, the sidebar becomes a **Map of Content** grown from your home note's links. Notes your home note links to become sections; their links become children. Rearrange your navigation by editing links in Obsidian — no configuration.

## Install

Paste this repo's URL into **Settings → Digital Garden → Plugins → Install from GitHub**, then disable the built-in `dg-filetree` plugin — only one navigation can be active, and the built-in one wins while enabled.

## How it works

Claims the `navigation` region and reads the site's core link graph. Honors the same `dgShowFileTree` flag as the built-in file tree (off = plain navbar), and supports the standard `navbar.actions` / `filetree.actions` slots, so search keeps its place.

## Settings

- **Sidebar heading** — the label above the map (default "Map of Content")
