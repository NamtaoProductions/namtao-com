---
{"dg-publish":true,"permalink":"/async-video/","hide":true,"tags":["project/nb"],"noteIcon":""}
---


 ---
- https://jade.fyi/blog/flakes-arent-real/
- Rust promises to take you by the hand, but when a sync is involved you're on your own buddy
- Just wrote Web services in tokio just buy ibm Steve k
- Async rust is a miracle - Steve klabnik

## Lint Tweaks

These lints make clippy less noisy when I'm building the video

```rust
#![allow(dead_code, unused_variables)]
#![allow(clippy::items_after_statements, clippy::no_effect, unused_must_use, clippy::must_use_candidate, clippy::unused_self, clippy::missing_const_for_fn, clippy::use_self)]
#![allow(clippy::needless_pass_by_ref_mut)]
#![allow(clippy::ptr_arg)]
#![allow(clippy::needless_pass_by_value)]
```

## Imports

```rust
```

## Setup

```rust
fn main() {
```

---

## ASYNC ISN'T REAL
![image:width:30%](/img/user/Resources/Meta/attachments/rust-logo.png)

## & CANNOT HURT YOU

---



Hi friends, my name is Tris and this is No Boilerplate, focusing on fast, technical videos.

---

 ---

- Best-in-class tooling
- No Nulls
- C-speed
- High-level ergonomics
- Low-level power
- Algebraic Type System



> (ie. my Shopping list, c. 2016)

---



Rust is the senior developer's dream language. Certainly, it was mine.

For the first time in my career, I feel would let me confidently write not just high-level application code, but low-level driver code, too.
What gives me this confidence is rust's borrow checker, algebraic types, powerful macro system, and the unsafe system, all kept safe and sane by the friendliest compiler in the business.
I have explained the joy of rust at length on this chennel, see this pinned playlist for details.

But there is a problem with my dreams of a perfect language, a lot of what I have just mentioned breaks down when interacting with async rust.

Though the compiler is getting more and more helpful with each iteration, it's still a sharp edge, especially for newcomers - what gives?

Well, to oversimplify, it turns out that async rust is not really rust.
But, you don't have to use it.




## Public Domain Videos


![image:width:30%](/img/user/Resources/Meta/attachments/cc-zero-2k.png)


> [!NOTE] For all links, read my scripts here:
> - `www.namtao.com`
> - `github.com/NamtaoProductions/namtao-com`






![image:width:100%](/img/user/Resources/Meta/attachments/white-logo.png)





 

I dedicate my video scripts to the public domain.

Everything you see here: script, links, and images are part of a Markdown document available freely at my website and on GitHub at the above address.

---


# `PART 1:`
## I WAS PROMISED
## FEARLESS CONCURRENCY

---

## SYNC EXAMPLE

```rust +exec:rust-script
# //! ```cargo
# //! [dependencies]
# //! minreq = "2.13.4"
# //! ```
# fn main(){}
fn gettr(url: String) {
  minreq::get(&url);
  minreq::get(&url);
  minreq::get(&url);
  dbg!("What a nice url: {}", url);
}
```

NOTES:
- Not a single lifetime in sight
- I love the borrow checker
- JavaScript wishes it looked this good
- What a day, what a lovely day!

---




 

Let's say we have an expensive function, perhaps it does a get request or three, that we want to run in the background while we do other things.

To do that, you might reasonably reach for Async, like in other languages.

Let's see what async looks like in Rust.
And now that `async-std` is deprecated, what that looks like is the tokio crate:

---

## TOKIO EXAMPLE

(same expensive function from before)

```rust +exec:rust-script +validate:failure
# //! ```cargo
# //! [dependencies]
# //! minreq = "2.13.4"
# //! http = "1.0"
# //! tokio = { version = "1", features = ["full"] }
# //! ```
# fn main(){}

async fn my_async_fn_scope(url: &String) {
  tokio::task::spawn_blocking(move || minreq::get(url)).await;
  tokio::task::spawn_blocking(move || minreq::get(url)).await;
  tokio::task::spawn_blocking(move || minreq::get(url)).await;
  dbg!("What a nice url: {}", url);
}
```





> [!CAUTION] CARGO BUILD ERROR:
> argument requires that `buf` must outlive `'static`&nbsp;
> &nbsp;

---


 

So here, instead of calling the `expensive_computation()` function directly, we spawn it with the tokio executor and await the returned future.
 
Easy!

Oh, huh, this doesn't compile.

---

 ---

Our call to `spawn_blocking()`:

```rust {2}
async fn my_async_fn_(buf: &mut Vec<u8>) {
  tokio::task::spawn_blocking(move || expensive_computation(buf))
    .await.unwrap()
}
```

`spawn_blocking`'s implementation:

```rust {1-5|3}
pub fn spawn_blocking<F, R>(f: F) -> JoinHandle<R>
    where
        F: FnOnce() -> R + Send + 'static,
        R: Send + 'static,
    {
```

---


Looking at the implementation, it seems that `spawn_blocking` requires references to have the static lifetime, which requires the compiler to prove they will be valid for the entire execution of the program.
This is not the case for our `buf` reference, the current lifetime is tied to the calling function's body, which in our example, immediately terminates!
OK, fair enough.
The full cargo error is very clear on how to solve this:

---

# TOKIO, FIXED

Update lifetime:

```rust
fn expensive_computation_static(buf: &'static mut Vec<u8>) {}
```

In both places:

```rust {1}
async fn my_async_fn(buf: &'static mut Vec<u8>) {
  tokio::task::spawn_blocking(move || expensive_computation(buf))
  .await.unwrap();
}
```

---

 

We simply obey the compiler, and dutifully add the static lifetime to the mutable reference.
The compiler is now happy, and if the compiler is happy I... Hmm.
I'm actually NOT happy, folks.
USUSALLY when the compiler is happy I am happy, but I'm not.
Not at all.
In fact, I'm kind of FURIOUS.

---

 

---


OF COURSE, you can get fearless concurrency if you only send around static data, that's actually super unimpressive.
Forcing all our references to be static, valid for the lifetime of the program, is effectively turning off a large part of the borrow checker.
I thought this was RUST!? No comprimises, I want to have my cake and eat it.
Well, of course, there is a solution: Don't use async.

# Patreon

![image:width:50%](/img/user/Resources/Meta/attachments/patreon.png)
## [Support me on Patreon](http://www.patreon.com/noboilerplate)

- 🦆 Duck Typing with Properties
- 📁 My downloadable template starter vault

---



It's just me running this channel, and I'm so grateful to everyone for supporting me on this wild adventure.

If you'd like to see and give feedback on my videos up to a week early, as well as get private discord access, and even your name in the credits, it would be very kind of you to check my Patreon.

I'm also offering a limited number of mentoring slots. If you'd like 1:1 tuition on personal organisation, Rust, creative production, web tech, or anything that I talk about in my videos, do sign up and let's chat!

---


# `PART 2:`

# FEARLESS
# PARALLELISM
 ---

---


```rust
fn thread_scope(url: String) {
  std::thread::scope(|s| {
    s.spawn(|| minreq::get(&url));
    s.spawn(|| minreq::get(&url));
    s.spawn(|| minreq::get(&url));
  });
  dbg!("What a nice url: {}", url);
}
```

The problem is that async tasks, by definition, can run for an unknownable amount of time on the executor.
This is fine for something like a server handling requests, but do I really need to throw out ownership just because I want to make a get request?

---

 ---

---


 

---

# Thank You

To all my patrons, you make this possible!

```rust
let producers: [&str; 0] = [];
let sponsors = [
	"Jaycee", "Gregory Taylor", "Ything LLC"
];
let patrons: [&str; 480];
```

I'd be truly grateful for your support on:
- [Patreon](http://www.patreon.com/noboilerplate)
- [Ko-Fi](https://ko-fi.com/noboilerplate)
- [Gumroad](https://namtao.gumroad.com)

---


If you would like to support my channel, get early ad-free and tracking-free videos, your name in the credits or 1:1 mentoring, head to my patreon or ko-fi.

If you're interested in transhumanism and hopepunk, please check out my weekly sci-fi audiofiction podcast, Lost Terminal.

I just finished Season 2 of The Phosphene Catalogue, if you like mysteries and art, check it out!

Transcripts and compile-checked markdown sourcecode are available on namtao.com and github, links in the description, and corrections are in the pinned ERRATA comment.

Thank you so much for watching, talk to you on Discord.

---


```rust
// that's all folks!
}
```

# Setup
## Cargo.toml
---

```toml
[package]
name = "async-video"
version = "0.1.0"
edition = "2021"

[lints.rust]
unsafe_code = "forbid"

# come at me, clippy
[lints.clippy]
enum_glob_use = "deny"
pedantic = { level = "deny", priority = -1 }
nursery = { level = "deny", priority = -1 }

[dependencies]
http = "1.0"
tokio = { version = "1", features = ["full"] }
minreq = { version = "2.13.4" }
```

---

 