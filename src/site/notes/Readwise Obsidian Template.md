---
{"dg-publish":true,"permalink":"/readwise-obsidian-template/","noteIcon":""}
---

The existing obsidian template that Readwise provide is good, but it can be GREAT.

I've taken [fromsergio's modifications](https://www.youtube.com/watch?v=CH84CsBViOs) and made them even better. Features:
- Headings per highlight so you can scan them in the outline view (truncated to 200 characters)
- Markdown checkbox per highlight, allowing you to track if you have read/processed it
- iNdented readwise tags (namespaced as `#readwise/tagname`) under the task
- and any notes nested under it to
- At the top, an obsidian tasks plugin query to show the first unchecked task in the note, allowing for easy sequential processing.


Update your template here: https://readwise.io/export/obsidian/preferences

# File Name
```py
{{title|replace(',','_')|replace(':','_')|replace('/','_')|replace('\n','_')}}
```

# Page Metadata
```md
{% raw %}
> [!IMPORTANT] Next highlight
> ```tasks
> not done
> 
> path includes {{query.file.path}}
> 
> hide scheduled date
> hide edit button
> hide backlink
> hide postpone button
> LIMIT 1
> ```
{% endraw %}


{% if image_url -%}
![rw-book-cover]({{image_url}})

{% endif -%}

```

# Highlights Header

```md
{% if is_new_page %}
## Highlights
{% elif has_new_highlights -%}
## New highlights added {{date|date('F j, Y')}} at {{time}}
{% endif -%}
```

# Highlights
```md
 ---
  
     - [{{highlight_location}}]({{highlight_location_url}}){% elif highlight_location %}
     - {{highlight_location}}{% endif %}{% if highlight_tags %}
     - Tags: {% for tag in highlight_tags %}#readwise/{{tag}} {% endfor %}{% endif %}{% if highlight_note %}
     - My note: {{ highlight_note | replace('\n', '')  }}{% endif %}
```

# Yaml front Matter
```yaml
author: {% if author %}"[[{{author}}]]"{% endif %}
title: "{{full_title}}"
category: {{category}}
highlighted_date: {{last_highlighted_date|date('Y-m-d')}}
published_date: {{published_date|date('Y-m-d')}}
cover_image: {{image_url}}
{% if document_note -%}
document_note: "{{document_note}}"
{% endif -%}

tags: [literature/unfiled {% if document_tags -%},{% for tag in document_tags %}{{tag}}, {% endfor %}{% endif -%}]

up: "[[My Commonplace Book]]"

{% if summary -%}

summary: {{summary|replace('\n',' ')}}
{% endif -%}
{% if url -%}
url: {{url}}
{% endif -%}
```
