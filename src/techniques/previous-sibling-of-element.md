---
title: Selecting the Previous Sibling of an Element
keywords: previous element, previous sibling, prev, preceding sibling, tag, selector, css selector, selector resolver
---

For the same reason CSS cannot reach the parent element if a given selector, you also are not able to reach the element appearing directly before a given element in HTML with CSS. It’s easy to select the element directly following any element with `+ *`, but there’s no way to go backward.

In JavaScript there is [`previousSibling`](https://developer.mozilla.org/en/docs/Web/API/Node/previousSibling) which returns the previous node, which could also be a text node or comment node (not always what we expect) so what we’re usually looking for is the element that’s equal to the [`previousElementSibling`](https://developer.mozilla.org/en-US/docs/Web/API/NonDocumentTypeChildNode/previousElementSibling) of another element.

## Parts Required

### JS Tests

Using the `previousElementSibling` of the selected element:

```javascript
element.previousElementSibling
```

## Plugins Capable

- [EQCSS](../plugins/eqcss.html)
- [Selectory](../plugins/selectory.html)
- [XPathy](../plugins/xpathy.html)
- [reproCSS](../plugins/reprocss.html)
- [Previous Selector Mixin](../plugins/prev-selector-mixin.html)
- [Scoped Eval Mixin](../plugins/scoped-eval-mixin.html)
- [XPath Selector Mixin](../plugins/xpath-selector-mixin.html)

## Syntax Examples

### EQCSS

```css
@element [type=button] {
  $prev {
    background: gold;
  }
}
```

### Selectory

```css
[test="this == document.querySelector(`#known`).previousElementSibling"] {
  background: lime
}
```

### XPathy

```css
/* All previous siblings */
[xpath="//*[@id='target']/preceding-sibling::*"] {
  background: red;
}

/* First previous sibling */
[xpath="//*[@id='target']/preceding-sibling::*[1]"] {
  background: lime;
}
```

## Demos

- [`$prev` from EQCSS](http://codepen.io/tomhodgins/pen/ZQBqeN)
- [Selecting the previous element with Selectory](http://codepen.io/tomhodgins/pen/mmXrLo)
- [Selecting previous siblings with XPathy](https://codepen.io/tomhodgins/pen/mwyJWE)