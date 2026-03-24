---
{"dg-publish":true,"permalink":"/obsidian-learning-part-ii-process/","tags":["project/nb"],"noteIcon":""}
---

<div style="position: relative; padding-top: 56.25%;"><iframe title="Obsidian For Learning II: Process" width="100%" height="100%" src="https://makertube.net/videos/embed/sJXLLnyHbKqabxsKtHBhGM?warningTitle=0" style="border: 0px; position: absolute; inset: 0px;" allow="fullscreen" sandbox="allow-same-origin allow-scripts allow-popups allow-forms"></iframe></div>

I was tempted to start this whole video at the end because most other guides start at note-taking and then trail off and handwave the most important part, the process.
And if you just take notes but don't do anything with them, that won't get you to where you need to be.
The biggest unanswered question in nearly every book, article, and video on note-taking I have seen is:






```mermaid
flowchart TD

    style B stroke-width:4px,fill:#333,stroke:#42affa

    A[TAKE NOTES]  B
    B[DRAW THE REST OF THE OWL]  C[PROFIT]
    
    B@{ shape: braces }
    
```

Thanks! I hate it




WHAT DO YOU DO AFTER YOU HAVE TAKEN NOTES?!

WHO CARES if you've got a beautifully-filed and linked web of notes, organised by tags and folders and themes and dewy decimal - or whatever!?

How does that help you write and learn? Where do you even start?

Well, to misquote the great Carl Sagan, before you can write an essay from scratch, you must first invent the universe:

ATOMIC NOTES
===
 ---
 ---




We are going to forge our work, essays, exam revision, books, or even video scripts, from atomic notes.

You may have heard of this concept before, perhaps as 'smart' or 'main', or 'permanent' notes, the core unit of the Zettelkasten system, an interlinked web of knowledge, with the information digested, deconstructed and rebuilt in your own words, in your own image.
Many books on note-taking talk about what makes these kinds of notes good, but I think all qualities are downstream of these two principle features of atomic  
2. Each note doesn't require reading lots of other notes to understand, they are loosely coupled to each other.

---



```mermaid
flowchart TD
style COMPILER stroke-width:4px,fill:#333,stroke:#42affa

NOTE1 COMPILER
NOTE2 COMPILER
NOTE3 COMPILER

COMPILER  ESSAY
```

_(In Zettelkasten, compiler is YOU!)_




Atomic Notes are the compiler artefacts of our learning, before they have been linked together into their final form.
When I was at university, they taught us that good software modules are well-written if they have:
- High cohesion, and
- Low coupling
That is, the parts work well together, but are flexible enough to be reused in multiple programs.
If a computer program is a composition of modules, the outputs of our system, like an essay, will be a composition of atomic notes.

---




![image:width:100%](/img/user/Resources/Meta/attachments/screenshot-learning-graph-atomis.png)





🔵 Atomic &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
🔴 Literature &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
🟡 Fleeting




I have taken this part of the FLAP system directly from the Zettelkasten notetaking method, from the best book on the subject, A System for Writing, by Bob Doto.

These small, self-contained notes hold our best understanding of a topic, written in our own words, as simply as possible (but no simpler).
One of the oft-claimed benefits of a mature notes system like Zettelkasten is that you never need to start from scratch: The notes are already written in your words, so you can simply stack them up in a reasonable order, write the glue and you've got a first draft.

Though the graph is a good illustration here, day-to-day, it doesn't actually scale, by the time you've got 30 or 40 notes, it's all too crowded to read the names.
What DOES scale is the original metophor:

---
![image:width:100%](/img/user/Resources/Meta/attachments/screenshot-yt-morganeua-zk.png)


Source: @morganeua `youtu.be/ugxcbsgjEHI`




The Zettelkasten system was originally a way of organising notes on paper, inside a linear card file, like this small demonstration here by fellow YouTuber Morgan (who makes really great videos on using her zk to write her PhD, btw.)

Notice how on paper there is no graph to browse?
Though zk paper notes do include numerical references to others in the box, creating a logical graph, the primary browsing and retrieval was done by thumbing through the cards, flicking through the titles and jumping to clumps of related knowledge.

---








This is

SO easy

to scroll

👉



![image:width:100%](/img/user/Resources/Meta/attachments/screenshot-obsidian-virt-folder.png)






Here you can see the visualisation of the tree inside my Obsidian using the [virt-folder](https://github.com/gr0grig/obsidian-virt-folder) plugin, a recent addition to my system.
This is better than a graph because I don't have any buttons for navigating graphs  on my computer.
But I do have a scroll wheel on my mouse.

OK, let's zoom into one of these atomic  
---

 ---

![image:width:100%](/img/user/Resources/Meta/attachments/screenshot-writing-notes-clarifies-your-thinking.png)




This is a mature example of one of my Atomic notes.
I will highlight a few key features, and we'll deep-dive later on.
- The filename is written with enough detail to remind you next week when you scroll past it, but the body has enough detail to remind you in a year, after you've forgotten the specifics
- The uplink is set to slot this note next to a closely related note, storing trains of related thought close to each other
- The `#atomic` tag allows for each searching and filtering
- A see-also section contains links to related atomic notes
- And there are references to other literature notes, either in my vault or links out onto the internet

---

## MY NOTES USE:




| OBSIDIAN FEATURE  | PURPOSE   |
| ----------------- | --------- |
| `up: [[Uplinks]]` | Structure |
| `#tags`           | Type      |
| `filenames.md`    | Identity  |




I use:
- uplinks for structure, where do my notes live.
- Tags for the type of note, atomic or project etc
- Filenames for identity, not IDs not datestamps, human-readable summaries that can jog your memory of the learning contained in the note without having to open it.

As I explained in the previous video, my system has 3 parts:




 ---


```mermaid
flowchart TD


    subgraph CAPTURE
        F@{ shape: card, label: "#Fleeting Notes" }
        L@{ shape: card, label: "#Literature Notes" }
    end
    
    subgraph PROCESS
        A@{ shape: database, label: "#Atomic Notes" }
        P@{ shape: processes, label: "Projects" }
    end 
        L |Reference from| A
        F |Process Into| A
    
    subgraph WRITE
        A |Compose Into| P
        P |Write| X@{ shape: documents, label: "Essays" }
        P |Write| Y@{ shape: documents, label: "Dissertations" }
        P |Write| Z@{ shape: documents, label: "Exam Revision" }
        P |Think| ZZ@{ shape: documents, label: "Ideas" }
    end
```




> 1. CAPTURE: Take notes on Lectures, Literature, and your own Fleeting thoughts.
> 2. PROCESS: Use these to write an interlinked network of Atomic notes in your own words.
> 3. WRITE: Compose clusters of Atomic Notes into Essay outlines, Exam revision or all kinds of writing and thinking with a lightweight Project management system that I can scale from 1 to 1000 ongoing projects.

In Obsidian, I use no folders and only 4 tags:
- Fleeting notes tagged `#fleeting`
- Highlights tagged `#literature`
- atomic notes tagged `#atomic`
- Projects tagged `#project`

In part 1 I focused on the inputs to this system, capturing your thoughts into fleeting notes, and other people's thoughts as literature notes.
Today, we're going to focus on processing those raw notes into atomic notes.



PART 1
===
## _THE PROCESS_

_a single trusted system_




The process that I aim to teach you today revolves around building a daily practice of distilling atomic notes, which will, over time, become a single trusted system.
I will demo what this looks like practically using Obsidian towards the end of the video.

The wording "Single Trusted System" is something I've borrowed from David Allan's legendary book from 2001, "Getting Things Done".

---


## A SINGLE TRUSTED SYSTEM




📥 Stored in 1 place&nbsp;

✅ Processed reliably




There are two vital components to your fleeting notes system:

1. Your Notes Must only Be Stored in a SINGLE place
2. You Must Process Them RELIABLY, Never Missing Anything

If you have multiple places where you store fleeting notes, such as apple notes AND messages to yourself, then you can never be certain you have checked everything, as perhaps the other place might have some new information for you.
Our eyes can only read one thing at a time, and our brains know this.
Multiple places to check has us running around the hamster cage, mimicking the sad state of social media, where there are 5 apps each with screenshots of the other 4 on.
No, to process your notes, you must make a single trusted system.

Here's mine:

---

 ---




```mermaid
flowchart TD 
    subgraph SYSTEM INPUTS
        Fleeting@{ shape: docs, label: "#Fleeting" }
        Literature@{ shape: docs, label: "#Literature" }
    end
    
    style Atomic stroke-width:4px,fill:#333,stroke:#42affa
    style Fleeting stroke-width:4px,fill:#333,stroke:#42affa
    style Literature stroke-width:4px,fill:#333,stroke:#42affa
    Atomic@{ shape: database, label: "#Atomic Notes" }
    IsAtomic@{ shape: braces, label: "Atomic, teachable unit of knowledge?" }
    DDDD@{ shape: processes, label: "Delete/Delegate/Defer/Do" }
    
    Fleeting ==> IsAtomic 
    IsAtomic ==>|yes: process into| Atomic
    IsAtomic |no: do it| DDDD
    Literature ==>|reference from| Atomic
```






`#literature` notes are linked to from new `#atomic` notes

`#fleeting` notes are rewritten to `#atomic` &nbsp;
(or done/deleted)

_(fleeting notes can be lecture or meeting notes, anything that makes sense for your work and life)_







Like the mason, we have dragged all the stone we need into our workshop, but the real challenge begins now.
During this process, our Literature and Fleeting notes are the raw materials we will hone into a useful form: Atomic notes.

There are two main parts of the process:

1. Fleeting notes get rewritten to atomic notes, keeping the original wording of the thought as reference, then are tagged `#atomic`
2. `#literature/unfiled` notes are linked to from new atomic notes, then retagged `#literature` for long-term reference

You must do this process daily, this is especially important for fleeting notes, as they could contain urgent tasks.

---


## THE TEMPORAL CONTRACT


```mermaid
flowchart LR
    style B stroke-width:4px,fill:#333,stroke:#42affa
    A[PAST SELF] |Write Notes| B
    B[PRESENT SELF] |Write Notes| C[FUTURE SELF]
```



1. Write notes to yourself
2. Process them daily




They're urgent because the 'you' of yesterday is counting on the 'you' of today to fulfil the temporal contract.

Yesterday's self had the easy job, throw some random words into a note and tag it fleeting, or make some highlights while reading, but now, you must process them.

---



 ---



_"Sometimes you feel drawn to an idea, but don’t know why... you can always come back to the capture and see if its relevancy has increased."_



Bob Doto, [[Resources/Research/Readwise/A System for Writing\|A System for Writing]]




And processing every little thought that comes to us, and every highlight from books we read, podcasts we listen to, and videos we watch can quickly become overwhelming.
And here, I propose an unusual solution.

There will naturally be fleeting notes that you can't quite understand why you wrote down, or highlights that don't seem very relevant now, in the cold light of day.
Zettelkasten is all about following your interests, so what do you do when they change?

You could refile these snoozed fleeting ideas or thought or highlights into a different list or tag or whathaveyou, but this list will spiral out of control in due course, and then you'll be back to an overflowing list of impossible to face thoughts and ideas, and you may bounce off the system entirely.

I have a better method based on misusing spaced repetition.

---


&nbsp; 1st  2nd     3rd        4th                     5th repetition

![image:width:100%](/img/user/Resources/Meta/attachments/spaced-rep-output.png)


Time

Image Credit: Taalhammer.com






I'm sure you know about spaced repetition
It's the effect whereby each time you revise something, you increase the amount of time you retain it, eventually flattening the forgetting curve to nearly horizontal - you've moved the information from short-term to long-term memory.

It's a marvellous technique, and the only one I have found that works for me.

---


![image:width:100%](/img/user/Resources/Meta/attachments/spaced-rep-plugin.png)




You should certainly become familiar with Stephen Mwangi's excellent Obsidian plugin, [Spaced Repetition](https://github.com/st3v3nmw/obsidian-spaced-repetitio) to aid in your studies, however I also use it for managing my fleeting note backlog.

Let me show you how to use it,
But if you want to get started immediately, I have compiled all of this into an obsidian vault you can download and use straight away, available for anyone who supports me on my Patreon.



PART 2
===
 ---




## Processing Fleeting Notes Demo
Finally, what does this all look like?
I've been a bit abstract so far, but an example will make it clear.
Join me in my daily processing.

---
![image:width:100%](/img/user/Resources/Meta/attachments/screenshot-student-open-note-review.png)




In the morning, I open my notes for review, using this command from the spaced repetition plugin.

---
![image:width:100%](/img/user/Resources/Meta/attachments/screenshot-student-review-fleeting.png)



Then I select fleeting, I'm not revising my atomic notes just yet.

---

![image:width:100%](/img/user/Resources/Meta/attachments/screenshot-student-ask-mum.png)



And the first due fleeting note is opened by the plugin, which in this case is:
"Ask mum when she is free for a catchup chat"

The first you run the note review, you'll of course have to go through and 'review' every note tagged `#fleeting`.
The sooner you do this, the better!

But as you review each note as good/medium/hard (which in our world means "snooze for a while/short time/tomorrow) you will find that on each subsequent day, you are only reviewing the fleeting notes that you thought were most important to process, not the whole damn list.

Back to this fleeting note, "Ask mum when she is free for a catchup chat":
My job now is to decide, quickly, what to do with this fleeting note that past tris wrote for me.
This one is simple.
If the fleeting note is a task that will take less than 2 minutes, do it there and then.
So for this, I'll send mum a quick message, then the task is done.
I delete this fleeting note, and re-run the spaced repetition command to get the next one.

---
![image:width:100%](/img/user/Resources/Meta/attachments/screenshot-student-buy-milk.png)



OK, "Buy oat milk"
If the task belongs to a different project, like here, a shopping list, I copy and paste it into another note, and delete this fleeting note and re-run spaced repetition command as before.

---

![image:width:100%](/img/user/Resources/Meta/attachments/screenshot-student-divine-base.png)



"Struggle with the dichotomy between my divine self and base self" HMM!
Sometimes, like here, it's difficult to figure out what to do with a fleeting note.
We're not the same person we were yesterday I suppose!
In this case, don't stress about it, just snooze it.
Future me can figure this one out I'm sure!

---

![image:width:100%](/img/user/Resources/Meta/attachments/screenshot-student-review-later.png)



To snooze this fleeting note, I review it using the spaced repetition plugin as "easy", or as I've renamed it in the plugin settings, to "later".
It's all the same, whatever spaced repetition you use - you could even use Anki if you want - this note will be scheduled to be reviewed in the future.
And hopefully I will have figured it out by then!

After I run this review command the note is changed:

---

![image:width:100%](/img/user/Resources/Meta/attachments/screenshot-student-all-caught-up.png)



Look at the  new properties added to the note.
We can see that I won't see it in my morning note review sessions for more 4 days, at time of recording.
Not only is the due date set, but so are two other numbers, which allow the plugin to keep track of the cumulative difficulty, or in our case, urgency, of the note.
Don't worry about the exact properties that the plugin sets, rest assured that it will snooze notes reliably and without you having to worry about exact dates.

---

## FLEETING NOTES MUST SCALE



![image:width:100%](/img/user/Resources/Meta/attachments/screenshot-obsidian-search-my-fleeting.png)


_(I'm honestly surprised I have so many, I review < 10 per day, plus any new fleeting notes from yesterday)_




After a few days of doing this, you'll have a much shorter list, only featuring the things you have consistently ranked as "hard" (ie, urgent). Now is the time to slow down and actually DO these tasks, or perhaps file or research them. Deleting is a great option too, if they can't be done, or don't make sense anymore.

The reason I process my fleeting notes like this, not just reading the list, is that I need something that SCALES.
If you are to trust that your system will work in the long run, then you need a scalable system, too.

---

![image:width:100%](/img/user/Resources/Meta/attachments/screenshot-student-earnest.png)



 ---
Some tasks must be done later on, and should be added to an existing project or, like here, captured in another note.

---

![image:width:100%](/img/user/Resources/Meta/attachments/screenshot-student-watch-list.png)



The solution here was to cut and paste the fleeting thought into the appropriate note.
More advanced project management with due dates and start dates I'll go into detail in the last video in this series, but it's in the patreon vault already if you'd like to give it a go now.

---

![image:width:100%](/img/user/Resources/Meta/attachments/screenshot-student-ramella.png)



 ---
Capturing what other people have said is as important to the student as it is for the teacher or office worker or someone who just wants to help out a friend:
- lectures
- talks
- interviews
- youtube videos
- podcasts
These kinds of notes are scattered and informal, they have to be: When you were writing them, your attention was on the other person speaking, where it should have been.
But now, when their words are still fresh in your mind, is the time to go through your notes and expand them into atomic notes, or tasks that are either further fleeting notes or added to a specific project, as before.

---

![image:width:100%](/img/user/Resources/Meta/attachments/screenshot-student-fleeting-writersblock.png)



 ---
- good thoughts? expand into atomic
- not enough? leave as fleeting and snooze

Finally we have an example of a fleeting thought that is perfect to expand into an atomic note:
"Writer's block is caused by reader's block"
Interesting.

The method is simple:

---

![image:width:100%](/img/user/Resources/Meta/attachments/screenshot-student-writers-atomic.png)



Here, I've taken this idea and expanded it in my own words, cross-referencing to other notes as I find them, and keeping the original capture as reference.
I have also changed the tag from fleeting to atomic.
HOWEVER, what makes the Zettelkasten method so useful is that we now find a place to file this note.
Not in a folder bunched together with other files, nor drifting aimlessly in a sea of notes, only loosely connected by the links between them.
We place this new atomic note 'behind' exactly one other note:

---

![image:width:100%](/img/user/Resources/Meta/attachments/screenshot-student-writersblock-zk-filed.png)



In a physical card box, you would put the note cards behind each other, and this is very, VERY useful. We are using the 'up' property, under the tag here to model this.
This single organisation technique allows us to build a tree of related links that can be explored and visualised in a much more understandable way than a graph, like here with the virt-folder plugin.

REFERENCES
===
 ---
- Names
- Addresses
- Code Blocks
- Facts
- Formulae




Another category of fleeting note is knowledge, not tasks to be done or lessons to be captured in atomic notes.

These are things like names, addresses, code blocks or facts that only need to be stored verbatim.
You shouldn't waste valuable time and brainspace for these facts.
When your fleeting review session presents you with one of these, make a new note with the info in, give it some sensible tags, and it's now filed safely away, for later retrieval.
You'll know where to find it when you need it

LITERATURE NOTES
===

## PROCESSING




 ---
- Some highlights are written up into their own atomic note
- others are referenced in existing atomics
- yet more are left to process later

---

![image:width:100%](/img/user/Resources/Meta/attachments/screenshot-student-smart-notes-think.png)



For example, here we have a highlight I made while reading How To Take Smart Notes by Sönke Ahrens.
Sönke quoted Niklas Luhmann, the legendary author whose prolific Zettelkasten card file contained over 90k notes.
Reading this quote resonated with me at the time, and because I am processing it soon after highlighting, I have remembered the insight and can form it into a new atomic note:

---

![image:width:100%](/img/user/Resources/Meta/attachments/screenshot-student-framework-language-luhmann-quote-addition.png)



Like so.
I have made a new note with the fully-developed learning as the filename, and I have referenced the Luhmann quote.
While thinking about this I also browsed through my other atomic notes using the tree on the left, refreshing my memory about similar topics, and added two more similar concepts as references.
Finally, and most importantly for the Zettelkasten system, I have slotted this new atomic note "behind" a related thought in the tree.
I have done this just by linking to it in the up property of this note.

These are the only two organisational features I need in my atomic  
- But an anchor parent note linked in the up property.

---

![image:width:100%](/img/user/Resources/Meta/attachments/screenshot-student-smart-notes-checked.png)




The final step, if you are using my readwise template, or any highlights importer that allows you to format highlights as markdown checkboxes, is to check off the highlight to indicate it is processed, and you can now move on to the next one.

---
 ---
```mermaid
flowchart TD

    A@{ shape: database, label: "Atomic Notes" }
    P@{ shape: processes, label: "Projects" }
    
    style N stroke-width:4px,fill:#333,stroke:#42affa
    
    style P stroke-width:4px,fill:#333,stroke:#42affa
    style X stroke-width:4px,fill:#333,stroke:#42affa
    style Y stroke-width:4px,fill:#333,stroke:#42affa
    style Z stroke-width:4px,fill:#333,stroke:#42affa
    style ZZ stroke-width:4px,fill:#333,stroke:#42affa
    
    F@{ shape: card, label: "Fleeting Notes" }
    L@{ shape: card, label: "Literature Notes" }
    L |Reference from| A
    F |Process Into| A
    A |Compose Into| P
    
    subgraph N[&nbsp;&nbsp;NEXT&nbsp;&nbsp;VIDEO]
        P |Write| X@{ shape: documents, label: "Essays" }
        P |Write| Y@{ shape: documents, label: "Dissertations" }
        P |Write| Z@{ shape: documents, label: "Exam Revision" }
        P |Think| ZZ@{ shape: documents, label: "Ideas" }
    end
```




We're two-thirds of the way through the system:
Once you've built the habit of daily processing, and you're making loosely coupled but highly cohesive atomic notes out of your fleeting thoughts and other people's highlights, you will have everything you need to build novel work of your own.
These time-boxed projects are the subject of the final video in this series, completing the unfortunately-name FLAP system.

---

# THANK YOU

To all my patrons, you make this possible!

```rust
let producers: [&str; 0] = [];
let sponsors:  [&str; 1] = [
	"Jaycee" 
];
let patrons: [&str; 940];
```

I'd be very grateful for your support on:
- [Patreon](http://www.patreon.com/noboilerplate)
- [Ko-Fi](https://ko-fi.com/noboilerplate)
- [Gumroad](https://namtao.gumroad.com)




If you would like to support my channel, get early ad-free and tracking-free videos, your name in the credits or 1:1 mentoring, head to my patreon or ko-fi.

If you're interested in transhumanism and hopepunk, please check out my weekly sci-fi audiofiction podcast, Lost Terminal.

I just finished Season 2 of The Phosphene Catalogue, if you like mysteries and art, check it out!

Transcripts and compile-checked markdown sourcecode are available on namtao.com and github, links in the description, and corrections are in the pinned ERRATA comment.

Thank you so much for watching, talk to you on Discord.

---

 