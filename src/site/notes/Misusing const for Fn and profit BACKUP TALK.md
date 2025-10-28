---
{"dg-publish":true,"permalink":"/misusing-const-for-fn-and-profit-backup-talk/","tags":["project/nb"],"noteIcon":""}
---








 ---


`Tris Oaten (he/him)`

> _Digital maker & surprisingly complex Markov chain._



![image:width:94%](/img/user/tris-cyberpunk-eurorust.png)





    Hi friends my name is Tris.

    I was a python web developer for 15 years before discovering Rust, but these days I think it is easiest to say that I am a professional writer.
    I write code, music, and fiction&non-fiction prose.
    3 years ago I accidentally monetised my addictions into a youtube channel called No Boilerplate where I talk about Rust and my various other technical hyperfixations.
    I'm a Linux guy, still have my ubuntu 6.06 CD, I worked at Canonical for a few years, but these days use nixos.

    Please excuse the name change - I found as I wrote the talk that though there was a lot i wanted to say about const functions, there was even more I wanted to talk about macros!


---

 ---

![image:width:50%](/img/user/Resources/Meta/attachments/sdr-podcast-logo.png)


https://sdr-podcast.com/episodes/compile-time-crimes/



    I perhaps should have called it compile-time crimes, but Amos & James already did that a few months ago on SDR.



---








 ---
 ---


`Tris Oaten (he/him)`

> _Digital maker & surprisingly complex Markov chain._



![image:width:94%](/img/user/tris-cyberpunk-eurorust.png)





    Today I going to talk about Rust’s compile-time, outside the focus of type correctness and safety, which gets all the press. This is a topic that is under-served, I believe, because it’s such an alien idea (except for lisp programmers!). AND YET IT’S SO COOL!
    I believe there’s a whole world folks might be missing.

    I live at compile time
    - I love pushing as much logic from runtime to compiletime using rust's rich type system
    - lifetimes allowing me to model not just what my data is, but when

    I'm never happier than modelling my data with Rust's rich type system, however, cruel external forces keep asking me to actually get some work done.
    runtime is a scary world of threads, async databases, and, worst of all: USERS.

    Before we start, some housekeeping:


---

## HOUSEKEEPING I






![image:width:80%](/img/user/Resources/Meta/attachments/cc-zero-2k.png)
![image:width:100%](/img/user/Resources/Meta/attachments/white-logo.png)




    I dedicate all my work to the public domain, and this talk is no different.
    If you are listening to the recording of this talk, and find that I speak too fast and you'd like to read along, you may read the script on my site, namtao.com.
    If you're listening to my voice live in the room, give me a few hours to upload it.
    Everything you see and hear today was written by me, a human, just like you.

    I can tell you have burning questions already, fine let's be quick:


---
## HOUSEKEEPING II: Q&A





0. Cool Bow Tie!
1. What font is that?
2. What presentation software is this?
3. But how am I seeing images and variable-height fonts?
4. Havn't I seen you on YouTube?



0. Thanks! Not a question
1. [Iosevka](github.com/be5invis/Iosevka)
2. [Presenterm](github.com/mfontanini/presenterm)
3. [Kitty](github.com/kovidgoyal/kitty)
4. Seen? [No](youtube.com/@NoBoilerplate)



    0. Thanks! Bow ties are cool. Not a question, though.
    1. This skinny font is Iosevka
    2. The terminal presentation software is Presenterm, written in Rust
    3. You're seeing images and variable-height fonts thanks to Kitty (I'm experimenting with Wezterm and Rio, don't @me)
    4. And no, you've not SEEN me on YouTube










`rustlings/exercise/00_intro/intro2.rs`


```diff
-    println!("Hello {}!");
+    printline!("Hello there!")
```




    You might recognise my name from my extremely important contribution to Rustlings, 2 years ago.
    That's what I'm most known for, I believe.



---
# PLAN


1. Const
2. Macros
3. What can we do?
4. What should we NOT do?



    OK, here's what we're talking about today:
        - Introducing the const world: a cosy subset of rust where computation can be done without executing any runtime code.
        - Then acknowledging that unreasonable forces may ask you to produce more side effects than just heating up your laptop. Silence these criticisms with macros.
        - Working out what we can and can't do with our newfound superpowers
 


---




 ---



    As I am a native of cyberspace, and therefore scared of interacting with other humans directly, there will be strictly no audience participation during this talk.
    Are we clear on that?
    I feel I am amoung friends, so I will start with sharing an extremely brave opinion with you today:



---
# <span class="highlight">PART 0:</span>




## _RUST IS GOOD_


    RUST IS GOOD!

    Nearly every feature that I wished for over the course of career so far as a senior web developer, Rust has.
    And now that I exclusively write Rust, every day I find that the language seems to have predicted the features I need before I knew I need them!

    It's no secret how this happened: It is thanks to the skill, experience, and foresight of the genius maintainers and community, many of whom are here today.


---
## RETROFITTING ALWAYS SUCKS


- `Types Checking`
    - MyPy for Python
    - Sorbet for Ruby
    - Typed Clojure
    - Yes, even Typescript
- `Null Safety`
    - Java (Groovy, Scala, Kotlin...)
- `Python's "package management"`
- `JavaScript's N preprocessors`
- `Garbage Collection`
    - Nim's O/Arc gc-free option
- `Metaprogramming`
    - Template Haskell
    - Zig's comptime



    Rust feels to me, a little like it was designed backwards, looking at existing solutions, and learning from all the mistakes of the past, whether it's:

    - the most popular languages in the world (and Clojure) realising a litle too late that static typing is enormously helpful in building complex systems
    - or Java's attempts to fix the Billion Dollar Mistake of nulls, I mean groovy, I mean scala, I mean KOTLIN - JUST ONE MORE LANGUAGE BRO I SWEAR WE'LL FIX IT THIS TIME.

    And dont get me started on python's packaging:
    Before Rust, I wrote python for 15 years, and every time a junior developer asked me to explain the virtualenv situation, I died a little inside.
    Rust has brought me back to life.

    Metaprogramming is nearly always left out or nerfed in programming languages because of how misused it has been in the past.
        Template haskell is legendary
        C and C++ have evolved multiple LAYERS of preprocessors
        And even zig's otherwise very good comptime is severly limited because they're scared of arbitary code execution.



---




## _SOMETIMES TO FIND OUT_
## _ONE SIMPLY MUST FUCK AROUND_


    I am not scared of executing code at compile time, and neither should you - in fact, I'm quite excited by it.
    And I discovered it almost by accident.



---

# JOKE THE FIRST



    To keep audience engagement high,
I have 3 jokes for you during this talk, here is the first joke.




There are only 2 hard problems in distributed computing:



2. Correct-ordering of messages
1. Exact once delivery
2. Correct ordering of messages



    There are only 2 hard problems in distributed computing:
        2. Correct-ordering of messages
        1. Exact once delivery
        2. Correct ordering of messages



---
# <span class="highlight">PART 1:</span>


## MY CONST JOURNEY

```rust +validate:rust-script
fn addone(x: i32) -> i32 { x + 1 }
```





What is wrong here?


    Let's look at this simple, Rust function.

    It may be elegant and beautiful, but nonetheless, clippy (both my wise master and infuriating nemisis) has a problem with it.

    Can anyone see what is wrong?


---
 ---


## THERE IS NO
## AUDIENCE PARTICIPATION
## IN THIS TALK



    What is wrong is that you have forgotten that there is no audience participation in this talk



---
# MY CONST JOURNEY

```rust +validate:rust-script
fn addone(x: i32) -> i32 { x + 1 }
```

My typical lints:
```toml
[lints.clippy] # come at me, clippy
pedantic      = { level = "deny", priority = -1 }
nursery       = { level = "deny", priority = -1 }
unwrap_used   = "deny"
```







  If you've set up clippy to neg your code by erroring on pedantic lints, which I do because I love pain, this simple rust function will not compile.


---
# CLIPPY SAVES YOUR BACON 🐷

![image:width:100%](/img/user/Resources/Meta/attachments/vim-comptime-error.png)




    A quick aside on how much I love the combination of bacon and clippy.

    Rust analyzer is certainly incredible, however LSP is inherently line based, and you will read the warnings and errors out of compiler order, and in the order of lines in your file.
    This is OFTEN what you want, but not always, and it doesn't quite have the same teaching power as the raw output of `cargo clippy`.
    compare this this inline error with:



---
# CLIPPY SAVES YOUR BACON 🐷
![image:width:100%](/img/user/Resources/Meta/attachments/bacon-comptime.png)




    clippy, when set up with the pedantic lints I just showed you.
    The compiler's output isn't just beautiful, it nearly always comes with hints to what you should fix.

    If you run `bacon clippy` in a terminal while you work on your project, you will find, as I did, that it teaches you Rust.
    As happened with my const journey.



---
# DETECTIVE CLIPPY

```js
$ cargo clippy

 1  error: this could be a `const fn`
    src/main.rs:20:1
    |
 20 | fn addone(x: i32) -> i32 { x + 1 }
    | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
```

As usual clippy negs my code...The fix:

```rust
const fn addone(x: i32) -> i32 { x + 1 }
^^^^^
```



    This error, here, was our first clue hinting at Rust's secret world:
    Clippy tells us that this function could be a `const fn`.

    And if you've scoped your functions tightly, and hygenically controlled for mutation, you may find clippy tells you this about some of you functions too.

    (By the way, the fix, as ever, is to do what clippy says, obey the compiler and turn the function into a const function)

    const functions are functions that are safe to execute in a const context, at compile time.
    They differ from rust macros by being much more limited in their side-effects.
    For example:



---
# CONSTANT FUNCTIONS






```rust {4-6} +validate:rust-script
const fn i_square(x: i32) -> i32 {
    x.pow(2) // OK
}
```

```rust +validate:rust-script +expect:failure
const fn f_square(x: f32) -> f32 {
    x.powi(2) // ERROR
}
```




```rust
error: cannot call non-const fn
`powi` in constant functions
    |
 44 |     x.powi(2)
    |     ^^^^^^^^^
// (error output lightly edited)
```



(btw, `powi()` et al is available in `lib.rs/crates/const_soft_float`)



    Not all floating point operations in the std library are supported, compared to their int counterparts.

    And this is to do with the side-effect that your CPU, from the code's point of view, might be affected by side effects during floating-point operations.

    Change the target, change the floating point hardware, and you could get a different output for the same input.

    If you think about it, const functions aren't weird for disallowing floating point operations like this, it's the REST of us who are weird for assuming they work!

    Just like with Pure functions in functional languages, these limits make them exciting:
    `const` functions have access to a limited subset of Rust, you could read about it in the Rust Reference, but let's experiment because that's more fun:


---
# WHAT WORKS IN CONST FNS?

```rust +validate:rust-script
const fn demo(x: i32, y: i32, f: f64) -> &'static str {
    x + y - x / y * x;
	(1, 2, 3).0;
	[1, 2, 3][0];
	let maybe_number = Option::Some(42);
	let adder = |z: i32| x + 1;
	let number_ref = &maybe_number;
	10 as f64 + f;
	loop {break 1};
	match maybe_number {
		Some(42..=42) => "Answer found!",
		_             => "Keep searching..."}}
```



_(TIP: try `https://lib.rs/crates/konst` for const std functions)_


    Presenterm runs all my rust code blocks through the compiler, it ran it just now, and it compiles, so it's obvious that a lot works here:


---

![image:width:90%](/img/user/Resources/Meta/attachments/presenterm-temp.png)



🔗 github.com/mfontanini/presenterm
💝 github.com/sponsors/mfontanini



    SIDENOTE: I'd like to take a moment to publicly shout-out Matias Fontanini for making Presenterm and responding to to all my unreasonable feature requests over the last 6 months!
    I was literally editing my presentation last night from my hotel room to take advantage of more new features he just added!
    Tip your open source software developers, folks.


---
# WHAT WORKS IN CONST FNS?

```rust +validate:rust-script
const fn demo(x: i32, y: i32, f: f64) -> &'static str {
    x + y - x / y * x;
	(1, 2, 3).0;
	[1, 2, 3][0];
	let maybe_number = Option::Some(42);
	let adder = |z: i32| x + 1;
	let number_ref = &maybe_number;
	10 as f64 + f;
	loop {break 1};
	match maybe_number {
		Some(42..=42) => "Answer found!",
		_             => "Keep searching..."}}
```



_(TIP: try `https://lib.rs/crates/konst` for const std functions)_



    It's obvious that a lot works in the strict environment of const functions:

    Including, from top to bottom:
    - arithmetic operators
    - tuple indexing
    - array slicing
    - structs
    - non-capturing closure expressions
    - shared borrows without interior mutability
    - safe casting
    - calling other `const` functions
    - `loop`, `while`, `while let`, `if`, `if let` and `match`
    - and range expressions

    That's quite a lot!
    But not everything, and some of what works is qualified.

    (By the way, if you're curious, the `konst` crate has const equivalents of many functions and methods that are in the process of being made const compatible in the standard library - more on that later)

    I don't have time to talk about Rust's granular purity system today, those who are interested may watch my video on this topic.
    Because, while const functions are cool, there are some problems we as engineers are trying to solve, for which compile-time side-effects are a feature, not a bug.
    For them, you will need access to the whole language, not just the sanitised subset available in a const context.
    And just like with the escape hatch of unsafe, macros are the escape hatch of const.



---
 ---
# MACROS

_(my favourite breakfast cereal)_




```rust +validate:rust-script
const compiletime: &str = env!("PATH");
```



    PART 2: Macros

    Macros execute arbitrary code at compile time, and then can insert the results of that processing as potentially const values, like here, the result of interrogating the path is a const, static string.



---
 ---


# THE WHOLE LANGUAGE
# IS AVAILABLE
# AT COMPILE TIME



    Arbitary code execution while compiling is an extremely clever trick that LISP had figured out in the 1950s.
    Are there any LISP programmers in today? Anyone written LISP? For bonus points, anyone been Paid to write lisp, like I was at a startup bank 10 years ago?
    *put hand up*
    *shade eyes and look at the back row*
    "What did you write?"
    *click to next slide*



---
 ---



## THERE IS NO
## AUDIENCE PARTICIPATION
## IN THIS TALK





    *shake head*
    Come find me afterwards!


---
# MACROS ARE AMAZING




PATH at runtime:
```rust {3} +validate:rust-script
# use std::env;
# fn pathdemo() {
let path = env::var("PATH");
# }
```

PATH at compiletime:
```rust +validate:rust-script
# use std::env;
# fn pathdemo() {
let path = env!("PATH");
# }
```

_THIS SIMPLE FEATURE IS SO RARE!_



    YOU ARE NOT SUFFICIENTLY EXCITED ABOUT MACROS!

    This unassuming example is WILD:
    - JS can't do this, nor can Java, Ruby Go, or ANY OF THE TOP 20 LANGUAGUES.

    in all these other languages, the source files are effectively dead text until the end user calls them to wake them up.






 1. &nbsp;❌JavaScript
 2. &nbsp;❌Python
 3. &nbsp;❌Java
 4. &nbsp;❌PHP
 5. &nbsp;❌C#
 6. &nbsp;❌TypeScript
 7. &nbsp;❌CSS
 8. &nbsp;❌C++
 9. &nbsp;❌Ruby
 10. ❌C
 11. ❌Swift
 12. ❌Go
 13. ❌R
 14. ❌Shell
 15. ❌Kotlin
 16. ❌Scala
 17. ❌Objective-C
 18. ❌PowerShell
 19. ✅Rust
 20. ❌Dart


---
# RUNTIME VS COMPILETIME




```rust {4, 9}
#[proc_macro]
pub fn runtime(_item: TokenStream)
-> TokenStream {
    "command('mkdir /tmp/test')"
        .parse().unwrap()
}
```

Executes when inserted code is called:
```rust
runtime!();
```



```rust {4, 9}
#[proc_macro]
pub fn comptime(_item: TokenStream)
-> TokenStream {
    command("mkdir /tmp/test");
    "()".parse().unwrap()
}
```
Executes immediately during compilation:
```rust
comptime!();
```





    Everyone clear?
    You can rewrite syntax and have your function call at runtime,
    or you can run the code during compilation RIGHT NOW.



---
 ---


# WHAT CAN WE DO?



    PART 3: What can we do?
    Having a macro system that can rewrite syntax at compile-time is already incredible.
    And in Rust, this basic feature is even more powerful than you can find in other languages, which limits you to only valid language syntax.
    This allows you to build DSLs with ALMOST no restrictions, such as:



---
# MACRO_LISP






wow!






✨



```rust {5-8} +validate:rust-script
# //! ```cargo
# //! [dependencies]
//! macro_lisp="0.1.0"
use macro_lisp::lisp;
use macro_lisp::lisp_arg;

lisp!(defun factorial ((n i32)) i32
  (if (<= n 1)
    1
    (* n (factorial (- n 1)))));

fn main(){
    let num = factorial(10);
    println!("{}", num);
}
```






💝


🌠



who is she?



    One of my favourites, the macro_lisp crate!
    It's not a lisp when it gets to runtime - this syntax with all our ancestors' parens is rewriten at compile time into a valid, equivilant, rust function.
    And this is not some kind of toy or hack -



---
# MACROS HAVE GOOD* ERRORS

```rust
lisp!(defun factorial ((n i32)) i32
  (if (<= n 1)
    1
    (* n (factorialTYPO (- n 1)))));
```

```rust
 error[E0425]: cannot find function `factorialTYPO`
     (* n (factorialTYPO (- n 1)))));
           ^^^^^^^^^^^^^
           |
           help: a function with a similar name exists: `factorial`
```



*Not as nice as runtime, sure, but improving all the time



    The errors are really good!
    This crate effectively teaches the rust compiler to speak lisp using the macro system.



---
# THIS EVEN WORKS IN-EDITOR



```rust {4-6}
    1 ▎ lisp!(defun factorial ((n i32)) i32
    2 ▎   (if (<= n 1)
   3 ▎     (* n (factorialTYPO (- n 1)))));
    4 ▎           Diagnostics:
    5 ▎           1. cannot find function `factorialTYPO` in this scope [E0425]
    6 ▎           2. a function with a similar name exists: `factorial` [E0425]
    7 ▎
 NORMAL   master   1  6  󱘗  src/main.rs               2   169  1  1
```




(This is Neovim. Other editors, I understand, are available)



    Thanks to the incredible work of the rust-analyzer team, Macro errors even work in-editor, at NEARLY ALWAYS the right line number!



---

# WHAT CAN WE DO? ANYTHING

```rust
extern crate proc_macro;
use proc_macro::TokenStream;

#[proc_macro]
pub fn make_answer(_item: TokenStream) -> TokenStream {

    //     <- ANYTHING IS POSSIBLE HERE ->

    "fn answer() -> u32 { 42 }".parse().unwrap()
}
```

Sure you can use macros to just rewrite syntax...

...but where's the fun in that? 😈



    But the power is much more than rewriting code or reducing boilerplate - though I love that feature.
    You can do anything in a macro, there is no compiler police like there is with those puritan const functions to tell you what you can and can't do.

    Want to execute code that has NOTHING to do with the eventual syntax you will insert into the source code? DO IT.



---

# JOKE THE SECOND

There are only 2 hard problems in computer science:



1. Cache invalidation
2. Naming things
3. Off-by-1 errors.



    JOKE THE SECOND

    There are only 2 hard problems in computer science:

    1. Cache invalidation
    2. Naming things
    3. Off-by-1 errors.



---



 ---


## WHY HAVE I NEVER
## REALISED THIS
## BEFORE?



    This secret compile-time world is inaccessible to most other languages for technical reasons, but it's also innaccessible to most Rust developers for a non-technical reasons.


---
## WE FORGET ABOUT MACROS

![image:width:60%](/img/user/Resources/Meta/attachments/model-checking-screenshot-macros.jpg)



It happens to the best of us!


    It happens to the best of us!
    (thank you to Horacio for letting me use his demo code as an example)
    This is completely understandable.



---




## IT'S DIFFICULT TO MISS
## WHAT YOU'VE NEVER KNOWN



    It perhaps is a problem of hermeneutics, unknown unknowns, or what we in the programming community call The Blub Paradox



---
# THE BLUB PARADOX

> [!IMPORTANT] And if Lisp is so great, why doesn't everyone use it? ...the reason everyone doesn't use it is that programming languages are not merely technologies, but habits of mind as well, and nothing changes slower.
> Paul Graham, "Beating The Averages"



    This Paradox is where people who have learned a lower-level language can't imagine why they would need the features of a higher-level one.
    Paul Graham said that programming languages are not technologies, but habits of mind.
    LISP might be the best language for your project technically, but try changing a Python team's minds about writing it all in Python.


---



![image:width:100%](/img/user/Resources/Meta/attachments/language-by-abstraction-xkcd-edit.png)

## 🦋


    Programmers are, on the whole, a practical guild.
    We are interested in solving problems with the magic lightning that we've persuaded a rock to think with.
    You CAN solve all problems with a simple turing machine and a few for loops and if statements.
    But if you're using Rust, you have access to macros at compile time.
    Tell the Python developer about that, and they'll be non-plussed, they've never needed it - they solve their problems with duck typing, debugging in production and Iterators.
    - "Iterators?" says the c programmer "What's wrong with a for loop?"
    - "Functions?" says the basic programmer, "GOTOs have worked fine for me for years!"
    - "GOTOs?" says the assembly programmer, "just stick some bytes in memory and jump there"

    And of course, as we all know, 'real programmers' use butterflies!



---
# _"What Made Lisp Different"_
 ---

- Conditionals.
- A function type.
- Recursion.
- Pass-by-reference.
- Garbage-collection.
- Programs composed of expressions, not statements.
- A symbol type.
- A notation for code using trees of symbols.
- <span class ="highlight">The whole language always available.</span> 👈



    In Rust, unlike with zig, unlike with c or haskell templates, the whole language is available at compile time.
    This was one of the key breakthroughs with Lisp, 70 years ago, and yet most implementors are afraid to add this functionality to their language.

    There is not need for this fear, we've had 70 years to solve the problems and build good rules.



---


# NEVER DO IN A <span class="highlight">MACRO</span>
# WHAT YOU CAN DO
# IN A <span class="highlight">FUNCTION</span>



    There is some ancient wisdom passed down from the wise lisp masters for us to learn, before we take off the training wheels and start rebuilding the world at compile time.

    Such as "never do in a macro what you can do in a function"



---

# JOKE THE THIRD

We only have 2 problems in all of software engineering:



1. We only have 1 joke
2. It's not very funny



    JOKE THE THIRD

    We only have 2 problems in all of software engineering:

    1. We only have 1 joke
    2. It's not very funny



---
# <span class="highlight">PART 4:</span>




## WHAT SHOULD WE
## <span class="highlight">_NOT_</span> DO?


    Look, every other top 20 language doesn't allow us this power because they're afraid.
    Powerful tools have powerful features, and you can cut yourself with them.
    BUT THAT DOESN'T MEAN YOU SHOULD BE AFRAID OF THEM
    Story Time:



---
# STORY TIME

![image:width:50%](/img/user/Resources/Meta/attachments/slms-clean-room.png)



(Image of the South London Makerspace, my new home)



    About 10 years ago, I was a member of a community workshop that had tools, machines and a nice atmosphere, all available for us to use.

    Some of the machines, like the lazer cutter, were delicate, and had instructions printed on posters on how to use it without damaging sensitive components.

    But there was one machine that had no instructions on how to use-



---
# THE LATHE

![image:width:40%](/img/user/Resources/Meta/attachments/lathe-2.png)



    THE LATHE

    Instead of diagrams and descriptions of safe use, the Lathe had a sign hung over it, stating simply --

    THIS MACHINE WANTS TO KILL YOU

    The takaway wasn't to not use the machine.
    BUT BE FUCKING CAREFUL.




> [!IMPORTANT] THIS MACHINE WANTS TO KILL YOU&nbsp;

---
# CAN YOU DO CRIMES? YES


```rust
#[proc_macro]
pub fn threader(_: TokenStream) -> TokenStream {
    std::thread::spawn(|| println!("Where is your god now?"));
    "()".parse().unwrap()
}
```
```diff
❯ cargo build
   Compiling scratch v0.1.0 (/home/oatman/projects/scratch/scratch)
> Where is your god now?
    Finished `dev` profile [unoptimized + debuginfo] target(s) in 0.21s
```



    Can you do crimes? YES.

    Neither I nor the compiler nor god can stop you from spawning threads during compilation.
    I'LL REMIND YOU THAT THE WHOLE LANGUAGE IS AVAILABLE!
    but this is GOOD.



---






- `JAVASCRIPT`
    - Babel
    - TypeScript
    - CoffeeScript
    - LiveScript
- `JAVA`
    - raydac/java-comment-preprocessor
    - Manifold
- `C#`
    - T4 Templates
- `C/C++`
    - ./configure
    - Make
    - etc
- `RUBY`
    - civol/ppr


![image:width:85%](/img/user/Resources/Meta/attachments/look-what-they-need.png)




    Look what they need to mimic a fraction of our power!

    Every language ends up requiring compile-time macros that have full access to the underlying system, and because they don't build them in from the start, they must create
    (to misquote Greenspun's tenth rule)
    an ad hoc, informally-specified, bug-ridden, slow implementations of half of a macro system.

    This is just another example of the Rust community truely understanding what features you need in a language, macros, and what features you don't, a GC.

    And before you speak, I can already hear you ask:


---
# PART 5:



## AREN'T THERE
## 😈 SECURITY 👻
## CONSIDERATIONS?



    Aren't there securiy considerations with arbitary compile-time code execution?
    And to that I say:


---
# RATIONAL REBUTTAL:




1. Shut up
2. Don't worry about it
3. You're not my real Mum
4. I'm not on trial here
5. I said no questions
6. FINE:



1. Shut up
2. Don't worry about it
3. You're not my real Mum
4. I'm not on trial here
5. I said no questions
6. FINE:



---
# sECuRIty cONsiDerATiOnS


> [!IMPORTANT] The Rust team and ecosystem will need to work to release fixes and security enhancements to prevent arbitrary code execution vulnerabilities like this one in the future.
> Eric Leijonmarck, eleijonmarck.dev/blog/2023-03-18---arbitrary-code-execution-rust/



    You may have, as I did, read this post, on HN 2 years ago, where Eric built a proof-of-concept macro that deleted a user's SSH key if they compiled, not ran, the project.
    In his blog post he said that "The Rust team and ecosystem will need to work to release fixes and security enhancements to prevent arbitrary code execution vulnerabilities like this one in the future."

    Eric, we're actually good, here, thank you for your concern.
    Firstly, only allowing arbitary code execution at runtime isn't the solution that everyone thinks it is:
    You know what I almost always do after I compile my code? I run my code!
    Secondly,




![image:width:100%](/img/user/Resources/Meta/attachments/vscode-restricted-mode-screenshot.png)



    THIS PROBLEM IS ALREADY FIXED in vscode, the editor for babies who are afraid of the command line. (I'm kidding, kindof)

    But there's a much more important reason why I don't care about imagined macro secrutity problems raised by people who have never used a language with them, and it's this:



---

## THE THING WITH COMPUTER PROGRAMS:

# _THEY GET TO_
# _PROGRAM THE COMPUTER_



    THE THING WITH COMPUTER PROGRAMS IS THEY GET TO PROGRAM THE COMPUTER
    *pause*
    I feel we lose track of this point in the discussion around macros.

    But what if my program executes bad code.
    I don't know, what if it executes good code?



---






```shell
$ ./configure # code executing here
$ make        # code executing here
```

```shell
$ cargo build # code executing here
```



    Every build system needs to run arbitrary code, rust just made it first-class
    I know which I prefer



---

# THANK YOU







```rust
   ┌───────EMAIL─┐
   │ ┌─NAME      │
  @tris@namtao.com
  │     └───WEB──┤
  └─MASTODON─────┘
```






> [!TIP] Links
> 🌐 github.com/0atman
> 📼 youtube.com/@NoBoilerplate
> 🎤 namtao.com



    Thank you!



---

 