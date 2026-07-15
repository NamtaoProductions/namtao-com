---
{"dg-publish":true,"permalink":"/rust/","noteIcon":"","updated":"2026-07-15T07:26:55.191+01:00","dg-note-properties":{"up":["[[No Boilerplate Home]]"]}}
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

And I dig running tests with https://nexte.st/
## Strict Lints

> These lints do two things:
> 1. Teach you rust
> 2. Stop panics at runtime
> Run them with `bacon clippy`.
> If you're wondering how to prototype code quickly using `.unwrap()` and friends - put them in unit tests, clippy ignores those!

```toml
[lints.clippy]
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

I also dig what is written here: https://emschwartz.me/your-clippy-config-should-be-stricter/
## Rust Devenv

> Here's a reasonable [devenv.nix](https://devenv.sh)

```js
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

Then add oxalica's rust-overlay with:

```sh
devenv inputs add rust-overlay github:oxalica/rust-overlay --follows nixpkgs
```

## Typestate Pattern

> The typestate pattern is an API design pattern that encodes information about an object's run-time state in its compile-time type.

I maintain the best example of this pattern here: https://github.com/0atman/typestate-template

```rust
//NOTE: This is psudocode, read the repo for working code

// States
struct Red;
struct Yellow;
struct Green;

// a trait for all valid states
trait SignalState {}
impl SignalState for Red {}
impl SignalState for Yellow {}
impl SignalState for Green {}

// Core state struct
struct TrafficSignal<S: SignalState> {
    _marker: PhantomData<S>,
    data: String,
}

// Methods only available in the Red state
impl TrafficSignal<Red> {
    pub fn next(self) -> TrafficSignal<Green> {
        TrafficSignal::transition(self)
    }
}
```

## Rust Function Signatures

> Are complex, but they can be understood through thorougher thought though.

From [`nom::combinator`](https://docs.rs/nom/latest/src/nom/combinator/mod.rs.html#801-808)

```rust
pub fn cut<I, E: ParseError<I>, F>(parser: F) 
-> impl Parser<I, Output = <F as Parser<I>>::Output, Error = E>
where
  F: Parser<I, Error = E>,
{
  Cut { parser }
}
```
 ---
```rust
fn walk_pet<W: Walk>(pet: &mut W) {
    pet.walk();
}
```
is equivalant to
```rust
fn walk_pet<W>(pet: &mut W)
where W: Walk {
    pet.walk();
}
```

Good stuff here: https://github.com/pretzelhammer/rust-blog/blob/master/posts/tour-of-rusts-standard-library-traits.md#scope
