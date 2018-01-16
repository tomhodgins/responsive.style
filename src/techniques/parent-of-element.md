---
title: Selecting the Parent of an Element
keywords: parent selector, ancestor selector, closest selector, parent element, selector, css selector, selector resolver
---

A parent selector for CSS is an often-requested feature from developers — but due to the optimizations browsers make when rendering HTML, so it’s not currently possible to include functionality like this.

JavaScript and XPath are both able to locate the parent node of another node, JavaScript with [`parentNode`](https://developer.mozilla.org/en-US/docs/Web/API/Node/parentNode), and using XPath with `/parent::*` or `/..`.

## Parts Required

To find the parent element of another element using JavaScript you’ll need to use either `element.parentNode`, `element.closest()`, or use `document.evaluate()` to evaluate an XPath selector that selects the parent of another element.

### JS Tests

Using the `parentNode` of the selected element:

```javascript
element.parentNode
```

## Plugins Capable

- [EQCSS](../plugins/eqcss.html)
- [Selectory](../plugins/selectory.html)
- [XPathy](../plugins/xpathy.html)
- [reproCSS](../plugins/reprocss.html)
- [Ancestor Selector Mixin](../plugins/ancestor-selector-mixin.html)
- [Closest Selector Mixin](../plugins/closest-selector-mixin.html)
- [Parent Selector Mixin](../plugins/parent-selector-mixin.html)
- [Scoped Eval Mixin](../plugins/scoped-eval-mixin.html)
- [XPath Selector Mixin](../plugins/xpath-selector-mixin.html)

## Syntax Examples

### EQCSS

```css
@element input and (min-characters: 5) {
  $parent {
    background: pink;
  }
}
```

### Selectory

```css
[xpath="//input/.."] {
  border: 1px solid purple;
}
```

## Demos

- [`$parent` meta-selector with EQCSS](https://codepen.io/tomhodgins/pen/mVVYBg)
- [Selecting parent node with XPathy](https://codepen.io/tomhodgins/pen/WObvRX)

## Further Reading

- [A Parent Selector for CSS](https://codepen.io/tomhodgins/post/a-parent-selector-for-css)
- []()