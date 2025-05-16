---
{"dg-publish":true,"permalink":"/spacekeys/","noteIcon":""}
---

This is my custom spacekeys config for obsidian, based on the sample keymap that comes with the plugin, but with some structural changes to match <https://lazynvim.org>'s defaults.
## Lazyvim Reference
![lazyvim which key screenshot.png|200](/img/user/Resources/Meta/attachments/lazyvim%20which%20key%20screenshot.png)
Here s some bad spellah.

```yaml
items:
  SPC: command-palette:open
  TAB: editor:focus
  /: global-search:open
  ",": editor:context-menu
  "?": switcher:open
  P: app:go-back
  N: app:go-forward
  e: file-explorer:open
  r: spacekeys:load-keymap

  z:
    description: "Folds and spelling"
    items:
      1: obsidian-languagetool-plugin:ltaccept-suggestion-1
      2: obsidian-languagetool-plugin:ltaccept-suggestion-2
      3: obsidian-languagetool-plugin:ltaccept-suggestion-3
 
  c:
    description: Code 
    items:
      s: obsidian-quiet-outline:quiet-outline

  w:
    description: Window
    items:
      d: workspace:close
      h: editor:focus-left
      l: editor:focus-right
      k: editor:focus-top
      j: editor:focus-bottom
      n: workspace:next-tab
      N: workspace:new-tab
      u: workspace:undo-close-pane
      v: workspace:split-vertical
      p: workspace:previous-tab
      P: workspace:toggle-pin
      s: workspace:split-horizontal
      S: workspace:toggle-stacked-tabs
      w: workspace:open-in-new-window
      W: workspace:move-to-new-window
      x:
        description: Close
        items:
          g: workspace:close-tab-group
          G: workspace:close-others-tab-group
          t: workspace:close
          T: workspace:close-others
          w: workspace:close-window

       # workspace:goto-tab-1
       # workspace:goto-tab-2
       # workspace:goto-tab-3
       # workspace:goto-tab-4
       # workspace:goto-tab-5
       # workspace:goto-tab-6
       # workspace:goto-tab-7
       # workspace:goto-tab-8
       # workspace:goto-last-tab

       # workspace:show-trash

  u:
    description: UI 
    items:
      p: editor:toggle-source
      s: editor:toggle-spellcheck
      T: window:toggle-always-on-top
      t: tag-pane:open
      l: app:toggle-left-sidebar
      r: app:toggle-right-sidebar


  f:
    description: File
    items:
      a: markdown:add-alias
      c: workspace:copy-path
      C: workspace:copy-url
      d: app:delete-file
      m: file-explorer:move-file
      o: open-with-default-app:open
      O: open-with-default-app:show
      r: editor:open-search-replace
      R: workspace:edit-file-title
      s: editor:save-file
      t: file-explorer:reveal-active-file
      T: tag-pane:open
      u: outline:open-for-current
      /: editor:open-search

      n:
        description: New
        items:
          c: file-explorer:duplicate-file
          n: file-explorer:new-file
          N: file-explorer:new-file-in-current-tab
          r: file-explorer:new-file-in-new-pane


      p:
        description: Properties
        items:
          a: markdown:add-metadata-property
          e: markdown:edit-metadata-property
          c: markdown:clear-metadata-properties

  t:
    description: Text
    items:
      b: editor:toggle-bold
      c: editor:toggle-code
      C: editor:toggle-comments
      d: editor:delete-paragraph
      F: editor:clear-formatting
      i: editor:toggle-italics
      p: editor:insert-codeblock
      q: editor:toggle-blockquote
      s: editor:toggle-strikethrough
      L: editor:toggle-bullet-list
      l: editor:cycle-list-checklist
      H: editor:toggle-highlight
      M: editor:toggle-inline-math

      # editor:set-heading
      0: editor:set-heading-0
      1: editor:set-heading-1
      2: editor:set-heading-2
      3: editor:set-heading-3
      4: editor:set-heading-4
      5: editor:set-heading-5
      6: editor:set-heading-6
      # editor:rename-heading

      # editor:swap-line-down
      # editor:swap-line-up

      # editor:toggle-checklist-status
      # editor:toggle-numbered-list

      t:
        description: Templates 
        items:
          s: obsidian-hotkeys-for-templates:templater:slide.md


  i:
    description: Insert
    items:
      a: editor:attach-file
      c: editor:insert-codeblock
      C: editor:insert-callout
      e: editor:insert-embed
      l: editor:insert-link
      L: editor:insert-wikilink
      m: editor:insert-mathblock
      r: editor:insert-horizontal-rule
      T: editor:insert-tag

      t:
        description: Template
        items:
          t: insert-template
          d: insert-current-date
          T: insert-current-time

  T:
    description: Table
    items:
      h: editor:table-col-left
      l: editor:table-col-right
      k: editor:table-row-up
      j: editor:table-row-down
      c: editor:table-col-after
      C: editor:table-col-before
      r: editor:table-row-after
      R: editor:table-row-before
      v: editor:table-row-copy
      V: editor:table-col-copy
      i: editor:insert-table

      d:
        description: Delete
        items:
          c: editor:table-col-delete
          r: editor:table-row-delete

      a:
        description: Align
        items:
          c: editor:table-col-align-center
          l: editor:table-col-align-left
          r: editor:table-col-align-right


      # window:reset-zoom
      # window:zoom-in
      # window:zoom-out

  # "Workspaces" core plugin
  q:
    description: Sessions
    items:
      l: workspaces:load
      L: workspaces:save-and-load
      S: workspaces:open-modal
      s: workspaces:save

  s:
    description: Search
    items:
      s: darlal-switcher-plus:switcher-plus:open-symbols-active
      f: advanced-random-note:query:3809fec3-64fd-4f34-b706-3e1f6ddd7d0c


# editor:toggle-fold-properties
# editor:toggle-fold
# editor:unfold-all
# editor:fold-all
# editor:fold-less
# editor:fold-more

# editor:follow-link
# editor:open-link-in-new-leaf
# editor:open-link-in-new-split
# editor:open-link-in-new-window


```
