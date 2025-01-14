#!/usr/bin/env -S sh -c "mask serve || echo 'Installing mask...' && cargo install -q --all-features mask && mask serve"
# Site Build instructions

This markdown file is in [mask](https://lib.rs/crates/mask) format, all commands are defined here.
Execute this file to get the deps and run the server (yes literally `./maskfile.md`, trust me, unix is magic)

> [!INFO] Usage
> You may install `mask` from your system packages, alternatively, if you have the rust package manager, `cargo`, mask will be installed from source on first run)


## build
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

