---
title: Selecting the First Element Matching a Selector
keywords: selector, css selector, selector resolver, :first, querySelector, first in document, first selector
---

CSS has pseudo-classes that allow you to select the first instance of a selector at any level in the DOM like [`:first-of-type()`](https://developer.mozilla.org/en-US/docs/Web/CSS/:first-of-type), but there is no equivalent in CSS for the ability to select only the first instance of an element matching a selector in the entire document (at any level). This would function more like [`document.querySelector()`](https://developer.mozilla.org/en-US/docs/Web/API/Document/querySelector) in JavaScript.

## Parts Required

### JS Tests

Using `document.querySelector` the ensure it’s the first instance:

```javascript
this === document.querySelector(test)
```

## Plugins Capable

- [EQCSS](../plugins/eqcss.html)
- [Selectory](../plugins/selectory.html)
- [reproCSS](../plugins/reprocss.html)
- [Container Queries Mixin](../plugins/container-queries-mixin.html)

## Syntax Examples

### EQCSS

```css
@element strong {
  eval('document.querySelector("strong") === $it && "$this"') {
    background: lime;
  }
}
```

### Selectory

```css
strong[test='this === document.querySelector(`strong`)'] {
    background: lime;
  }
}
```

## Demos

- [First of Selector in Document with EQCSS](https://codepen.io/tomhodgins/pen/pPbBMd)
- [First of Selector in Document with Selectory](https://codepen.io/tomhodgins/pen/vmdXRQ)