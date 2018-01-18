---
title: Selecting Elements with a Partial Attribute Name
keywords: attribute selector, attribute name, partial attribute, selector, css selector, selector resolver
description: How can you select an element by matching only part of an attribute it has? JavaScript and XPath are aware of an element's attributes, learn how to use them together with CSS to apply styles to an element when all you know is part of an attribute it has.
---

CSS selectors (and `document.querySelector()`) let you select elements by matching the names and values of their attributes. It’s possible to match [part of an attribute’s value](https://drafts.csswg.org/selectors/#attribute-representation) using `[attribute*=]`, `[attribute^=]`, `[attribute$=]`, but there’s no way to select an element based on matching only part of an attribute name.

Thankfully this is something we can do via XPath in all modern browsers (excluding IE11) like this:

```javascript
document.evaluate(
  '//*[@*[starts-with(name(), "data-custom-")]]',
  document, 
  null, 
  XPathResult.UNORDERED_NODE_ITERATOR_TYPE, 
  null
)
```

This XPath selector, `//*[@*[starts-with(name(), "data-custom-")]]`, returns all nodes with an attribute name that starts with `data-custom-`, so it would match elements with `data-custom-name` and `data-custom-example`, but not `data-customizer`.

For those wishing to select elements with this ability while authoring CSS, here are a few workarounds that can help:

## Parts Required

### JS Tests

To find an attribute that begins with `attribute-name-`:

```javascript
/^.*attribute-name-/.test(element.outerHTML)
```

## Plugins Capable

- [EQCSS](../plugins/eqcss.html)
- [Selectory](../plugins/selectory.html)
- [XPathy](../plugins/xpathy.html)
- [reproCSS](../plugins/reprocss.html)
- [Container Queries Mixin](../plugins/container-queries-mixin.html)
- [Scoped Eval Mixin](../plugins/scoped-eval-mixin.html)
- [XPath Selector Mixin](../plugins/xpath-selector-mixin.html)
- [VARIUS](../plugins/varius.html)

## Syntax Examples

### EQCSS

```css
@element * {
  eval("/^.*data-item-/.test(outerHTML) && '$this'") {
    background: lime;
  }
}
```

### Selectory

```css
[test="/^.*data-item-/.test(this.outerHTML)"] {
  background: lime;
}
```

### XPathy

```css
[xpath="//*[@*[starts-with(name(), 'data-item-')]]"] {
  background: lime;
}
```

## Demos

- [Partial attribute name match with EQCSS](https://codepen.io/tomhodgins/pen/eWarWa)
- [Partial attribute name match with Selectory](http://codepen.io/tomhodgins/pen/MmQbWv)
- [Partial attribute name match with XPathy](https://codepen.io/tomhodgins/pen/RgNNOw)