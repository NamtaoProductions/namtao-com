---
{"dg-publish":true,"permalink":"/conflicted-oxidise-your-cli-2025-tris-oaten-s-conflicted-copy-2025-05-16/","hide":true,"tags":["project"],"noteIcon":""}
---



Oxidise Your CLI 2
===

There is a [^1] footnote here [^2]





 

Hi folks,
It's been a bit over 2 years since my [Oxidise your Command Line](https://youtu.be/dFkGNe4oaKk) video, and a few people have asked for updates over the years, so here it is!




# Standard Tools





 
> The tools I've replaced with modern oxidised versions

UUTILS COREUTILS
===

> All gnu coreutils rewritten in rust

Config:
```bash
alias ls="coreutils ls"
```

```bash +exec_replace
echo ""
cd ~/projects/Decapsulate-com/
echo "> coreutils ls"
coreutils ls
echo ""
```




 

- A REPLACEMENT FOR ALL GNU COREUTILS
- Using the nixos `uutils-coreutils-noprefix` package, all gnu coreutils are swapped out for aliases to uutils' version
- If you're on any other operating system - INCLUDING WINDOWS - you can grab the binary from https://github.com/uutils/coreutils or find it packaged for your package manager
- Only do this if you want to be the life of every party

Fish
===

> Finally, a `sh`ell for the 90s!

```bash
tris@pc~> cd projects/Decapsulate-com/

tris@pc ~/p/Decapsulate-com (main)> ls

CODE_OF_CONDUCT.md  Cargo.toml  README.md  docs/      src/
Cargo.lock LICENSE  decapsulate-feed.xml   episodes/  target/
```

```bash
tris@pc ~/p/Decapsulate-com (main)> ls ^R

search:             
► ls  ► cd projects/Decapsulate-com/
```




 

- The Rust rewrite finished in February! https://fishshell.com/blog/new-in-40/)
- though a non-standard shell (you wouldn't write shell scripts in it), it's lovely for interactive use
- batteries included, even a web-based theme chooser
- I love fish because I install, and everything is right out of the box
- The way I think about shells is that zsh is bash with plugins, and fish is zsh with plugins.

Nushell
===

> A new type of `sh`ell

```sh +exec_replace
cd ~/projects/Decapsulate-com/
echo ""
echo "> unam   # typo"
nu -c unam
echo "> uname"
nu -c uname
echo ""
```




 

- Honourable mention: Nushell, a pure rust radical take on what a shell can do
- `--colo[u]r-scale-mode`

Ripgrep
===

> Recursively searches for a regex while respecting your `.gitignore`

```bash +exec_replace
echo ""
cd ~/projects/Decapsulate-com/
echo "> rg --type=rust fn"
echo ""
rg --type=rust --color=always fn
echo ""
```




 

- the first rust program I ever knowingly used, I think!
- the fastest grepper in town
- has a smart defaults that ignore many files we aren't usually concerned with, even reads the .gitignore file to do so
- searches 600GB in 1 minute even on my mid-tier thinkpad, only double what du did

Fd
===

> A simple, fast and user-friendly alternative to `find`

```bash +exec_replace
echo ""
cd ~/projects/Decapsulate-com/
echo "> fd .rs"
echo ""
fd .rs --color=always

echo ""
echo "> fd -e .rs -x wc"
echo ""
fd -e .rs -x wc
echo ""
```




- a fast, pretty, drop-in replacement for find

BAT
===

> The `cat` with wings!

```bash +exec_replace
echo ""
cd ~/projects/Decapsulate-com/
echo "> bat  --line-range 0:4 Cargo.toml"
echo ""
bat --color always --line-range 0:4 Cargo.toml
echo ""
```




 
- the cat with wings!
- beautiful syntax highlighting of basically every file type

EZA
===

> A modern replacement for `ls`

```bash +exec_replace
echo ""
cd ~/projects/Decapsulate-com/
echo "> eza -l --icons --time-style=long-iso --group-directories-first"
echo ""
eza --time-style=long-iso --group-directories-first --icons -l --color=always
echo ""
```




 
- Alias `ls=eza` and you get a drop-in replacement that supports colours and git status
- fork of exa, which stopped being developed in 2021

ZOXIDE
===

> A smarter `cd` command for your terminal

Config:
```bash
zoxide init fish | source
```

Usage:
```bash +exec_replace
echo ""
echo "> pwd"
echo "/home/tris"
echo ""
echo "> cd lua"
echo "> pwd"
echo ".config/nvim/lua"
echo ""
```




 

- Add it to your shell config (this is fish, all other shells work)
- Then start jumping to previously used by relative path:
- Zoxide knows where you've been, so instead of typing `cd .config/nvim/lua/` you can type `cd lua` from anywhere and it'll usually do what you want!

XH
===

> Friendly and fast tool for sending HTTP requests. (inspired by `httpie`)

```bash +exec_replace
echo ""
echo "> xh httpbin.org/get --pretty=all"
echo ""
xh httpbin.org/get --pretty=all
echo ""
```




 
- A simpler interface than curl
- with pretty-printed output
- a rust rewrite of the excellent httpie, which I used for years in my Python era

ZELLIJ
===

> A terminal workspace with batteries included. (`tmux` alternative)

![](/img/user/Resources/Meta/attachments/zellij-screenshot-two-panes.png)




 
- tmux/screen replacement
- great defaults, great UI, great plugin community

GITUI
===

> blazing fast terminal-ui for `git`

![](/img/user/Resources/Meta/attachments/gitui-staged-changes-screenshot.png)




 
- nice rust port of lazygit (go), which is also a great option

DU-DUST
===

> A more intuitive version of `du`

```bash +exec_replace
echo ""
cd ~/projects/Decapsulate-com/
echo "> dust"
echo ""
dust -Cin 9
echo ""
```




 
- graphical disk usage analyser
- On my machine, 600GB analysed in 2 seconds, compared to 30 for du

DUA
===

> XXX

```bash +exec_replace
echo ""
cd ~/projects/Decapsulate-com/
echo "> dua"
echo ""
dua
echo ""
```




 
- graphical disk usage analyser
- On my machine, 600GB analysed in 2 seconds, compared to 30 for du

Non-standard Tools
===

> I recommend these to anyone because they're COOL and they'll make your life more joyful!

STARSHIP.RS
===

> The minimal, blazing-fast, and infinitely customizable prompt for any `sh`ell

```bash +exec_replace
cd ~/projects/Decapsulate-com/
starship prompt
echo "ls"
ls --color=always --group-directories-first
echo ""

```




 
- A really fast informative shell prompt, works with all shells

YAZI
===

> XXX

```bash +exec_replace
date
```




 

- a command-line file manager, like the venerable Ranger
- fast, backgrounds long operations (like copying large files)
- vim bindings
- and FILE PREVIEW for images, pdfs, and many more (if used with modern terminals like kitty or ghostty, or fairly modern terminals like alacritty or wez)

HYPERFINE
===

> A command-line benchmarking tool

```bash +exec_replace
echo ""
cd ~/projects/Decapsulate-com/
echo '> hyperfine "cargo build"'
echo ""
hyperfine --warmup=1 -r 3 --style=color "cargo build"
echo ""
```




 

- fasterthanlime lived up to their name when they recommended this to me
- It's a very clever command line benchmarking tool, built by people who understand statistics
- it runs the command a sensible number of times to eliminate run-to-run variance, with an initial discarded run to warm up any caches

EVIL-HELIX
===

> TODO

![](/img/user/Resources/Meta/attachments/screenshot-evil-helix-tokyonight.png)

Rust lsp auto-configured, lsp code action triggered, tokyonight theme



demo
 
- helix is a batteries-included text editor in a single binary
- It's got built-in LSP, tree-sitter syntax highlighting, fuzzy finder, and beautiful themes.
- it's a modal editor like vim, but its motions are kindof backwards compared to what we're used to, specifically it uses the selection->action model, so it's word delete, rather than delete word.
- Though I agree that vim has the motions kindof backwards, if you think about it, all of my programs have vim bindings, such as my video editor and browser, so for me, practicality beats purity.
- Evil helix a fork of helix mostly putting the keyboard bindings back to the standard vim way
- I keep it around for when I break my vim config...

BACON
===

> TODO

![](/img/user/Resources/Meta/attachments/screenshot-bacon-clippy-warnings-2025.png)




 
The rust compiler output is better than your editor's output.

CARGO-INFO
===

> TODO

```bash +exec_replace
echo ""
echo "> cargo info rayon"
echo ""
cargo info rayon --color=always
echo ""
```




 
I spend my whole life trying to avoid opening a web browser, and cargo-info helps me!

FSELECT
===

> TODO

```bash +exec_replace
echo ""
cd ~/projects/Decapsulate-com/
echo '> fselect "select name where size > 100000"'
echo ""
fselect "select name where size > 100000"
echo ""
```




 

NCSPOT
===

> TODO

```bash +exec_replace
date
```




 

RUSTY-MAN
===

> TODO



 ```bash +exec_replace
echo ""
echo "> rusty-man std::thread"
echo ""
rusty-man std::thread --viewer=rich --width=30
echo ""
```


 ```bash +exec_replace
echo ""
echo "> rusty-man -e std::thread"
echo ""
rusty-man -e std::thread --viewer=rich --width=30
echo ""
```






 

DELTA
===

> TODO

```bash +exec_replace
echo ""
cd ~/projects/Decapsulate-com/
echo '> delta README.md README-duplicate.md'
delta README.md README-duplicate.md
echo ""
```




 

RIPGREP-ALL
===

```bash +exec_replace
echo ""
cd ~/projects/Decapsulate-com/
echo 'rga river ~/Dropbox/Books/A\ Kiss\ Of\ Salt\ And\ Silt.epub'
echo ""
rga --color=always river ~/Dropbox/Books/A\ Kiss\ Of\ Salt\ And\ Silt.epub | head -n3
echo ""
```




 

TOKEI
===

> Count your code, quickly

```bash +exec_replace
echo ""
cd ~/projects/Decapsulate-com/
echo '> tokei'
echo ""
tokei
echo ""
```




 

---
# Footnotes

[^1]: Here are some extra information in a footnote
[^2]: Here are some extra information in a footnote2

---

 