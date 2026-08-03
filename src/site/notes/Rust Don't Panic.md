---
{"dg-publish":true,"dg-path":"rust-dont-panic","permalink":"/rust-dont-panic/","tags":["project/nb"],"noteIcon":"","updated":"2026-08-03T20:47:25.244+01:00","dg-note-properties":{"start":"2026-06-30","due":"2026-07-31","up":["[[No Boilerplate Index]]"],"tags":["project/nb"],"state":"promoting"}}
---



<div style="position: relative; padding-top: 56.25%;"><iframe title="Rust: Don't Panic" width="100%" height="100%" src="https://makertube.net/videos/embed/sPBJihWsLmkDiNoEsHNoxw?warningTitle=0" style="border: 0px; position: absolute; inset: 0px;" allow="fullscreen" sandbox="allow-same-origin allow-scripts allow-popups allow-forms"></iframe></div>



## THE MISTAKE

```rust
let (feature_values, _) = features
    .append_with_names(&self.config.feature_names)
    .unwrap();
```

-- [Cloudflare](blog.cloudflare.com/18-november-2025-outage/)



 
Hi friends my name is Tris and this is No Boilerplate, where I focus on fast, technical videos.

4 years ago, I wrote a video called "Rust on Rails: Write code that never crashes", but it seems like some companies didn't get the memo.

As Cloudflare showed by temporarily releasing us from our Internet addictions in 2025, badly written Rust can still cause problems if you write it like it's any other language.
But Rust ISN'T like any other language. In Rust, it's EASY to write code that never crashes.

So why don't rust developers do that?

---

# PART 1
## ALTERNATIVES TO `UNWRAP()`




Like a kid on Christmas morning about to receive an Atari instead of an Xbox, you must be careful of what you unwrap.

Rust NEVER had nulls, the ecosystem was built around the Result type from the very start, so we have a very uniform way of managing errors right in the standard library, with no exceptions.

Speaking of:

 ---
```rust
# fn explicit_panics() {
panic!("crash and burn");
# }
```
 ---
```rust
# fn implicit_panics() {
let v = vec![1, 2, 3];
v[99];
# }
```
 ---
```rust
# fn unwrapping_errs() {
let a_file = std::fs::File::open("does_not_exist.txt").unwrap();
# }
```




 
Chapter 9 of the Rust Book tells us the three typical ways that we can crash our rust code:
1. Explicit panicking, which aborts the process
2. Implicit panicking, like indexing past the end of a vector, and
3. Unwrapping the Err variant of a Result

While in software, failure is always an option, these 3 are the primary causes of application crashes in Rust.

---




> [!IMPORTANT] I THOUGHT RUST WAS SAFE?!
> -Normal reaction




Yes, I know, I was surprised when people told me panicking the process and crashing counts as safe.

Look, crashing IS safe, technically: _Memory_ safe.
Often it's far better to kill the program when an unrecoverable state has been reached than carry on with weird, undefined memory behaviour.

But this answer does not satisfy me.

# MEMORY SAFETY
## IS NOT ENOUGH




I want to avoid panicking in any of the 3 main cases Rust code can panic.

Fortunately for me and you, we can safely navigate all three of these cases using rust's native Results and their extremely cool combinator methods:

---




## RESULTS

- ok
- err


## _BOTH!_
- <span style="color: red">~~unwrap~~</span>
- <span style="color: red">~~expect~~</span>
- unwrap_or
- unwrap_or_else
- `unwrap_or_default`
- map_or
- map_or_else
- map
- and
- and_then
- map_err
- or
- or_else
- transpose


## OPTIONS

- xor
- filter
- ok_or
- ok_or_else
- flatten






OOH just look at those options!
And Results, I suppose.

You should make yourself familiar with all of these, in addition to the excellent question-mark operator.

I will give you a combinator cheatsheet in a moment, but I'll highlight one of these now, as I use it all the time:

---

## TESTING FOR OK

```
fn parse_add_one_v1(num: &str) -> i32 {
    let number = num.parse::<i32>();
    if number.is_ok() {
        number.unwrap() + 1 
    } else {
        1
    }
}
```




Let's say you're parsing a string into a number and then adding one to it.
For our example, if it doesn't parse, then it's equivalent to zero.

This kind of behaviour happens all the time, often falling back to a sensible default value allows us to keep going.

Most Rust types implement the default trait, such as i32 from the standard library here, which simply returns 0, just the sensible value we want to use in case we can't parse our string into a number.

But this is a lot of messy code to check.
Here's how to do it properly:

---

## UNWRAP_OR_DEFAULT()

```rust
fn parse_add_one_v1(num: &str) -> i32 {
    let number = num.parse::<i32>();
    if number.is_ok() {
        number.unwrap() + 1 
    } else {
        i32::default() + 1
    }
}

fn parse_add_one_v2(num: &str) -> i32 {
    let number = num.parse::<i32>();
    number.unwrap_or_default() + 1
}
```




NOW we're talking.
The genius of `unwrap_or_default()` isn't just that we deleted a bunch of boilerplate, though you can imagine how I feel about that, but that we _removed a call to unwrap()_.

And that's going to be a theme throughout this video, because I think you should:

# <span style="color: red">NEVER</span> UNWRAP()

_(seriously)_




NEVER unwrap.

It's that easy, and that hard.

Because, while we might intend to write sensible code that uses all the lovely Result combinators, there is a powerful force attempting to lead us astray:

# PART 2
## THE PROBLEM WITH `UNWRAP()`



 
Monadic error passing
Better than exceptions, better than returning random error numbers, better than multiple return values.
Treating errors as native types in the type system rather than exceptions to otherwise imagined perfect code inverts the usual happy-path thinking we typically employ as engineers.

This is all fine in theory, but in practice there is a problem, see if you can spot it:

---

## HOW DO YOU USE SERDE?

Just read the readme:

```rust
# //! ```cargo
# //! [dependencies]
# //! serde = { version = "1.0", features = ["derive"] }
//! serde_json = "1.0"
# //! ```
# fn main(){}
# #[derive(serde::Serialize, serde::Deserialize)]
# struct Point {
#    x: i32,
#    y: i32,
# }
use serde_json::*;

fn serde_unwrapped() {
    let point = Point { x: 1, y: 2 };
    let serialized = to_string(&point).unwrap();
    let deserialized: Point = from_str(&serialized).unwrap();
}
```

_you panic if given json in a bad format_




Here's the hello world example for serde, one of the Rust ecosystem's most popular crates by downloads and references.
Show me a rust app that doesn't use serde, and I'll show you a rust app that PROBABLY SHOULD HAVE.

But notice anything? The very first example serde shows us, right at the top of the readme has an unwrap in.
This is the primary way unwraps creep into our code I think, through code examples copied and pasted without critique or modification - AND THEY ARE EVERYWHERE!

---

## HOW DO YOU USE REGEX?

Duh, just read the readme:
```rust
# //! ```cargo
# //! [dependencies]
//! regex = "1.13"
# //! ```
fn main() {
    regex::Regex::new(r"(\d{4})-(\d{2})-(\d{2})").unwrap();
}
```

_Another unwrap!_




Here's the regex crate - same problem!
So what's the solution?

Hmm. I thought Rust was supposed to be an extremely safe, sensible language, set apart from the usual crop of 'fuck it ship it' languages!

Let's see what The Book has to say on the matter:

---




<span style="color: #555555">"When you're writing an example to illustrate some concept, also including robust error-handling code can make the example less clear.</span>
## _IN EXAMPLES, IT’S UNDERSTOOD THAT A CALL TO A METHOD LIKE `UNWRAP` THAT COULD PANIC IS MEANT AS A <span style="color: red">PLACEHOLDER</span>_

<span style="color: #555555">for the way you'd want your application to handle errors. Similarly, the unwrap and expect methods are very handy when you're prototyping and you're not yet ready to decide how to handle errors." </span>



--The Rust Book, Chapter 9.3




"In examples", the book says, "it's understood that a call to a method like unwrap that could panic is meant as a placeholder for the way you'd want your application to handle errors."

Interesting. It goes on to say:

---



## _"THEY LEAVE CLEAR MARKERS IN YOUR CODE FOR WHEN YOU’RE READY <span style="color: blue">TO MAKE YOUR PROGRAM MORE ROBUST</span>"_



--The Rust Book, Chapter 9.3




"They leave clear markers in your code for when you're ready to make your program more robust."

RIGHT! This is the genius of unwrap, they are syntactical todos that are not just left in comments or, worse, jira tickets, but actually in the code that can be consumed by the compiler.

---

## SYNTACTICAL TODOS

```rust
let _home: std::net::IpAddr = "1.2.3." // <- error here
    .parse().unwrap(); //INFO: Hardcoded IP address should be valid
```


We can do a bit better with `expect()`:

```rust
let _home: std::net::IpAddr = "1.2.3." // <- error here
    .parse().expect("Hardcoded IP address should be valid");
```

Which at least gives a nice message when it crashes:

> The application panicked (crashed).
> Message: `Hardcoded IP address should be valid: AddrParseError(Ip)`




`unwrap()`, and its cousin, `expect()`, are todos we put in our code, but we were never meant to leave them there.

Maybe you can trust yourself to never commit a line that panics, but for the other people in your team, the solution is to get the local tooling and remote CI to throw out all code that can crash.
This means disallowing all unwraps, expects, and any panicking methods, even and especially, the implicit ones.

And we'll ensure that by using one single tool included in every Rust installation.

# PART 3
## `CLIPPY`




![image:width:100%](/img/user/Resources/Meta/attachments/clippy-transparent.png)
Great, THIS guy!




---

## CLIPPY DOESN'T LET YOU HAVE ANY FUN

```rust +validate:rust-script
/// Zero-depts random number generator! (re-run for a second number)
fn randint() -> usize {
    randint as usize
}
```

```rust
warning: direct cast of function item into an integer
    src/main.rs:2:13
    |
2   |     randint as usize
    |             ^^^^^^^^
```

_(and in doing so, teaches you correct rust)_




As you probably know, Clippy is rust's built-in code-checker.
Out of the box, it has sensible but conservative defaults that allow panicking, which is, like, why would you let this be the default?
This is RUST! It's SO easy to never panic!
(People love panicking I guess? Don't want to surprise them with a weird language that doesn't)

If configured correctly, clippy can fail on nearly any code that might panic at runtime.
This is all powered by the extra syntax that the Rust language gives us - hints to the compiler about what our intentions are - and is thus impossible in languages with simpler syntax.





 ---


in your `Cargo.toml`:

Up-to-date version @
`namtao.com/rust`


```toml
[lints.clippy]
pedantic = { level = "deny", priority = -1 }
nursery = { level = "deny", priority = -1 }
# DENY PANICS:
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







Enable these lints in every project. They do two things:
1. Teach you rust
2. Stop panics at runtime

Enabling the groups pedantic and nursery will teach you good rust habits, and the rest are all about covering cases where you have written code that might panic at runtime.

Single lines, functions, or whole files can be exempted if you find these lints to be overly burdensome. The lints in nursery are not guaranteed to be free from false positives, but nevertheless I urge you to enable them so you can be kept safe in all your code by default.

---

## CLIPPY SAVES YOUR BACON
```rust +validate:rust-script
fn might_panic(list: Vec<i32>) -> i32 {
    list[10]
}
```

```rust
$ cargo clippy
error: indexing may panic
   src/main.rs:20:5
   |
20 |     list[10]
   |     ^^^^^^^^
   |
   = help: consider using `.get(n)` or `.get_mut(n)` instead
```




Here's what your development environment will be like after you have done so: not just kept safe by clippy, but in nearly all cases, errors are enriched with sensible suggestions and defaults.

---
## `UNWRAPS` ARE ALLOWED IN TESTS
(another win for TDD)

```rust +validate:rust-script
# //! ```cargo
# //! [dependencies]
//! regex = "1.13"
# //! ```
#[cfg(test)]
mod tests {

    #[test]
    fn clippy_dgaf() {
        regex::Regex::new(r"(\d{4})-(\d{2})-(\d{2})").unwrap();
    }
}
```



Oh, by the way: You can have your cake and eat it, too:

If you're wondering how on earth to prototype code quickly if you can't use `.unwrap()` and friends - you CAN use them in unit tests, by default clippy ignores them in that context, even using the strict lints I recommend.

---

## `NO_PANIC` MACRO

```rust
use no_panic::no_panic;
#[no_panic]
fn demo(s: &str) -> &str {
    &s[1..] // can panic
}
fn main() {
    println!("{}", demo("\u{1f980}input string"));
}
```
```rust
   Compiling no-panic-demo v0.0.1
error: linking with `cc` failed: exit code: 1
[...]
          ERROR[no-panic]: detected panic in function `demo`
```




If, on the other hand, you want to be MORE strict, and want to PROVE your code never panics, not just trust that clippy is finding all edge cases:

A comprehensive solution is David Tolnay's `no-panic` crate, which provides a macro that aborts compilation if the annotated function produces code that links to the panic handler, and therefore has SOME execution paths that could panic at runtime.

Because it makes assumptions about the link-time environment, this crate is, perhaps, a little TOO clever, and may produce false positives. There are workarounds in the readme if you trip up on them.

---
## BEAUTIFUL EXAMPLE


```rust
fn purchase(basket: Result<Basket>) -> Result<Order> {
   basket
       .map(check_stock)
       .and_then(stage_payment)
       .map_err(log_error)
       .and_then(take_payment)
}
```

✨ wow ✨




A well-behaved Rust program, like in any functional language, is composed of data that is transformed through functions in a pipeline.
Rust encourages this through its powerful, native iterators, but also in the result combinator methods.
It's not just safer if you don't unwrap, it's actually way nicer to code like this!

---

 ---


| **Method**                    | **DESCRIPTION**                                              |
| ----------------------------- | ------------------------------------------------------------ |
| `unwrap_or`(self, default: T) | Returns the `Ok` value, else `T`                             |
| `map`(self, f: F)             | Computes a new `Result` with `f` if `Ok`, else `Err`         |
| `and`(self, res: Result)      | Returns `res` if `Ok`, otherwise returns self's `Err`        |
| `and_then`(self, op: F)       | compute another Result given the current value               |
| `map_err`(self, op: D)        | compute a new error value given the old error value          |
| `or`(self, res: Result<T, F>) | Returns `self.Ok` or `res.Ok`, left-biased, else `res`'s Err |
| `or_else`(self, op: O)        | compute another Result given the current error               |


Great cheatsheet at `wasabifan.github.io/combinator-quick-reference`




Here are some common Result transformation methods, with not a single unwrap in sight!
Checkout wasabifan's cheatsheet, linked below.

---
# CAVEAT
## FAILURE IS ALWAYS AN OPTION

_(but don't let that put you off)_




Before you head to the comments to tell me that only using non-panicking language features does not protect against failed memory allocations or other problems, I acknowledge that following my advice here will only give you a program that is _nearly_ perfect.

But as Voltaire may have said, "the perfect is the enemy of the good".
Code that has no execution paths that can panic at runtime is not nothing, in fact, for most applications, it's really good!
Cloudflare certainly should have done this!

If you're in a memory constrained or safety-critical application, then you have work to do to get to 100%, but starting at 99% is probably a good idea!

---

![image:width:100%](/img/user/Resources/Meta/attachments/galaxy-brain-unwrap-meme.png)

_(I also dig this article: `emschwartz.me/your-clippy-config-should-be-stricter`)_




In closing, once you stop unwrapping errors to get to the type inside, and start working safely with combinator methods, the distinction between errors and data falls away, and you are left with just data.
And no reason to panic!
