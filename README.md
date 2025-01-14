#!/usr/bin/env -S sh -c "mask --maskfile README.md serve || echo 'Installing mask...' && cargo install -q --all-features mask && mask --maskfile README.md serve"

# Hi folks, I'm Tris 👋
> I'm a producer, web developer, and musician based in London. I write electronic music, fast technical videos, and audio drama podcasts.

# 📔 Check out [namtao.com](https://www.namtao.com) for all my Projects! (or read on...)


# Site Build instructions

This markdown file is in [mask](https://lib.rs/crates/mask) format, all commands are defined here.
Execute this readme to get the deps and run the server (yes literally `./readme.md`, trust me, unix is magic)

> [!INFO] Usage
> You may install `mask` from your system packages, alternatively, if you have the rust package manager, `cargo`, mask will be installed from source on first run)


## Build
> builds all md files into html
```sh
npx quartz build -d src/site/notes/
```

## moveassets
> Images and other assets are put in a quartz-inaccessible folder by the Digital Garden plugin, this moves them back
```sh
cp -r src/site/img/user/* src/site/notes/
```

## serve
> starts a auto-reloading local quartz server
```sh
	npx quartz build -d src/site/notes/ --serve --port 3010
```
## install
> First-time install for Quartz
```sh
	npm i
```

