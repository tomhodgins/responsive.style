---
title: Container Queries
keywords: container queries, element queries, element breakpoints, media queries
---

This is a term for an element query that wraps a block of CSS rules that apply to different elements other than the scoped element itself. The syntax I am proposing is a container-style element query syntax.

```css
@element '#sidebar' and (max-width: 300px) {
  #sidebar .widget {
    font-size: 10pt;
  }
}
```

A non container-style element query syntax would allow you to write responsive conditions for one element, and only change styles for that one element depending on its own condition.

## Plugins Capable

- [EQCSS](../plugins/eqcss.html)
- [Selectory](../plugins/selectory.html)
- [reproCSS](../plugins/reprocss.html)
- [Container Queries Mixin](../plugins/container-queries-mixin.html)

## Further Reading

- [What are Container Queries?](https://codepen.io/tomhodgins/post/what-are-container-queries)
- [What the Heck are Element Queries & Container Queries?](https://codepen.io/tomhodgins/post/what-the-heck-are-element-queries-container-queries)