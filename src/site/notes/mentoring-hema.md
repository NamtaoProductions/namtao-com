---
{"dg-publish":true,"permalink":"/mentoring-hema/","hide":true,"noteIcon":"","updated":"2026-06-11T12:54:45.233+01:00","dg-note-properties":{"up":["[[Mentoring|Mentoring]]"],"pron":"heh-muh"}}
---

# Background

- bsc software engineering
- 

## Initial Email/chat



I am Hema, a software engineer early in my career. I appreciate your content materially and stylistically. I thought it would help to get some direct career guidance from you. I have already been working for a year and a half in a small startup as a junior rust engineer but I am disappointed at my rate of improvement over the past year. I used to pour hours into learning rust and other essential engineering concepts continuously but that has not held up as I have been having less time to dedicate for learning. I can no longer afford inefficient methods to up-skill myself and wish to have some structure to my process.   
  
I do not struggle with staying consistent or try to figure things out on myself. But finding the highest value skills/concepts to focus on has not been clear to me. I am comfortable reading technical books and/or any other media you believe to be most beneficial. My goal is to become a well rounded and high agency engineer that can take ownership of bigger projects while following battle tested design principles and methods of building that usually come from years of experience. I know there is a limit to how much you can "speedrun" expertise but I think I can do much better than my current rate.

# Overall Goals for Mentoring

## 1

## 2

# 2026-06-10 - 15:57

- needs more structure and consistancy
- 2y dev mostly in rust
- blockchain, async, decentralised
- got the basics
    - git
    - team comms
- but lacking in areas, well-rounding
    - don't mind a specialisation
- what can be ignored, what needs to be learned?
    - with ai tools a lot can be ignored
     
    - aware of the whole stack
    - did do algorithms and data structures
        - but don't have the specialist knowledge to be put it on the spot
        - 
- Hema also teaches students
- Take-home research, homework
     
-  T shaped people
    - specialist
        - Rust
        - rustlings
        - find your long loops
    - generalist
- ai tools are the oposite of katas
- wants to learn
    - scripting/makefile
    - infra
    - 



- Goals: what can be ignored, what needs to be learned?
    - Single specialism
        - high-performance Rust microservices
    - Broad familiarity
        - Transferable high-value full-stack compsci knowledge 

Let's patch up your computer science theory with what I think are forgotten foundational concepts and also my recommendations on how to learn these:

- FIRST: Recommendations on HOW to learn and how to think about learning, skip any you don't need:
    - According to Adam Savage, in his book Every Tool's A Hammer (read it!) it's all about tolerances
        - The Novice doesn't know when to have tight tolerances and when you can get away with being loose, so they muddle the two up. This causes sloppy work when they're being loose when they should be tight, as well as slow work even when they get it right.
        - The Journeyman is tight all the time. This makes their work of high quality, but it still remains slow.
        - The Master knows when to save time by cutting corners, and when nothing but the most careful tight tolerances are required, she uses them.
        - This is of course all about experience, and I think translates perfectly to software engineering
            - When to optimise an inner loop, 
                - or when to know You Ain't Gonna Need It
            - What jobs requires us to choose more comprehensive tools (such as precise modelling in Rust), or when we can get away with throwing something together quickly in, say, Ruby On Rails
    - I recommend becoming what Valve calls "T shaped people"
        - "jack of all trades, master of none, still better than the master of one!"
        - Generalist with a single specialism
        - Learn widely, certainly, but learn your day job tech deeply, you gotta get paid!
        - I first heard about T shaped people in <https://archive.org/details/ValveEmployeeHandbook>
    - Read Ultralearning, scott h young
        - https://www.scotthyoung.com/blog/ultralearning/
        - This book is PACKED with science-backed tips on how to learn fast, which you can apply to your software learning
        - read it as soon as you can, I wish I read it while I was still studying full-time (it's still super useful for my studying while working)
- SECOND: Levelling up your knowledge, recommendations and booklist:
    - Design Patterns
        - <https://en.wikipedia.org/wiki/Design_Patterns>
        - Called the "Gang of Four" book
        - Useful to know what they mean
        - One does not need to know the design patterns, but they should at least have forgotten them...
    - Structure and Interpretation of Computer Programs
        - Lambda Calculus is how to think about functions
        - Lisp is applied Lambda Calculus
        - Modern Functional programming languages (rust, javascript, haskell) inherit this directly from Lisp
        - Lambda Calculus video: <https://www.youtube.com/watch?v=eis11j_iGMs>
        - SICP is THE book to learn Lambda Calculus, if you want
            - do it in clojure or racket!
    - Computer Science crash course
        - LOVE this series
        - [https://www.youtube.com/watch?v=tpIctyqH29Q&list=PLH2l6uzC4UEW0s7-KewFLBC1D0l6XRfye](https://www.youtube.com/watch?v=tpIctyqH29Q&list=PLH2l6uzC4UEW0s7-KewFLBC1D0l6XRfye)
        - bite sized videos covering all of computer science
        - If you want to get a feel of the whole profession, history and all, it's a fantastic series
    - "The cathedral and the bazaar" by Eric S Raymond
        - "many eyeballs make all bugs shallow"
        - <https://en.wikipedia.org/wiki/The_Cathedral_and_the_Bazaar>
        - great musings on linux and open source
        - how did we get here
    - The Art of Unix Programming
        - Smart rules that never went out of style
    - Hackers: Heroes of the Computer Revolution
        - <https://en.wikipedia.org/wiki/Hackers>:_Heroes_of_the_Computer_Revolution
        1. An extremely cool book of first-hand accounts of the computer revolution that started when members of MIT's Tech Model Railroad Club got interested in the newly-delivered IBM 704 mainframe, and wondered if they might sneak in to the locked mainframe room at night and have a play...!
    - "The C Programming Language" book.
        - reads like a Victorian science book that couldn't assume ANY level of education!
        - so pretty
	- big O notation - common algorithmic complexity notation (how efficient an iterative process, such as sorting a list etc)
	    - fast fireship video intro
	        - https://www.youtube.com/watch?v=g2o22C3CRfU
	    - good tom scott video
	        - https://www.youtube.com/watch?v=RGuJga2Gl_k
	    - redis docs are a good example here
	        - note the 'time complexity' field
	        - https://redis.io/commands/hget/
    - Everything on:
        - https://12factor.net/#the_twelve_factors
        - http://www.extremeprogramming.org/rules.html
- The final boss, the ultimate interview question to test your foundational understanding of our whole world:
    - "After the user clicks a link, describe what happens in every layer as the packets are encapsulated and transmitted"
    - Know the full answer to this question and you will have completed your generalist computer wizard training!
    - The answer to the question would be structured around the 5-layer tcp model:
        - Application (HTTP requests)
        - Transport (TCP/UDP packets)
        - Network/Internet (IP packets)
        - Data Link (Ethernet frames)
        - Physical (VOLTAGES!)
    - A nice start for this would be: <https://www.geeksforgeeks.org/tcp-ip-model/>

 

 ---
- tooling
- unix/scripts/makefile/etc
- infra
