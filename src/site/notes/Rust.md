---
{"dg-publish":true,"permalink":"/rust/","noteIcon":""}
---


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

```sh
cargo clippy -- -D clippy::pedantic -D clippy::nursery
```

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