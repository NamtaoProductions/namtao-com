---
{"dg-publish":true,"dg-path":"savepoint","permalink":"/savepoint/","title":"Savepoint Project","noteIcon":"","updated":"2026-05-07T21:42:55.567+01:00","dg-note-properties":{"up":["[[Namtao Home]]"],"title":"Savepoint Project"}}
---


![savepoint-white.png\|200](/img/user/Resources/Meta/attachments/savepoint-white.png)
## Can't Beat the Boss? Load a Previous Save

_A command watcher that commits when you fix errors_

Feel free to poke around the [code](https://github.com/NamtaoProductions/savepoint/tree/main/), I would love [feature suggestions](https://github.com/NamtaoProductions/savepoint/issues/new/choose)!

# Usage

```shell
Usage: savepoint [OPTIONS] --filetype <filetype> [COMMAND]...

Arguments:
  [COMMAND]...  Command to run (use after -- if your shell requires it)

Options:
  -f, --filetype <filetype>  Filename extension to watch (eg rs, js, py, java)
  -d, --dryrun               Don't run git commit when tests pass
  -c, --clear                Clear screen between exections
  -q, --quiet                Don't display test output
  -h, --help                 Print help
  -V, --version              Print version
```

# DEMO

`savepoint` runs the test, and it fails:
```shell
🏁 SAVEPOINT: Running command...
   Compiling savepoint v0.1.4 (/home/oatman/projects/savepoint)
error: expected one of `!` or `::`, found `SavePoint`
   src/main.rs:37:10
   |
37 | uhoh! impl SavePoint<Passing> {
   |            ^^^^^^^^^ expected one of `!` or `::`

error: could not compile `savepoint` (bin "savepoint") due to 1 previous error
🏁 SAVEPOINT: Error!
🏁 SAVEPOINT: Monitoring..
```

When tests pass, savepoint makes a commit:

```shell
🏁 SAVEPOINT: Running command...
   Compiling savepoint v0.1.4 (/home/oatman/projects/savepoint)
    Finished `dev` profile [unoptimized + debuginfo] target(s) in 0.18s
🏁 SAVEPOINT: Autosaving!
[main 3d65083] SAVEPOINT REACHED!
 2 files changed, 16 insertions(+), 1 deletion(-)
🏁 SAVEPOINT: Monitoring..
```

 ---

```mermaid
flowchart LR
PASSING|fail|FAILING
FAILING|pass; git commit|PASSING
```

> Other transitions are no-ops (such as tests passing while in passing state)

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://brainmade.org/white-logo.svg">
  <source media="(prefers-color-scheme: light)" srcset="https://brainmade.org/black-logo.svg">
  <img align="right" alt="Brain mark." src="https://brainmade.org/black-logo.svg">
</picture>
