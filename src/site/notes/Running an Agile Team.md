---
{"dg-publish":true,"permalink":"/running-an-agile-team/"}
---


> [!NOTE]
> When building bridges, you test your designs with physical modelling. With software, you test with people. This is called [Agile Software Development](https://agilemanifesto.org/).

Here are my thoughts on running an agile software development team after 2 decades doing it, but the TLDR is:

1. [Read the manifesto](https://agilemanifesto.org/)
2. Do what is valuable.
3. Don't do what is not.

## General Guidelines
> We are uncovering better ways of developing software by doing it and helping others do it.

- [Pigs only](https://en.wikipedia.org/wiki/The_Chicken_and_the_Pig). Chickens may attend for their interest, but they may not speak.
    - In plain terms: Developers and workers only, no managers.
- There are no dedicated jobs such as 'project manager' or 'scrum master' in this system, these are trivial hats that any developer may wear temporarily
- This is by design, the core competency in building software is 'experience building software', and so developers must run the ship. [As Valve says](http://media.steampowered.com/apps/valve/Valve_Handbook_LowRes.pdf) "Non-Engineers: program or be programmed".
- Schedule
    - Planning on the first day of the iteration
    - Standups daily
    - Demo followed by Retro on the last day of the iteration

## Standups
> Individuals and interactions over processes and tools

- My Minimal trello standup/kanban template
  - https://trello.com/b/dBvRGD6S/minimal-kanban
- Process:
    - Each day a new person 'runs' this process (pick facilitators randomly or on a rota)
        - This is a useful way of giving everyone a chance to learn
    - DON'T ask everyone to talk in turn - you speak in card order, backwards, from 'done' to 'started'.
    - Strictly timeboxed, 30s each per card
    - If someone has work they want to talk about, don't let them interrupt, but ask them to make a card and talk about it tomorrow (blockers notwithstanding, see below)
        - This friction exposes holes in our planning process - why was this work not captured before? This allows us to learn for next time.
        - If it happens too often, bring it up in retro
        - In my experience, this only happens the first few days of running this process - people learn quickly to plan better
    - When you've got back to the 'started' column, you're done
    - Finally, the facilitator asks "Does anyone have any blockers?"

## Planning
> Working software over comprehensive documentation

- No estimation
- No points
- No velocity
- No planning poker
- No time-wasters
- Estimation points are an abstraction so that people who don't understand what is happening can pretend they do.
    - Chickens are not invited, we're all pigs here.
- Pull in (or create) cards from the customer-prioritised backlog into 'next up' or 'current sprint' as much work as we think we can usefully do this sprint
    - Based on last sprint's retro, we should have a better idea how much we can do this time
- Don't assign cards at this stage, cards are assigned as they are moved by the developer into 'in-progress'

## Demo
> Customer collaboration over contract negotiation

- At the end of the sprint, the team demos what they have built to the customer
    - no customer available? Make a customer proxy: someone, perhaps a ux-minded person who talks to the customer regularly
- feedback from the customer demo is captured into cards in the backlog
- The customer then prioritises the backlog, the team asks the customer which features they would like them to build FIRST
- Demonstrating working software (not designs, not mockups) to the actual customer is the heart of agile.
- Throw everything else in this process away if you must, but demo working software regularly and you will build the right thing

## Retrospective Feedback
> Responding to change over following a plan

- After the demo, the development team comes together to discuss how the iteration went
- This is the last back-stop of feedback, the last firebreak, if something is going wrong, it must be discovered and discussed here, ready to do better next iteration
- Format
    - https://trello.com/b/LT4PU1Hv/a-good-sprint-retro-template
    - Set a 5-minute timer, then the whole team adds cards in 3 categories
        - 👍 Good things
        - 👎 Bad things
        - 🙏 Thanks/appreciation
    - Then the team has another 5 minutes to read and vote on cards they think are important
        - the correct voting method is 'vote for as many cards as you want, one vote per person per card', which is trello's default.
            - If doing it IRL, you can use 'dot voting', where each person has a thick marker pen and puts a single dot on each card they care about.
        - this is self-limiting, as voting for every card is the same as if you voted for none
    - Someone clicks 'order columns by votes', and we take the rest of the meeting to discuss the issues, in strict order of votes (whatever column they are in)
    - 'good' and 'thanks' cards tend to be quite fast, the 'bad' cards naturally take longer
    - All actions must be captured with a person assigned to them.
    - Discussion without a plan of action is just complaining (which is occasionally valid, but try to keep things actionable).

1. [Read the manifesto](https://agilemanifesto.org/)
2. Do what is valuable.
3. Don't do what is not.

My video on this topic is here: https://www.youtube.com/watch?v=9K20e7jlQPA
