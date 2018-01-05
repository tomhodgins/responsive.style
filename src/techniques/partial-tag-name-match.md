# Selecting Elements with a Partial Tag Name

CSS selectors (and [`document.querySelector()`](https://developer.mozilla.org/en-US/docs/Web/API/Document/querySelector) in JavaScript) let you select elements by matching their HTML tag name, however there’s no way to match an element based on matching only a part of the tag name. Whether working with custom elements, or wanting to write a selector encompassing `<h1>` tags through `<h6>`, being able to match a partial tag name could be really useful when writing styles.

Thankfully this is something we can do via [XPath](https://developer.mozilla.org/en-US/docs/Web/XPath) in modern browsers (>IE11) like this:

```javascript
document.evaluate(
  '//*[starts-with(name(), "custom-")]',
  document, 
  null, 
  XPathResult.UNORDERED_NODE_ITERATOR_TYPE, 
  null
)
```

This XPath selector, `//*[starts-with(name(), "custom-")]`, returns all nodes with a tag name that starts with `custom-`, so it would match `<custom-tag>` and `<custom-example>`, but not a tag named `<customizer-panel>`.

For those wishing to select elements in a similar way while authoring CSS, here are a few workarounds that can help:

## Parts Required

### JS Tests

To select a tag name starting with `tag-name`:

```javascript
/^<tag-name/.test(element.outerHTML)
```

## Plugins Capable

- [EQCSS](../plugins/eqcss.html)
- [Selectory](../plugins/selectory.html)
- [XPathy](../plugins/xpathy.html)
- [reproCSS](../plugins/reprocss.html)
- [Container Queries Mixin](../plugins/container-queries-mixin.html)
- [Scoped Eval Mixin](../plugins/scoped-eval-mixin.html)
- [XPath Selector Mixin](../plugins/xpath-selector-mixin.html)

## Syntax Examples

### EQCSS

```css
@element * {
  eval("/^<custom-/.test(outerHTML) && '$this'") {
    border: 1px solid lime;
  }
}
```

### Selectory

```css
[test="/^<custom-/.test(this.outerHTML)"] {
  border: 1px solid lime;
}
```

```css
[test="/^<h[\d]/.test(this.outerHTML)"] {
  color: lime;
}
```

### XPathy

```css
[xpath="//*[starts-with(name(), 'custom-')]"] {
  border: 1px solid lime;
}
```

```css
[xpath="//div/*[starts-with(name(),'h')][substring(name(),2) > 0]"] {
  background: red;
}
```

## Demos

- [Partial tag name match with EQCSS](https://codepen.io/tomhodgins/pen/xdNjdG)
- [Partial tag name match with XPathy](https://codepen.io/tomhodgins/pen/JJodPz)
- [Selecting H1-H6 with Selectory](https://codepen.io/tomhodgins/pen/RVQGXz)
- [Selecting H1-H6 with XPathy](https://codepen.io/tomhodgins/pen/EXaaBd)