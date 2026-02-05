---
{"dg-publish":true,"permalink":"/rust/","noteIcon":""}
---

## My Standard Library
```toml
[dependencies]
# COMMAND LINE PARSING
clap = { version = "4.5.53", features = ["derive"] }
# ERGONOMIC DATETIMES
chrono = "0.4.42"
# SIMPLE PRETTY ERROR HANDLING
color-eyre = "0.6.5"
# BENCHMARKING
criterion = "0.8.1"
# SUPERPOWERED ITERATORS
itertools = "0.14.0"
# PARALELL ITERATORS
rayon = "1.11.0"
# SERIALISATION / DESERIALISATION
serde = { version = "*", features = ["derive"] }
```

## Strict Lints

> These lints do two things:
> 1. Teach you rust
> 2. Stop panics at runtime
> Run them with `bacon clippy`.
> If you're wondering how to prototype code quickly using `.unwrap()` and friends - put them in unit tests, clippy ignores those!

```toml
# UM, ACTUALLY
pedantic = { level = "deny", priority = -1 }
# DEVELOPING LINTS
nursery = { level = "deny", priority = -1 }
# DENY PANICS
unwrap_used = "deny"
expect_used = "deny"
indexing_slicing = "deny"
arithmetic_side_effects = "deny"
unreachable = "deny"
unimplemented = "deny"
unchecked_time_subtraction = "deny"
todo = "deny"
string_slice = "deny"
panic_in_result_fn = "deny"
panic = "deny"
exit = "deny"
as_conversions = "deny"
```

Also here's an 80% of the above as a one-liner:
```sh
cargo clippy -- -D clippy::pedantic -D clippy::nursery
```

## Rust Devenv

> Here's a reasonable [devenv.nix](https://devenv.sh)

```python
{ pkgs, lib, config, ... }:

{
  languages.rust = {
    enable = true;
    channel = "nightly";
    components = [ "rustc" "cargo" "clippy" "rustfmt" "rust-analyzer" ];
  };

  packages = with pkgs; [
    openssl
  ];

  scripts.watcher= {
    exec = ''
      RUSTFLAGS=-Awarnings watchexec -r --clear=reset -e rs --wrap-process=none "cargo run -q"
    '';
    packages = [ pkgs.watchexec ];
    description = "Rebuilds and runs app with supressed warnings";
  };

  # 
  # C LIBRARIES
  #
  # env.LD_LIBRARY_PATH = lib.makeLibraryPath [
  #   pkgs.zlib
  # ];
}

```
