---
{"dg-publish":true,"dg-path":"ai-levels","permalink":"/ai-levels/","tags":["project/nb","project"],"noteIcon":"","updated":"2026-11-02T09:22:43.000+00:00","dg-note-properties":{"up":["[[Projects/No Boilerplate Index]]"],"tags":["project/nb","project"],"sr-due":"2026-07-21","start":"2026-07-19","due":"2026-07-20","state":"writing","priority":"normal","modified":"2026-10-17T19:13:57.302+02:00","image":"[[Resources/Meta/attachments/backrooms-2yellow-agents-monster.jpg]]"}}
---


 ---
 
 
 
 

 ---
- unix ai model
- Why are we stuck on front of a computer for the same reason we are stuck behind a piano
- instead of writing a program you can just ask ai this represents a new higher level of computation where its just on tap but it only works if you cover the earth with datacentres because of how computationally expensive it is to do on linux syscall might take millions of syscalls for llms to decide to run - why write a prompt to write a program if you can just write a prompt to do it
- If you make your own bricks your house will fall down ai always makes its bricks
- Ai vegan vegetarian pescataroan omnivoire

## Names
- rwexecute.com
- unixmodelai.com
- 0rwx
    - 0RWX

<!-- skip_slide -->
<!-- end_slide -->
Resize till you can just see the calibration line ⬇
<!-- new_lines: 20 -->

Calibration Line

---

![image:width:50%](/img/user/Resources/Meta/attachments/namtao-logo-1000.png)

<!-- end_slide -->
<!-- skip_slide -->
Hi friends my name is Tris and this is No Boilerplate, where I focus on fast, technical videos.

# WE HAVE TO TALK
## ABOUT HOW TO TALK ABOUT AI ART

<!-- new_lines: 1 -->

<!-- end_slide -->
<!-- skip_slide -->

Rant: Data centers water use job losses What the hell is happening

I use a simple mental framework to think about AI work which I'm calling the RWX framework.

---
<!-- new_lines: 1 -->

![image:width:100%](/img/user/Resources/Meta/attachments/screenshot-obsidian-writers-editing.png)

<!-- jump_to_middle -->
# STORY TIME

<!-- end_slide -->
<!-- skip_slide -->

Tell me if this has ever happened to you:

I was enjoying using a new Obsidian plugin for organising my writing, but kept finding that there was something strange with the software:

Things were not quite where I expected, features were slightly buggy or surprising, there was something entirely off about the whole thing.

The maintainer was helpful and responsive, always happy to talk and fix the bugs as I reported them, but when I came across the 3rd or 4th weird design decision, I realised that the problem ran deeper than just bugs.

# THE VIBES WERE OFF
<!-- new_lines: 1 -->

<!-- end_slide -->
<!-- skip_slide -->

I read more about the project and the maintainer, and quickly found a post confirming my initial suspicions: The plugin was vibe coded.
OK, that's disappointing, but I've used good vibe-coded software before. As a software engineer, I know that reliable systems can be made from unreliable parts.
Fine.
But what really hit me was when I realised that the maintainer was a WRITER, not a PROGRAMMER. They had vibe-coded the entire project not just without reading the code, but without any frame of reference to know what good code design should be.

This realisation caused two things:
1. I was greatly impressed that the state of technology and the attitude of this writer were such that non-programmers can now get exactly the software they want with no training, and
2. I uninstalled the plugin.

This experience was not the first time I'd had my heart broken.
I resolved to find a solution, a framework.
## Why Can't We Have Nice Things?

My early ideas about the RWX framework began, as so many things do, with reading a tweet by @mitchellh:

![i read the code.png](/img/user/Resources/Meta/attachments/i%20read%20the%20code.png)

This is facinating, and I have a number of comments.

Principly, I thought he didn't go far enough, I think it's more like:
## I ~~READ~~ _WRITE_ THE CODE

I WRITE the code, not just read it. Sure I might short-circuit a particulally cryptic error by digitally pair programming with a chat bot, but - personally - I prefer every character of what I write to be written by me.
This is the thesis of brainmade.org, head there for my previous thoughts on this topic.

But it's obvious that there are a few different levels you can work at, and an all-or-nothing approach lack nuance in discussion, my feelings on what is the RIGHT level for me, might not be the same as you, or, too often, YOUR boss.

And there is prior art here from the automotive industry regarding diverless car assistant levels:

---

## CAR ASSISTANT LEVELS
![image:width:100%](/img/user/Resources/Meta/attachments/self-driving-levels.png)

<!-- alignment: right -->

Source: `https://illuri-sandeep5454.medium.com/self-driving-cars-intro-6831192cd95d`

<!-- end_slide -->
<!-- skip_slide -->

they go:
- `zero`: no controls as a regular manual car
- `one`: feet off which is simple driver assist lane beeps and adaptive cruise control
- `two`: hands-off complex combined driver assist like autopilot and lane following
    - This is the current state of the art at time of recording, no matter what car company CEOs say
- `three`: eyes off automatic driving with human on standby this does danger avoidance
- `four: mind-off
    - Automatic driving, but only in controlled circumstances, like highway route following.
- And `five` is passenger.
    - Automated driving in all conditions and it never falls back to a human.
    - You never need to reach for the wheel.
    - This is a robot taxi like a Johnny cab from Total Recall.

---

<!-- new_lines: 6 -->
<!-- alignment: left -->
## ARE THERE
<!-- alignment: center -->
## "`AI ASSISTANCE LEVELS`"?

_`I think so!`_

---

## AI ASSISTANCE LEVELS

<!-- list_item_newlines: 2 -->

0. `NO AI USE`
    - _vscode/vim/etc - Painting with paint - playing music_
1. `I WRITE THE CODE`
    - _a research assistant: copilot questions - music LLM advice - AI Spell Checker_
2. `I READ THE CODE`
    - _do it while I watch - copilot autocomplete - refactoring / translation / change tense of prose / change style of music_
3. `I DON'T (OR CAN'T!) READ THE CODE`
    - _just do it for me, and I'll test it later - maybe. Claude Code, - building final track mp3_

<!-- new_lines: 1 -->

<!-- end_slide -->
<!-- skip_slide -->
 

- So are there AI assistance levels?
- This was my first attempt at mapping AI assistant to this driverless car assistant levels.
- Zero is, I think: with no AI use.
    - This is coding in Visual Studio Code, VIM, et cetera, or painting with real paint, playing and recording your own music.
- Level one is I make, where you get feedback from the AI.
    - You write everything.
    - You write the code, but you can ask co-pilot questions or if you're writing music, you can get LLM advice on chord progressions or influence or meter.
    - This is AI IntelliSense in your editor with advice on mistakes and tips and spelling like an AI spellchecker.
- Level two is I FIX.
    - This is where you have a co-writer.
    - There's a short AI writing loop, but you can still edit its output.
    - This is critical.
    - This is, I read the code.
    - This is Mitchell's level, level two.
    - Do it while I watch.
    - Write me 10 classes with all of these methods.
    - This is music loop building, chord progression, automation, refactoring or translating, changing the tense of prose, changing the style of your music.
- Level three is I CURATE.
    - You just decide on what output looks good.
    - This is Claude code.
    - You can't change the output.
    - You don't or can't read the code.
    - Do it and I'll read it later.
    - This is a music generation system.
    - Build me an entire album of Rage Against the Machine cover songs as though played by a funk band.
- And maybe there are higher levels, but I don't think they make sense.
- Just as in reality, higher levels kind of break down here.
- What would they even be?

The problem with existing methods is that they're based on this automotive model, which is based in fantasy!
We've been at level 2 for a decade, and it doesn't seem likely that we'll have full self driving cars any time soon.
Making a car kickflip is easy, making it not kill a skateboarder in the road is not.

And the problem with the higher levels is that the closer the automated cars get to perfection, the more dangerous they become on our streets.

---

# Bainbridge's 1983 Ironies of Automation

"Ironies of Automation" is a 1983 research paper by cognative psychologist Dr. Lisanne Bainbridge.

![japanese-train-driver-point-and-call.png](/img/user/Resources/Meta/attachments/japanese-train-driver-point-and-call.png)

 

pointing-and-calling; a system that reduces workplace errors by up to 85 percent.
_shisa kanko_

"Humans working without time-pressure can be impressive problem solvers. The difficult remains that they are less effective when under time pressure."

"...one is not by automating necessarily removeing the difficulties ... resolving them will require even greater technological ingenuitiy than does classic automation"

In it, she argues that once you autmate NEARLY all of the work of a system, the human becomes complacant and their skills atrophy. This means that it's very unlikely they will be prepared to jump in when the machine fails, and even if they do, their skills may not be up to the challenge any more.
Rather than automation empowering unskilled operators, Bainbridge argues that they actually need to be trained DIFFERENTLY, to be ready to identify the rare but vital times that their intervention is needed.
The operator's skillset switched from being expert a the task to being expert at monitoring the machine.

Do you see where I'm going with this?

- If agents write 99% correct code, but that cannot be supervised
- 99% is useless to me, I can't trust myself
- At high levels of automation, like with Claude Code, I think people who say they read the code are lying, they CAN'T.

---

## SO YOU BETTER KNOW HOW THEY ARE USING AI

---

# Presenting:
## The UNIX Model Of AI
<!-- new_lines: 1 -->

<!-- end_slide -->
<!-- skip_slide -->

## 0rwx.com

After a few months of refining my thoughts on this subject, please allow me to present my simplified UNIX permissions model of AI.

There are just 3 simple levels:

---
```sql
0. "ZERO"
    - I THINK
    - NO AI USE
    - vscode/vim/etc - Painting w/paint - playing music

1. "READ"
    - I MAKE
    - I WRITE THE CODE
    - a research assistant: copilot questions - music LLM advice - AI Spell Checker
    - Intellisense / Advice on mistakes / tips / spelling

2. "WRITE"
    - I FIX
    - I READ THE CODE
    - do it while I watch - copilot autocomplete
    - music loop building / chord progression automation
    - refactoring / translation / change tense of prose / change style of music

3. "EXECUTE"
    - I CURATE
    - I DONT (OR CANT!) READ THE CODE
    - Do it, and I will read it later - maybe
    - Claude Code - building final track mp3
```

<!-- jump_to_middle -->
# `LEVEL 0: DENY`
<!-- new_lines: 1 -->

<!-- end_slide -->
<!-- skip_slide -->

Level zero is DENY: AI has no access to your work, you write or paint as you have always done.


---

<!-- jump_to_middle -->
# `LEVEL 1: READ`
<!-- new_lines: 1 -->

<!-- end_slide -->
<!-- skip_slide -->

Level 1 is read-only permissions, you can question the AI and it can read your work, but only to advise you, not to write to it.
This is the limit of what I would consider brainmade.org, and my personal comfortable limit.

---

<!-- jump_to_middle -->
# `LEVEL 2: WRITE`
<!-- new_lines: 1 -->

<!-- end_slide -->
<!-- skip_slide -->
Level 2 is write permissions, the AI can make isolated changes to your work, but you still can check it

---

<!-- jump_to_middle -->
# `LEVEL 3: EXECUTE`
<!-- new_lines: 1 -->

<!-- end_slide -->
<!-- skip_slide -->
## 3: x
The final level is execute permissions, fully agentic, it writes your work opaquely.

The difference in these levels is not nescissarily about what TOOL you use, but your scrutiny of the generated work.

---

## Credit Where Credit's Due
0. No AI Credit
1. AI Research assistant
2. AI Co-writer
3. HUMAN research assistant, AI primary author

Each of these methods of interacting affords benefits and drawbacks, of course.

---

0. `I THINK`
    - _NO AI USE_
    - vscode/vim/etc - Painting with paint - playing music
1. `I MAKE`
    - _I WRITE THE CODE_
    - a research assistant: copilot questions - music LLM advice - AI Spell Checker
    - Intellisense / Advice on mistakes / tips / spelling
2. `I FIX`
    - _I READ THE CODE_
    - do it while I watch - copilot autocomplete
    - music loop building / chord progression automation
    - refactoring / translation / change tense of prose / change style of music
    - Code/sentance completion - Simplify/shorten paragraph
3. `I CURATE`
    - _I DON'T (OR CAN'T!) READ THE CODE_
    - do it, and I'll read it later - maybe
    - Claude Code - building final track mp3
4. I TRUST
    - The inmates are running the asylum
 

---

# Rationale

## 0. AI:NO
## 1. AI:READ
## 2. AI:WRITE
## 3. AI:EXECUTE

This framework is easy to explain, even to those with even a passing familiarity with the current technological situation.

Language is powerful, I have enjoyed using this simple framework to discuss mine and other's work without judgement or confusion.

# Notes
- Like cancer the web was born with the source of its downside: google
- It was very unfortunate that whales evolved oil it's also unfortunate that humans evolved something too

ceos think that ai is fine to use because they are novices ie they dont know when they need to be tight or loose craftspeople dont touch that shit because they do know

8:00

---

<!-- new_lines: 2 -->

![image:width:40%](/img/user/Resources/Meta/attachments/cc-zero-2k.png)

![AI0.png\|40](/img/user/Resources/Meta/attachments/AI0.png)
<!-- new_lines: 3 -->
## PUBLIC DOMAIN VIDEOS

<!-- new_lines: 1 -->

> [!NOTE] &nbsp;Notes
> - For all [links](), read my scripts at www.namtao.com
> - All footnotes<sup>1</sup> are in the video description.

<!-- column_layout: [5,1] -->
<!-- column: 0 -->
<!-- column: 1 -->

<!-- new_lines: 0 -->

<!-- reset_layout -->

<!-- end_slide -->
<!-- skip_slide -->

I dedicate my video scripts to the public domain.

Everything you see here: script, links, and images are part of a Markdown document available freely on my website, namtao.com, and github.

---

%%
# state: DRAFT
# Patreon

![image:width:30%](/img/user/Resources/Meta/attachments/patreon.png)
## [Support me on Patreon](http://www.patreon.com/noboilerplate)

 
- nb support on patreon
- 📼 Early, longer, and more detailed videos
- 👨‍🏫 1:1 Mentoring over video chat. Email: mentoring@namtao.com
- ❤️ My infinite gratitude for allowing me to continue making these videos

<!-- end_slide -->
<!-- skip_slide -->

It's just me running this channel, and I'm so grateful to everyone for supporting me on this wild adventure.

If you'd like to see and give feedback on my videos up to a week early, as well as get private discord access, and even your name in the credits, it would be very kind of you to check my Patreon.

I also offer regular mentoring. If you'd like 1:1 tuition on Obsidian, personal organisation, programming, creative production, or anything that I talk about in my videos, do sign up and let's chat!

---

# PODCAST SHOUTOUT
 ---

<!-- end_slide -->
<!-- skip_slide -->

whatever seems relavent

---
# Thank You

<!-- end_slide -->

To all my patrons, you make this possible!

```rust
let producers: [&str; 0] = [];
let sponsors = [
 "Jaycee"
];
let patrons: [&str; XXX];
```

I'd be very grateful for your support on:
- [Patreon](http://www.patreon.com/noboilerplate)
- [Ko-Fi](https://ko-fi.com/noboilerplate)
- [Gumroad](https://namtao.gumroad.com)

<!-- skip_slide -->

If you would like to support my channel, get early ad-free and tracking-free videos, your name in the credits or 1:1 mentoring, head to my patreon or ko-fi.

If you're interested in transhumanism and hopepunk, please check out my weekly sci-fi audiofiction podcast, Lost Terminal.

If you like urban fantasy, I produce a wonderful podcast called Modem Prometheus.
I just finished Season 3 of The Phosphene Catalogue, if you like mysteries and art, check it out!

Transcripts and compile-checked markdown sourcecode are available on namtao.com and github, links in the description, and corrections are in the pinned ERRATA comment.

Thank you so much for watching, talk to you on Discord.

---

 