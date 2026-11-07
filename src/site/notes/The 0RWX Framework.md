---
{"dg-publish":true,"dg-path":"0rwx","permalink":"/0rwx/","tags":["project/nb","project"],"noteIcon":"","updated":"2026-11-07T16:47:43.831+00:00","dg-note-properties":{"up":["[[Projects/No Boilerplate Index]]"],"tags":["project/nb","project"],"sr-due":"2026-07-21","start":"2026-07-19","due":"2026-07-20","state":"writing","priority":"normal","modified":"2026-10-17T19:13:57.302+02:00","image":"[[Resources/Meta/attachments/backrooms-2yellow-agents-monster.jpg]]"}}
---

<!-- new_lines: 7 -->

<!-- bg_image: {path: Resources/Meta/attachments/ddg-ai-headlines-results.png, fit: cover, opacity: 5} -->
# WE HAVE TO TALK
## ABOUT HOW TO TALK ABOUT AI

<!-- end_slide -->
<!-- skip_slide -->

<!-- bg_image: {path: "Resources/Meta/attachments/ddg-ai-headlines-results.png", fit: cover, opacity: 20} -->

Data centres, water use, job losses-
What the hell is happening, and more importantly: HOW do we talk about it sensibly?
I don't have time to explain the former, but I hopefully can help with the latter:

I have a simple mental framework to think and talk about AI work, which I'm calling 0RWX.

---

<!-- font_size: 5 -->
<!-- alignment: left -->

<!-- column_layout: [2,5] -->
<!-- column: 0 -->
<!-- column: 1 -->
# 0. N`0`NE
# 1. `R`EAD
# 2. `W`RITE
# 3. E`X`ECUTE
<!-- reset_layout -->

<!-- end_slide -->
<!-- skip_slide -->

This framework is easy to explain, even to those with just a passing familiarity with the current STATE of tech, you can probably guess already, and it is broadly applicable to any kind of generative AI tool.

Language is powerful, I have employed this simple framework to discuss my and other's work without judgement or confusion over the last 6 months

But why did I need this in the first place?

---

<!-- bg_image: {path: Resources/Meta/attachments/screenshot-obsidian-writers-editing.png, fit: contain, opacity: 20} -->

<!-- new_lines: 2 -->

<!-- jump_to_middle -->
# STORY TIME

<!-- end_slide -->
<!-- skip_slide -->

Tell me if this has ever happened to you:

I was enjoying using a new Obsidian plugin for organising my writing, but kept finding that there was something strange with the software:

Things were not quite where I expected, features were slightly buggy or surprising, there was something entirely off about the whole thing.

The maintainer was helpful and responsive, always happy to talk and fix the bugs as I reported them, but when I came across the 3rd or 4th weird design decision, I realised that the problem ran deeper than just bugs.

---

<!-- new_lines: 5 -->
# THE VIBES
# WERE `OFF`
<!-- new_lines: 1 -->

<!-- end_slide -->
<!-- skip_slide -->

I read more about the project and the maintainer, and quickly found a post confirming my initial suspicions: The plugin was vibe coded.
OK, that's disappointing, but I've used good vibe-coded software before. As a software engineer, I know that reliable systems can be made from unreliable parts.
Fine.

But what really hit me was when I realised that the maintainer was a WRITER, not a PROGRAMMER. They had vibe-coded the entire project not just without reading the code, but without any frame of reference to know what good software design should be in the first place.

This realisation caused two things:
1. I was greatly impressed that the state of technology and the attitude of this writer were such that non-programmers could now get exactly the software they want with no training, and
2. I uninstalled the plugin.

This experience was not the first time I'd had my heart broken.
And the cause was LABELLING not vibe coding itself.
I resolved to find a framework-

---

<!-- bg_image: {path: Resources/Meta/attachments/loss-abstract.jpg, fit: cover, opacity: 10} -->

<!-- font_size: 4 -->
<!-- alignment: left -->

<!-- column_layout: [2,5] -->
<!-- column: 0 -->
<!-- column: 1 -->
## `1.` DENIAL
## `2.` ANGER
## `3.` BARGAINING
## `4.` DEPRESSION
## `5.` ACCEPTANCE

<!-- jump_to_middle -->
<!-- font_size: 1 -->
<!-- new_lines: 13 -->
<!-- alignment: right -->

(i refuse)

<!-- reset_layout -->

<!-- end_slide -->
<!-- skip_slide -->

That wasn't just the stages of grief.

---

![image:width:100%](/img/user/Resources/Meta/attachments/i-read-the-code.png)

I READ THE CODE - Mitchell Hashimoto, iconic meme lord

<!-- end_slide -->
<!-- skip_slide -->

My early ideas about the 0RWX framework began, as so many things do, with reading an iconic tweet by @mitchellh:

This is fascinating, and I have a number of comments.

I liked "I read the code" on principle, but I thought he didn't go far enough, I wanted something more like:

---
<!-- jump_to_middle -->
## `I` ~~READ~~ `WRITE THE CODE`
<!-- new_lines: 1 -->
(see `brainmade.org` for more detail)
<!-- end_slide -->
<!-- skip_slide -->

I WRITE the code, not just read it.

Sure I might short-circuit a particularly cryptic error by digitally pair programming with a chat bot, but - personally - I prefer every character of what I write to be written by me.
This is the thesis of brainmade.org, head there for more of my thoughts on this topic.

BTW, I'll mostly be using programming examples in this video because that's what I'm familiar with, but the problems that using 0RWX solves are the same for anything you write, from a song to a sonnet.

It's obvious that there are a few different levels of AI you can work with, and an all-or-nothing approach lacks nuance in discussion.
My feelings on what is the right level for ME, might not be the same as you, or, too often, YOUR boss.

---

<!-- new_lines: 1 -->
 ---
<!-- new_lines: 1 -->

<!-- font_size: 2 -->

<!-- column_layout: [1,2,3] -->
<!-- column: 0 -->
<!-- column: 1 -->
<!-- alignment: left -->

🌱 VEGAN

🥛 VEGETARIAN

🐟 PESCETARIAN

🍔 OMNIVORE

<!-- column: 2 -->

_strictly no ai_

_no ai (exceptions apply)_

_certain kinds of ai_

_any ai_
<!-- reset_layout -->

<!-- end_slide -->
<!-- skip_slide -->

I wanted to find a few simple terms like the ones that we use at a restaurant when ordering food for the table:

- "I'm vegan, but you go ahead, I'll order the food that I'm comfortable with"
- "Any vegetarians in the party?"
- "You're pescetarian right?"
- "I'll eat anything!"

It's easy to use these terms to figure out our individual preferences for what we put in our bodies.

This is what I want for AI.
And there is prior art here from the automotive industry regarding diverless car assistant levels:

---

 ---
![image:width:100%](/img/user/Resources/Meta/attachments/self-driving-levels.png)

<!-- alignment: right -->

Source: `https://illuri-sandeep5454.medium.com/self-driving-cars-intro-6831192cd95d`

<!-- end_slide -->
<!-- skip_slide -->

The 5 levels are:
- `zero`: no controls as a regular manual car
- `one`: simple driver assist lane beeps and adaptive cruise control
- `two`: complex combined driver assist like autopilot and lane following
    - This is the current state of the art at time of recording, no matter what car company CEOs say
- `three`: automatic driving with human on standby this does danger avoidance
- `four`: Automatic driving, but only in controlled circumstances, like highway route following.
- `five`: Automated driving in all conditions, never falling back to a human.
    - This is a robot taxi like a Johnny cab from Total Recall

---

<!-- alignment: left -->

 ---

![image:width:80%](/img/user/Resources/Meta/attachments/self-driving-levels.png)

<!-- alignment: right -->

 ---

<!-- new_lines: 1 -->

<!-- end_slide -->
<!-- skip_slide -->

The problem with existing AI categorisation methods is that they're based on this automotive model, which is based in fantasy!
We've been at level 2 for a decade, and it doesn't seem likely that we'll have full self-driving cars any time soon.

Making a car kickflip is easy, ensuring it never kills a skateboarder in the street is not.

And the issue with higher levels is that the closer the automated cars get to perfection, paradoxically, the more dangerous they become on our streets.

---
<!-- new_lines: 5 -->

<!-- font_size: 2 -->

> [!IMPORTANT] "...one is not by automating necessarily removing the difficulties ... resolving them will require even greater technological ingenuity than does classic automation"

<!-- alignment: right -->

<!-- font_size: 1 -->
_"Ironies of Automation"_, Dr. Lisanne Bainbridge, 1983

<!-- new_lines: 1 -->

<!-- end_slide -->
<!-- skip_slide -->

This effect is famously described in the 1983 paper, Ironies of Automation, by Lisanne Bainbridge.
(and I promise this is relevant to AI)
In it, she argues that once you automate NEARLY all of the work of a system, the human becomes complacent and their skills atrophy, and there senses dull.
This means that it's very unlikely they will be prepared to jump in when the machine fails, and even if they do, their skills may not be up to the challenge any more.

---

![image:width:100%](/img/user/Resources/Meta/attachments/japanese-train-driver-point-and-call.png)

_shisa kanko_, pointing-and-calling

<!-- new_lines: 1 -->

<!-- end_slide -->
<!-- skip_slide -->

Rather than automation empowering unskilled operators, Bainbridge argues that they actually need to be trained DIFFERENTLY, to be ready to identify the rare but vital times that their intervention is needed.

This is like the Japanese rail system of _shisa kanko_, pointing-and-calling; a simple procedure that reduces errors by up to 85 percent (and is even used in the NYC metro)

When automation becomes close to perfect, the operator's skillset switch from being expert at the task to being expert at monitoring the machine doing the task.

Do you see where I'm going with this?

> At high levels of AI automation, like with Claude Code, I think people who say they read the code are lying to themselves, they CAN'T.
> Not any more, anyway.
> They have become an unreliable narrator of their own experience.

---

<!-- new_lines: 4 -->

## "CLAUDE TESTED IT FOR ME"

# `DOESN'T CUT IT`

## BE `SPECIFIC`

---

<!-- new_lines: 6 -->

# `0 R W X`

<!-- jump_to_middle -->
<!-- alignment: right -->

`.com`&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

<!-- alignment: center -->
## THE UNIX MODEL OF AI

<!-- end_slide -->
<!-- skip_slide -->

## 0rwx.com

After a few months of refining my thoughts on this subject, please allow me to present my simplified model of AI categories, inspired by unix permissions.

There are just 4 simple levels:

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
# `LEVEL 1: READ`
<!-- new_lines: 1 -->

<!-- end_slide -->
<!-- skip_slide -->

Level 1 is read-only permissions, you can question the AI, and it can read your work, but only to advise you, not to write to it.
This is the limit of what I would consider brainmade.org, and my personal comfort level for my projects.

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
# `LEVEL 2: WRITE`
<!-- new_lines: 1 -->

<!-- end_slide -->
<!-- skip_slide -->
Level 2 is write permissions, the AI can make isolated changes to your work, but you still can check it

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
# `LEVEL 3: EXECUTE`
<!-- new_lines: 1 -->

<!-- end_slide -->
<!-- skip_slide -->
## 3: x
The final level is execute permissions, fully agentic, it builds your work opaquely.

The difference in these levels is not necessarily about what TOOL you use, but your ability to scrutinise the generated work.

I belive a labelling system is important for domain experts working with AI in a healthy way, and like with most things, it's about TOLERANCES.

---

<!-- bg_image: {path: Resources/Meta/attachments/savage-explosion.jpg, fit: cover, opacity: 5} -->

<!-- new_lines: 1 -->
IT'S ABOUT:
# TOLERANCES
<!-- new_lines: 1 -->

<!-- font_size: 2 -->
- _The `Master` knows when it is safe to cut corners_
- _The `Journeyman` must do everything the hard way_
- _The `Novice` cuts the wrong corners_

<!-- alignment: right -->
<!-- font_size: 1 -->
<!-- new_lines: 6 -->

My summary of Adam Savage's advice in `Every Tool's A Hammer (2019)`

<!-- end_slide -->
<!-- skip_slide -->

CEOs and managers DON'T know how to actually do the work, so think all that AI is fine to use because it speeds them up.
But they are novices, that is, someone who, according to Adama Savage, doesn't know when they need to employ tight or loose tolerances. Professionals know when the corners can be cut.
BUT ONLY IF WE KNOW THE CORNERS ARE BEING CUT, and that requires clear language.

---

<!-- new_lines: 6 -->

<!-- column_layout: [1,1,1,1] -->
<!-- column: 0 -->
![image:width:100%](/img/user/Resources/Meta/attachments/AI-0.png)
<!-- column: 1 -->
![image:width:100%](/img/user/Resources/Meta/attachments/AI-R.png)
<!-- column: 2 -->
![image:width:100%](/img/user/Resources/Meta/attachments/AI-W.png)
<!-- column: 3 -->
![image:width:100%](/img/user/Resources/Meta/attachments/AI-X.png)
<!-- reset_layout -->
<!-- font_size: 1 -->
<!-- new_lines: 3 -->
_icons available for download at `0rwx.com`_

<!-- end_slide -->
<!-- skip_slide -->

I've made a some simple icons available on 0rwx.com, for you to use to mark your own work, to clue others into what level of AI automation was used in your projects.

But unlike brainmade.org, this is not necessarily a virtue-signalling farm-to-table mark, I think it's most useful used in conversation to clarify your thinking and avoid confusion.

---

<!-- new_lines: 3 -->

 ---
<!-- font_size: 2 -->
<!-- alignment: center -->

<!-- new_lines: 1 -->
- `0` I made this
- `r` with help from an _AI assistant_
- `w` with help from an _AI Co-writer_
- `x` _AI made this_, with help from a _human assistant_

<!-- end_slide -->
<!-- skip_slide -->

If the framework doesn't vibe with you, then consider using the language of accreditation:
1. At the _read_ level, credit an AI research assistant, someone who aided you while you made your work
2. If AI-generated work ends up in your final project, then credit IT as a co-writer
3. And if the project was mostly AI-written, own it, don't be that guy in the group project getting equal credit for no work!

---

<!-- bg_image: {path: Resources/Meta/attachments/0rwx-screenshot.png, fit: cover, opacity: 20} -->

<!-- new_lines: 8 -->
# 0RWX.COM
<!-- new_lines: 1 -->

<!-- end_slide -->
<!-- skip_slide -->

I ended my first video on AI, "The Second Renaissance" published 5000 years ago in 2022, by asking the question

> What would you do, if you could do it all?

We now have that answer, and it's not all sunshine and rainbows. It's not even all slop and bankrolls.

We need new language to talk about large language models, and I hope the 0rwx framework makes it just a little easier.

 